Problem Statement- Use the given data to find the customer with the highest total order cost within a single day  between 2021-02-01 to 2021-03-01.
Total order cost is calculated as order_cost*order_quantity. Output their first name, total sales amount and the date. 
For simplicity, you can assume that every first name in the dataset is unique. Also, the cost of the certain item 
(e.g. shoes) could vary among different purchases (not all shoes cost the same)

Table- Customers,Orders
IDE- MS SQL Server

USE IVY_practise;

SELECT * FROM (
SELECT c.firstname ,(o.Order_cost*o.order_quantity) AS Highest_Total_Sales, CAST(o.order_date AS DATE) Order_date,
RANK() OVER (ORDER BY (o.Order_cost*o.order_quantity) DESC ) ranking 
FROM Customers c
INNER JOIN Orders o
ON c.id=o.cust_id
WHERE o.order_date BETWEEN '2021-02-01' AND '2021-03-01'
GROUP BY c.firstname,o.order_date,o.Order_cost,o.order_quantity) AS t
HAVING t.ranking = 1


