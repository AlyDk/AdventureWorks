DROP TABLE IF EXISTS customer_data_cleaned, reseller_data_cleaned, sales_data_cleaned;


-- #1
-- Create cleaned customer table
CREATE TABLE customer_data_cleaned AS
SELECT *,
       CASE WHEN CustomerKey = -1 THEN 10999 ELSE CustomerKey END AS CleanedCustomerKey
FROM customer_data;

-- Add placeholder customer record
INSERT INTO customer_data_cleaned (CustomerKey, `Customer ID`, Customer, City, `State-Province`, `Country-Region`, `Postal Code`)
VALUES (10999, 'AW00010999', 'NA', 'NA', 'NA', 'NA', 'NA');

-- #2
--  Create cleaned reseller table
CREATE TABLE reseller_data_cleaned AS
SELECT *,
       CASE WHEN ResellerKey = -1 THEN 0 ELSE ResellerKey END AS CleanedResellerKey
FROM reseller_data;

-- Add placeholder reseller record
INSERT INTO reseller_data_cleaned (ResellerKey, `Reseller ID`, `Business Type`, Reseller, City, `State-Province`, `Country-Region`, `Postal Code`)
VALUES (0, 'AW00000000', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA');

-- #3
-- Create cleaned sales table
CREATE TABLE sales_data_cleaned AS
SELECT *,
       CASE WHEN CustomerKey = -1 THEN 10999 ELSE CustomerKey END AS CleanedCustomerKey,
       CASE WHEN ResellerKey = -1 THEN 0 ELSE ResellerKey END AS CleanedResellerKey
FROM sales_data;


-- Clean up column names (CleanedCustomerKey and CleanedResellerKey replace the original)
ALTER TABLE sales_data_cleaned 
DROP COLUMN CustomerKey,
DROP COLUMN ResellerKey;

ALTER TABLE sales_data_cleaned 
CHANGE CleanedCustomerKey CustomerKey INT,
CHANGE CleanedResellerKey ResellerKey INT;


Select * from sales_data_cleaned limit 5;


