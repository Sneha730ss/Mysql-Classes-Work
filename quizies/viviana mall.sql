-- ---------------------------------------------- Database Queries -----------------------------------------------

-- To create a database
create database Viviana_mall;

-- we need to use the databse which has been created 
use Viviana_mall;

-- Delete a database
drop database viviana_mall;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1: Stores(StoreID, StoreName, Category, Floor, OpeningDate, MonthlyRent)

T2: Employees(EmployeeID, StoreID, Name, Position, Salary, HireDate)

T3: Customers(CustomerID, Name, Email, Phone, MembershipStatus)

T4: Purchases(PurchaseID, CustomerID, StoreID, Amount, PurchaseDate, PaymentMode)

T5: Events( EventID, EventName, EventDate, StoreID, Budget)

*/
-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Stores 
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Floor INT CHECK (Floor BETWEEN 1 AND 5),
    OpeningDate DATE,
    MonthlyRent DECIMAL(10, 2)
);

-- Insert the records into the table
INSERT INTO Stores VALUES
(1, 'Zara', 'Clothing', 1, '2019-05-20', 150000.00),
(2, 'Starbucks', 'Cafe', 1, '2020-01-15', 90000.00),
(3, 'Croma', 'Electronics', 2, '2018-07-10', 200000.00),
(4, 'McDonalds', 'Food', 3, '2016-03-18', 110000.00),
(5, 'Hamleys', 'Toys', 2, '2021-11-12', 95000.00),
(6, 'Apple Store', 'Electronics', 3, '2022-02-01', 300000.00),
(7, 'Pantaloons', 'Clothing', 4, '2017-09-30', 140000.00),
(8, 'Dominos', 'Food', 3, '2020-06-20', 105000.00),
(9, 'Archies', 'Gifts', 5, '2015-12-25', 70000.00),
(10, 'Chumbak', 'Accessories', 1, '2018-04-01', 85000.00);

-- to display/retrieve table data
SELECT * FROM Stores;               

-- to remove complete data from table
truncate table Stores;

-- to delete complete attributes and records 
drop table Stores;
set sql_safe_updates=0;
-- ------------------------------------------ Queries -------------------------------------------------------------
-- 1. adding constraint in table store to check the (MonthlyRent > 0)
ALTER TABLE Stores ADD CONSTRAINT chk_Rent CHECK (MonthlyRent > 0);

-- 2. Increase rent by 5% for Food stores
UPDATE Stores SET MonthlyRent = MonthlyRent * 1.05 WHERE Category = 'Food';

-- 3. List all Clothing stores, highest rent first
SELECT * FROM Stores WHERE Category = 'Clothing' ORDER BY MonthlyRent DESC;

-- 4. Show all categories that have more than one store
SELECT Category, COUNT(*) AS StoreCount
FROM Stores
GROUP BY Category
HAVING COUNT(*) > 1;

-- 5. Find stores located on floors 2 through 4
SELECT * FROM Stores WHERE Floor BETWEEN 2 AND 4;

-- 6. Select stores in Clothing or Electronics
SELECT * FROM Stores WHERE Category IN ('Clothing', 'Electronics');

-- 7. Find stores whose names start with “A”
SELECT * FROM Stores WHERE StoreName LIKE 'A%';

-- 8. Select stores that have an opening date recorded
SELECT * FROM Stores WHERE OpeningDate IS NOT NULL;

-- 9. Show each store’s name and calculate its annual rent
SELECT StoreName, MonthlyRent * 12 AS AnnualRent FROM Stores;

-- 10. Display store names in all uppercase
SELECT UPPER(StoreName) AS StoreCaps FROM Stores;

-- 11. Get store names and what year they opened
SELECT StoreName, YEAR(OpeningDate) AS OpenedYear FROM Stores;

-- 12. Label each store as High/Medium/Low rent based on thresholds
SELECT StoreName,
  CASE
    WHEN MonthlyRent > 150000 THEN 'High'
    WHEN MonthlyRent BETWEEN 90000 AND 150000 THEN 'Medium'
    ELSE 'Low'
  END AS RentCategory
FROM Stores;

-- 13. Report the highest and lowest monthly rent
SELECT MAX(MonthlyRent) AS MaxRent, MIN(MonthlyRent) AS MinRent FROM Stores;

-- 14. Show store names and their character lengths
SELECT StoreName, LENGTH(StoreName) AS NameLength FROM Stores;

-- 15. Combine store name and category in one field
SELECT StoreName || ' - ' || Category AS FullInfo FROM Stores;

-- 16. Mark each StoreID as even (0) or odd (1)
SELECT StoreID, MOD(StoreID, 2) AS EvenOdd FROM Stores;

-- 17. Compute how far each rent is from ₹100,000 
SELECT ABS(MonthlyRent - 100000) AS RentDiff FROM Stores;

-- 18. List every store paired with its employees
SELECT s.StoreName, e.Name
FROM Stores s
JOIN Employees e ON s.StoreID = e.StoreID;

-- 19. Show stores that pay more than the average rent
SELECT * FROM Stores WHERE MonthlyRent > (
  SELECT AVG(MonthlyRent) FROM Stores
);

-- 20. Show stores with rent higher than the average for their category
SELECT StoreName
FROM Stores s1
WHERE MonthlyRent > (
  SELECT AVG(MonthlyRent) FROM Stores s2 WHERE s1.Category = s2.Category
);

-- 21.  Create a view of stores with rent over ₹150,000
CREATE VIEW HighRentStores AS
SELECT StoreName, MonthlyRent FROM Stores WHERE MonthlyRent > 150000;

-- 22. select those on floors below 4
WITH ClothingStores AS (
  SELECT * FROM Stores WHERE Category = 'Clothing'
)
SELECT * FROM ClothingStores WHERE Floor < 4;

-- 23. List stores and their purchases
SELECT s.StoreName, p.Amount
FROM Stores s
LEFT JOIN Purchases p ON s.StoreID = p.StoreID;

-- 24. Show stores with their events
SELECT s.StoreName, e.EventName
FROM Stores s
JOIN Events e ON s.StoreID = e.StoreID;

-- 25. Combine stores without events and stores with events
SELECT s.StoreName, e.EventName
FROM Stores s
LEFT JOIN Events e ON s.StoreID = e.StoreID
UNION
SELECT s.StoreName, e.EventName
FROM Stores s
RIGHT JOIN Events e ON s.StoreID = e.StoreID;

-- 26. Show how many employees each store has
SELECT StoreName, (SELECT COUNT(*) FROM Employees e WHERE e.StoreID = s.StoreID) AS EmpCount
FROM Stores s;

-- 27. Create a view listing upcoming store events
CREATE VIEW StoreEvents AS
SELECT s.StoreName, e.EventName, e.EventDate
FROM Stores s
JOIN Events e ON s.StoreID = e.StoreID;

-- 28. Find stores with no employees
SELECT StoreName FROM Stores
WHERE StoreID NOT IN (SELECT StoreID FROM Employees);

-- 29. Find stores with total purchases over ₹5,000 
SELECT s.StoreName, SUM(p.Amount) AS TotalEarning
FROM Stores s
JOIN Purchases p ON s.StoreID = p.StoreID
GROUP BY s.StoreName
HAVING SUM(p.Amount) > 5000;

-- 30. List clothing‑category stores with recent hires
SELECT s.StoreName, e.Name
FROM Stores s
JOIN Employees e ON s.StoreID = e.StoreID
WHERE s.Category = 'Clothing' AND e.HireDate > '2020-01-01';

-- 31. Calculate total monthly rent by store category 
SELECT Category, SUM(MonthlyRent) AS TotalRent
FROM Stores
GROUP BY Category;

-- 32. Find stores with rent greater than 100000
SELECT * FROM Stores WHERE MonthlyRent > 100000;

-- 33. Stores on floor 1 or 2
SELECT * FROM Stores WHERE Floor IN (1, 2);

-- 34. Stores with rent between 80000 and 150000
SELECT * FROM Stores WHERE MonthlyRent BETWEEN 80000 AND 150000;

-- 35. Clothing stores opened before 2020
SELECT * FROM Stores WHERE Category = 'Clothing' AND OpeningDate < '2020-01-01';

-- 36. Electronics stores or Food outlets
SELECT * FROM Stores WHERE Category = 'Electronics' OR Category = 'Food';

-- 37. Stores with names starting with 'C'
SELECT * FROM Stores WHERE StoreName LIKE 'C%';

-- 38. Stores not on floor 3
SELECT * FROM Stores WHERE Floor <> 3;

-- 39. Stores with rent not null and greater than or equal to 90000
SELECT * FROM Stores WHERE MonthlyRent IS NOT NULL AND MonthlyRent >= 90000;

-- 40. Count of stores per category
SELECT Category, COUNT(*) AS StoreCount FROM Stores GROUP BY Category;

-- 41. Average rent per floor, only floors with >1 store
SELECT Floor, AVG(MonthlyRent) AS AvgRent
FROM Stores
GROUP BY Floor
HAVING COUNT(*) > 1;

-- 42. Total rent sum for Food or Cafe category
SELECT SUM(MonthlyRent) AS TotalRent FROM Stores WHERE Category IN ('Food', 'Cafe');

-- 43. Minimum and maximum rent values
SELECT MIN(MonthlyRent) AS MinRent, MAX(MonthlyRent) AS MaxRent FROM Stores;

-- 44. Increase rent by 10% for stores opened before 2018
SELECT StoreID, StoreName, MonthlyRent * 1.10 AS IncreasedRent
FROM Stores
WHERE OpeningDate < '2018-01-01';

-- 45. Stores whose name is exactly 7 characters long
SELECT * FROM Stores WHERE LENGTH(StoreName) = 7;

-- 46. Floors sorted descending with counts
SELECT Floor, COUNT(*) AS NumStores
FROM Stores
GROUP BY Floor
ORDER BY Floor DESC;

-- 47. Stores with 'a' in their names (case-insensitive)
SELECT * FROM Stores WHERE LOWER(StoreName) LIKE '%a%';

-- 48. Opened this decade (from 2020 onward)
SELECT * FROM Stores WHERE OpeningDate >= '2020-01-01';

-- 49. Gifts or Accessories category with rent under 90000
SELECT * FROM Stores
WHERE (Category = 'Gifts' OR Category = 'Accessories')
  AND MonthlyRent < 90000;

-- 50. All stores ordered by rent per floor ratio descending
SELECT *, MonthlyRent / Floor AS RentPerFloor
FROM Stores
ORDER BY RentPerFloor DESC;

-- ------------------------------------------------------------------------------------------------------------------------------
-- Table 2: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    StoreID INT,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- Insert the records into the table
INSERT INTO Employees VALUES
(1, 1, 'Amit Patel', 'Manager', 60000, '2020-01-10'),
(2, 2, 'Rina Shah', 'Barista', 25000, '2021-03-05'),
(3, 3, 'Mohit Verma', 'Sales Exec', 30000, '2019-07-19'),
(4, 4, 'John Doe', 'Chef', 40000, '2018-12-20'),
(5, 5, 'Seema Gupta', 'Cashier', 28000, '2022-05-15'),
(6, 6, 'Raj Kumar', 'Tech Specialist', 70000, '2023-01-10'),
(7, 7, 'Fatima Sheikh', 'Manager', 55000, '2020-09-23'),
(8, 8, 'Sanjay Mishra', 'Server', 27000, '2021-10-01'),
(9, 9, 'Deepika Rane', 'Sales', 26000, '2019-11-30'),
(10, 10, 'Mehul Desai', 'Cashier', 30000, '2017-08-05');

-- to display/retrieve table data
SELECT * FROM Employees;               

-- to remove complete data from table
truncate table Employees;

-- to delete complete attributes and records 
drop table Employees;

-- ------------------------------------------ Queries -------------------------------------------------------------

-- 1. Ensure Salary is at least 20,000
ALTER TABLE Employees ADD CONSTRAINT chk_Salary CHECK (Salary >= 20000);

-- 2. Give Managers a 10% raise
UPDATE Employees SET Salary = Salary * 1.10 WHERE Position = 'Manager';

-- 3. Find employees earning more than 30,000
SELECT * FROM Employees WHERE Salary > 30000;

-- 4. List all unique job titles
SELECT DISTINCT Position FROM Employees;

-- 5. Show titles held by at least 2 employees
SELECT Position, COUNT(*) AS Count
FROM Employees
GROUP BY Position
HAVING COUNT(*) >= 2;

-- 6. List employees by most recent hire date
SELECT * FROM Employees ORDER BY HireDate DESC;

-- 7. Find hires between Jan 1, 2020 and Jan 1, 2023
SELECT * FROM Employees WHERE HireDate BETWEEN '2020-01-01' AND '2023-01-01';

-- 8. Top 3 highest-paid employees
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 3;

-- 9. Calculate annual salary for each person
SELECT Name, Salary * 12 AS AnnualSalary FROM Employees;

-- 10. Lowercase all position titles
SELECT LOWER(Position) AS Role FROM Employees;

-- 11. Round Salary to nearest 1,000
SELECT Name, round(Salary / 1000) * 1000 AS RoundedSalary FROM Employees; 

-- 12. Categorize employees into salary bands
SELECT Name,
  CASE
    WHEN Salary > 60000 THEN 'High'
    WHEN Salary BETWEEN 30000 AND 60000 THEN 'Medium'
    ELSE 'Low'
  END AS SalaryBand
FROM Employees;

-- 13. Combine Name and Position into one field
SELECT Name || ' works as ' || Position AS Description FROM Employees;

-- 14. Show highest and lowest salary
SELECT MAX(Salary) AS MaxSal, MIN(Salary) AS MinSal FROM Employees;

-- 15. Get length of each name
SELECT Name, LENGTH(Name) AS CharCount FROM Employees;

-- 16. Compute how far salary is from 50,000
SELECT Name, ABS(Salary - 50000) AS SalaryGap FROM Employees;

-- 17. Show each employee with their store name
SELECT e.Name, s.StoreName
FROM Employees e
JOIN Stores s ON e.StoreID = s.StoreID;

-- 18. Employees earning above the company average
SELECT * FROM Employees
WHERE Salary > (
  SELECT AVG(Salary) FROM Employees
);

-- 19. Highest-paid employee per store
SELECT e.Name, e.Salary, s.StoreName
FROM Employees e
JOIN Stores s ON e.StoreID = s.StoreID
WHERE e.Salary = (
  SELECT MAX(Salary) FROM Employees WHERE StoreID = e.StoreID
);

-- 20. Create view of high earners (> 50,000)
CREATE VIEW HighEarners AS
SELECT Name, Salary FROM Employees WHERE Salary > 50000;

-- 21. View of employees hired since 2022
WITH RecentHires AS (
  SELECT * FROM Employees WHERE HireDate > '2022-01-01'
)
SELECT * FROM RecentHires;

-- 22. Count purchases handled per employee
SELECT e.Name, COUNT(p.PurchaseID) AS PurchasesHandled
FROM Employees e
JOIN Stores s ON e.StoreID = s.StoreID
JOIN Purchases p ON p.StoreID = s.StoreID
GROUP BY e.Name;

-- 23. List all employees, include store if any
SELECT e.Name, s.StoreName
FROM Employees e
LEFT JOIN Stores s ON e.StoreID = s.StoreID;

-- 24. Show each employee and total purchases in their store
SELECT Name, (SELECT COUNT(*) FROM Purchases p WHERE p.StoreID = e.StoreID) AS StorePurchases
FROM Employees e;

-- 25. Show which events each employee is associated with via store
SELECT e.Name, ev.EventName
FROM Employees e
JOIN Stores s ON e.StoreID = s.StoreID
JOIN Events ev ON ev.StoreID = s.StoreID;

-- 26. View employee name, position, and store
CREATE VIEW EmpStoreView AS
SELECT e.Name, e.Position, s.StoreName FROM Employees e
JOIN Stores s ON e.StoreID = s.StoreID;

-- 27. Employees in electronics stores
SELECT e.Name, s.StoreName
FROM Employees e
JOIN Stores s ON e.StoreID = s.StoreID
WHERE s.Category = 'Electronics';

-- 28. Employees earning below the average for their position
SELECT * FROM Employees e1
WHERE Salary < (
  SELECT AVG(Salary)
  FROM Employees e2
  WHERE e1.Position = e2.Position
);

-- 29. Show employees with their store floor, sorted by floor
SELECT e.Name, s.Floor
FROM Employees e
JOIN Stores s ON e.StoreID = s.StoreID
ORDER BY s.Floor;

-- 30. Find stores with more than one employee
SELECT StoreID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY StoreID
HAVING COUNT(*) > 1;

-- 31. Find employees assigned to non-existent stores
SELECT *
  FROM Employees
 WHERE StoreID NOT IN (
   SELECT StoreID FROM Stores
 );

-- 32. Compute total salary cost per store category
SELECT s.Category,
       SUM(e.Salary) AS TotalCost
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 GROUP BY s.Category;

-- 33. List employees working in stores with high rent (>150,000)
SELECT e.Name,
       s.MonthlyRent
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 WHERE s.MonthlyRent > 150000;

-- 34. Count employees by position within each store
SELECT StoreID,
       Position,
       COUNT(*) AS Count
  FROM Employees
 GROUP BY StoreID, Position;

-- 35a. Find employees hired before the store opened
SELECT e.Name,
       e.HireDate,
       s.OpeningDate
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 WHERE e.HireDate < s.OpeningDate;

-- 35b. Employees working in Electronics stores
SELECT e.Name,
       s.StoreName
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 WHERE s.Category = 'Electronics';

-- 36. Find employees earning less than the average for their position
SELECT *
  FROM Employees e1
 WHERE Salary < (
   SELECT AVG(Salary)
     FROM Employees e2
    WHERE e2.Position = e1.Position
 );

-- 37. List employees with the floor number of their store, ordered by floor
SELECT e.Name,
       s.Floor
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 ORDER BY s.Floor;

-- 38. Show stores that employ more than one person
SELECT StoreID,
       COUNT(*) AS EmployeeCount
  FROM Employees
 GROUP BY StoreID
HAVING COUNT(*) > 1;

-- 39. (Same as 31) Employees assigned to stores that don't exist
SELECT *
  FROM Employees
 WHERE StoreID NOT IN (
   SELECT StoreID FROM Stores
 );

-- 40. (Same as 32) Total salary per store category
SELECT s.Category,
       SUM(e.Salary) AS TotalCost
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 GROUP BY s.Category;

-- 41. (Same as 33) Employees in high‑rent stores
SELECT e.Name,
       s.MonthlyRent
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 WHERE s.MonthlyRent > 150000;

-- 42. (Same as 34) Employee count by store and position
SELECT StoreID,
       Position,
       COUNT(*) AS Count
  FROM Employees
 GROUP BY StoreID, Position;

-- 43. (Same as 35a) Employees hired before store opening
SELECT e.Name,
       e.HireDate,
       s.OpeningDate
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 WHERE e.HireDate < s.OpeningDate;

-- 44. Count how many employees hold each position
SELECT Position,
       COUNT(*) AS Count
  FROM Employees
 GROUP BY Position;

-- 45. Find the average salary of all employees
SELECT AVG(Salary) AS AverageSalary
  FROM Employees;

-- 46. List employees whose names start with 'R'
SELECT *
  FROM Employees
 WHERE Name LIKE 'R%';

-- 47. Get employee count for each store
SELECT StoreID,
       COUNT(*) AS EmployeeCount
  FROM Employees
 GROUP BY StoreID;

-- 48. Remove all employees who are Cashiers
DELETE
  FROM Employees
 WHERE Position = 'Cashier';

-- 49. List employees working in stores with rent >100,000
SELECT e.*
  FROM Employees e
  JOIN Stores s
    ON e.StoreID = s.StoreID
 WHERE s.MonthlyRent > 100000;

-- 50. Show employees whose salary is among the top 3 highest
SELECT *
  FROM Employees
 WHERE Salary IN (
   SELECT DISTINCT Salary
     FROM Employees
    ORDER BY Salary DESC
     LIMIT 3
 );

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Table 3: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone CHAR(10),
    MembershipStatus VARCHAR(20) CHECK (MembershipStatus IN ('Gold', 'Silver', 'None'))
);

-- Insert the records into the table
INSERT INTO Customers VALUES
(1, 'Priya Sharma', 'priya@gmail.com', '9876543210', 'Gold'),
(2, 'Rahul Mehta', 'rahul@gmail.com', '9876543211', 'Silver'),
(3, 'Ayesha Khan', 'ayesha@gmail.com', '9876543212', 'None'),
(4, 'Karan Malhotra', 'karan@gmail.com', '9876543213', 'Gold'),
(5, 'Neha Sinha', 'neha@gmail.com', '9876543214', 'Silver'),
(6, 'Suresh Iyer', 'suresh@gmail.com', '9876543215', 'None'),
(7, 'Alisha Roy', 'alisha@gmail.com', '9876543216', 'Gold'),
(8, 'Manav Joshi', 'manav@gmail.com', '9876543217', 'Silver'),
(9, 'Sneha Kapoor', 'sneha@gmail.com', '9876543218', 'None'),
(10, 'Ravi Shukla', 'ravi@gmail.com', '9876543219', 'Gold');

-- to display/retrieve table data
SELECT * FROM Customers;               

-- to remove complete data from table
truncate table Customers;

-- to delete complete attributes and records 
drop table Customers;

-- ------------------------------------------ Queries -------------------------------------------------------------
-- 1. Add a column to track when a customer signed up
ALTER TABLE Customers
  ADD SignupDate DATE;

-- 2. Change Phone column to hold up to 15 characters
ALTER TABLE Customers
  MODIFY Phone VARCHAR(15);

-- 3. Create a Memberships table to store status and discount info
CREATE TABLE Memberships (
  Status        VARCHAR(20) PRIMARY KEY,
  DiscountRate  DECIMAL(5,2)
);

-- 4. Link Customers' MembershipStatus to Memberships.Status
ALTER TABLE Customers
  ADD FOREIGN KEY (MembershipStatus)
    REFERENCES Memberships(Status);

-- 5. Remove the Phone column from Customers
ALTER TABLE Customers
  DROP COLUMN Phone;

-- 6. Rename Customers table to ClientRoster
RENAME TABLE Customers TO ClientRoster;

-- 7. Insert a new customer (note: needs matching table name)
INSERT INTO Customers
  VALUES (11, 'Vikram Patel', 'vikram@gmail.com', '9876543220', 'None', '2025-02-02');

-- 8. Promote long-term 'None' members to 'Silver'
UPDATE Customers
SET MembershipStatus = 'Silver'
WHERE MembershipStatus = 'None'
  AND SignupDate < CURRENT_DATE - INTERVAL '365' DAY;

-- 9. Remove customers with known bad emails
DELETE FROM Customers
WHERE Email IN ('bad1@example.com','bad2@example.com');

-- 10. List gold members and their contact details, alphabetically
SELECT Name, Email, Phone
FROM Customers
WHERE MembershipStatus = 'Gold'
ORDER BY Name;

-- 11. Show all distinct membership statuses
SELECT DISTINCT MembershipStatus
FROM Customers;

-- 12. Count how many customers in each membership tier
SELECT MembershipStatus,
       COUNT(*) AS NumCustomers
FROM Customers
GROUP BY MembershipStatus;

-- 13. Get usernames by extracting email prefixes
SELECT Name,
       SUBSTRING(Email, 1, POSITION('@' IN Email)-1) AS Username
FROM Customers;

-- 14. Count total customers and how many are Gold members
SELECT COUNT(*) AS Total,
       SUM(CASE WHEN MembershipStatus='Gold' THEN 1 ELSE 0 END) AS GoldCount
FROM Customers;

-- 15. List all pairs of customers sharing the same membership status
SELECT c1.Name AS Cust1,
       c2.Name AS Cust2
FROM Customers c1
JOIN Customers c2
  ON c1.MembershipStatus = c2.MembershipStatus
 AND c1.CustomerID < c2.CustomerID;

-- 16. Show names if there are more than 3 Silver members
SELECT Name
FROM Customers
WHERE (SELECT COUNT(*) FROM Customers WHERE MembershipStatus='Silver') > 3;

-- 17. Create a view of VIP contacts, then list 5 most recent customers
CREATE VIEW VIPContacts AS
  SELECT CustomerID, Name, Email
  FROM Customers
  WHERE MembershipStatus IN ('Gold','Silver');

WITH Recent AS (
  SELECT *, ROW_NUMBER() OVER (ORDER BY SignupDate DESC) AS rn
  FROM Customers
)
SELECT *
FROM Recent
WHERE rn <= 5;

-- 18. Find customers with names ending in 'a'
SELECT Name
FROM Customers
WHERE Name LIKE '%a';

-- 19. Show all Gold or Silver customers
SELECT *
FROM Customers
WHERE MembershipStatus IN ('Gold','Silver');

-- 20. Find customers with phone in specific range
SELECT *
FROM Customers
WHERE Phone BETWEEN '9876543210' AND '9876543215';

-- 21. Create a description by combining name and membership
SELECT CustomerID,
       CONCAT(Name, ' (', MembershipStatus, ')') AS Description
FROM Customers;

-- 22. Find customers with no promotions, and rank customers per status by signup date
SELECT c.*
FROM Customers c
LEFT JOIN Promotions p ON c.CustomerID = p.CustomerID
WHERE p.CustomerID IS NULL;

SELECT CustomerID,
       Name,
       MembershipStatus,
       RANK() OVER (PARTITION BY MembershipStatus ORDER BY SignupDate) AS TierRank
FROM Customers;

-- 23. Show customers whose ID is above the table's average
SELECT c1.*
FROM Customers c1
WHERE CustomerID > (
  SELECT AVG(CustomerID) FROM Customers
);

-- 24. Inspect the schema of the Customers table
SELECT column_name,
       data_type,
       is_nullable
FROM information_schema.columns
WHERE table_name = 'Customers';

-- 25. Find customers with Gmail and phone starting with specific digits
SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com'
  AND Phone LIKE '987654321%';

-- 26. Create personalized upgrade messages for non-members
SELECT CONCAT('Dear ', Name, ', please upgrade your membership.') AS Message
FROM Customers
WHERE MembershipStatus='None';

-- 27. Create a temporary table of recent Gold members (last 180 days)
CREATE TEMPORARY TABLE TempRecentGold AS
SELECT *
FROM Customers
WHERE MembershipStatus='Gold'
  AND SignupDate >= CURRENT_DATE - INTERVAL '180' DAY;

-- 28. Find customers who have made purchases exceeding 10,000
SELECT c.Name, SUM(p.Amount) AS TotalSpent
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
GROUP BY c.Name
HAVING SUM(p.Amount) > 10000;

-- 29. Retrieve customers who have attended events with a budget greater than 50,000
SELECT c.Name
FROM Customers c
JOIN EventAttendees ea ON c.CustomerID = ea.CustomerID
JOIN Events e ON ea.EventID = e.EventID
WHERE e.Budget > 50000;

-- 30. List customers who have made purchases but are not assigned to any promotions
SELECT c.Name
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
LEFT JOIN Promotions pr ON c.CustomerID = pr.CustomerID
WHERE pr.CustomerID IS NULL;

-- 31. Find customers with 'Gold' membership and email containing 'shukla'
SELECT * FROM Customers WHERE MembershipStatus = 'Gold' AND Email LIKE '%shukla%';

-- 32. Get customers with 'Silver' membership and phone number starting with '987654'
SELECT * FROM Customers WHERE MembershipStatus = 'Silver' AND Phone LIKE '987654%';

-- 33. List customers whose names contain 'K'
SELECT * FROM Customers WHERE Name LIKE '%K%';

-- 34. Retrieve customers with 'Gold' membership and email ending with 'gmail.com'
SELECT * FROM Customers WHERE MembershipStatus = 'Gold' AND Email LIKE '%@gmail.com';

-- 35. Get customers who signed up after January 1, 2025
SELECT * FROM Customers WHERE SignupDate > '2025-01-01';

-- 36. List customers with 'None' membership and no phone number
SELECT * FROM Customers WHERE MembershipStatus = 'None' AND Phone IS NULL;

-- 37. Find customers with 'Silver' membership and email ending with 'gmail.com'
SELECT * FROM Customers WHERE MembershipStatus = 'Silver' AND Email LIKE '%@gmail.com';

-- 38. Get customers with 'Gold' membership who signed up in 2025
SELECT * FROM Customers WHERE MembershipStatus = 'Gold' AND YEAR(SignupDate) = 2025;

-- 39. Count customers with 'Silver' membership and phone number starting with '987'
SELECT COUNT(*) FROM Customers WHERE MembershipStatus = 'Silver' AND Phone LIKE '987%';

-- 40. Retrieve customers whose names contain 'Sh'
SELECT * FROM Customers WHERE Name LIKE '%Sh%';

-- 41. Find customers who signed up in the last 30 days
SELECT * FROM Customers WHERE SignupDate > CURRENT_DATE - INTERVAL 30 DAY;

-- 42. Get customers with 'None' membership and email not ending with 'gmail.com'
SELECT * FROM Customers WHERE MembershipStatus = 'None' AND Email NOT LIKE '%@gmail.com';

-- 43. List customers with 'Gold' membership and phone number ending with '3210'
SELECT * FROM Customers WHERE MembershipStatus = 'Gold' AND Phone LIKE '%3210';

-- 44. Count customers who signed up in 2024
SELECT COUNT(*) FROM Customers WHERE YEAR(SignupDate) = 2024;

-- 45. Retrieve customers with 'Silver' membership and email starting with 'rahul'
SELECT * FROM Customers WHERE MembershipStatus = 'Silver' AND Email LIKE 'rahul%';

-- 46. Find customers with 'Gold' membership and phone number starting with '987654'
SELECT * FROM Customers WHERE MembershipStatus = 'Gold' AND Phone LIKE '987654%';

-- 47. Get customers whose names end with 'a'
SELECT * FROM Customers WHERE Name LIKE '%a';

-- 48. Count customers with 'None' membership and email ending with 'yahoo.com'
SELECT COUNT(*) FROM Customers WHERE MembershipStatus = 'None' AND Email LIKE '%@yahoo.com';

-- 49. List customers with 'Silver' membership and phone number ending with '3211'
SELECT * FROM Customers WHERE MembershipStatus = 'Silver' AND Phone LIKE '%3211';

-- 50. Retrieve customers who signed up before January 1, 2025
SELECT * FROM Customers WHERE SignupDate < '2025-01-01';

-- ------------------------------------------------------------------------------------------------------------------------------------
-- Table 4: Purchases
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,
    CustomerID INT,
    StoreID INT,
    Amount DECIMAL(10, 2),
    PurchaseDate DATE,
    PaymentMode VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- Insert the records into the table
INSERT INTO Purchases VALUES
(1, 1, 1, 5000, '2024-01-10', 'Card'),
(2, 2, 2, 350, '2024-02-12', 'Cash'),
(3, 3, 3, 45000, '2024-02-20', 'Card'),
(4, 4, 4, 1200, '2024-03-15', 'UPI'),
(5, 5, 5, 3000, '2024-03-30', 'Cash'),
(6, 6, 6, 120000, '2024-04-01', 'Card'),
(7, 7, 7, 7000, '2024-04-10', 'UPI'),
(8, 8, 8, 900, '2024-05-01', 'Cash'),
(9, 9, 9, 600, '2024-05-05', 'UPI'),
(10, 10, 10, 1500, '2024-06-01', 'Card');

-- to display/retrieve table data
SELECT * FROM Purchases;               

-- to remove complete data from table
truncate table Purchases;

-- to delete complete attributes and records 
drop table Purchases;

-- ------------------------------------------ Queries -------------------------------------------------------------

-- 1. Add an index on SignupDate to speed up date-based queries
CREATE INDEX idx_cust_signup
  ON Customers(SignupDate);

-- 2. Add a "Discount" column to store discounts in Purchases
ALTER TABLE Purchases
  ADD COLUMN Discount DECIMAL(6,2);

-- 3. (Duplication alert) Add SignupDate to Customers for tracking when they joined
ALTER TABLE Customers
  ADD SignupDate DATE;

-- 4. Add "location" field to Stores for address or city info
ALTER TABLE Stores
  ADD COLUMN location VARCHAR(100);

-- 5. Create a Returns table to log returns of purchases
CREATE TABLE Returns (
  ReturnID   INT PRIMARY KEY,
  PurchaseID INT,
  ReturnDate DATE
);

-- 6. Link Returns to Purchases so each return maps to a purchase
ALTER TABLE Returns
  ADD FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID);

-- 7. Clean out small purchases under ₹500 (or $500) if they’re irrelevant
DELETE FROM Purchases
 WHERE Amount < 500;

-- 8. List Gold/Silver customers with their phone (showing "N/A" if missing), newest first
SELECT Name,
       COALESCE(Phone, 'N/A') AS PhoneNumber,
       MembershipStatus
  FROM Customers
 WHERE MembershipStatus IN ('Gold','Silver')
 ORDER BY SignupDate DESC;

-- 9. Count number of unique buyers per payment method
SELECT PaymentMode,
       COUNT(DISTINCT CustomerID) AS UniqueBuyers
  FROM Purchases
 GROUP BY PaymentMode;

-- 10. Get monthly sales totals, but only show months over ₹10,000
SELECT EXTRACT(MONTH FROM PurchaseDate) AS Month,
       SUM(Amount) AS TotalSales
  FROM Purchases
 GROUP BY Month
 HAVING SUM(Amount) > 10000;

-- 11. Extract usernames from email addresses
SELECT SUBSTRING(Email,1, POSITION('@' IN Email)-1) AS Username
  FROM Customers;

-- 12. Show all purchases made from January 1, 2024 to today
SELECT *
  FROM Purchases
 WHERE PurchaseDate BETWEEN '2024-01-01' AND CURRENT_DATE;

-- 13. Average spend per payment mode, rounded to 2 decimals
SELECT PaymentMode,
       ROUND(AVG(Amount), 2) AS AvgAmt
  FROM Purchases
 GROUP BY PaymentMode;

-- 14. Classify purchases as HighValue (>50k) or Normal, with counts
SELECT CASE WHEN Amount > 50000 THEN 'HighValue' ELSE 'Normal' END AS SpendTier,
       COUNT(*) AS Count
  FROM Purchases
 GROUP BY SpendTier;

-- 15. Show each purchase amount, clipped to min ₹1,000 and max ₹50,000
SELECT GREATEST(Amount, 1000) AS Min1k,
       LEAST(Amount, 50000) AS Cap50k
  FROM Purchases;

-- 16. Get all distinct payment modes, in uppercase
SELECT DISTINCT UPPER(PaymentMode)
  FROM Purchases;

-- 17. List each purchase along with customer name and store name
SELECT c.Name,
       s.StoreName,
       p.Amount
  FROM Purchases p
  JOIN Customers c ON p.CustomerID = c.CustomerID
  JOIN Stores s    ON p.StoreID = s.StoreID;

-- 18. List customers who've made at least one purchase over ₹10,000
SELECT *
  FROM Customers c
 WHERE EXISTS (
   SELECT 1
     FROM Purchases p
    WHERE p.Amount > 10000
      AND p.CustomerID = c.CustomerID
 );

-- 19. Create a view summarizing each store's total sales and buyer count
CREATE VIEW TopStores AS
  SELECT StoreID,
         SUM(Amount)          AS TotalSales,
         COUNT(DISTINCT CustomerID) AS BuyerCount
    FROM Purchases
   GROUP BY StoreID;

-- 20. Give store-level data: total sales, average per customer, and number of buyers
SELECT StoreID,
       SUM(Amount)                     AS Sales,
       SUM(Amount) * 1.0 / COUNT(DISTINCT CustomerID) AS AvgPerCust,
       COUNT(DISTINCT CustomerID)     AS Buyers
  FROM Purchases
 GROUP BY StoreID;

-- 21. Identify customers who bought from more than one store
SELECT CustomerID,
       COUNT(DISTINCT StoreID) AS NumStoresVisited
  FROM Purchases
 GROUP BY CustomerID
HAVING COUNT(DISTINCT StoreID) > 1;

-- 22. Show the purchase(s) with the highest amount ever recorded
SELECT *
  FROM Purchases
 WHERE Amount = (
   SELECT MAX(Amount)
     FROM Purchases
 );

-- 23. Running total of purchase amounts per customer
SELECT *, SUM(Amount) OVER (PARTITION BY CustomerID ORDER BY PurchaseDate) AS RunningTotal
FROM Purchases;

-- 24. Monthly total amount per store
SELECT StoreID, DATE_TRUNC('month', PurchaseDate) AS Month,
  SUM(Amount) AS MonthTotal
FROM Purchases
GROUP BY StoreID, Month;

-- 25. Rank of purchases per customer by amount
SELECT *, RANK() OVER (PARTITION BY CustomerID ORDER BY Amount DESC) AS AmountRank
FROM Purchases;

-- 26. Percent rank of amount in each store
SELECT *, PERCENT_RANK() OVER (PARTITION BY StoreID ORDER BY Amount) AS PctRank
FROM Purchases;

-- 27. Difference from previous purchase amount per customer
SELECT *, Amount - LAG(Amount) OVER (PARTITION BY CustomerID ORDER BY PurchaseDate) AS DiffFromPrev
FROM Purchases;

-- 28. Lead next purchase date per customer
SELECT *, LEAD(PurchaseDate) OVER (PARTITION BY CustomerID ORDER BY PurchaseDate) AS NextPurchaseDate
FROM Purchases;

-- 29. Average purchase per customer to date
SELECT *, AVG(Amount) OVER (PARTITION BY CustomerID ORDER BY PurchaseDate ROWS UNBOUNDED PRECEDING) AS AvgToDate
FROM Purchases;

-- 30. Cumulative store total amount
SELECT *, SUM(Amount) OVER (PARTITION BY StoreID ORDER BY PurchaseDate ROWS UNBOUNDED PRECEDING) AS CumulStoreAmt
FROM Purchases;

-- 31. Number purchases per payment mode
SELECT PaymentMode, COUNT(*) AS CountMode
FROM Purchases
GROUP BY PaymentMode;

-- 32. Customers with total spend >50k
SELECT CustomerID, SUM(Amount) AS TotalSpend
FROM Purchases
GROUP BY CustomerID
HAVING SUM(Amount) > 50000;

-- 33. average per store, join back
WITH StoreAvg AS (
  SELECT StoreID, AVG(Amount) AS AvgAmt FROM Purchases GROUP BY StoreID
)
SELECT p.*, s.AvgAmt
FROM Purchases p
JOIN StoreAvg s USING(StoreID);

-- 34. Number stores each customer purchased from
SELECT CustomerID, COUNT(DISTINCT StoreID) AS NumStores
FROM Purchases
GROUP BY CustomerID;

-- 35. Quarter and average by quarter
SELECT CustomerID, EXTRACT(quarter FROM PurchaseDate) AS Q, AVG(Amount) AS AvgAmt
FROM Purchases
GROUP BY CustomerID, Q;

-- 36. Dense rank payment modes by spend
SELECT PaymentMode, DENSE_RANK() OVER (ORDER BY SUM(Amount) DESC) AS ModeRank
FROM Purchases GROUP BY PaymentMode;

-- 37. Join payment mode totals via CTE
WITH ModeTot AS (
  SELECT PaymentMode, SUM(Amount) AS ModeSum FROM Purchases GROUP BY PaymentMode
)
SELECT p.*, m.ModeSum FROM Purchases p JOIN ModeTot m USING(PaymentMode);

-- 38. Find customers with exactly 2 purchases
SELECT CustomerID FROM Purchases GROUP BY CustomerID HAVING COUNT(*)=2;

-- 39. Latest purchase date per customer
SELECT *, MAX(PurchaseDate) OVER (PARTITION BY CustomerID) AS LastPurchase
FROM Purchases;

-- 40. Identify high-value stores (avg >10k)
SELECT StoreID, AVG(Amount) AS AvgAmt
FROM Purchases GROUP BY StoreID HAVING AVG(Amount) > 10000;

-- 41. Count distinct buyers for each store
SELECT StoreID, COUNT(DISTINCT CustomerID) AS UniqueBuyers
  FROM Purchases
 GROUP BY StoreID;

-- 42. List high-value purchases over ₹50,000
SELECT * FROM Purchases WHERE Amount > 50000;

-- 43. Show payment mode usage counts
SELECT PaymentMode, COUNT(*) AS ModeCount
  FROM Purchases
 GROUP BY PaymentMode;

-- 44. List purchases made in the first quarter of 2024
SELECT * FROM Purchases
 WHERE PurchaseDate BETWEEN '2024-01-01' AND '2024-03-31';

-- 45. Identify customers who purchased from multiple stores
SELECT CustomerID,
       COUNT(DISTINCT StoreID) AS StoresVisited
  FROM Purchases
 GROUP BY CustomerID
HAVING COUNT(DISTINCT StoreID) > 1;

-- 46. View the single largest purchase
SELECT * FROM Purchases
 WHERE Amount = (SELECT MAX(Amount) FROM Purchases);

-- 47. Add a Discount column to calculate hypothetical 10% savings
SELECT PurchaseID,
       Amount,
       Amount * 0.10 AS DiscountValue
  FROM Purchases;

-- 48. Compare actual amount with ₹1,000–₹50,000 caps
SELECT PurchaseID,
       GREATEST(Amount, 1000) AS Min1k,
       LEAST(Amount, 50000) AS Cap50k
  FROM Purchases;

-- 49. Count high-value vs normal purchases
SELECT CASE WHEN Amount > 50000 THEN 'HighValue' ELSE 'Normal' END AS Tier,
       COUNT(*) AS CountPerTier
  FROM Purchases
 GROUP BY Tier;

-- 50. List purchases with padded payment mode in uppercase
SELECT PurchaseID,
       Amount,
       UPPER(PaymentMode) AS Mode,
       LPAD(PaymentMode, 8, '*') AS PaddedMode
  FROM Purchases;

-- -------------------------------------------------------------------------------------------------------------------
-- Table 5: Events
CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    StoreID INT,
    Budget DECIMAL(10, 2),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- Insert the records into the table
INSERT INTO Events VALUES
(1, 'Fashion Fest', '2024-01-15', 1, 100000),
(2, 'Coffee Lovers Meet', '2024-02-20', 2, 30000),
(3, 'Tech Expo', '2024-03-10', 3, 150000),
(4, 'Burger Mania', '2024-04-01', 4, 50000),
(5, 'Toy Bonanza', '2024-04-15', 5, 25000),
(6, 'Apple Launch', '2024-05-05', 6, 200000),
(7, 'Summer Sale', '2024-05-10', 7, 50000),
(8, 'Pizza Party', '2024-05-15', 8, 40000),
(9, 'Gifting Carnival', '2024-06-01', 9, 30000),
(10, 'Accessory Fest', '2024-06-20', 10, 45000);

-- to display/retrieve table data
SELECT * FROM Events;               

-- to remove complete data from table
truncate table Events;

-- to delete complete attributes and records 
drop table Events;

-- ------------------------------------------ Queries -------------------------------------------------------------

-- 1.  Create an index on the EventDate column
CREATE INDEX idx_events_date ON Events(EventDate);

-- 2.  Add a new column "Location" (up to 100 characters) to the Events table
ALTER TABLE Events ADD COLUMN Location VARCHAR(100);

-- 3.  Create a table for attendees of events
CREATE TABLE EventAttendees (
  AttendeeID INT PRIMARY KEY,
  EventID INT,
  CustomerID INT,
  FOREIGN KEY(EventID) REFERENCES Events(EventID),
  FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. nsert a new event into Events
INSERT INTO Events VALUES (11,'Book Fair','2025-07-15',1,80000);

-- 5. Increase budget by 10% for any events with a date in the future
UPDATE Events SET Budget = Budget * 1.10 WHERE EventDate > CURRENT_DATE;

-- 6. List events whose budget is over 50,000, sorted by date 
SELECT EventName, EventDate FROM Events WHERE Budget > 50000 ORDER BY EventDate DESC;

-- 7. Show events occurring between January 1 2024 and today
SELECT * FROM Events WHERE EventDate BETWEEN '2024-01-01' AND CURRENT_DATE;

-- 8. List each event with budget in thousands (rounded to one decimal),and classify budget as "High" or "Low"
SELECT EventName, ROUND(Budget/1000,1) AS BudgetK, CASE WHEN Budget>100000 THEN 'High' ELSE 'Low' END AS Tier FROM Events;

-- 9. Show unique payment modes used in Purchases, in uppercase
SELECT DISTINCT UPPER(PaymentMode) FROM Purchases;

-- 10. For each event, show MinBudget = lesser of Budget or 50,000;    MaxBudget = greater of Budget or 150,000
SELECT LEAST(Budget,50000) AS MinBudget, GREATEST(Budget,150000) AS MaxBudget FROM Events;

-- 11. Count how many events per store, using a window function
SELECT COUNT(*) OVER(PARTITION BY StoreID) AS EventsPerStore, StoreID FROM Events;

-- 12. Join Events with Stores to show event name, store name, and budget
SELECT e.EventName, s.StoreName, e.Budget
 FROM Events e
 JOIN Stores s ON e.StoreID = s.StoreID;
 
-- 13. Select events that have at least one attendee who made a purchase >5,000
SELECT * FROM Events e WHERE EXISTS (
  SELECT 1 FROM EventAttendees ea JOIN Purchases p ON ea.CustomerID=p.CustomerID
   WHERE ea.EventID=e.EventID AND p.Amount>5000
);

-- 14. Create a view summarizing number of events and total budget per store
CREATE VIEW StoreEventBudget AS
 SELECT s.StoreID, s.StoreName, COUNT(e.EventID) AS NumEvents, SUM(e.Budget) AS TotalBudget
 FROM Events e JOIN Stores s USING(StoreID)
 GROUP BY s.StoreID,s.StoreName;

-- 15. For each store, list the total number of events and total budgets using LEFT JOIN
SELECT s.StoreName, COUNT(e.EventID) AS EventsHeld, SUM(e.Budget) AS TotalBudget
FROM Stores s LEFT JOIN Events e ON s.StoreID=e.StoreID
GROUP BY s.StoreName;

-- 16. Count of unique attendees per event
SELECT e.EventName, COUNT(DISTINCT ea.CustomerID) AS Attendees
FROM Events e LEFT JOIN EventAttendees ea USING(EventID)
GROUP BY e.EventName;

-- 17. List each event with its budget and total spend at that store
SELECT EventID, Budget, (SELECT SUM(Amount) FROM Purchases WHERE StoreID=Events.StoreID) AS StoreTotalSpend FROM Events;

-- 18. Show the event(s) having the maximum budget
SELECT * FROM Events WHERE Budget = (SELECT MAX(Budget) FROM Events);

-- 19. For each store that has more than 2 events with budget >50,000, show count
SELECT StoreID, COUNT(*) AS HighBudgetEvents FROM Events WHERE Budget>50000 GROUP BY StoreID HAVING COUNT(*)>2;

-- 20. For each store, get sum of budgets and average purchase amount per event
SELECT e.StoreID,
  SUM(e.Budget) AS BudgetSum,
  AVG(p.Amount) AS AvgPurchasePerEvent
FROM Events e LEFT JOIN Purchases p USING(StoreID)
GROUP BY e.StoreID;

-- 21. Compute a rolling sum of budget over current + two previous events, ordered by date
SELECT EventID, Budget,
       SUM(Budget) OVER(ORDER BY EventDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS RollingBudget
FROM Events;

-- 22. Inspect table schemas (column names and types) for key tables
SELECT table_name, column_name, data_type
 FROM information_schema.columns
 WHERE table_name IN ('Events','Stores','Customers','Purchases');
 
-- 23. Select events whose budgets lie between 20,000 and 150,000 inclusive 
SELECT * FROM Events e WHERE Budget BETWEEN 20000 AND 150000;

-- 24. assign new AttendeeIDs to each Gold customer for EventID = 5
INSERT INTO EventAttendees SELECT ROW_NUMBER() OVER(), 5, CustomerID FROM Customers WHERE MembershipStatus='Gold';

-- 25. Remove all attendee records for EventID = 10
DELETE FROM EventAttendees WHERE EventID=10;

-- 26.  Create a temporary table listing all events with budget >100,000
CREATE TEMPORARY TABLE TempHighBudget AS SELECT * FROM Events WHERE Budget>100000; -- 1. List all events
SELECT * FROM Events;

-- 27. Find events with budget over 50,000
SELECT * FROM Events
WHERE Budget > 50000;

-- 28. Count the number of events per store
SELECT StoreID, COUNT(*) AS EventCount
FROM Events
GROUP BY StoreID;

-- 29. Total budget across all events
SELECT SUM(Budget) AS TotalBudget
FROM Events;

-- 30. Average budget per event
SELECT AVG(Budget) AS AvgBudget
FROM Events;

-- 31. Maximum budget event
SELECT * FROM Events
WHERE Budget = (SELECT MAX(Budget) FROM Events);

-- 32. Minimum budget event
SELECT * FROM Events
WHERE Budget = (SELECT MIN(Budget) FROM Events);

-- 33. Events in the first half of 2024
SELECT * FROM Events
WHERE EventDate BETWEEN '2024-01-01' AND '2024-06-30';

-- 34. Upcoming events after a given date, e.g. after 2024-04-01
SELECT * FROM Events
WHERE EventDate > '2024-04-01';

-- 35. Events ordered by date ascending
SELECT * FROM Events
ORDER BY EventDate ASC;

-- 36. Events ordered by budget descending
SELECT * FROM Events
ORDER BY Budget DESC;

-- 37. Count of events per month
SELECT MONTH(EventDate) AS EventMonth, COUNT(*) AS NumEvents
FROM Events
GROUP BY MONTH(EventDate)
ORDER BY EventMonth;

-- 38. Budget per store
SELECT StoreID, SUM(Budget) AS TotalStoreBudget
FROM Events
GROUP BY StoreID;

-- 39. Stores that have spent more than 100,000 total budget
SELECT StoreID
FROM Events
GROUP BY StoreID
HAVING SUM(Budget) > 100000;

-- 40. Events with “Fest” in the name
SELECT * FROM Events
WHERE EventName LIKE '%Fest%';

-- 41. Rename column
ALTER TABLE Events
CHANGE COLUMN EventName Name VARCHAR(100);

-- 42. Add a new column “Location” for storing event location
ALTER TABLE Events
ADD COLUMN Location VARCHAR(255);

-- 43. Update a specific event’s budget
UPDATE Events
SET Budget = 120000
WHERE EventID = 1;

-- 44. Delete an event by ID
DELETE FROM Events
WHERE EventID = 10;

-- 45. Join example with a hypothetical Stores table
SELECT e.EventID, e.EventName, s.StoreName
FROM Events e
JOIN Stores s USING (StoreID);
;

-- 46. Total budget spent per month
SELECT EXTRACT(MONTH FROM EventDate) AS Month,
       SUM(Budget) AS TotalMonthlyBudget
  FROM Events
 GROUP BY Month
 ORDER BY Month;

-- 47. Average budget per StoreID
SELECT StoreID, ROUND(AVG(Budget), 2) AS AvgBudget
  FROM Events
 GROUP BY StoreID;

-- 48. Top 3 most expensive events
SELECT *
  FROM Events
 ORDER BY Budget DESC
 LIMIT 3;

-- 49. Rolling sum of budgets over current and previous two events by date
SELECT EventID,
       EventName,
       Budget,
       SUM(Budget) OVER (
         ORDER BY EventDate
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS RollingBudget
  FROM Events;

-- 50. Find events that do not overlap with 'Tech Expo' in schedule (before or after)
SELECT *
  FROM Events
 WHERE EventDate < (
     SELECT EventDate FROM Events WHERE EventName = 'Tech Expo'
   )
   OR EventDate > (
     SELECT EventDate FROM Events WHERE EventName = 'Tech Expo'
   );


