/*
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                               

(1.) Database Concepts

1. What is a database?
-> A database is an organized collection of data that is stored and accessed electronically. It allows you to store, manage, and retrieve data efficiently.

2. What is the difference between a database and a DBMS?
-> (1) A database is a collection of data that is stored in an organized way, but not necessarily in tables.
   (2) An RDBMS(Relational Database Management System) is a type of database that stores data in the form of 
      tables (rows and columns) and maintains relationships between them.
   (3) A database may or may not have relations between data, but RDBMS always maintains relationships using keys(like primary and foreign keys).  
   (4) Database can be as simple as a file system storing data, while RDBMS uses a structured format and supports SQL for managing data.    
   (5) Examples of a Database include Excel sheets or file-based storage, while RDBMS examples include MySQL, Oracle, and SQL Server.

3. What are the different types of databases?
-> (1) Relational Database stores data in tables with rows and columns. It uses SQL for managing data. Example: MySQL, Oracle, SQL Server
   (2) NoSQL Database stores unstructured or semi-structured data like documents, key-value pairs, or graphs. Example: MongoDB, Cassandra
   (3) Hierarchical Database organizes data in a tree-like structure with parent-child relationships. Example: IBM IMS
   (4) Object-Oriented Database stores data as objects like in programming, including attributes and methods. Example: ObjectDB, db4o
   (5) Distributed Database stores data across multiple computers but behaves like a single database. Example: Google Spanner, Apache Cassandra
   (6) Cloud Database is hosted on cloud platforms and can be accessed over the internet. Example: Amazon RDS, Google Firebase
   
4. What is a relational database?
-> A Relational Database is a type of database that stores data in tables (also called relations). 
   These tables are connected to each other through keys like primary keys and foreign keys.

5. What is normalization? Explain its types.
-> Normalization is a process in database design used to organize data to reduce redundancy (repeated data) and ensure data integrity.
   It divides large, complex tables into smaller related tables and links them using keys (like primary and foreign keys).
   Types of Normalization: 
   (1) 1NF (First Normal Form): Removes repeating groups by ensuring each column has atomic (single) values.
   (2) 2NF (Second Normal Form): Removes partial dependency by ensuring full dependency on the entire primary key.
   (3) 3NF (Third Normal Form): Removes transitive dependency by ensuring non-key attributes depend only on the primary key.
   (4) BCNF (Boyce-Codd Normal Form): Ensures every determinant is a candidate key, handling exceptions not covered by 3NF.
   (5) 4NF (Fourth Normal Form): Removes multi-valued dependencies to avoid storing multiple independent facts in one table.
   (6) 5NF (Fifth Normal Form): Removes join dependencies by breaking down tables into smaller ones without losing data.

6. What is denormalization?
-> Denormalization is the process of reversing normalization by combining tables or adding redundant data to improve read performance in a database.
   It is used to reduce complex joins and make data retrieval faster, especially in large databases.

7. What is a primary key? How is it different from a unique key? 
-> A Primary Key is a column (or set of columns) in a table that uniquely identifies each row in that table.
   It cannot contain NULL values and must be unique for every record, while a unique key also ensures uniqueness but can have one NULL value.

8. What is a foreign key?
-> A foreign key is a column in one table that links to the primary key of another table to create a relationship between the two tables.

9. What are indexes? Why are they used?
-> An index is a database object that improves the speed of data retrieval from a table. It works like a book index —
   helping the database find data faster without scanning every row.
   they are used: To speed up SELECT queries.
                  To improve search performance on large tables.
                  To make WHERE, JOIN, and ORDER BY operations faster.

10. What is a composite key?
-> A composite key is a combination of two or more columns in a table that together uniquely identify a row.
   It is used when no single column is unique on its own, but the combination is unique.
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                               

(2.) MySQL Commands

11. What is the purpose of the CREATE command?
-> The CREATE command in SQL is used to create new database objects such as: Tables, Databases, Views, Indexes, Users, etc.

12. How do you delete a database in MySQL?
-> To delete a database in MySQL, use the command: DROP DATABASE database_name;

13. What is the ALTER command used for?
-> The ALTER command is used to modify the structure of an existing database table, such as adding, deleting, or changing columns. 

14. How do you create a table in MySQL?
-> To create a table in MySQL, use this command: CREATE TABLE table_name (
                                                        column1 datatype,
                                                        column2 datatype,....);
													
15. What is the DROP command?
-> The DROP command is used to permanently delete a database object like a table, database, or view from the system.

16. How do you insert data into a table?
-> To insert data into a table in SQL, use the INSERT INTO command: INSERT INTO table_name (column1, column2, ...)
                                                                         VALUES (value1, value2, ...);

17. What is the syntax for updating records in a table?
-> UPDATE table_name
   SET column1 = value1, column2 = value2, ...
   WHERE condition;

18. How do you delete records from a table?
-> DELETE FROM table_name
    WHERE condition;

19. What is the SELECT statement used for?
-> The SELECT statement is used to retrieve data from one or more tables in a database.

20. How do you retrieve unique records from a table?
-> To retrieve unique records from a table, use the SELECT DISTINCT statement: SELECT DISTINCT column1, column2, ...
                                                                                FROM table_name;
                                                                                
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                               

(3.) Clauses and Operators

21. What is the purpose of the WHERE clause?
-> The WHERE clause is used to filter records based on a specified condition. Example: SELECT * FROM Student WHERE Age > 18;

22. Explain the ORDER BY clause.
-> The ORDER BY clause is used to sort the result in ascending (ASC) or descending (DESC) order. Example: SELECT * FROM Student ORDER BY Name ASC;

23. What is the GROUP BY clause used for?
-> The GROUP BY clause is used to group rows that have the same values in specified columns, often with aggregate functions.
    Example: SELECT Dept, COUNT(*) FROM Employee GROUP BY Dept;

24. How do you use the HAVING clause?
-> The HAVING clause is used to filter grouped results (used with GROUP BY). Example: SELECT Dept, COUNT(*) FROM Employee GROUP BY Dept HAVING COUNT(*) > 5;

25. What are the different comparison operators in MySQL?
->  The comparison operators in MySQL are: =, != or <>, >, <, >=, <=, and <=> (null-safe equal).

26. What is the BETWEEN operator?
-> The BETWEEN operator checks if a value is within a range (inclusive). Example: SELECT * FROM Student WHERE Age BETWEEN 18 AND 25;

27. Explain the LIKE operator.
-> The LIKE operator is used for pattern matching in strings using % and _. Example: SELECT * FROM Student WHERE Name LIKE 'A%';

28. What is the IN operator?
->  The IN operator is used to match a value against a list of values. Example: SELECT * FROM Student WHERE City IN ('Delhi', 'Mumbai');

29. How do you use the NULL operator?
-> The IS NULL and IS NOT NULL operators check whether a column has a NULL value or not. Example: SELECT * FROM Orders WHERE Address IS NULL;

30. What is the difference between AND and OR operators?                                                                                
->  The AND operator returns true if both conditions are true, while OR returns true if at least one condition is true.
      Example: SELECT * FROM Student WHERE Age > 18 AND City = 'Pune';
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                               

(4.) Predefined Functions

31. What are aggregate functions? Give examples.
->  Aggregate functions perform calculations on a set of values and return a single result. Examples: COUNT(), SUM(), AVG(), MIN(), MAX()

32. What is the COUNT() function?
-> The COUNT() function returns the number of rows that match a condition. SELECT COUNT(*) FROM Student;

33. Explain the SUM() function.
->  The SUM() function returns the total of numeric values in a column. SELECT SUM(Salary) FROM Employee;

34. What is the AVG() function?
-> The AVG() function returns the average value of a numeric column.
	SELECT AVG(Marks) FROM Result;

35. How does the MAX() function work?
->  The MAX() function returns the highest value in a column.
    SELECT MAX(Salary) FROM Employee;

36. What is the MIN() function?
->  The MIN() function returns the lowest value in a column.
    SELECT MIN(Marks) FROM Result;

37. Explain string functions in MySQL.
-> String functions in MySQL are used to perform operations on string data like length, case, extraction, and joining.
   Examples: LENGTH(), LOWER(), UPPER(), SUBSTRING(), CONCAT()

38. What is the CONCAT() function?
-> The CONCAT() function joins two or more strings into one. Eg. SELECT CONCAT(FirstName, ' ', LastName) FROM Student;

39. How do you use the SUBSTRING() function?
-> The SUBSTRING() function extracts a part of a string from a given position. Eg. SELECT SUBSTRING('Snehaa', 2, 3); → Output

40. What is the NOW() function?
-> The NOW() function returns the current date and time. Eg. SELECT NOW(); → Output: 2025-07-08 22:45:00 (for example)
---------------------------------------------------------------------------------------------------------------------------------------------------------------

(5.) User -Defined Functions

41. What is a user-defined function (UDF) in MySQL?
-> A User-Defined Function (UDF) is a custom function created by users to perform specific operations in MySQL.

42. How do you create a UDF?
-> UDFs are created using programming languages like C/C++ and then registered with MySQL using CREATE FUNCTION.

43. What is the syntax for calling a UDF?
-> To call a UDF, use the syntax: SELECT function_name(arguments);

44. Can UDFs return multiple values?
->  No, UDFs return only a single value, not multiple values.

45. What are the advantages of using UDFs?
-> Advantages of UDFs include reusability, customization, and improved code organization in queries.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(6.) Views

46. What is a view in MySQL?
-> A view is a virtual table created from the result of a SQL query.

47. How do you create a view?
-> To create a view, use: CREATE VIEW view_name AS SELECT ...;

48. What is the difference between a view and a table?
-> A view shows data from one or more tables, but unlike a table, it doesn't store data physically.

49. Can you update a view? If yes, how?
-> Yes, you can update a view if it is based on a single table and doesn't use functions or joins.
    Example: UPDATE view_name SET column = value WHERE condition;

50. How do you drop a view?
-> To drop a view, use: DROP VIEW view_name;
---------------------------------------------------------------------------------------------------------------------------------------------------------------

(7.) Common Table Expressions (CTE)

51. What is a Common Table Expression (CTE)?
-> A CTE is a temporary result set defined using WITH that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.

52. How do you create a CTE?
-> WITH cte_name AS (
   SELECT column1, column2
   FROM table_name
   WHERE condition
)
SELECT * FROM cte_name;

53. What is the difference between a CTE and a subquery?
-> CTE: More readable, reusable, and supports recursion.
Subquery: Embedded directly in the query, less readable for complex logic.

54. Can you use a CTE recursively?
-> Yes, recursive CTEs are used to perform hierarchical or repeated operations, such as traversing tree structures.

55. How do you reference a CTE in a query?
-> We can reference it just like a table: select * from CTE_name;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(8.) Joins

56. What is a join in SQL?
-> A join is used to combine rows from two or more tables based on a related column.

57. Explain the different types of joins.
-> (a) INNER JOIN: Returns matching rows from both tables.
(b) LEFT JOIN (LEFT OUTER JOIN): All rows from the left table + matching rows from the right.
(c) RIGHT JOIN (RIGHT OUTER JOIN): All rows from the right table + matching rows from the left.
(d) FULL OUTER JOIN: All rows from both tables, matched where possible.
(e) CROSS JOIN: Cartesian product of both tables.
(f) SELF JOIN: A table joined with itself.

58. What is an INNER JOIN?
->  Returns rows where there is a match in both joined tables.

59. What is a LEFT JOIN?
-> Returns all rows from the left table, and matched rows from the right table (NULLs if no match).

60. What is a RIGHT JOIN?
-> Returns all rows from the right table, and matched rows from the left table (NULLs if no match).

61. What is a FULL OUTER JOIN?
-> Returns all rows when there is a match in either left or right table (NULLs if no match on one side).

62. How do you perform a CROSS JOIN?
-> SELECT * FROM table1
   CROSS JOIN table2;

63. What is a self-join?
-> A self-join is a table joined with itself using aliases: SELECT a.name, b.manager
															FROM employees a
                                                            JOIN employees b ON a.manager_id = b.id;

64. How do you join multiple tables?
-> SELECT * FROM table1
   JOIN table2 ON table1.id = table2.fk_id
   JOIN table3 ON table2.id = table3.fk_id;

65. What is the difference between a join and a subquery?
->  Join: Combines data from multiple tables into one result set.
    Subquery: Nested query used to return data for filtering, computation, or as a derived table.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(9.) Subqueries

66. What is a subquery?
-> A subquery is a query nested inside another query to return data that is used by the main query.

67. How do you write a subquery in the SELECT statement?
-> SELECT name, (SELECT MAX(salary) FROM employees) AS max_salary FROM employees;

68. Can you use a subquery in the WHERE clause?
-> SELECT name
   FROM employees
   WHERE salary > (SELECT AVG(salary) FROM employees);

69. What is a correlated subquery?
-> A subquery that depends on the outer query for its values. It runs once for every row selected by the outer query.
Example : SELECT e1.name
          FROM employees e1
		  WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e1.department = e2.department);

70. How do you handle subqueries that return multiple rows?
-> Use operators like IN, ANY, ALL, or rewrite as a JOIN.
  Example: SELECT name FROM employees
           WHERE department_id IN (SELECT id FROM departments WHERE location = 'Mumbai');

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(10.) Stored Procedures

71. What is a stored procedure?
->  A stored procedure is a group of SQL statements stored in the database that can be executed as a single unit.

72. How do you create a stored procedure in MySQL?
-> DELIMITER //
   CREATE PROCEDURE GetAllEmployees()
   BEGIN
       SELECT * FROM employees;
   END //
   DELIMITER ;

73. What is the syntax for calling a stored procedure?
-> CALL GetAllEmployees();

74. Can stored procedures accept parameters?
-> Yes, they can accept IN, OUT, or INOUT parameters.
   Example : CREATE PROCEDURE GetEmployeeById(IN emp_id INT)
		     BEGIN
				SELECT * FROM employees WHERE id = emp_id;
             END;

75. What are the advantages of using stored procedures?
-> (a) Improves performance (precompiled).
   (b) Promotes code reuse.
   (c) Enhances security (access controlled).
   (d) Reduces network traffic.
   (e) Centralized business logic.

---------------------------------------------------------------------------------------------------------------------------------------------------------------
   
11.) Triggers

76. What is a trigger in MySQL?
-> A trigger is a database object that automatically executes a specified action in response to certain events on a table (e.g., INSERT, UPDATE, DELETE).

77. How do you create a trigger?
-> CREATE TRIGGER trigger_name
   AFTER INSERT ON table_name
   FOR EACH ROW
   BEGIN
       -- actions
   END;

78. What are the different types of triggers?
-> (a) BEFORE INSERT     (b) AFTER INSERT             (c) BEFORE UPDATE
   (d)AFTER UPDATE       (e) BEFORE DELETE            (f) AFTER DELETE

79. Can a trigger call a stored procedure?
-> Yes, a trigger can call a stored procedure, but it cannot accept OUT or INOUT parameters.

80. What is the difference between a trigger and a stored procedure?Feature	Trigger	Stored Procedure
-> Execution   |   Automatic (on table events)	 |  Manual (via CALL statement)
   --------------------------------------------------------------------
    Use Case   |   Data auditing, validation	 |  Complex business logic, reuse
   ---------------------------------------------------------------------
   Parameters  |   Cannot accept parameters	     |  Can accept IN/OUT/INOUT parameters

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(12.) Data Control Language (DCL)

81. What is Data Control Language (DCL)?
-> DCL deals with rights, permissions, and control of access to database objects. Main commands: GRANT and REVOKE.

82. What is the purpose of the GRANT command?
-> It gives specific privileges to users or roles. Example: GRANT SELECT, INSERT ON employees TO 'snehaa'@'localhost';

83. How do you revoke privileges using the REVOKE command?
-> Removes permissions previously granted. Example: REVOKE INSERT ON employees FROM 'snehaa'@'localhost';

84. What is the difference between a user and a role in MySQL?
-> User: An account that can connect and work with the database.
   Role: A collection of privileges that can be assigned to users.

85. How do you create a new user in MySQL?   
-> CREATE USER 'snehaa'@'localhost' IDENTIFIED BY 'your_password';

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(13.) Transaction Control Language (TCL)

86. What is Transaction Control Language (TCL)?
-> TCL commands manage transactions in a database. They help ensure data integrity by grouping SQL operations into logical units.

87. What is the purpose of the COMMIT command?
-> COMMIT permanently saves all changes made in the current transaction to the database.

88. How do you use the ROLLBACK command?
-> ROLLBACK undoes all changes made in the current transaction. Example: ROLLBACK;

89. What is the SAVEPOINT command?
-> SAVEPOINT sets a point within a transaction to which you can roll back without affecting the entire transaction.

90. How do you set the transaction isolation level?
-> Command: SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(14.) Types of Databases

91. What are the different types of databases (e.g., relational, NoSQL)?
-> (a) Relational (SQL)   (b) NoSQL (Document, Key-Value, Column, Graph)    (c) Distributed databases
   (d) Cloud databases    (e) Object-oriented databases                     (f) Time-series databases

92. What is the difference between SQL and NoSQL databases?
-> SQL: Structured, uses tables and schema.
   NoSQL: Unstructured or semi-structured, flexible schema, supports high scalability.

93. What are some examples of NoSQL databases?
-> MongoDB, Cassandra, Redis, CouchDB, Amazon DynamoDB.

94. What is a distributed database?
-> A database where data is stored across multiple physical locations (servers/nodes), but appears as a single database to users.

95. What is a cloud database?
-> A database that runs on cloud computing platforms such as AWS, Azure, or Google Cloud, offering scalability, backup, and remote access.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

(15.) Database Management Systems (DBMS)

96. What is a Database Management System (DBMS)?
-> Software that helps in creating, managing, and interacting with databases.

97. What are the functions of a DBMS?
-> (a) Data storage and retrieval
   (b) Transaction management
   (c) Concurrency control
   (d) Backup and recovery
   (e) Security and authorization
   (f) Data integrity enforcement

98. What is the difference between a DBMS and a RDBMS?
-> DBMS: Manages data in files or simple databases (no relationships).
   RDBMS: Manages relational data using tables and supports relationships and constraints (e.g., MySQL, Oracle).
 
99. What are some popular DBMS software?
->  MySQL, PostgreSQL, Oracle, SQL Server, MongoDB, SQLite, IBM DB2.

100. What is data integrity, and how does a DBMS ensure it?
-> Data integrity ensures accuracy and consistency of data.
   A DBMS enforces it using:
                            (a) Constraints (PRIMARY KEY, FOREIGN KEY)
							(b) Transactions
                            (c) Validation rules
                            (d) Triggers

*/