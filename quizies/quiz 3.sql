-- ------------------------------------------------------ SQL Concepts and Real Situations --------------------------------------------------------------------
-- Create a database
create database EmpData;

-- Use the Database
use EmpData;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

-- ------------------------------------------------------- Part A: Commands (DDL, DML, DQL) -------------------------------------------------------------------

-- 1. Your company wants to store employee data. Write an SQL statement to create a table Employees with columns: EmpID(Primary key), Name, Department, and Salary.
-- Create a table : Employees
create table Employees (
EmpID int primary key,
Name varchar(100),
department varchar(100),
salary decimal(10,2)
);

-- Insert 10 records in the Employee table
INSERT INTO Employees (EmpID, Name, department, salary) VALUES
(101, 'Rahul Sharma', 'IT', 75000.00),
(102, 'Priya Mishra', 'HR', 60000.00),
(103, 'Amit patel', 'Finance', 82000.50),
(104, 'Neha Jha', 'Marketing', 72000.00),
(105, 'Ravi Patil', 'IT', 68000.75),
(106, 'Sneha Sahu', 'Sales', 55000.00),
(107, 'Ankit shukla', 'Finance', 90000.00),
(108, 'Divya Sahani', 'HR', 61000.25),
(109, 'Suresh Sahu', 'Marketing', 70000.00),
(110, 'Meena Dubey', 'Sales', 58000.50);

-- 2. The HR team found one employee's salary was entered incorrectly. Write an SQL query to update the salary of employee with EmpID = 105.
Update Employees set salary = 75000.00 where EmpID = 105;

-- 3. A manager wants to remove employees who resigned. Write an SQL statements to delete employees from the Employees table where Department ='HR'
delete from employees where department = 'HR';

-- 4. Write a query to display all employees working in the 'Finance' department.
SELECT * FROM Employees WHERE Department = 'Finance';

-- ---------------------------------------------------------- Part B: Clauses - 4 Questions ----------------------------------------------------------------

-- 5. Display the top 3 Highest-paid employees using the ORDER BY and LIMIT clauses.
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 3;

-- 6. Find the total salary paid by each department using the GROUP BY clause
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department;

-- 7. Retrieve all employees who earn more than 50,000 but less than 80,000 using the WHERE clause.
SELECT * FROM Employees WHERE Salary > 50000 AND Salary < 80000;

-- 8. Show Employees whose names start with "A" using the LIKE clause.
SELECT * FROM Employees WHERE Name LIKE 'A%';

-- -------------------------------------------------------------- Part C: Constraints ---------------------------------------------------------------------

-- 9. When creating the students table, ensure that RollNio is unique and marks cannot be negative. Write teh SQL Statement.
CREATE TABLE Students (
    RollNo INT UNIQUE,
    Name VARCHAR(100),
    Marks INT CHECK (Marks >= 0)
);

-- 10. add a NOT NULL constraint on the Email column in the Employees table.
ALTER TABLE Employees
MODIFY Email VARCHAR(100) NOT NULL;

create table customers (
CustomerID int primary key,
cust_name varchar(100)
);

-- Insert 5 records in the orders table
insert into customers(customerID, Cust_name) values
(1, 'Sanika Samanta'),
(2, 'Soniya Guria'),
(3, 'Priya khair'),
(4, 'Ashi Bhitle'),
(5, 'Ashu Sharma'); 

-- 11. Create a table orders where OrderID is the Primary Key and CustomerID is a Foreign KEy referencing the Customers table.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    orderAmount int,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ----------------------------------------------------------------------- Part D: Joiins -------------------------------------------------------------------

-- 12. Write a query to fetch all customer names along with their order details using an INNER JOIN. 
SELECT Customers.Cust_Name, Orders.OrderID, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

create table projects (
projectID int primary key,
projectName varchar(100),
empid int not null
);

create table department(
deptID INT PRIMARY KEY,
DeptName varchar(100)
);

-- 13. Display all employees and their assigned projects. If an employees has no project, still show their name using a LEFT JOIN.
SELECT Employees.Name, Projects.ProjectName
FROM Employees
LEFT JOIN Projects ON Employees.EmpID = Projects.EmpID;

-- 14. List all departments using a RIGHT JOIN. Ensure departments with no employees are also shown.
SELECT Department.DeptName, Employees.Name
FROM Employees
RIGHT JOIN Department ON Employees.DeptID = Department.DeptID;

-- 15. Retrieve employees who have not been assigned to any project using a join.
SELECT Employees.Name
FROM Employees
LEFT JOIN Projects ON Employees.EmpID = Projects.EmpID
WHERE Projects.EmpID IS NULL;

-- 16. Combine two tables Branch_A_Employees and Branch_B_Employees to get a full list of employees using a UNION.
SELECT * FROM Branch_A_Employees
UNION
SELECT * FROM Branch_B_Employees;

-- ------------------------------------------------------------------Part E: Subqueries --------------------------------------------------------------------------

-- 17. Find the second highest salary from the Employees table using a subquery.
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

-- 18. Retrieve names of employees whose salary is greater than average salary using a subquery.
SELECT Name
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 19. Display employees who work in the same department as the employee named "Rohit".
SELECT *
FROM Employees
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Employees
    WHERE Name = 'Rohit'
);

-- 20. Fetch all customers who placed orders worth more than the average order amount.
SELECT DISTINCT CustomerID
FROM Orders
WHERE OrderAmount > (SELECT AVG(OrderAmount) FROM Orders);

-- --------------------------------------------------------------- Part F: Built-in & User-defined Functions ---------------------------------------------------

-- 21. Use a built-in function to display the current date and time.
SELECT NOW() AS CurrentDateTime;

-- 22. Write a query to show the length of each employee's name using the LENGTH() function. 
SELECT Name, LENGTH(Name) AS NameLength
FROM Employees;

-- 24. Retrieve the total number of employees in the company using a built-in function. 
SELECT COUNT(*) AS TotalEmployees
FROM Employees;

-- 25. Create a user-defined function GetBonus(salary) that returns 10% of the salary as a bonus.
-- Use Your GetBonus function to display EmpID, Name, and Bonus for all the employees.

DELIMITER //
CREATE FUNCTION GetBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //
DELIMITER ;

SELECT EmpID, Name, GetBonus(Salary) AS Bonus
FROM Employees;



