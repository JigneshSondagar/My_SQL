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

insert into Job (Job_id,Job_title,Department_no)
values
	(20101,"Manager",20),
	(200105,"Product Excutive",50),
	(200107,"Programmer",10),
	(200187,"Exceutive",40),
	(200976,"Manager",30),
	(200765,"Accountant",0),
	(200234,"Programmer",10),
	(200546,"Exceutive",40),
	(200123,"Account Executive",90),
	(200548,"Support Assistant",10);


SELECT * from Job;


CREATE table Department(
	Department_no int(3),
	Department_Name varchar(15));

insert into Department(Department_no,Department_Name)
values
	(20,"Sales"),
	(50,"Marketing"),
	(10,"IT"),
	(40,"Admin"),
	(30,"HR"),
	(0,"Finance"),
	(10,"IT"),
	(40,"Admin"),
	(90,"Finance"),
	(10,"IT");

SELECT * from Department ;


# ******** Accounting Department Requirements ********

# Request 1
# List the last name, first name and employee number of all programmers who were hired on or 
# before 21 May 1991 sorted in ascending order of last name.
SELECT e.Employee_no, e.First_Name, e.Last_Name, j.Job_title from Employee e 
join Job j 
on e.Job_id = j.Job_id
where j.Job_title = 'Programmer' and 
e.Hire_Date <= '1991-05-21'
ORDER BY e.Last_Name ASC ;


# Request 2
# List the department number, last name and salary of all employees who were hired between 16/09/87 and 12/05/96 sorted 
# in ascending order of last name within department number.
SELECT e.Department_No, e.Last_Name, e.Annual_Salary from Employee e 
WHERE e.Hire_Date BETWEEN '1987-09-16' AND '1996-05-12'
ORDER BY e.Last_Name ASC , e.Department_No ASC ;


# Request 3
# List all the data for each job where the average salary is greater than 15000 sorted in descending order of the average salary.
SELECT j.*, e.Annual_Salary,(SELECT AVG(e.Annual_Salary) from Employee e) as Avrage_salary from Job j
join Employee e 
on j.Job_id = e.Job_id 
WHERE Annual_Salary  > 15000
ORDER BY Avrage_salary DESC ; 


# Request 4
# List the last name, first name, job id and commission of employees who earn commission sorted in 
# ascending order of first name. (Commision=Annual_Salary* Commission_Percent)
SELECT e.Last_Name, e.First_Name, e.Job_id, e.Commision_Percent from Employee e 
WHERE e.Commision_Percent > 0
ORDER BY e.First_Name ASC ;


# Request 5
# Which Job Title are found in the IT and Sales departments?
SELECT j.Job_title from Job j
join Department d 
on j.Department_no = d.Department_no 
WHERE d.Department_Name = 'IT' OR d.Department_Name = 'Sales';


# Request 6
# List the last name of all employees in department no 10 and 40 together with their monthly salaries (rounded to 2 decimal places), 
# sorted in ascending order of last name.
SELECT e.Last_Name,ROUND(e.Annual_Salary / 12,2) as Monthly_salary from Employee e where
e.Department_No = '10' or e.Department_No = '40'
ORDER BY e.Last_Name ASC ;


# Request 7
# Show the total Annual Salary salaries for one month displayed with no decimal places.
SELECT ROUND(SUM(e.Annual_Salary/12)) as Monthly_Salary from Employee e ;


# ******** Personnel Department Requirements ********


# Request 8
# Show the total number of employees. 
SELECT COUNT(e.Employee_no) as Total_Employees from Employee e ;


# Request 9
# List the department number, department name and the number of employees for each department that has more than 
# 2 employees grouping by department number and department name.
SELECT d.Department_no, d.Department_Name, COUNT(e.Employee_no) as Total_Employee
from Department d 
join Employee e 
on e.Department_No = d.Department_no 
GROUP BY d.Department_Name, d.Department_no 
HAVING Total_Employee > 2;


# Request 10
# List the department number, department name and the number of employees for the department that has the highest 
# number of employees using appropriate grouping.
SELECT d.Department_no, d.Department_Name, COUNT(DISTINCT  e.First_Name) as Total_Employee
from Department d 
join Employee e 
on e.Department_No = d.Department_no 
GROUP BY d.Department_Name,d.Department_no 
ORDER BY Total_Employee DESC ;


# Request 11
# List the department number and name for all departments where no programmers work.
SELECT DISTINCT j.Department_no, d.Department_Name from Job j 
join
Department d 
on j.Department_no = d.Department_no 
where j.Job_title != 'Programmer' ;


# Request 12
# Update all the Annual salaries for jobs with an increase of 1000.
create table Employee_Copy select * from Employee e ;
UPDATE Employee_Copy set Annual_Salary = Annual_Salary + 1000;
SELECT * from Employee_Copy ;


# Request 13
# List all the data for jobs sorted in ascending order of job id.
SELECT * FROM Job j
order by j.Job_id ASC ;

# Request 14
# The job history for employee number 102 is no longer required. Delete this record.
DELETE FROM Employee_Copy  WHERE Employee_no = '102';
SELECT * from Employee_Copy;


# Request 15
# Prepare a table with percentage raises, employee numbers and old and new salaries. 
# Employees in departments 20 and 10 are given a 5% rise, employees in departments 50, 90 and 30 are given a 10% rise and 
# employees in other departments are not given a rise.
create view Increment_table as select employee_no, 
IF(department_no in (20,10),5,
If(department_no in (50,90,30),10,0)) percentage_raise,
annual_salary old_annual_salary,
round(annual_salary*(1+(IF(department_no in (20,10),5,
If(department_no in (50,90,30),10,0))*0.01)),2) new_annual_salary
from Employee_Copy;

select * from Increment_table;


# ******** IT Manager Requirements ********


# Request 16
# Create a new view for manager’s details only using all the fields from the employee table.
create view manager_table as select * from Job where job_title like 'Manager%';
select * from manager_table;

CREATE view Programmer_Table as select * from Job where Job_title like 'Programmer';
SELECT * from programmer_table ;


# Request 17
# Show all the fields and all the managers using the view for managers sorted in ascending order of employee number.
select * from manager_table mt ;
