-- Databricks SQL workshop lab: Gold business metrics

CREATE OR REPLACE TABLE workshop.gold.daily_sales AS
SELECT
    CAST(order_ts AS DATE) AS order_date,
    region,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(order_amount), 2) AS revenue,
    ROUND(AVG(order_amount), 2) AS avg_order_value
FROM workshop.silver.orders
WHERE data_quality_status = 'VALID'
GROUP BY CAST(order_ts AS DATE), region;

-- Business-facing quality check
SELECT
    order_date,
    region,
    orders,
    customers,
    revenue,
    avg_order_value,
    ROUND(revenue / NULLIF(customers, 0), 2) AS revenue_per_customer
FROM workshop.gold.daily_sales
ORDER BY order_date DESC, revenue DESC;
