/*
Fabric Warehouse dimensional modeling lab
Scenario: retail sales analytics
Topics: star schema, CTAS-style transformations, surrogate keys, serving layer
*/

CREATE TABLE dbo.DimDate (
    DateKey        int NOT NULL,
    CalendarDate   date NOT NULL,
    CalendarYear   smallint NOT NULL,
    CalendarMonth  tinyint NOT NULL,
    MonthName      varchar(20) NOT NULL,
    PRIMARY KEY (DateKey)
);

CREATE TABLE dbo.DimProduct (
    ProductKey     bigint NOT NULL,
    ProductCode    varchar(50) NOT NULL,
    ProductName    varchar(200) NOT NULL,
    CategoryName   varchar(100) NULL,
    IsCurrent      bit NOT NULL,
    PRIMARY KEY (ProductKey)
);

CREATE TABLE dbo.DimCustomer (
    CustomerKey    bigint NOT NULL,
    CustomerId     varchar(50) NOT NULL,
    CustomerName   varchar(200) NOT NULL,
    RegionName     varchar(100) NULL,
    PRIMARY KEY (CustomerKey)
);

CREATE TABLE dbo.FactSales (
    SalesId        bigint NOT NULL,
    DateKey        int NOT NULL,
    ProductKey     bigint NOT NULL,
    CustomerKey    bigint NOT NULL,
    Quantity       int NOT NULL,
    NetSales       decimal(18,2) NOT NULL,
    DiscountAmount decimal(18,2) NOT NULL,
    MarginAmount   decimal(18,2) NOT NULL
);

-- Serving query used by semantic models or analysts
CREATE VIEW dbo.vw_DailyCategorySales AS
SELECT
    d.CalendarDate,
    p.CategoryName,
    SUM(f.NetSales) AS NetSales,
    SUM(f.MarginAmount) AS MarginAmount,
    SUM(f.Quantity) AS Units
FROM dbo.FactSales AS f
JOIN dbo.DimDate AS d ON d.DateKey = f.DateKey
JOIN dbo.DimProduct AS p ON p.ProductKey = f.ProductKey
GROUP BY d.CalendarDate, p.CategoryName;

-- Pipeline challenge:
-- Build the dimension keys from staged Lakehouse/Warehouse data,
-- then load the fact only after all dimensions resolve successfully.