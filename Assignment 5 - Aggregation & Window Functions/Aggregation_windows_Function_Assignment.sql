CREATE TABLE orders (
order_id INT,
customer VARCHAR,
region VARCHAR,
amount INT
);



INSERT INTO orders VALUES
(1, 'C1', 'North', 500),
(2, 'C2', 'North', 700),
(3, 'C3', 'North', 700),
(4, 'C4', 'South', 300),
(5, 'C5', 'South', 600),
(6, 'C6', 'South', 900),
(7, 'C7', 'East', 400),
(8, 'C8', 'East', 400),
(9, 'C9', 'West', 800),
(10, 'C10', 'West', 1000);

SELECT * FROM orders;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- ****************************************************************

-- 1. Find the total order amount.
SELECT SUM(amount) as Total_Amount 
FROM orders ;

-- ****************************************************************

-- 2. Find the average order amount.
SELECT AVG(amount) as Aerage_Amount 
FROM orders ;

-- ****************************************************************

-- 3. Find the minimum and maximum order amount.
SELECT MIN(amount) as Minimun_Amount,
MAX(amount) as Maximum_Amount
FROM orders ;

-- ****************************************************************

-- 4. Find the total number of orders.
SELECT COUNT(orders) AS Number_of_orders
FROM orders;

-- ****************************************************************

-- 5. Find the total order amount per region.
SELECT region,SUM(amount)
FROM orders
GROUP BY region;

-- ****************************************************************

-- 6. Find the average order amount per region.
SELECT region,AVG(amount) AS Average_Amount
FROM orders
GROUP BY region;

-- ****************************************************************

-- 7. Find the number of orders per region.
SELECT region,COUNT(amount) AS No_of_Orders
FROM orders
GROUP BY region;

-- ****************************************************************

-- 8. Find the minimum order amount per region.
SELECT region,MIN(amount) AS Minimum_Amount
FROM orders
GROUP BY region;

-- ****************************************************************

-- 9. Find the maximum order amount per region.
SELECT region,MAX(amount) AS Maximum_Amount
FROM orders
GROUP BY region;


-- ****************************************************************

-- 10. Assign ROW_NUMBER to orders based on amount (ascending).
SELECT customer,amount,
row_number() over(ORDER BY amount ASC) AS Row_No
from orders;

-- ****************************************************************

-- 11. Assign RANK to orders based on amount (descending).
SELECT customer,amount,
rank() over(ORDER BY amount DESC) AS Row_No
from orders;

-- ****************************************************************

-- 12. Assign DENSE_RANK to orders based on amount (descending).
SELECT customer,amount,
dense_rank() over(ORDER BY amount DESC) AS Row_No
from orders;

-- ****************************************************************

-- 13. Assign ROW_NUMBER per region ordered by amount (ascending).
SELECT customer,region,amount,
row_number() 
over(
	PARTITION BY region
	ORDER BY amount ASC
) AS Row_No
from orders;

-- ****************************************************************

-- 14. Assign RANK per region ordered by amount (descending).
SELECT customer,region,amount,
rank()
over(
	PARTITION BY region
	ORDER BY amount DESC
)
FROM orders;

-- ****************************************************************

-- 15. Assign DENSE_RANK per region ordered by amount (descending).
SELECT customer,region,amount,
dense_rank()
OVER(
	PARTITION BY region
	ORDER BY amount DESC
)
FROM orders;

-- ****************************************************************






