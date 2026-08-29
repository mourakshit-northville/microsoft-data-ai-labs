/*
Reusable SQL data-quality checks
Scenario: validate a curated sales load before publishing
*/

-- Null / domain validation
SELECT 'NULL_CUSTOMER' AS CheckName, COUNT_BIG(*) AS FailureCount
FROM dbo.FactSales
WHERE CustomerKey IS NULL
UNION ALL
SELECT 'NEGATIVE_NET_SALES', COUNT_BIG(*)
FROM dbo.FactSales
WHERE NetSales < 0
UNION ALL
SELECT 'INVALID_QUANTITY', COUNT_BIG(*)
FROM dbo.FactSales
WHERE Quantity <= 0;
GO

-- Duplicate business grain validation
SELECT
    SalesId,
    COUNT_BIG(*) AS DuplicateCount
FROM dbo.FactSales
GROUP BY SalesId
HAVING COUNT_BIG(*) > 1;
GO

-- Referential integrity checks when constraints are not enforced physically
SELECT f.ProductKey, COUNT_BIG(*) AS OrphanRows
FROM dbo.FactSales AS f
LEFT JOIN dbo.DimProduct AS p ON p.ProductKey = f.ProductKey
WHERE p.ProductKey IS NULL
GROUP BY f.ProductKey;
GO

-- Source-to-target reconciliation
WITH src AS (
    SELECT CAST(OrderDate AS date) AS BusinessDate,
           COUNT_BIG(*) AS RowCount,
           SUM(NetSales) AS NetSales
    FROM staging.Sales
    GROUP BY CAST(OrderDate AS date)
), tgt AS (
    SELECT d.CalendarDate AS BusinessDate,
           COUNT_BIG(*) AS RowCount,
           SUM(f.NetSales) AS NetSales
    FROM dbo.FactSales f
    JOIN dbo.DimDate d ON d.DateKey = f.DateKey
    GROUP BY d.CalendarDate
)
SELECT
    COALESCE(src.BusinessDate, tgt.BusinessDate) AS BusinessDate,
    src.RowCount AS SourceRows,
    tgt.RowCount AS TargetRows,
    src.NetSales AS SourceSales,
    tgt.NetSales AS TargetSales,
    COALESCE(tgt.NetSales,0) - COALESCE(src.NetSales,0) AS SalesDifference
FROM src
FULL OUTER JOIN tgt ON tgt.BusinessDate = src.BusinessDate
WHERE COALESCE(src.RowCount,-1) <> COALESCE(tgt.RowCount,-1)
   OR ABS(COALESCE(src.NetSales,0) - COALESCE(tgt.NetSales,0)) > 0.01;
