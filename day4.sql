#JOIN

show databases;
show tables;
use practisedb;
show tables;
select * from myemp where dep_id = 60 and salary > 15000;
select * from myemp where dep_id between 10 and 70 and salary >10000;
select * from myemp where dep_id between 10 and 70;
select * from myemp where dep_id between 10 and 70 and salary >5000;
select * from myemp where dep_id = 10 or salary > 15000;
select * from myemp where dep_id = 10 or dep_id = 30 or dep_id = 70;
select hire_date, job_id, salary from myemp;
select hire_date, year(hire_date) from myemp;
select hire_date, salary group by emp_id from myemp;
select sum(salary) from myemp;
count(*) from myemp;
select max(salary) from myemp;
select max(salary) group by emp_id from myemp;
select emp_id,max(salary) from myemp group by emp_id;
select emp_id, dep_id, max(salary) from myemp group by dep_id order by dep_id;
select mgr_id , dep_id, max(salary) from myemp;
select mgr_id, dep_id, max(salary) from myemp group by dep_id;
select mgr_id, dep_id, max(salary) from myemp group by dep_id, mgr_id;
select dep_id , max(salary) from myemp group by dep_id;
select dep_id , max(salary) from myemp group by dep_id having dep_id = 50;
select dep_id, max(salary) from myemp group by dep_id having dep_id in (30,50,60);
select * from movies;
select * from members;
select id, title, first_name, last_name 
from movies inner join members
on id = movieid;
select id, title, first_name, last_name
from movies left join members
on id = movieid;
select id, title, ifnull(first_name,'-'), ifnull(last_name,'-') 
from movies left join members
on id= movieid;
select id, title, ifnull(first_name,'-') as fname, ifnull(last_name,'-') as lname 
from movies left join members
on id= movieid;
select memid, first_name, last_name , id, title
from movies right join members
on id = movieid;
use practisedb;
select * from drinks;
select * from meals;
select drinkname, mealname from drinks cross join meals ;
select drinkname, mealname, rate from drinks cross join meals;
# rate is ambiguous
select dr.drinkname, ml.mealname, dr.rate, ml.rate
from drinks as dr cross join meals as ml; 
select dr.drinkname, ml.mealname, (dr.rate+ ml.rate) as total
from drinks as dr cross join meals as ml;
select dr.drinkname, ml.mealname, dr.rate+ ml.rate as total
from drinks as dr cross join meals as ml;
select * from myemp limit 5;
select emp_id, first_name, last_name, mgr_id from myemp limit 5;
select emp.emp_id, emp.first_name, emp.last_name, mgr.mgr_id, mgr.first_name, mgr.last_name
from myemp as emp join myemp as mgr
on emp.emp_id = mgr.mgr_id;