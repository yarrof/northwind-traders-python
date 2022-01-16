SELECT company_name,
COUNT(order_id) AS orders, 
STRING_AGG(orders.order_id::VARCHAR, ', ') AS order_ids
FROM customers
JOIN orders ON customers.customer_id=orders.customer_id
WHERE country='USA'
GROUP BY company_name
HAVING COUNT(order_id) < 5
ORDER BY orders, company_name