CREATE TABLE Store_data(
    Row_ID INTEGER PRIMARY KEY,
    Order_ID TEXT ,
    Order_Date DATE ,
	Ship_Date DATE ,
    Ship_Mode VARCHAR ,
	Customer_ID TEXT ,
	Customer_Name VARCHAR ,
	Segment VARCHAR ,
	Country VARCHAR ,
	City VARCHAR ,
	State_lived VARCHAR ,
	Postal_code INTEGER ,
	Region VARCHAR , 
	Product_ID TEXT , 
	Category VARCHAR , 
	Sub_Category VARCHAR(50) , 
	Product_Name TEXT , 
	Sales NUMERIC(10,2)
);

SELECT * FROM store_data;

-- Overall sales
SELECT SUM(sales) AS Total_Sales FROM store_data;

-- Over Orders 
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM store_data;

-- Unique customers 
SELECT COUNT(DISTINCT customer_id) AS Unique_cust FROM store_data;

-- Avg Order_Value  

SELECT CAST(CAST(SUM(sales) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
AS DECIMAL(10,2)) AS Avg_order_Value 
FROM store_data;

-- Total sales by category 

SELECT category, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY category;

-- Total sales by Sub_category 

SELECT Sub_category, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY Sub_category;

-- Product generate by Highest Sales 

SELECT Product_name, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY Product_name
ORDER BY Total_Sales DESC;

-- Customer generate the Highest Sales 

SELECT Customer_name, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY Customer_name
ORDER BY Total_Sales DESC;

-- Total Sales by region 

SELECT region, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY region
ORDER BY Total_Sales DESC;

-- Total Sales by Segment 

SELECT Segment, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY Segment
ORDER BY Total_Sales DESC;

SELECT * FROM store_data; 

-- Monthly Sales 

SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales
FROM store_data
GROUP BY month
ORDER BY month;

-- Yearly Sales

SELECT
    EXTRACT(YEAR FROM order_date) AS year_sales,
    SUM(sales) AS total_sales
FROM store_data
GROUP BY year_sales
ORDER BY year_sales;

-- Month which had Highest sales 

SELECT
    EXTRACT(MONTH FROM order_date) AS month_sales,
    SUM(sales) AS total_sales
FROM store_data
GROUP BY month_sales
ORDER BY month_sales DESC
LIMIT 5;

-- Year which generated Highest sales 

SELECT
    EXTRACT(YEAR FROM order_date) AS year_sales,
    SUM(sales) AS total_sales
FROM store_data
GROUP BY year_sales
ORDER BY year_sales DESC
LIMIT 1;

-- Total Sales by Year and Category 

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    category,
    SUM(sales) AS total_sales
FROM store_data
GROUP BY EXTRACT(YEAR FROM order_date), category
ORDER BY year, total_sales DESC;

-- Category which has highest sales 

SELECT category, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY category
LIMIT 5;

-- Sub_category has highest sales 

SELECT sub_category, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY sub_category
LIMIT 5;

-- Top 10 products by sales 

SELECT product_name, SUM(sales) AS Total_sales
FROM store_data
GROUP BY product_name 
ORDER BY Total_sales DESC
LIMIT 10;

-- Bottom 10 Products by Sales 

SELECT product_name, SUM(sales) AS Total_sales
FROM store_data
GROUP BY product_name 
ORDER BY Total_sales ASC
LIMIT 10;

-- Customers have generated more than ₹10,000 in sales 

SELECT 
    customer_name, 
    SUM(sales) AS Total_sales
FROM store_data
GROUP BY customer_name
HAVING SUM(sales) > 10000
ORDER BY Total_sales DESC;

SELECT * FROM store_data; 

-- Which customer segment generates the most sales?

SELECT Segment, SUM(sales) AS Total_Sales 
FROM store_data
GROUP BY Segment
ORDER BY Total_sales;

-- How many customers are there in each segment?  

SELECT COUNT(DISTINCT customer_name), Segment FROM store_data
GROUP BY Segment;

SELECT 
    segment,
    COUNT(DISTINCT customer_id) AS total_customers
FROM store_data
GROUP BY segment
ORDER BY total_customers DESC;

-- average sales per customer by segment

SELECT 
    segment,
    CAST(AVG(total_sales) AS DECIMAL(10,2)) AS avg_sales_per_customer
FROM (
    SELECT 
        segment,
        customer_name,
        SUM(sales) AS total_sales
    FROM store_data
    GROUP BY segment, customer_name
) AS customer_sales
GROUP BY segment
ORDER BY avg_sales_per_customer DESC;

-- Top 10 Customer Sales 

SELECT customer_name, SUM(sales) AS Total_Sales
FROM store_data
GROUP BY Customer_name
ORDER BY Total_Sales DESC
LIMIT 10;

-- customers have placed the most orders 

SELECT customer_name, COUNT(order_id) AS Total_orders
FROM store_data
GROUP BY Customer_name
ORDER BY Total_orders DESC;

-- average order value for each customer segment

SELECT * FROM store_data; 

SELECT 
    segment,
    CAST(SUM(sales) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Average_Order_Value
FROM store_data
GROUP BY segment
ORDER BY Average_Order_Value DESC;

-- Which region has the highest number of customers 

SELECT region, COUNT(customer_id) AS Total_customers
FROM store_data
GROUP BY region
ORDER BY Total_customers DESC;

-- Which City generates the highest sales 

SELECT city, SUM(sales) AS Total_sales FROM store_data
GROUP BY city
ORDER BY Total_sales DESC; 

-- Which state generates the highest sales

SELECT state_lived, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY state_lived
ORDER BY Total_sales DESC;

SELECT * FROM store_data;

--  Which region generates the highest sales 

SELECT region, SUM(sales) AS Total_sales
FROM store_data 
GROUP BY region
ORDER BY Total_sales DESC;

-- How many customers are present in each region 

SELECT region, COUNT(DISTINCT Customer_id) AS Unique_id
FROM store_data 
GROUP BY region
ORDER BY Unique_id DESC;

-- What are the top 10 cities by sales 

SELECT city, SUM(sales) AS Total_sales
FROM store_data
GROUP BY city
ORDER BY Total_sales DESC;

-- What percentage of total sales comes from each region 

SELECT 
    region,
    CAST(
        SUM(sales) * 100.0 / SUM(SUM(sales)) OVER ()
        AS DECIMAL(10,2)
    ) AS sales_percentage
FROM store_data
GROUP BY region
ORDER BY sales_percentage DESC;

-- How many orders use each shipping mode  

SELECT ship_mode, COUNT(order_id) AS Total_orders 
FROM store_data
GROUP BY ship_mode
ORDER BY Total_orders DESC;

-- What are the sales generated by each shipping mode 

SELECT ship_mode, SUM(sales) AS Total_sales 
FROM store_data
GROUP BY ship_mode
ORDER BY Total_sales DESC;

-- What is the average shipping time?

SELECT 
    CAST(AVG(ship_date - order_date) AS DECIMAL(10,2)) AS Average_Shipping_Time
FROM store_data;

-- Which shipping mode has the longest average delivery time

SELECT ship_mode,
    CAST(AVG(ship_date - order_date) AS DECIMAL(10,2)) AS Avg_Ship_Time
FROM store_data
GROUP BY ship_mode
ORDER BY Avg_ship_time DESC;

-- Which shipping mode generates the highest sales 

SELECT ship_mode, SUM(sales) AS Total_sales
FROM store_data
GROUP BY ship_mode
ORDER BY Total_sales DESC;

-- Are higher-sales orders associated with particular shipping modes 

SELECT 
    ship_mode,
    CAST(AVG(sales) AS DECIMAL(10,2)) AS Avg_Sales_Per_Order,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM store_data
GROUP BY ship_mode
ORDER BY Avg_Sales_Per_Order DESC;

SELECT * FROM store_data;

-- Q41. Find the monthly sales and previous month's sales. 

SELECT
    TO_CHAR(DATE_TRUNC('month', order_date), 'YYYY-MM') AS month,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS monthly_sales,
    CAST(
        LAG(SUM(sales)) OVER (ORDER BY DATE_TRUNC('month', order_date))
        AS DECIMAL(10,2)
    ) AS previous_month_sales
FROM store_data
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);

-- Calculate month-over-month sales growth

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(sales) AS monthly_sales
    FROM store_data
    GROUP BY DATE_TRUNC('month', order_date)
)

SELECT
    TO_CHAR(month, 'YYYY-MM') AS month,
    CAST(monthly_sales AS DECIMAL(10,2)) AS monthly_sales,
    CAST(
        LAG(monthly_sales) OVER (ORDER BY month)
        AS DECIMAL(10,2)
    ) AS previous_month_sales,
    CAST(
        (monthly_sales - LAG(monthly_sales) OVER (ORDER BY month))
        * 100.0
        / NULLIF(LAG(monthly_sales) OVER (ORDER BY month), 0)
        AS DECIMAL(10,2)
    ) AS mom_growth_percentage
FROM monthly_sales
ORDER BY month;

-- Find the top 3 products in each category. 

SELECT * FROM store_data;

WITH product_sales AS (
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales
    FROM store_data
    GROUP BY category, product_name
),
ranked_products AS (
    SELECT
        category,
        product_name,
        total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS rank
    FROM product_sales
)
SELECT
    category,
    product_name,
    CAST(total_sales AS DECIMAL(10,2)) AS total_sales,
    rank
FROM ranked_products
WHERE rank <= 3
ORDER BY category, rank;

-- Find the top 5 customers in each region.

WITH customer_sales AS (
    SELECT
        region,
        customer_name,
        SUM(sales) AS total_sales
    FROM store_data
    GROUP BY region, customer_name
),
ranked_customers AS (
    SELECT
        region,
        customer_name,
        total_sales,
        DENSE_RANK() OVER (
            PARTITION BY region
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM customer_sales
)
SELECT *
FROM ranked_customers
WHERE sales_rank <= 5
ORDER BY region, sales_rank;

-- Calculate each category's percentage contribution to total sales

SELECT
    category,
    SUM(sales) AS category_sales,
    ROUND(
        SUM(sales) * 100.0 /
        SUM(SUM(sales)) OVER (), 2
    ) AS sales_percentage
FROM store_data
GROUP BY category
ORDER BY sales_percentage DESC;

-- Find the cumulative sales over time 

WITH daily_sales AS (
    SELECT
        order_date,
        SUM(sales) AS total_sales
    FROM store_data
    GROUP BY order_date
)
SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_sales
FROM daily_sales
ORDER BY order_date;

-- Find the first order date for every customer 

SELECT
    customer_name,
    MIN(order_date) AS first_order_date
FROM store_data
GROUP BY customer_name
ORDER BY first_order_date;

-- Find customers who have placed more than one order

SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM store_data
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;

-- Find the highest-selling product in every state 

WITH product_sales AS (
    SELECT
        state_lived,
        product_name,
        SUM(sales) AS total_sales
    FROM store_data
    GROUP BY state_lived, product_name
),
ranked_products AS (
    SELECT
        state_lived,
        product_name,
        total_sales,
        DENSE_RANK() OVER (
            PARTITION BY state_lived
            ORDER BY total_sales DESC
        ) AS product_rank
    FROM product_sales
)
SELECT
    state_lived,
    product_name,
    total_sales
FROM ranked_products
WHERE product_rank = 1
ORDER BY state_lived;

-- Find the month with the highest sales for each category 

WITH monthly_sales AS (
    SELECT
        category,
        DATE_TRUNC('month', order_date) AS sales_month,
        SUM(sales) AS total_sales
    FROM store_data
    GROUP BY category, DATE_TRUNC('month', order_date)
),
ranked_months AS (
    SELECT
        category,
        sales_month,
        total_sales,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS month_rank
    FROM monthly_sales
)
SELECT
    category,
    sales_month,
    total_sales
FROM ranked_months
WHERE month_rank = 1
ORDER BY category;




