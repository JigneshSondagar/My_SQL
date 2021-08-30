show databases;

CREATE database SQL_Assignment_3;

use SQL_Assignment_3;

CREATE table Employee(
	Employee_no int(4),
	First_Name varchar(15),
	Last_Name varchar(15),
	Hire_Date date,
	Annual_Salary decimal(10,2),
	Commision_Percent int(3),
	Job_id int(3),
	Department_No int(3));


insert into Employee (Employee_no,First_Name,Last_Name,Hire_Date,Annual_Salary,Commision_Percent,Job_id,Department_no)
values
	(101,"Ravi","Sharma","1987-09-16",12000.76,0,20101,20),
	(102,"Kapil","Shah","1996-05-12",15000.55,1,200105,50),
	(103,"Niharika","Soni","1988-06-11",17000,0,200107,10),
	(104,"Richa","Sharma","1994-08-17",55000,2,200187,40),
	(105,"Tejas","Patel","1990-01-27",30000,0,200976,30),
	(106,"Kanika","Kapoor","1992-05-21",33000.887,3,200765,0),
	(107,"Rohan","Seth","1989-11-13",26000,6,200234,10),
	(108,"Zinab","Kapasi","1989-11-12",20000.76,7,200546,40),
	(109,"Mittal","Bajaj","1992-06-21",10000.76,1,200123,90),
	(110,"Tina","Rai","1992-04-21",18000.76,2,200548,10);



SELECT * FROM Employee e ;


CREATE table Job(
	Job_id int(3),
	Job_title varchar(20),
	Department_no int(3));
