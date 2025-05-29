/*
-- Analysis
-- books(book_id, title, author, status, quantity)
-- members(member_id, member_name, address, Location, Phone, Email)
-- borrow(borrow_id, borrow_name, member_id, issued_date, return_date)
--staff(staff_id, staff_name, email, phone, role,username, Password)
--supplier( supp_id,supp_name, email, phone, Location)
--publisher(publisher__id ,publisher_name ,address,Email, website, established_year) 
*/

-- create a database first 
create database library;

-- use  created database
use library;

-- create a table related to library database
-- Table 1: Books
create table books(
book_id int primary key not null, -- primary key should not null + unique
title varchar(50) not null,
author varchar(50) not null,
status varchar(50) not null,
quantity int not null
);

--  insert a record into tables
 insert into books(book_id, title, author, status, quantity)
 values
(1,'Alone life', 'Ramananda', 'Available', 50),
(2,'motivation', 'Rama', 'Available', 59),
(3,'Careerlife', 'anand', 'Available', 40),
(4,'Dream life', 'Shivam', 'Available', 90),
(5,'Focus life', 'Ramananda', 'Available', 80),
(6,'Developer', 'Ramananda', 'Available', 60),
(7,'Alone life', 'Ramananda', 'Available', 30);

-- to display the table
select * from books;

-- to remove the records from table
Truncate table books;

-- to delete the records from table
drop table books;

 
-- Table 2: Members
create table members(
member_id int primary key not null, -- primary key should not null + unique
member_name varchar(50) not null,
address varchar(50) not null,
Location varchar(50) not null,
Phone varchar(10) not null,
Email varchar(50) not null
);

--  insert a record into tables
insert into members(member_id, member_name, address, Location, Phone, Email)
value
(1, 'ashu', 'thane', 'Maharashtra', '9875398765', 'ashu1@gmail.com'),
(2, 'mahi', 'thane', 'Maharashtra', '9875398665', 'ash11@gmail.com'),
(3, 'moni', 'thane', 'Maharashtra', '9875398765', 'asuu1@gmail.com'),
(4, 'soni', 'thane', 'Maharashtra', '9875348765', 'astu1@gmail.com'),
(5, 'pihu', 'thane', 'Maharashtra', '9875398765', 'aihu1@gmail.com'),
(6, 'sonu', 'thane', 'Maharashtra', '9875358765', 'asuu1@gmail.com'),
(7, 'ashi', 'thane', 'Maharashtra', '9875396765', 'ashi1@gmail.com');


-- to display the table
select * from members;

-- to remove the records from table
Truncate table members;

-- to delete the records from table
drop table members;


-- Table 3: Borrow
create table borrow(
borrow_id int primary key not null, -- primary key should not null + unique
borrow_name varchar(50) not null,
member_id int not null,
issued_date varchar(50) not null,
return_date varchar(50) not null
);

-- insert a records into tables
insert into borrow(borrow_id, borrow_name, member_id, issued_date, return_date)
values
(1,'pooja',1,'2025-02-01','2025-02-06'),
(2,'ashna',2,'2025-03-06','2025-02-06'),
(3,'kajal',3,'2025-03-07','2025-02-07'),
(4,'surya',4,'2025-03-01','2025-02-05'),
(5,'priya',5,'2025-02-01','2025-02-09'),
(6,'mansi',6,'2025-02-01','2025-02-08'),
(7,'divya',7,'2025-02-01','2025-02-02');

-- to display the table
select * from borrow;

-- to remove the records from table
Truncate table borrow;

-- to delete the records from table
drop table borrow;

-- Table 4: Staff
create table staff(
staff_id int primary key not null, -- primary key should not null + unique
staff_name varchar(50) not null,
email varchar(50) not null,
phone varchar(50) not null,
role varchar(50) not null,
username varchar(50) not null,
Password varchar(50) not null
);

-- insert a records into tables
insert into staff(staff_id, staff_name, email, phone, role,username, Password)
values
(1, 'sara', 'sara1@gmail.com','8976544563','manager','sara','sara1'),
(2, 'sana', 'sana1@gmail.com','8976554563','accountant','sana','sana1'),
(3, 'siya', 'siya1@gmail.com','8976548563','manager','siya','siya1'),
(4, 'zara', 'zara1@gmail.com','8976524563','manager','zara','zara1'),
(5, 'piha', 'piha1@gmail.com','8976534563','manager','spra','pihu1'),
(6, 'hina', 'hina1@gmail.com','8974544563','manager','sara','hina1'),
(7, 'lara', 'lara1@gmail.com','8976564563','hr','lara','lara1');

-- to display the table
select * from staff;

-- to remove the records from table
Truncate table staff;

-- to delete the records from table
drop table staff;


-- Table 5: Supplier
create table supplier(
supp_id int primary key not null, -- primary key should not null + unique
supp_name varchar(50) not null,
email varchar(50) not null,
phone varchar(50) not null,
Location varchar(50) not null
);

-- insert a records into tables
insert into supplier( supp_id,supp_name, email, phone, Location)
values
(1,'suraj','suraj1@gmail.com','9875687543', 'Delhi'),
(2,'rahul','rahul1@gmail.com','9875697543', 'Delhi'),
(3,'rohan','rohan1@gmail.com','9875686543', 'Delhi'),
(4,'sonal','sonal1@gmail.com','9875687443', 'Delhi'),
(5,'rimi','rimi1@gmail.com','9875687533', 'Delhi'),
(6,'sart','sartj1@gmail.com','9875687542', 'Delhi'),
(7,'punam','punam1@gmail.com','9875687553', 'Delhi');

-- to display the table
select * from supplier;

-- to remove the records from table
Truncate table supplier;

-- to delete the records from table
drop table supplier;



-- Table 6: orders
create table orders(
order_id int primary key not null, -- primary key should not null + unique
order_name varchar(50) not null,
supp_id int not null,
date varchar(50) not null,
total_books int not null,
status varchar(50) not null
);


-- insert a records into tables
insert into orders(
order_id, order_name , supp_id, date, total_books, status)
values
(1,'pankaj',1,'2022-05-03',54,'Available'),
(2,'pawan',1,'2021-02-08',53,'Available'),
(3,'sarthy',1,'2022-03-07',58,'Available'),
(4,'sakshi',1,'2021-06-04',50,'Available'),
(5,'shreya',1,'2023-05-02',55,'Available'),
(6,'shrii',1,'2023-08-06',64,'Available'),
(7,'aniket',1,'2022-06-03',70,'Available');

-- to display the table
select * from orders;

-- to remove the records from table
Truncate table orders;

-- to delete the records from table
drop table orders;

-- table 7: publisher
create table publisher(
publisher__id int primary key not null, -- primary key should not null + unique
publisher_name  varchar(50) not null,
address varchar(50) not null,
Email varchar(50) not null,
website varchar(50) not null,
established_year varchar(50) not null
);

-- insert a records into tables
insert into publisher(publisher__id ,publisher_name ,address,Email, website, established_year)
values
(1, 'radha', 'mumbai','raddha1@gmail.com','http//:radhawww.com','2002'),
(2, 'anika', 'mumbai','anika1@gmail.com','http//:anikawww.com','2002'),
(3, 'anita', 'mumbai','anita@gmail.com','http//:anitawww.com','2002'),
(4, 'aarya', 'mumbai','aarya1@gmail.com','http//:aaryawww.com','2002'),
(5, 'purba', 'mumbai','purba1@gmail.com','http//:aaryawww.com','2002'),
(6, 'purvi', 'mumbai','purvi1@gmail.com','http//:aaryawww.com','2002'),
(7, 'sneha', 'mumbai','raddha1@gmail.com','http//:snehawww.com','2002');

-- to display the table
select * from publisher;

-- to remove the records from table
Truncate table publisher;

-- to delete the records from table
drop table publisher;



