-- Ecommerce Join Analysis

-- 1. INNER JOIN: Orders with Customer Details
SELECT
    o.Order_Number,
    o.Order_Date,
    o.Order_Type,
    c.Customer_ID,
    c.Customer_Name,
    c.Customer_State,
    c.Sales_region
FROM orders AS o
INNER JOIN customers AS c
    ON o.Customer_ID = c.Customer_ID;

-- 2. LEFT JOIN: Customers Who Never Placed Orders
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Customer_State,
    c.Customer_type
FROM customers AS c
LEFT JOIN orders AS o
    ON c.Customer_ID = o.Customer_ID
WHERE o.Order_Number IS NULL;

-- 3. Revenue per Product (High-performing SKUs)
SELECT
    p.Product_Number,
    p.Item,
    SUM(o.Quantity * p.Price) AS Total_Revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.Product_Number = p.Product_Number
GROUP BY p.Product_Number, p.Item
ORDER BY Total_Revenue DESC;

-- 4. Category-wise Revenue Distribution
SELECT
    cat.Category_Name,
    SUM(o.Quantity * p.Price) AS Category_Revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.Product_Number = p.Product_Number
INNER JOIN categories AS cat
    ON p.Product_category = cat.Category_ID
GROUP BY cat.Category_Name
ORDER BY Category_Revenue DESC;