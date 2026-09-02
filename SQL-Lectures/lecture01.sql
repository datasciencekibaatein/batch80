-- SQL (Structured Query Language)
-- Database -> Where we store our data
-- RDB(Relational Database) -> The database where we store data, which is in form of tables
-- DBMS(Database management system) -> It is software , from which we query to our database
-- RDBMS(Relational database management System) -> It is also software to query on RDB.
-- MySQL Workbench


-- Want to store the data of employee
-- (emp_id,emp_name,department,salary)employee

-- create database

create database sonix;

use sonix;

-- create table query

create table employee(
	emp_id int,
    emp_name varchar(20),
    department varchar(10),
    salary int
);



desc employee;



select * from employee;

-- insert the records

insert into employee values(1,"Rohit","IT",70000);

insert into employee values
(2,"Neha","HR",54000),
(3,"Krish","Finance",45000),
(4,"Nishu","IT",50000),
(5,"Rishabh","Finance",40000);


select
	emp_id,
    emp_name
from employee;


select
	*
from STORE.customers;




