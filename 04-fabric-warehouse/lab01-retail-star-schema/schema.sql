-- Fabric Warehouse teaching lab: small retail star schema

CREATE TABLE dbo.DimDate (
    DateKey INT NOT NULL,
    CalendarDate DATE NOT NULL,
    CalendarYear INT NOT NULL,
    CalendarMonth INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    CONSTRAINT PK_DimDate PRIMARY KEY NONCLUSTERED (DateKey) NOT ENFORCED
);

CREATE TABLE dbo.DimProduct (
    ProductKey INT NOT NULL,
    ProductCode VARCHAR(30) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    UnitCost DECIMAL(12,2) NOT NULL,
    CONSTRAINT PK_DimProduct PRIMARY KEY NONCLUSTERED (ProductKey) NOT ENFORCED
);

CREATE TABLE dbo.DimCustomer (
    CustomerKey INT NOT NULL,
    CustomerCode VARCHAR(30) NOT NULL,
    Segment VARCHAR(30) NOT NULL,
    Region VARCHAR(30) NOT NULL,
    CONSTRAINT PK_DimCustomer PRIMARY KEY NONCLUSTERED (CustomerKey) NOT ENFORCED
);

CREATE TABLE dbo.FactSales (
    SalesId BIGINT NOT NULL,
    DateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    CustomerKey INT NOT NULL,
    Quantity INT NOT NULL,
    GrossSales DECIMAL(14,2) NOT NULL,
    DiscountAmount DECIMAL(14,2) NOT NULL,
    NetSales AS (GrossSales - DiscountAmount)
);

-- Workshop query 1: monthly revenue by category
SELECT
    d.CalendarYear,
    d.CalendarMonth,
    p.Category,
    SUM(f.GrossSales - f.DiscountAmount) AS NetRevenue
FROM dbo.FactSales AS f
JOIN dbo.DimDate AS d ON d.DateKey = f.DateKey
JOIN dbo.DimProduct AS p ON p.ProductKey = f.ProductKey
GROUP BY d.CalendarYear, d.CalendarMonth, p.Category
ORDER BY d.CalendarYear, d.CalendarMonth, NetRevenue DESC;

-- Workshop query 2: customer segment contribution
SELECT
    c.Segment,
    c.Region,
    COUNT(DISTINCT f.CustomerKey) AS ActiveCustomers,
    SUM(f.GrossSales - f.DiscountAmount) AS NetRevenue
FROM dbo.FactSales AS f
JOIN dbo.DimCustomer AS c ON c.CustomerKey = f.CustomerKey
GROUP BY c.Segment, c.Region
ORDER BY NetRevenue DESC;
