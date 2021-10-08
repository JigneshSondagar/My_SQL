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



