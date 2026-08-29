/*
Fabric SQL endpoint analytics lab
Scenario: query Lakehouse-serving tables through the SQL endpoint
Focus: reusable analytical views, window functions, endpoint-friendly SQL
*/

CREATE VIEW dbo.vw_CustomerRevenue AS
SELECT
    CustomerId,
    COUNT_BIG(*) AS OrderCount,
    SUM(NetSales) AS LifetimeRevenue,
    MAX(OrderDate) AS LastOrderDate
FROM dbo.Sales
GROUP BY CustomerId;
GO

WITH MonthlySales AS (
    SELECT
        DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS MonthStart,
        SUM(NetSales) AS NetSales
    FROM dbo.Sales
    GROUP BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
)
SELECT
    MonthStart,
    NetSales,
    LAG(NetSales) OVER (ORDER BY MonthStart) AS PriorMonthSales,
    NetSales - LAG(NetSales) OVER (ORDER BY MonthStart) AS MonthOverMonthChange,
    CASE
        WHEN LAG(NetSales) OVER (ORDER BY MonthStart) = 0 THEN NULL
        ELSE 100.0 * (NetSales - LAG(NetSales) OVER (ORDER BY MonthStart))
             / LAG(NetSales) OVER (ORDER BY MonthStart)
    END AS MonthOverMonthPct
FROM MonthlySales
ORDER BY MonthStart;
GO

-- Teaching challenge:
-- 1. Add a rolling 3-month average.
-- 2. Add customer segmentation using NTILE.
-- 3. Compare what belongs in a SQL view vs semantic model measure.
-- 4. Discuss read-only SQL endpoint behavior and data ownership boundaries.
