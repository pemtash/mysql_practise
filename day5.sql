show databases;
use practisedb;
show tables;
select * from students;
drop table students;
#constraints
create table students (sid integer UNIQUE, sname varchar(30) NOT NULL, age integer check (age>18), course varchar(30));
desc students;
insert into students values (1, 'pema', 23, 'mysql');
select * from students;
insert into students values (2, 'choenyi', 23, 'mysql');
select * from students;
insert into students values (3, 'tim' , 17, 'Data science');
insert into students values (3, 'tim', 19, 'Data science');
select * from students;
insert into students (sid, age, course) values (4, 21, 'manager');
insert into students (sid, sname, age, course) values (4, null , 21, 'manager');
alter table students modify column sname varchar(30) not null default 'john';
desc students;
# clearly we can see that default value is john in sname
insert into students (sid, age, course) values (4, 21, 'manager');
select * from students;
select * from authors;
select * from books;
# key constraints
drop table authors;
# not allowed to drop the parents data
# so we have to drop the child first and than parent
# when we create , we need to create parent and than child table
drop table books;
drop table authors;
show tables;
create table authros (authorid integer PRIMARY KEY	, name varchar(50));
desc authors;
drop table authros;
create table authors (authorid integer PRIMARY KEY	, name varchar(50));
desc authors;
create table books (
bookid integer PRIMARY KEY, 
title varchar(255), 
aid integer,
FOREIGN KEY	(aid) REFERENCES authors (authorid)
ON delete cascade
ON update cascade);
desc books;
# mul tell its foreign key 
insert into Authors values(1,'J K Rowling');
insert into Authors values(2,'Thomas Hardy');
insert into Authors values(3,'Oscar Wilde');
insert into Authors values(4,'Sidney Sheldon');
insert into Authors values(5,'Alistair MacLean');
insert into Authors values(6,'Jane Austen');
insert into Authors values(7,'Chetan Bhagat');
insert into Authors values(8,'Oscar Wilde');
insert into authors values (9,'pema tashi');


insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);

insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(14,'The Happy Prince',8);
insert into Books values (15, 'The data analyst', 9);

select * from authors;
select * from books;
delete from authors where authorid = 9;
select * from authors ;
select * from books;
# we can see that authorid 9 and its data has been deleted both from parent and child tables
insert into books values (15, 'the data analysist', 9);
#18:11:59	insert into books values (15, 'the data analysist', 9)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`practisedb`.`books`, CONSTRAINT `books_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `authors` (`authorid`) ON DELETE CASCADE ON UPDATE CASCADE)	0.125 sec
select * from authors;
insert into authors values (9, 'pema tashi');
select * from books;
insert into books values (15, 'the gamer' , 9);
select * from books;
update authors set authorid = 80 where authorid = 8 ;
select * from authors;
select * from books;


show databases;
use practisedb;
show tables;
# TRANSACTION CONTROL
# set of commands either succeed or fail
# club all the commands together to one \ 1 transaction eg, transferring money to other acc, it should be either success or fail

# inconsistent = if acc is debited and the receiver acc didnt got credited . 

select * from students;
insert into students values (5,'choenyi',27,'entrepreneur');

select * from students;
rollback;
select * from students;
# didnt roll back BECAUSE OF AUTO COMMIT IS ON

set autocommit = 0;
insert into students values (6,'dolma',27,'entrepreneur');
select * from students;
rollback;
select * from students;
# now we can rollback ( DML)

set autocommit = 1;
# turn the autocommit ON

# EXCEPTION HANDLING
create table tt (id char);
insert into tt values ('a');
insert into tt values ('b');
select * from tt;
rollback;
select * from tt;
# autocommit is on

delete from tt;
#08:47:54	delete from tt	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
SET SQL_SAFE_UPDATES=0;
delete from tt;
start transaction; # autocommit off
select * from tt;
insert into tt (id) values ('a'), ('b');
savepoint sb;
select * from tt;
insert into tt (id) values ('c'), ('d');
savepoint sd;
insert into tt (id) values ('e'), ('f');
select * from tt;
rollback to sd;
select * from tt; # rollback e and f 
rollback to sb; 
select * from tt; #rollback c and d
commit; # autocommit on
insert into tt values ('d');
select * from tt;
rollback to sb; # we use commit
rollback;
select * from tt; # didnt rollback as commmit will set autocommit on






