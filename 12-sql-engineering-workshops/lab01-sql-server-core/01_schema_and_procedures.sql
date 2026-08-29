/*
SQL Server Core Engineering Lab
Scenario: order processing service
Topics: schema design, constraints, transactions, procedures, error handling
*/

CREATE SCHEMA sales;
GO

CREATE TABLE sales.Customer (
    CustomerId      int IDENTITY(1,1) PRIMARY KEY,
    CustomerName    nvarchar(200) NOT NULL,
    EmailAddress    nvarchar(320) NULL,
    CreatedAtUtc    datetime2(3) NOT NULL CONSTRAINT DF_Customer_CreatedAtUtc DEFAULT SYSUTCDATETIME(),
    IsActive        bit NOT NULL CONSTRAINT DF_Customer_IsActive DEFAULT (1)
);
GO

CREATE TABLE sales.[Order] (
    OrderId         bigint IDENTITY(1,1) PRIMARY KEY,
    CustomerId      int NOT NULL,
    OrderDateUtc    datetime2(3) NOT NULL CONSTRAINT DF_Order_OrderDateUtc DEFAULT SYSUTCDATETIME(),
    OrderStatus     varchar(20) NOT NULL,
    OrderTotal      decimal(18,2) NOT NULL,
    CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerId) REFERENCES sales.Customer(CustomerId),
    CONSTRAINT CK_Order_Status CHECK (OrderStatus IN ('NEW','PROCESSING','COMPLETE','CANCELLED')),
    CONSTRAINT CK_Order_Total CHECK (OrderTotal >= 0)
);
GO

CREATE INDEX IX_Order_Customer_OrderDate
ON sales.[Order](CustomerId, OrderDateUtc DESC)
INCLUDE (OrderStatus, OrderTotal);
GO

CREATE OR ALTER PROCEDURE sales.usp_CreateOrder
    @CustomerId int,
    @OrderTotal decimal(18,2),
    @OrderId bigint OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRAN;

        IF NOT EXISTS (
            SELECT 1
            FROM sales.Customer
            WHERE CustomerId = @CustomerId
              AND IsActive = 1
        )
            THROW 50001, 'Customer does not exist or is inactive.', 1;

        INSERT sales.[Order](CustomerId, OrderStatus, OrderTotal)
        VALUES (@CustomerId, 'NEW', @OrderTotal);

        SET @OrderId = SCOPE_IDENTITY();

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH;
END;
GO

-- Challenge ideas:
-- 1. Add order lines and preserve transactional consistency.
-- 2. Make the procedure idempotent using an external request key.
-- 3. Add optimistic concurrency handling.
