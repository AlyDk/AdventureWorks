-- Total Sales
CREATE OR REPLACE VIEW vw_total_sales AS
SELECT 
    ROUND(SUM(`Sales Amount`), 2) AS TotalSales
FROM sales_data_cleaned;
SELECT * FROM vw_total_sales;

-- Sales by Category
CREATE OR REPLACE VIEW vw_sales_by_category AS
SELECT 
    p.Category,
    ROUND(SUM(s.`Sales Amount`), 2) AS TotalSalesAmount,
    ROUND(SUM(s.`Order Quantity`), 0) AS TotalQuantity
FROM sales_data_cleaned s
JOIN product_data p ON s.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY TotalSalesAmount DESC;
SELECT * FROM vw_sales_by_category;

-- Monthly Sales Trend
CREATE OR REPLACE VIEW vw_monthly_sales_trend AS
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    ROUND(SUM(`Sales Amount`), 2) AS TotalSales
FROM sales_data_cleaned
WHERE OrderDate IS NOT NULL
GROUP BY Month
ORDER BY Month;
Select * From vw_monthly_sales_trend;

-- Year-over-Year Sales Growth
CREATE OR REPLACE VIEW vw_yoy_sales_growth AS
SELECT 
    YEAR(OrderDate) AS Year,
    ROUND(SUM(`Sales Amount`), 2) AS TotalSales,
    ROUND(
        (SUM(`Sales Amount`) - 
         LAG(SUM(`Sales Amount`)) OVER (ORDER BY YEAR(OrderDate))) 
         / LAG(SUM(`Sales Amount`)) OVER (ORDER BY YEAR(OrderDate)) * 100,
        2
    ) AS YoYGrowthPercent
FROM sales_data_cleaned
WHERE OrderDate IS NOT NULL
GROUP BY YEAR(OrderDate)
ORDER BY Year;
SELECT * FROM vw_yoy_sales_growth;

-- Top 5 Resellers by Sales & AOV
CREATE OR REPLACE VIEW vw_top_resellers AS
SELECT 
    r.Reseller,
    ROUND(SUM(s.`Sales Amount`), 2) AS TotalSales,
    ROUND(AVG(s.`Sales Amount`), 2) AS AvgOrderValue
FROM sales_data_cleaned s
JOIN reseller_data_cleaned r ON s.ResellerKey = r.ResellerKey
WHERE r.Reseller <> 'NA'  -- Exclude reseller with the value 'NA'
GROUP BY r.Reseller
ORDER BY TotalSales DESC
LIMIT 5;
SELECT * FROM vw_top_resellers;

-- Top 5 Customers by Sales & AOV
CREATE OR REPLACE VIEW vw_top_customers AS
SELECT 
    c.Customer,
    ROUND(SUM(s.`Sales Amount`), 2) AS TotalSales,
    ROUND(AVG(s.`Sales Amount`), 2) AS AvgOrderValue
FROM sales_data_cleaned s
JOIN customer_data_cleaned c ON s.CustomerKey = c.CustomerKey
WHERE c.Customer <> 'NA'  -- Exclude Customer with the value 'NA'
GROUP BY c.Customer
ORDER BY TotalSales DESC
LIMIT 5;
SELECT * FROM vw_top_customers;


-- For Export
SELECT * FROM vw_total_sales;
SELECT * FROM vw_sales_by_category;
SELECT * FROM vw_monthly_sales_trend;
SELECT * FROM vw_yoy_sales_growth;
SELECT * FROM vw_top_resellers;
SELECT * FROM vw_top_customers;