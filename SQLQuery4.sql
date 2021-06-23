USE IVY_practise

SELECT *
FROM Employee
--Use the given data to enlist the employees who have received raise in their salary for at least 3 consecutive years.
SELECT employee_id,salary,year,
 DENSE_RANK() OVER (PARTITION BY employee_id ORDER BY salary desc) AS Ranking
FROM Employee
ORDER BY employee_id

SELECT t.employee_id,t.year,t.salary,t.previous_salary,(t.salary-t.previous_salary) AS diff
FROM (SELECT employee_id,year,salary,
LAG(salary) OVER(PARTITION BY employee_id ORDER BY year) previous_salary
FROM Employee) t 
GROUP BY t.employee_id,t.year,t.salary,t.previous_salary
HAVING MIN(t.salary-t.previous_salary) > 0 AND COUNT(*) >=3
-- new
SELECT t.employee_id,t.salary,t.previous_salary,(t.salary-t.previous_salary) AS diff
FROM (SELECT employee_id,year,salary,
LAG(salary) OVER(PARTITION BY employee_id ORDER BY year) previous_salary
FROM Employee) t 

-- new queries
with cte_salary (employee_id,year,salary,previous_salary,diff) AS (SELECT t.employee_id,t.year,t.salary,t.previous_salary,(t.salary-t.previous_salary) AS diff
FROM (SELECT employee_id,year,salary,
LAG(salary) OVER(PARTITION BY employee_id ORDER BY year) previous_salary
FROM Employee) t 
GROUP BY t.employee_id,t.year,t.salary,t.previous_salary 
)







