show databases;

CREATE database SQL_Assignment_2;

use SQL_Assignment_2;

show tables;

CREATE table Employee
(
Id int(10),
Name varchar(20),
Last_Name varchar(20),
Department int(5)
);

CREATE table Department
(
Code int(5),
Name varchar(20),
Budget int(8)
);

insert into Employee (Id,Name,Last_Name,Department)
values
(123234877,"Michael","Rogers",14),
(152934485,"Anand","Manikutty",14),
(223464883,"Carol","Smith",37),
(326587417,"Joe","Stevens",37),
(32154719,"Mary-Anne","Foster",14),
(332569843,"George","ODonnell",77),
(546523478,"John","Doe",59),
(631231482,"David","Smith",77),
(654873219,"Zacary","Efron",59),
(745685214,"Eric","Goldsmith",59),
(845657245,"Elizabeth","Doe",14),
(845657246,"Kumar","Swamy",14);

insert into Department (Code,Name,Budget)
values
(14,"IT",6500),
(37,"Accounting",15000),
(59,"Human Resources",240000),
(77,"Research",55000);


# 1. Select the last name of all employees, without duplicates.
SELECT DISTINCT Last_Name FROM Employee ;


# 2. Select all the data of employees whose last name is "Smith".
SELECT * FROM Employee WHERE Last_Name like 'Smith';


# 3. Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM Employee WHERE Last_Name = 'Smith' OR Last_Name = 'Doe';


# 4. Select all the data of employees that work in department 14.
SELECT * FROM Employee WHERE Department = 14;


# 5. Select all the data of employees that work in department 37 or department 77.
SELECT * FROM Employee WHERE Department = 37 or Department = 77;


# 6. Select all the data of employees whose last name begins with an "S".
SELECT * FROM Employee WHERE Last_Name LIKE 's%';


# 7. Select the sum of all the departments' budgets.
SELECT SUM(Budget) Total_Budget FROM Department ;


# 8. Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT Department,COUNT(*) No_of_Employee from Employee GROUP BY Department; 


# 9. Select all the data of employees, including each employee's department's data.
SELECT * from Employee join Department ;


# 10.Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT e.Name, e.Last_Name, d.Name, d.Budget from Employee e 
join Department d 
on
e.Department = d.Code;


# 11.Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT e.Name, e.Last_Name,d.Budget from Employee e 
join Department d 
on 
e.Department = d.Code
WHERE d.Budget >= 60000;


# 12.Select the departments with a budget larger than the average budget of all the departments.
SELECT * from Employee e 
join Department d 
on
e.Department = d.Code
WHERE d.Budget > (SELECT AVG(Budget) from Department);

SELECT * FROM Department 
where Budget > (SELECT avg(budget) from Department );


# 13.Select the names of departments with more than two employees. 
SELECT d.Name from Department d 
join Employee e 
on
d.Code = e.Department
GROUP BY d.Name
HAVING COUNT(*) > 2 ;

# 14.Very Important - Select the name and last name of employees working for departments with second lowest budget.
SELECT e.Name, e.Last_Name, d.Budget FROM Employee e
join Department d 
on e.Department = d.Code 
WHERE e.Department = (
       SELECT sub.Code 
       FROM (SELECT * FROM Department d ORDER BY d.Budget LIMIT 2) sub 
       ORDER BY budget DESC LIMIT 1);


# 15.Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11.


# 16.And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.


# 17.Reduce the budget of all departments by 10%.


# 18.Reassign all employees from the Research department (code 77) to the IT department (code 14).


# 19.Delete from the table all employees in the IT department (code 14). 


# 20.Delete from the table all employees who work in departments with a budget greater than or equal to $60,000. 




