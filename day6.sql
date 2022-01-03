show databases;
use practisedb;
show tables;
show views;
# DATA OBJECTS
# SEQUENCE

create table mytab( id integer Primary Key auto_increment , name char(30));
desc mytab;
truncate mytab;
desc mytab;
drop table mytab;
create table mytab (id integer PRIMARY KEY auto_increment, name char(30), age integer);
desc mytab;
insert into mytab (name, age) values ('pema', 28);
select * from mytab;
insert into mytab(name, age) values ('tenzin', 29);
select * from mytab;
delete from mytab;
# 14:00:55	delete from mytab	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
delete from mytab where id = 2;
select * from mytab;
insert into mytab(name, age) values ('choenyi', 29);
select * from mytab;
# notice that after delete and than insertion again the id resumed from 3 
truncate mytab;
select * from mytab;
insert into mytab (name,age) values ('pema', 27), ('tenzin', 28), ('choenyi', 22);
select * from mytab;
# we see that id starts from 1, as we use truncate (drop, recreate(sequence))

# DATA OBJECTS
# 1) VIEWS
select * from myemp limit 5;
create view myview as select emp_id, first_name, last_name from myemp limit 5;
select * from myview;
desc myview;
drop myview;
delete myview;
select * from movies;
select * from members;
select mv.id, mv.id, ifnull(mm.first_name,'-')fname, ifnull(mm.last_name,'-')lname
from movies as mv left join members as mm
on mv.id = mm.movieid
order by mv.id;
create view rentals as select mv.id, mv.title, ifnull(mm.first_name,'-')fname, ifnull(mm.last_name,'-')lname
from movies as mv left join members as mm
on mv.id = mm.movieid
order by mv.id;
# 14:42:21	create view rentals as select mv.id, mv.id, ifnull(mm.first_name,'-')fname, ifnull(mm.last_name,'-')lname from movies as mv left join members as mm on mv.id = mm.movieid order by mv.id	Error Code: 1060. Duplicate column name 'id'	0.000 sec
select * from rentals;
create view dep_60 as select * from myemp where dep_id = 60;
select * from dep_60;
select * from myemp where dep_id = 60;
delete dep_60;
delete view dep_60 from myemp;
delete dep_60 from myemp;
select * from dep_60;
select * from myemp where dep_id = 30;
create view dep_30 as select * from myemp where dep_id = 30;
select * from dep_30;
select * from authors;
delete from authors where authorid in (1,9);
select * from authors;
create view aview as select * from authors where authorid <10;
select * from aview;
insert into aview values (11, 'larry collins');
select * from aview;
select * from authors;

drop view aview;
create view aview as select * from authors where authorid < 10 with check option;
select * from aview;
insert into aview values (13,'chetan bhagat');
# 15:06:00	insert into aview values (13,'chetan bhagat')	Error Code: 1369. CHECK OPTION failed 'practisedb.aview'	0.109 sec

# HASH INDEX
# SYNTAX : CREATE[ UNIQUE/SPATIAL/ FULLTEXT] INDEX < NAME.IDX > [USING HASH/B.TREE] ON < TABLE_NAME > (COL_NAME);
select count(*) from myemp;
select * from myemp limit 5;
show indexes from myemp;
show indexes from authors;
# implicitly create index as the table has primary key
desc students;
show indexes from students;


