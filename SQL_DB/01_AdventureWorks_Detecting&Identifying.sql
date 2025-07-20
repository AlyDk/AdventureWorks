-- Use adventureworks schema
USE adventureworks_db;

-- Select all from sales data table
SELECT COUNT(*) FROM sales_data;

-- Show column in sales data table
SHOW COLUMNS FROM sales_data;

-- Show first 5 rows of data in sales table
SELECT * FROM sales_data LIMIT 5;

-- Count of Placeholder CustomerKey in sales_data
SELECT CustomerKey, COUNT(*) AS records
FROM sales_data
GROUP BY CustomerKey
ORDER BY CustomerKey;

-- Count rows in customer table
SELECT COUNT(*) FROM customer_data;

-- Count of Placeholder ResellerKey in sales_data
SELECT ResellerKey, COUNT(*) AS records
FROM sales_data
GROUP BY ResellerKey
ORDER BY ResellerKey;

-- Check for CustomerKey = -1 in customer_data
SELECT *
FROM customer_data
WHERE CustomerKey = -1;

-- Check for ResellerKey = -1 in reseller_data
SELECT *
FROM reseller_data
WHERE ResellerKey = -1;

-- Count Missing or Placeholder Postal Codes
SELECT 
    'customer_data' AS source_table,
    COUNT(*) AS placeholder_count
FROM customer_data
WHERE `Postal Code` IN ('-1', '[Not Applicable]', 'NA')

UNION ALL

SELECT 
    'reseller_data',
    COUNT(*)
FROM reseller_data
WHERE `Postal Code` IN ('-1', '[Not Applicable]', 'NA');


-- Check Date Format in sales_data
SELECT 
    OrderDateKey,
    DueDateKey,
    ShipDateKey,
    LENGTH(OrderDateKey) AS OrderLen,
    LENGTH(DueDateKey) AS DueLen,
    LENGTH(ShipDateKey) AS ShipLen
FROM sales_data
LIMIT 10;

-- Convert Date Keys to Proper DATE Format in sales_data
-- Add new columns
ALTER TABLE sales_data
ADD COLUMN OrderDate DATE,
ADD COLUMN DueDate DATE,
ADD COLUMN ShipDate DATE;

-- Update with converted values
SET SQL_SAFE_UPDATES = 0;
UPDATE sales_data
SET 
    OrderDate = STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d'),
    DueDate = STR_TO_DATE(CAST(DueDateKey AS CHAR), '%Y%m%d'),
    ShipDate = STR_TO_DATE(CAST(ShipDateKey AS CHAR), '%Y%m%d')
WHERE 
    LENGTH(OrderDateKey) = 8
    AND LENGTH(DueDateKey) = 8
    AND LENGTH(ShipDateKey) = 8
    AND OrderDateKey IS NOT NULL
    AND DueDateKey IS NOT NULL
    AND ShipDateKey IS NOT NULL;
    SET SQL_SAFE_UPDATES = 1;
