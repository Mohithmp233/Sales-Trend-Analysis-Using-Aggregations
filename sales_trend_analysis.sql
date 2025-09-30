-- ======================================
-- Full Sales Analysis Script
-- Creates database, table, inserts data, and runs queries
-- ======================================

-- 1. Create database if it doesn't exist and select it
CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

-- 2. Create table
CREATE TABLE IF NOT EXISTS online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    product_id INT NOT NULL
);

-- 3. Insert sample data
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-05', 1200, 101),
(2, '2024-01-10', 2500, 102),
(3, '2024-01-15', 1800, 103),
(4, '2024-02-02', 3000, 101),
(5, '2024-02-20', 2200, 104),
(6, '2024-02-25', 1500, 105),
(7, '2024-03-01', 2700, 102),
(8, '2024-03-12', 1300, 106),
(9, '2024-03-20', 2100, 101),
(10, '2024-04-05', 3100, 107),
(11, '2024-04-18', 1900, 104),
(12, '2024-05-02', 2500, 102),
(13, '2024-05-15', 2800, 108),
(14, '2024-06-10', 1700, 109),
(15, '2024-06-25', 2200, 103);

-- ======================================
-- 4. Monthly revenue & order volume
-- ======================================
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS year_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY year_month;

-- ======================================
-- 5. Top 3 months by revenue
-- ======================================
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS year_month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 3;

-- ======================================
-- 6. Monthly revenue & order volume with year and month separately
-- ======================================
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- ======================================
-- 7. Revenue per product
-- ======================================
SELECT 
    product_id,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY product_id
ORDER BY total_revenue DESC;

- ======================================
-- 8. Average order amount
-- ======================================
SELECT AVG(amount) AS avg_order_amount
FROM online_sales;

-- ======================================
-- 9. Orders above average amount
-- ======================================
SELECT *
FROM online_sales
WHERE amount > (SELECT AVG(amount) FROM online_sales)
ORDER BY amount DESC
LIMIT 0, 1000;



