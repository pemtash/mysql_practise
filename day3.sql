show databases;
select * from practisedb;
use practisedb;
show tables ;
select * from customer;
select * from patients;

# import practisetables in practisedb

select * from myemp;
select * from myemp limit 5;
select first_name, last_name , job_id from myemp limit 5;
select dep_id from myemp;
select distinct dep_id from myemp;
select distinct job_id from myemp;
show tables;
select distinct first_name, last_name from myemp;
select * from person;
insert into person values (6,'Tom', 'Cruise');
select * from person;
select distinct fname, lname from person;
select distinct fname from person;
select distinct lname from person;
select * from myemp;
select * from myemp order by last_name;
select * from myemp order by hire_date;
select * from myemp where salary >10000;
select * from myemp where salary>= 20000;
select * from myemp where job_id != 'st_clerk';
select * from myemp where job_id = 'st_clerk';
select * from myemp
select * from myemp where salary between 10000 and 15000;
select * from myemp where salary = 10000;
select * from myemp where salary >10000;
select * from myemp where salary <20000;
select * from myemp where salary between 10000 and 15000;
select * from myemp where hire_date >= 2000-01-01;
select * from myemp where hire_date >= '2000-01-01';
select * from myemp where first_name like 'j%';
select * from myemp where first_name like '%a';
select * from myemp where first_name like '%c%';
select * from myemp where first_name like 'j____';
select * from myemp where email like 'j%';