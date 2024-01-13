-- Generate queries

-- 1. Count number of customers
SELECT COUNT(customer_id) as 'No. of customers'
FROM CUSTOMERS;

-- 2. Count number of orders
SELECT COUNT(order_id) AS 'No. of orders'
FROM ORDERS;

-- 3. Top 5 customers which ordered the most
SELECT customer_id, COUNT(order_id) AS 'No. of orders'
FROM ORDERS
GROUP BY customer_id
ORDER BY COUNT(order_id) DESC
LIMIT 5;

-- 4. Number of orders from each state
SELECT c.state, COUNT(o.order_id) AS 'No. of orders'
FROM ORDERS o
INNER JOIN CUSTOMERS c ON o.customer_id = c.customer_id
GROUP BY c.state;

-- 5. Top 5 cities which ordered the most
SELECT c.city, c.state, COUNT(o.order_id) AS 'No. of orders'
FROM ORDERS o
INNER JOIN CUSTOMERS c ON o.customer_id = c.customer_id
GROUP BY c.city, c.state
ORDER BY COUNT(order_id) DESC
LIMIT 5;

-- 6. Total income by each store
SELECT s.store_name, SUM(i.quantity*(i.list_price-(i.list_price*i.discount))) AS 'Total income'
FROM ORDERS o
INNER JOIN STORES s ON o.store_id = s.store_id
INNER JOIN ORDER_ITEMS i ON o.order_id = i.order_id
GROUP BY s.store_name
ORDER BY SUM(i.quantity*(i.list_price-(i.list_price*i.discount))) DESC;

-- 7. Which items are sold most by a store
SELECT s.store_name, p.product_name, SUM(i.quantity) AS 'Total Sold'
FROM ORDERS o
INNER JOIN STORES s ON o.store_id = s.store_id
INNER JOIN ORDER_ITEMS i ON o.order_id = i.order_id
INNER JOIN PRODUCTS p ON i.product_id = p.product_id
WHERE s.store_name = 'Santa Cruz Bikes'
GROUP BY s.store_name, p.product_name
HAVING SUM(i.quantity) > 30
ORDER BY SUM(i.quantity) DESC;

-- 8. Categories which were sold the most
SELECT c.category_name, SUM(i.quantity) AS 'Total quantity sold'
FROM ORDER_ITEMS i 
INNER JOIN PRODUCTS p ON i.product_id = p.product_id
INNER JOIN CATEGORIES c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY SUM(i.quantity) DESC;

-- 9. Total income by each category
SELECT c.category_name, SUM(i.quantity*(i.list_price-(i.list_price*i.discount))) AS 'Total income'
FROM ORDER_ITEMS i
INNER JOIN PRODUCTS p ON i.product_id = p.product_id
INNER JOIN CATEGORIES c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY SUM(i.quantity*(i.list_price-(i.list_price*i.discount))) DESC;

-- 10. Brands which were sold the most
SELECT b.brand_name, SUM(i.quantity) AS 'Total quantity sold'
FROM ORDER_ITEMS i 
INNER JOIN PRODUCTS p ON i.product_id = p.product_id
INNER JOIN BRANDS b ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY SUM(i.quantity) DESC;

-- 11. Total income by each brand
SELECT b.brand_name, SUM(i.quantity*(i.list_price-(i.list_price*i.discount))) AS 'Total income'
FROM ORDER_ITEMS i
INNER JOIN PRODUCTS p ON i.product_id = p.product_id
INNER JOIN BRANDS b ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY SUM(i.quantity*(i.list_price-(i.list_price*i.discount))) DESC;

-- 12. Number of orders per month
select MONTH(date_format(order_date,'%Y-%m-%d')) AS 'Month', COUNT(order_id) AS 'No. of orders'
from ORDERS
GROUP BY MONTH(date_format(order_date,'%Y-%m-%d'))
ORDER BY COUNT(order_id) DESC;

