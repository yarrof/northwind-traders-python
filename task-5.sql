SELECT date_part('year', order_date) AS year,
date_part('month', order_date) AS month,
COUNT(orders.order_id) AS order_count,
ROUND(SUM(unit_price*quantity*(1-discount))) AS revenue 
FROM orders
JOIN order_details
ON orders.order_id=order_details.order_id
GROUP BY year, month
HAVING extract(year FROM order_date)=1997
ORDER BY month;