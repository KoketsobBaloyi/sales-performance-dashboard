-- Preview the first 10 rows of the imported table to see the data
SELECT TOP 10 *
FROM [dbo].[Sample - Superstore];

-- Drop the clean table if it already exists
IF OBJECT_ID('sales_data', 'U') IS NOT NULL
    DROP TABLE sales_data;
GO
-- 'OBJECT_ID' checks if a table named 'sales_data' exists
-- 'U' indicates a user table
-- 'DROP TABLE' deletes it so we can recreate it cleanly


-- Create a new clean table for analysis
CREATE TABLE sales_data (
    order_id NVARCHAR(50),   -- Order identifier, stored as text
    order_date DATE,     -- Date of order
    ship_date DATE,      -- Date order was shipped
    customer_name NVARCHAR(100),   -- Customer full name
    region NVARCHAR(50),      -- Region name  
    product_name NVARCHAR(200),   -- Product name 
    category NVARCHAR(50),     -- Product category
    sub_category NVARCHAR(50),  -- Sub-category of product
    sales DECIMAL(18,2),    -- Sales amount, two decimal places
    quantity INT,          -- Quantity sold
    discount DECIMAL(18,2),   -- Discount applied
    profit DECIMAL(18,2)          -- Profit from the sale
);
GO

-- We define appropriate data types for analysis
-- Text columns: NVARCHAR
-- Numbers with decimals: DECIMAL
-- Integers: INT
-- Dates: DATE


-- Insert data from the imported raw table into the clean table
INSERT INTO sales_data (
    order_id,
    order_date,
    ship_date,
    customer_name,
    region,
    product_name,
    category,
    sub_category,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    Order_ID,
    TRY_CAST(Order_Date AS DATE),   -- Match column from raw table
    TRY_CAST(Ship_Date AS DATE),    -- Convert to DATE safely; returns NULL if invalid
    Customer_Name,                  -- Same for shipping date
    Region,
    Product_Name,
    Category,
    Sub_Category,
    TRY_CAST(Sales AS DECIMAL(18,2)),   -- Convert Sales to decimal
    TRY_CAST(Quantity AS INT),          -- Convert Quantity to integer
    TRY_CAST(Discount AS DECIMAL(18,2)), -- Convert Discount to decimal
    TRY_CAST(Profit AS DECIMAL(18,2))    -- Convert Profit to decimal
FROM [dbo].[Sample - Superstore];
-- 'TRY_CAST' prevents the query from failing if there is bad data
-- This ensures all data is safely inserted into the new clean table


-- Preview the first 10 rows of the clean table
SELECT TOP 10 * FROM sales_data;
-- Verifies that the data was copied and transformed correctly
-- Now ready for analysis queries


/* 1. Calculate total revenue per Month */
SELECT 
	FORMAT(order_date, 'yyyy-MM') AS month,   --Convert order_date to 'YYYY-MM'
	SUM(sales) AS total_revenue               --Sum of sales for that month
FROM sales_data
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;


/* 2. Find the top 10 customers who spent the most */
SELECT TOP 10
	customer_name,      -- Customer name 
	SUM(sales) AS total_spent    -- Total amount spent by customer 
FROM sales_data
GROUP BY customer_name   -- Group sales per customer 
ORDER BY total_spent DESC-- Sort descrensing to get top spending 


/* 3. Calculate profit margin percentage per product category   */
SELECT 
    category,                           -- Product category
    SUM(profit) AS total_profit,        -- Total profit in category
    SUM(sales) AS total_sales,          -- Total sales in category
    (SUM(profit) * 100.0 / SUM(sales)) AS profit_margin_percentage -- Profit margin %
FROM sales_data
GROUP BY category                       -- Group by category
ORDER BY profit_margin_percentage DESC; -- Optional: sort by highest margin

/* 4. Identify products that are losing money  */
SELECT 
    product_name,                -- Product name
    SUM(profit) AS total_profit  -- Total profit (will be negative for loss-making products)
FROM sales_data
GROUP BY product_name           -- Group by product
HAVING SUM(profit) < 0          -- Only products with negative profit
ORDER BY total_profit ASC;      -- Sort by biggest losses first  

-- Check for missing sales values
SELECT COUNT(*) AS missing_sales
FROM sales_data
WHERE sales IS NULL;

-- Check for negative sales values
SELECT *
FROM sales_data
WHERE sales < 0;

-- Check for missing customer names
SELECT COUNT(*) AS missing_customers
FROM sales_data
WHERE customer_name IS NULL;

-- Check for invalid profit (optional)
SELECT *
FROM sales_data
WHERE profit IS NULL;

-- Total revenue per region
SELECT 
    region, 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;