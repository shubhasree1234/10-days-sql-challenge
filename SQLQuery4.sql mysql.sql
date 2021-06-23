select * from work.employee;

# Use the given data to enlist the employees who have received raise in their salary for at least 3 consecutive years.
select emp.employee_id
from (select *,
             lag(salary) over (partition by employee_id order by year) as prev_salary,
             salary - lag(salary) over (partition by employee_id order by year) AS difference
      from work.employee
     ) emp
group by emp.employee_id
having min(emp.difference) > 0 and
       count(emp.difference) >=3;
