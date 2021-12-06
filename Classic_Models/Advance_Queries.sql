show databases;

use SQL_Assignment_3;

show tables;

-- Subquery --

SELECT * from Employee e ;

SELECT e.First_Name ,e.Last_Name ,e.Annual_Salary 
from Employee e WHERE e.Annual_Salary >
(SELECT AVG(e2.Annual_Salary) from Employee e2);

SELECT e.First_Name ,e.Last_Name ,e.Annual_Salary 
from Employee e WHERE e.Annual_Salary >
(SELECT e2.Annual_Salary from Employee e2 WHERE e2.First_Name = 'Tejas');

use classicmodels;

show tables;

SELECT * from products p ;

SELECT * from orderdetails o ;

-- Subquery--

SELECT p.productCode, p.productName , p.MSRP 
from products p WHERE p.productCode IN 
(SELECT o.productCode from orderdetails o WHERE o.priceEach < 100);

-- Join--

SELECT DISTINCT p.productCode ,p.productName ,p.MSRP 
from products p 
join orderdetails o 
on p.productCode = o.productCode 
WHERE o.priceEach < 100;

-- Stored Procedure

CREATE database Game;
use Game;

SELECT * from player p ;

delimiter &&
CREATE procedure top_player()
begin
	SELECT first_name, gols from player WHERE gols > 60;
end &&
delimiter ;

call top_player ;

# stored procedure using IN

show databases;
use SQL_Assignment_3;


select * from Employee;

delimiter //
create procedure sp_sort_by_salary(IN var int)
begin
	select First_Name, Last_Name, Annual_Salary from Employee
    order by Annual_Salary desc limit var;
end //
delimiter ;

call sp_sort_by_salary(3);

delimiter //
create procedure update_salary(IN temp_name varchar(20),
							   IN new_salary float)
begin
update Employee set 
Annual_Salary = new_salary where first_Name = temp_name;
end;

select * from Employee;

call update_salary('Tina',20000);


-- Trigger in SQL

-- Data Manipulation Trigger
-- Data Dafination Trigger
-- Log on TRIGGER 


CREATE DATABASE Students;

CREATE table student
(
	st_roll int,
	age int,
	name varchar(30),
	mark float
);

delimiter //
CREATE trigger marks_verify
before INSERT on student
for each ROW 
if new.marks < 0 then set new.marks = 50 ;
end if; //


INSERT into student values
(501,10,'Jay',45),
(502,11,'Rima',-12),
(503,12,'Dave',-43.3),
(504,13,'Mike',40);

SELECT * from student s ;

-- Views in SQL

use classicmodels;

SELECT * from customers c ;

CREATE view cust_details
as
select c.customerName, c.phone, c.city 
from customers c ;

SELECT * from cust_details cd ;

SELECT * from productlines p ;

CREATE view product_description
as
select p.productName , p.quantityInStock, p.MSRP, pl.textDescription 
from products p 
join
productlines pl
on
p.productLine = pl.productLine ;



SELECT * from product_description pd ;

# Rename Description

rename table product_description to vehical_description;

SELECT * from vehical_description vd ;

# Windows Function

show databases;

use SQL_Assignment_3;

SELECT * from Employee e ;

SELECT e.First_Name,e.Department_No,
sum(e.Annual_Salary) over (PARTITION by e.Department_No) as Total_salary
FROM Employee e ;

# Row number

SELECT ROW_NUMBER () over(order by e.Annual_Salary) as row_num,
e.First_Name , e.Annual_Salary 
from Employee e 
order by e.Annual_Salary ;

SELECT e2.First_Name, e2.Annual_Salary from Employee e2 WHERE e2.Annual_Salary =(SELECT max(e.Annual_Salary)from Employee e );



