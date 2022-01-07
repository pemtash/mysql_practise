show databases;
use practisedb;
show tables;
select * from authors;
desc authors;
insert into authors values (1, 'pema tashi'), (12, 'tenzin choenyi');
select * from authors;
delect authors where authorid = 12;
delete from authors where authorid = 12;
select * from authors;

create database pema;
delete database pema;
drop database pema;

create database pem;
use pem;
show tables;
create table student (sid int primary key, sname char(55), dob date);
show tables;
insert into student values (1, 'tenzin choenyi', '1992-05-01'), (2, 'pema tashi', '1993-12-07'), (3, 'tenzin tsewang', '1994-10-05'),(4, 'tenzin younten', '1992-10-20');
select * from student;
select * from student where dob > 1990;