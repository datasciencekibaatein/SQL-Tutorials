-- DDL

-- DDL (DATA DEFINITION LANGUAGE)

-- CREATING THE DATABASE
CREATE DATABASE LECTURE2;

-- HOW TO USE DATABASE
USE LECTURE2;

-- DROP DATABASE
DROP DATABASE LECTURE2;

-- CREATE TABLE 
CREATE TABLE employees(
	emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    hire_date date
);

create table emp(
	emp_id int,
    emp_name varchar(10)
);

insert into emp values(1,'Rohit');

-- ALTER TABLE
-- ADDING COLUMN
ALTER TABLE employees ADD COLUMN email varchar(40);

-- modifying the column
ALTER TABLE employees MODIFY COLUMN salary FLOAT;

-- RENAME THE COLUMN USING ALTER
ALTER TABLE employees RENAME COLUMN emp_name to full_name;

-- RENAME THE TABLE 
ALTER TABLE employees RENAME TO staff_members;


-- DROP TABLE
DROP TABLE STAFF_MEMBERS;

select * from emp;
drop table emp;
-- TRUNCATE
TRUNCATE table emp;















