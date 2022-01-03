show databases;
use practisedb;
create table patient (pid int, pname varchar(30), dob date, doa datetime);
select*from patient;
desc patient;
insert into patient values (1, 'pema', '1993-12-7', '2021-12-23 02:44:00');
insert into patient values (2, 'tashi', '1993-12-7', '2021-12-23 02:45:00');
select * from patient;
select adddate (dob, interval 30 day) from patient;
### Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') from patient' at line 1
select current_date();
select current_time();
select current_timestamp();
insert into patient values (3, 'choenyi', '1992-05-01', now());
select * from patient;
select year(dob) from patient;
select month(dob) from patient;
