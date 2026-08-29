/*
Incremental ELT with a high-watermark
Scenario: load source orders into a curated target
Applicable concepts: SQL Server, Azure SQL, Fabric Warehouse patterns
*/

CREATE SCHEMA etl;
GO

CREATE TABLE etl.Watermark (
    PipelineName        varchar(100) PRIMARY KEY,
    LastSuccessfulUtc   datetime2(3) NOT NULL
);
GO

INSERT INTO etl.Watermark(PipelineName, LastSuccessfulUtc)
VALUES ('orders_incremental', '1900-01-01');
GO

CREATE TABLE etl.OrderStage (
    OrderId         bigint NOT NULL,
    CustomerId      int NOT NULL,
    OrderDateUtc    datetime2(3) NOT NULL,
    ModifiedAtUtc   datetime2(3) NOT NULL,
    OrderStatus     varchar(20) NOT NULL,
    OrderTotal      decimal(18,2) NOT NULL
);
GO

CREATE TABLE etl.OrderCurated (
    OrderId         bigint PRIMARY KEY,
    CustomerId      int NOT NULL,
    OrderDateUtc    datetime2(3) NOT NULL,
    ModifiedAtUtc   datetime2(3) NOT NULL,
    OrderStatus     varchar(20) NOT NULL,
    OrderTotal      decimal(18,2) NOT NULL,
    LoadedAtUtc     datetime2(3) NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

DECLARE @LastWatermark datetime2(3),
        @ThisRunUpperBound datetime2(3) = SYSUTCDATETIME();

SELECT @LastWatermark = LastSuccessfulUtc
FROM etl.Watermark
WHERE PipelineName = 'orders_incremental';

TRUNCATE TABLE etl.OrderStage;

/* Replace dbo.SourceOrders with an actual source object or pipeline landing table. */
INSERT etl.OrderStage(OrderId, CustomerId, OrderDateUtc, ModifiedAtUtc, OrderStatus, OrderTotal)
SELECT OrderId, CustomerId, OrderDateUtc, ModifiedAtUtc, OrderStatus, OrderTotal
FROM dbo.SourceOrders
WHERE ModifiedAtUtc > @LastWatermark
  AND ModifiedAtUtc <= @ThisRunUpperBound;

MERGE etl.OrderCurated AS tgt
USING etl.OrderStage AS src
ON tgt.OrderId = src.OrderId
WHEN MATCHED AND src.ModifiedAtUtc > tgt.ModifiedAtUtc THEN
    UPDATE SET
        CustomerId    = src.CustomerId,
        OrderDateUtc  = src.OrderDateUtc,
        ModifiedAtUtc = src.ModifiedAtUtc,
        OrderStatus   = src.OrderStatus,
        OrderTotal    = src.OrderTotal,
        LoadedAtUtc   = SYSUTCDATETIME()
WHEN NOT MATCHED BY TARGET THEN
    INSERT (OrderId, CustomerId, OrderDateUtc, ModifiedAtUtc, OrderStatus, OrderTotal)
    VALUES (src.OrderId, src.CustomerId, src.OrderDateUtc, src.ModifiedAtUtc, src.OrderStatus, src.OrderTotal);

UPDATE etl.Watermark
SET LastSuccessfulUtc = @ThisRunUpperBound
WHERE PipelineName = 'orders_incremental';

-- Instructor discussion:
-- * Why capture @ThisRunUpperBound before reading the source?
-- * What happens with late-arriving records?
-- * When would CDC/change tracking be better than a timestamp watermark?
-- * In Fabric pipelines, which steps belong in orchestration vs SQL?