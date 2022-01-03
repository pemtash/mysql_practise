# TRIGERS

use practisedb;
show tables;
alter table books add column sales integer default 10;
select * from books;
update books set sales = sales + 3 where bookid = 6;
select * from books;
select * from book_sales;