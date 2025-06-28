-- single line comments

/*
Multiline
Comments
*/

-- ---------------------------------- Database Queries -------------------------------------------

-- create a database Holycross
create database Holycross;

-- to work on it, need to use it first
use holycross;

-- SQL is not a case sensitive language, ex- AGE or Age or age all will be treated as same word

-- to delete database
drop database holycross;

-- ---------------------------------- Database Analysis ------------------------------------------
/*
Database Name - Holycross

Tables-->

T-1 Students(id,name,age,std,Address)

T-2 Teachers(id,name, Subject,Contact,Salary)

T-3 Staff(id, Name, position,salary,contact)

*/

-- -------------------------------- Table Queries ------------------------------------------------
-- T-1 Students(id,name,age,std,Address)
-- create a table
create table Students(
id int primary key,  -- primary key = not null + unique
name varchar(50),
age int,
std varchar(10),
Address varchar(100)
);

-- display table data
select * from Students;

-- insert table data
insert into Students (id,name,age,std,Address)
Values
(1,'Tejas', 5, '1st', 'Kasara'),
(2,'Sahil',5,'1st', 'Dombivli'),
(3,'Kajal',5,'1st', 'Dombivli'),
(4,'Devdutt',5,'1st', 'Thane'),
(5,'Yogesh',5,'1st', 'Titwala');

-- to remove complete table values
truncate table Students;

-- to remove complete table
drop table Students;

-- T-2 Teachers(id,name, Subject,Contact,Salary)

-- T-3 Staff(id, Name, position,salary,contact)
















