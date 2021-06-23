use IVY_practise

select * from students
--In the following dataset 1-2,3-4,5-6,7-8 form a pair but the class teacher decides to 
--                                                          interchange the students ids of each pair. 
--Help the teacher to write a SQL query to interchange all the pair id in one go.

select iif (id % 2= 1 , id+1, id-1) as id,stu_name
from students
order by id

-- create a view
create view altered_students as
select iif (id % 2= 1 , id+1, id-1) as id,stu_name
from students

select * from altered_students order by id
 
