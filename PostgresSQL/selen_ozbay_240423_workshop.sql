--- GROUP BY 1
SELECT COUNT(customer_id),country FROM customers
GROUP BY country;
---GROUP BY 2
SELECT COUNT(customer_id), country FROM customers
GROUP BY country
ORDER BY COUNT(customer_id) DESC;

---HAVING 1
SELECT COUNT(customer_id), country FROM customers
GROUP BY country
HAVING COUNT(customer_id) > 5
ORDER BY COUNT(customer_id) DESC;
--- HAVING 2
SELECT e.last_name, COUNT(o.order_id) AS NumberOfOrders
FROM Orders o
INNER JOIN employees e ON o.employee_id = e.employee_id
GROUP BY last_name
HAVING COUNT(o.order_id) > 10;




