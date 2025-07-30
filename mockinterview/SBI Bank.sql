-- ----------------------------------- Database Queries --------------------------------------
-- Create SBI Bank database
CREATE DATABASE SBI_Bank;

-- Select the database for use
USE SBI_Bank;

-- To Drop a database
drop database SBI_Bank;
-- ---------------------------------- Table Queries -----------------------------------------

-- Table-1 : Customers

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AadharNumber VARCHAR(16),
    PANNumber VARCHAR(12),
    Address TEXT,
    BranchCode VARCHAR(10)
);

INSERT INTO Customers VALUES
(1, 'Rahul Sharma', '1988-06-12', 'Male', 'rahul88@gmail.com', '9876543210', '123412341234', 'ABCDE1234F', 'Delhi, India', 'SBI001'),
(2, 'Anjali Mehta', '1992-03-25', 'Female', 'anjali25@gmail.com', '9856432109', '987698769876', 'GHYTR5678G', 'Mumbai, India', 'SBI002'),
(3, 'Amit Roy', '1985-01-10', 'Male', 'amitroy@gmail.com', '9871122334', '123456781234', 'DFGTR1234E', 'Kolkata, India', 'SBI003'),
(4, 'Pooja Nair', '1990-09-17', 'Female', 'pooja.n@gmail.com', '9934567890', '567812341234', 'POIUY6789H', 'Chennai, India', 'SBI004'),
(5, 'Vikram Sinha', '1982-12-04', 'Male', 'vikram.sinha@gmail.com', '9765432101', '345612341234', 'PLMNB2345J', 'Bangalore, India', 'SBI005'),
(6, 'Riya Sen', '1994-11-30', 'Female', 'riya.sen@gmail.com', '9823456781', '876543218765', 'LKJHG8765K', 'Hyderabad, India', 'SBI006'),
(7, 'Neeraj Das', '1987-07-23', 'Male', 'neeraj.das@gmail.com', '9812345672', '765412349876', 'MNBVC2345L', 'Ahmedabad, India', 'SBI007'),
(8, 'Seema Agarwal', '1993-04-15', 'Female', 'seema.a@gmail.com', '9743124567', '234512347654', 'QWERT1234P', 'Surat, India', 'SBI008'),
(9, 'Anil Kumar', '1989-08-12', 'Male', 'anil.k@gmail.com', '9687654321', '112233445566', 'ZXCVB3456M', 'Jaipur, India', 'SBI009'),
(10, 'Sneha Das', '1991-02-22', 'Female', 'sneha.d@gmail.com', '9765123890', '667788990011', 'ASDFG5678T', 'Bhopal, India', 'SBI010'),
(11, 'Aditya Mehra', '1990-03-11', 'Male', 'aditya.m@gmail.com', '9845000001', '123400000123', 'PQWER6789Z', 'Lucknow, India', 'SBI011'),
(12, 'Divya Thakur', '1995-06-19', 'Female', 'divya.t@gmail.com', '9789456123', '234500000123', 'LKJHG0001A', 'Kanpur, India', 'SBI012'),
(13, 'Manish Tiwari', '1984-05-15', 'Male', 'manish.t@gmail.com', '9876541290', '321654987000', 'ZMXNB7890D', 'Nagpur, India', 'SBI013'),
(14, 'Priya Kaur', '1987-07-21', 'Female', 'priya.k@gmail.com', '9712314567', '654321009876', 'REWQ1234AS', 'Amritsar, India', 'SBI014'),
(15, 'Kunal Ghosh', '1992-10-01', 'Male', 'kunal.g@gmail.com', '9834567890', '223344556677', 'IUYTRE4321Z', 'Guwahati, India', 'SBI015'),
(16, 'Rachna Pathak', '1989-12-12', 'Female', 'rachna.p@gmail.com', '9854123987', '334455667788', 'OIUYT5678B', 'Indore, India', 'SBI016'),
(17, 'Saurabh Jain', '1985-08-08', 'Male', 'saurabh.j@gmail.com', '9723456789', '445566778899', 'XCVBN2345U', 'Kota, India', 'SBI017'),
(18, 'Meera Joshi', '1991-09-09', 'Female', 'meera.j@gmail.com', '9745123467', '556677889900', 'TREWQ3456N', 'Raipur, India', 'SBI018'),
(19, 'Arun Verma', '1993-06-06', 'Male', 'arun.v@gmail.com', '9887654321', '667788990011', 'NBVCX9876P', 'Agra, India', 'SBI019'),
(20, 'Meena Kapoor', '1991-08-09', 'Female', 'meenak@gmail.com', '9945362819', '673498761234', 'FHTRE7865J', 'Pune, India', 'SBI020');

-- Display all customers
SELECT * FROM Customers;

-- Delete all customer records but keep the table structure
TRUNCATE TABLE Customers;

-- Completely remove the Customers table from the database
DROP TABLE Customers;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. WHERE clause to filter Male customers
SELECT * FROM Customers WHERE Gender = 'Male';

-- 2. ORDER BY clause to sort customers by FullName
SELECT * FROM Customers ORDER BY FullName ASC;

-- 3. GROUP BY clause to count customers per gender
SELECT Gender, COUNT(*) AS Total FROM Customers GROUP BY Gender;

-- 4. HAVING clause to filter grouped results
SELECT BranchCode, COUNT(*) AS Total FROM Customers GROUP BY BranchCode HAVING COUNT(*) > 0;

-- 5. LIMIT clause to fetch top 5 customers
SELECT * FROM Customers LIMIT 5;

-- 6. DDL: Add a new column for account status
ALTER TABLE Customers ADD Status VARCHAR(20);

-- 7. DML: Update phone number of a customer
UPDATE Customers SET Phone = '9000000000' WHERE CustomerID = 1;

-- 8. DML: Delete a customer
DELETE FROM Customers WHERE CustomerID = 20;

-- 9. Show all customers with valid 12-digit PAN (VARCHAR(12))
SELECT * FROM Customers WHERE LENGTH(PANNumber) = 10;

-- 10. Check customers with phone numbers not null 
SELECT * FROM Customers WHERE Phone IS NOT NULL;

-- 11. Filter customers with DOB in correct DATE format
SELECT * FROM Customers WHERE DOB BETWEEN '1985-01-01' AND '1995-12-31';

-- 12. Using = operator
SELECT * FROM Customers WHERE BranchCode = 'SBI001';

-- 13. Using LIKE operator for names starting with 'A'
SELECT * FROM Customers WHERE FullName LIKE 'A%';

-- 14. Use IN operator
SELECT * FROM Customers WHERE BranchCode IN ('SBI001', 'SBI002');

-- 15. Use BETWEEN operator
SELECT * FROM Customers WHERE DOB BETWEEN '1985-01-01' AND '1990-12-31';

-- 16. Use IS NOT NULL
SELECT * FROM Customers WHERE Email IS NOT NULL;

-- 17. Rename a column
ALTER TABLE Customers RENAME COLUMN Phone TO ContactNumber;

-- 18. Update email
UPDATE Customers SET Email = 'new.email@gmail.com' WHERE CustomerID = 2;

-- 19. update branch code
UPDATE Customers SET BranchCode = 'SBI999' WHERE BranchCode = 'SBI001';

set SQL_safe_updates=0;

-- 20. Get customer names and emails
SELECT FullName, Email FROM Customers;

-- 21. Count total customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- 22. Get customers from a specific city
SELECT * FROM Customers WHERE Address LIKE '%Delhi%';

-- 23. Find all unique branch codes
SELECT DISTINCT BranchCode FROM Customers;

-- 24. UPPER function on names
SELECT UPPER(FullName) FROM Customers;

-- 25. LENGTH of PAN number
SELECT FullName, LENGTH(PANNumber) FROM Customers;

-- 26. CONCAT name and email
SELECT CONCAT(FullName, ' - ', Email) AS ContactInfo FROM Customers;

-- 27. CURRENT_DATE
SELECT FullName, CURRENT_DATE AS Today FROM Customers;

-- 28. Subquery in FROM clause
SELECT AVG(Age) FROM (SELECT YEAR(CURRENT_DATE) - YEAR(DOB) AS Age FROM Customers) AS AgeData;

-- 29. Subquery with IN
SELECT * FROM Customers WHERE BranchCode IN (SELECT BranchCode FROM Customers WHERE Gender = 'Female');

-- 30. Subquery with EXISTS
SELECT * FROM Customers C WHERE EXISTS (SELECT 1 FROM Customers WHERE BranchCode = C.BranchCode AND Gender = 'Female');

-- 31. Create trigger to log customer inserts (Assumes CustomerLog table)
CREATE TRIGGER AfterCustomerInsert
AFTER INSERT ON Customers
FOR EACH ROW
INSERT INTO CustomerLog(CustomerID, Action, Timestamp) 
VALUES (NEW.CustomerID, 'INSERT', NOW());

select * from customers;

-- 32. Trigger to update audit log
CREATE TRIGGER AfterUpdateCustomer
AFTER UPDATE ON Customers
FOR EACH ROW
INSERT INTO CustomerLog(CustomerID, Action, Timestamp) 
VALUES (NEW.CustomerID, 'UPDATE', NOW());

-- 33. Trigger before delete
CREATE TRIGGER BeforeDeleteCustomer
BEFORE DELETE ON Customers
FOR EACH ROW
INSERT INTO CustomerLog(CustomerID, Action, Timestamp) 
VALUES (OLD.CustomerID, 'DELETE', NOW());

-- 34. Rank customers by DOB
SELECT FullName, DOB, RANK() OVER (ORDER BY DOB ASC) AS DOBRank FROM Customers;

-- 35. Count per branch with window
SELECT FullName, BranchCode, COUNT(*) OVER (PARTITION BY BranchCode) AS BranchCount FROM Customers;

-- 36. Customers from Mumbai
SELECT CustomerID, FullName, Email FROM Customers WHERE Address LIKE '%Mumbai%';

-- 37. Customers older than 35
SELECT FullName, DOB
FROM Customers
WHERE DOB <= DATE_SUB(CURDATE(), INTERVAL 35 YEAR);

-- 38. Gender count
SELECT Gender, COUNT(*) AS CountByGender
FROM Customers
GROUP BY Gender;

-- 39. Count by branch
SELECT BranchCode, COUNT(*) AS NumCustomers
FROM Customers
GROUP BY BranchCode
HAVING COUNT(*) > 1;  

-- 40. Customers with Aadhaar starting ‘1234’
SELECT *
FROM Customers
WHERE AadharNumber LIKE '1234%';

-- 41. Customers in Delhi or Mumbai
SELECT FullName, Address
FROM Customers
WHERE Address LIKE '%Delhi%' OR Address LIKE '%Mumbai%';  

-- 42. Female customers not in Hyderabad
SELECT FullName, Address
FROM Customers
WHERE Gender = 'Female' AND Address NOT LIKE '%Hyderabad%';  

-- 43. Customers born between 1990 and 1995
SELECT FullName, DOB
FROM Customers
WHERE DOB BETWEEN '1990-01-01' AND '1995-12-31'; 

-- 44. Customers with specific branch codes
SELECT FullName, BranchCode
FROM Customers
WHERE BranchCode IN ('SBI001', 'SBI002', 'SBI003');  

-- 45. Check for missing PAN (NULL)
SELECT CustomerID, FullName
FROM Customers
WHERE PANNumber IS NULL;  

-- 46. Customers whose Aadhaar isn't '123412341234'
SELECT CustomerID, FullName
FROM Customers
WHERE AadharNumber <> '123412341234';  

-- 47. Customers sorted by full name
SELECT CustomerID, FullName
FROM Customers
ORDER BY FullName ASC;

-- 48. Customers per branch with min DOB
SELECT BranchCode, MIN(DOB) AS OldestDOB, COUNT(*) AS CustCount
FROM Customers
GROUP BY BranchCode;

-- 49. Branches where count > 2
SELECT BranchCode, COUNT(*) AS CountPerBranch
FROM Customers
GROUP BY BranchCode
HAVING COUNT(*) > 2; 

-- 50. Customers whose phone number's third digit is '1'
SELECT CustomerID, FullName, Phone
FROM Customers
WHERE SUBSTRING(Phone, 3, 1) = '1';  

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Table-2: Accounts

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    OpenDate DATE,
    Balance DECIMAL(12,2),
    IFSCCode VARCHAR(11),
    BranchCode VARCHAR(10),
    Status VARCHAR(10),
    NomineeName VARCHAR(100),
    Currency VARCHAR(5),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Accounts VALUES
(101, 1, 'Savings', '2020-01-15', 55000.75, 'SBIN000001', 'SBI001', 'Active', 'Reena Sharma', 'INR'),
(102, 2, 'Current', '2019-05-22', 125000.00, 'SBIN000002', 'SBI002', 'Active', 'Vijay Mehta', 'INR'),
(103, 3, 'Savings', '2021-11-10', 67000.00, 'SBIN000003', 'SBI003', 'Active', 'Asha Roy', 'INR'),
(104, 4, 'Savings', '2018-07-09', 89000.00, 'SBIN000004', 'SBI004', 'Active', 'Pritam Nair', 'INR'),
(105, 5, 'Current', '2022-01-01', 32000.00, 'SBIN000005', 'SBI005', 'Active', 'Kiran Sinha', 'INR'),
(106, 6, 'Savings', '2020-06-15', 47000.90, 'SBIN000006', 'SBI006', 'Active', 'Aman Sen', 'INR'),
(107, 7, 'Savings', '2021-02-25', 51000.50, 'SBIN000007', 'SBI007', 'Active', 'Sonal Das', 'INR'),
(108, 8, 'Current', '2017-09-10', 95000.00, 'SBIN000008', 'SBI008', 'Active', 'Vivek Agarwal', 'INR'),
(109, 9, 'Savings', '2023-04-20', 22000.00, 'SBIN000009', 'SBI009', 'Active', 'Rina Kumar', 'INR'),
(110, 10, 'Savings', '2019-12-12', 34000.00, 'SBIN000010', 'SBI010', 'Active', 'Neeraj Das', 'INR'),
(111, 11, 'Savings', '2021-08-12', 78000.45, 'SBIN000011', 'SBI011', 'Active', 'Priya Mehra', 'INR'),
(112, 12, 'Current', '2022-03-19', 125000.00, 'SBIN000012', 'SBI012', 'Active', 'Ajay Thakur', 'INR'),
(113, 13, 'Savings', '2023-01-23', 33000.00, 'SBIN000013', 'SBI013', 'Active', 'Anita Tiwari', 'INR'),
(114, 14, 'Savings', '2020-10-14', 59000.00, 'SBIN000014', 'SBI014', 'Active', 'Karan Kaur', 'INR'),
(115, 15, 'Current', '2021-04-18', 40500.00, 'SBIN000015', 'SBI015', 'Active', 'Deepak Ghosh', 'INR'),
(116, 16, 'Savings', '2019-11-11', 22000.00, 'SBIN000016', 'SBI016', 'Active', 'Nidhi Pathak', 'INR'),
(117, 17, 'Savings', '2020-05-30', 47000.50, 'SBIN000017', 'SBI017', 'Active', 'Tarun Jain', 'INR'),
(118, 18, 'Current', '2022-06-22', 110000.00, 'SBIN000018', 'SBI018', 'Active', 'Ankit Joshi', 'INR'),
(119, 19, 'Savings', '2023-03-03', 56000.00, 'SBIN000019', 'SBI019', 'Active', 'Radhika Verma', 'INR'),
(120, 20, 'Savings', '2023-07-07', 43250.50, 'SBIN000020', 'SBI020', 'Active', 'Amit Kapoor', 'INR');

-- Show all accounts
SELECT * FROM Accounts;

-- Delete all account records but keep the structure
TRUNCATE TABLE Accounts;

-- Completely remove the Accounts table
DROP TABLE Accounts;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. Where clause to filter the saving account
select * from Accounts where AccountType = 'savings';

-- 2. ORDER BY clause to sort Accounts by NomineeName
SELECT * FROM Accounts ORDER BY NomineeName ASC;

-- 3. GROUP BY clause to count Accounts per Currency
SELECT Currency, COUNT(*) AS Total FROM Accounts GROUP BY Currency;

-- 4. LIMIT clause to fetch top 5 accounts
SELECT * FROM accounts LIMIT 5;

-- 5. Inner Join 
SELECT c.FullName, a.Balance
FROM Customers c
INNER JOIN Accounts a
  ON c.CustomerID = a.CustomerID;
  
-- 6. Left Join
SELECT c.FullName, a.Balance
FROM Customers c
LEFT JOIN Accounts a
  ON c.CustomerID = a.CustomerID;
  
-- 7. Right Join
SELECT c.FullName, a.Balance
FROM Customers c
RIGHT JOIN Accounts a
  ON c.CustomerID = a.CustomerID;
  
-- 8. Cross Join
SELECT c.FullName, a.AccountID
FROM Customers c
CROSS JOIN Accounts a; 

-- 9. Add a CHECK constraint to ensure balance non‑negative
ALTER TABLE Accounts
  ADD CONSTRAINT chk_balance CHECK (Balance >= 0);

-- 10. Rename column NomineeName to Nominee
ALTER TABLE Accounts
  RENAME COLUMN NomineeName TO Nominee;

-- 11. Drop the BranchCode column
ALTER TABLE Accounts
  DROP COLUMN BranchCode;

alter table accounts add column branchcode varchar(10);

-- 12. Update balance for an account
UPDATE Accounts
SET Balance = Balance + 5000
WHERE AccountID = 103;

-- 13. Close (deactivate) an account
UPDATE Accounts
SET Status = 'Closed'
WHERE OpenDate < '20190101';

-- 14. Bulk update currency to default if NULL
UPDATE Accounts
SET Currency = 'INR'
WHERE Currency IS NULL;

-- 15. List all active accounts
SELECT * FROM Accounts
WHERE Status = 'Active';

-- 16. Show CustomerID and balance where balance > 50000, sorted
SELECT CustomerID, Balance
FROM Accounts
WHERE Balance > 50000
ORDER BY Balance DESC;

-- 17. Count the number of accounts by type
SELECT AccountType, COUNT(*) AS NumAccounts
FROM Accounts
GROUP BY AccountType;

-- 18. Check distinct account types
SELECT DISTINCT AccountType
FROM Accounts;

-- 19. Average balance across all accounts
SELECT AVG(Balance) AS AvgBalance
FROM Accounts;

-- 20. Add a UNIQUE constraint on IFSCCode in Accounts
ALTER TABLE Accounts
  ADD CONSTRAINT uq_ifsc UNIQUE (IFSCCode);

-- 21. Use BETWEEN operator on dates
SELECT * FROM Accounts
WHERE OpenDate BETWEEN '20200101' AND '20211231';

-- 22. Use LIKE operator on nominee names
SELECT * FROM Accounts WHERE Nominee LIKE 'A%';

-- 23. Use CASE expression to classify balances
SELECT AccountID, Balance,
  CASE
    WHEN Balance >= 100000 THEN 'High'
    WHEN Balance >= 50000 THEN 'Medium'
    ELSE 'Low'
  END AS BalanceCategory
FROM Accounts;

-- 24. Count accounts per branch using join
SELECT a.BranchCode, COUNT(*) AS NumAccounts
FROM Accounts a
JOIN Customers c ON a.CustomerID = c.CustomerID
GROUP BY a.BranchCode;

-- 25. Selfjoin 
SELECT a1.AccountID, a2.AccountID AS RelatedAccount
FROM Accounts a1
JOIN Accounts a2
  ON a1.BranchCode = a2.BranchCode
    AND a1.AccountID <> a2.AccountID;

-- 26. Subquery in WHERE: accounts with balance above average
SELECT AccountID, Balance
FROM Accounts
WHERE Balance > (
  SELECT AVG(Balance) FROM Accounts
);

-- 27. Subquery in FROM (derived table)
SELECT branch, AVG(Balance) AS AvgBal
FROM (
  SELECT BranchCode AS branch, Balance FROM Accounts
) AS sub
GROUP BY branch;

-- 28. Correlated subquery: show accounts with the highest balance per branch
SELECT AccountID, Balance, BranchCode
FROM Accounts a1
WHERE Balance = (
  SELECT MAX(Balance)
  FROM Accounts a2
  WHERE a2.BranchCode = a1.BranchCode
);

-- 29. Use EXISTS
SELECT AccountID
FROM Accounts a
WHERE EXISTS (
  SELECT 1 FROM Customers c
  WHERE c.CustomerID = a.CustomerID AND c.FullName LIKE 'A%'
);

-- 30. Use IN
SELECT * FROM Accounts
WHERE CustomerID IN (
  SELECT CustomerID FROM Customers WHERE FullName LIKE 'S%'
);

-- 31. Row number partitioned by branch
SELECT AccountID, BranchCode, Balance,
  ROW_NUMBER() OVER (PARTITION BY BranchCode ORDER BY Balance DESC) AS RankInBranch
FROM Accounts;

-- 32. Cumulative sum of balance by branch
SELECT AccountID, BranchCode, Balance,
  SUM(Balance) OVER (PARTITION BY BranchCode ORDER BY OpenDate) AS RunningTotal
FROM Accounts;

-- 33. Average balance in branch with partition
SELECT AccountID, Balance,
  AVG(Balance) OVER (PARTITION BY BranchCode) AS AvgBranchBal
FROM Accounts;

-- 34. Lead/Lag to compare balances in opening order
SELECT AccountID, OpenDate, Balance,
  LAG(Balance) OVER (ORDER BY OpenDate) AS PrevBalance,
  LEAD(Balance) OVER (ORDER BY OpenDate) AS NextBalance
FROM Accounts;

-- 35. Dense rank within branch
SELECT AccountID, BranchCode, Balance,
  DENSE_RANK() OVER (PARTITION BY BranchCode ORDER BY Balance DESC) AS DenseRank
FROM Accounts;

-- 36. Equal (=): Accounts where AccountType is 'Savings'
SELECT * FROM Accounts WHERE AccountType = 'Savings';

-- 37. Not Equal (<>): Accounts not of type 'Savings'
SELECT * FROM Accounts WHERE AccountType <> 'Savings';

-- 38. Greater Than (>): Balance greater than 50,000
SELECT * FROM Accounts WHERE Balance > 50000;

-- 39. Less Than (<): Balance less than 30,000
SELECT * FROM Accounts WHERE Balance < 30000;

-- 40. Greater or Equal (>=): Balance >= 100,000
SELECT * FROM Accounts WHERE Balance >= 100000;

-- 41. Less or Equal (<=): Balance <= 25,000
SELECT * FROM Accounts WHERE Balance <= 25000;

-- 42. BETWEEN: Balance between 40,000 and 60,000
SELECT * FROM Accounts WHERE Balance BETWEEN 40000 AND 60000;

-- 43. IN: AccountType is 'Savings' or 'Current'
SELECT * FROM Accounts WHERE AccountType IN ('Savings', 'Current');

-- 44. NOT IN: BranchCode not SBI001 or SBI002
SELECT * FROM Accounts WHERE BranchCode NOT IN ('SBI001', 'SBI002');

-- 45. LIKE: Nominee starts with 'A'
SELECT * FROM Accounts WHERE Nominee LIKE 'A%';

-- 46. NOT LIKE: IFSCCode not starting with 'SBIN00001'
SELECT * FROM Accounts WHERE IFSCCode NOT LIKE 'SBIN00001%';

-- 47. IS NULL: Nominee is NULL 
SELECT * FROM Accounts WHERE Nominee IS NULL;

-- 48. AND: Savings accounts with balance > 50,000
SELECT * FROM Accounts WHERE AccountType = 'Savings' AND Balance > 50000;

-- 49. OR: Accounts opened before 2020 or balance < 30,000
SELECT * FROM Accounts WHERE OpenDate < '2020-01-01' OR Balance < 30000;

-- 50. Arithmetic (+): Add 500 to balance temporarily
SELECT AccountID, Balance, Balance + 500 AS NewBalance FROM Accounts;

-- -----------------------------------------------------------------------------------------------------------------------------------------

--  Table-3: Transactions

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Type VARCHAR(10),
    Amount DECIMAL(10,2),
    Description TEXT,
    Mode VARCHAR(20),
    Status VARCHAR(10),
    BalanceAfter DECIMAL(12,2),
    BranchCode VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions VALUES
(1001, 101, '2024-06-10', 'Credit', 5000.00, 'Salary credited', 'NEFT', 'Success', 60000.75, 'SBI001'),
(1002, 101, '2024-06-15', 'Debit', 2000.00, 'Mobile recharge', 'UPI', 'Success', 58000.75, 'SBI001'),
(1003, 102, '2024-05-22', 'Debit', 1500.00, 'Electricity bill', 'Net Banking', 'Success', 123500.00, 'SBI002'),
(1004, 103, '2024-07-01', 'Credit', 20000.00, 'Cheque deposit', 'Cheque', 'Success', 87000.00, 'SBI003'),
(1005, 104, '2024-07-02', 'Debit', 500.00, 'ATM Withdrawal', 'ATM', 'Success', 88500.00, 'SBI004'),
(1006, 105, '2024-06-20', 'Credit', 10000.00, 'UPI received', 'UPI', 'Success', 42000.00, 'SBI005'),
(1007, 106, '2024-05-10', 'Debit', 1500.00, 'Online shopping', 'UPI', 'Success', 45500.90, 'SBI006'),
(1008, 107, '2024-07-15', 'Debit', 2500.00, 'Fuel payment', 'Card', 'Success', 48500.50, 'SBI007'),
(1009, 108, '2024-06-30', 'Credit', 7000.00, 'Client payment', 'IMPS', 'Success', 102000.00, 'SBI008'),
(1010, 109, '2024-05-18', 'Debit', 1000.00, 'Recharge', 'UPI', 'Success', 21000.00, 'SBI009'),
(1011, 110, '2024-07-05', 'Credit', 5000.00, 'Salary', 'NEFT', 'Success', 39000.00, 'SBI010'),
(1012, 111, '2024-06-12', 'Debit', 2000.00, 'Shopping', 'UPI', 'Success', 76000.45, 'SBI011'),
(1013, 112, '2024-05-25', 'Credit', 15000.00, 'Cheque', 'Cheque', 'Success', 140000.00, 'SBI012'),
(1014, 113, '2024-06-07', 'Debit', 2000.00, 'Rent', 'NEFT', 'Success', 31000.00, 'SBI013'),
(1015, 114, '2024-05-29', 'Debit', 1000.00, 'Petrol', 'UPI', 'Success', 58000.00, 'SBI014'),
(1016, 115, '2024-07-18', 'Credit', 10000.00, 'Client Payment', 'IMPS', 'Success', 50500.00, 'SBI015'),
(1017, 116, '2024-06-25', 'Debit', 500.00, 'Bill Payment', 'Net Banking', 'Success', 21500.00, 'SBI016'),
(1018, 117, '2024-07-03', 'Credit', 12000.00, 'Cash Deposit', 'Cash', 'Success', 59000.50, 'SBI017'),
(1019, 118, '2024-06-17', 'Debit', 1000.00, 'Restaurant', 'Card', 'Success', 109000.00, 'SBI018'),
(1020, 119, '2024-07-21', 'Credit', 8000.00, 'Transfer from friend', 'UPI', 'Success', 64000.00, 'SBI019');

-- Show all transactions
SELECT * FROM Transactions;

-- Remove all transaction records (preserves structure)
TRUNCATE TABLE Transactions;

-- Delete the Transactions table permanently
DROP TABLE Transactions;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. WHERE: Filters transactions where the amount is greater than 5000
SELECT * FROM Transactions
WHERE Amount > 5000;

-- 2. GROUP BY: Groups transactions by type and calculates the total amount for each type
SELECT Type, SUM(Amount) AS TotalAmount
FROM Transactions
GROUP BY Type;

-- 3. HAVING: Filters groups where the total amount is greater than 10000
SELECT Type, SUM(Amount) AS TotalAmount
FROM Transactions
GROUP BY Type
HAVING SUM(Amount) > 10000;

-- 4. ORDER BY: Sorts transactions by date in descending order
SELECT * FROM Transactions
ORDER BY TransactionDate DESC;

-- 5. LIMIT: Limits the result to the first 5 transactions
SELECT * FROM Transactions
LIMIT 5;

-- 6. UPDATE: Modifies the status of a transaction
UPDATE Transactions
SET Status = 'Failed'
WHERE TransactionID = 1002;

-- 7. DELETE: Removes a transaction record
DELETE FROM Transactions
WHERE TransactionID = 1003;

-- 8. = : Equal to
SELECT * FROM Transactions
WHERE Amount = 5000;

-- 9. > : Greater than
SELECT * FROM Transactions
WHERE Amount > 5000;

-- 10. < : Less than
SELECT * FROM Transactions
WHERE Amount < 5000;

-- 11. BETWEEN: Within a range
SELECT * FROM Transactions
WHERE Amount BETWEEN 1000 AND 5000;

-- 12. LIKE: Pattern matching
SELECT * FROM Transactions
WHERE Description LIKE '%bill%';

-- 13. INNER JOIN: Retrieves matching records from both tables
SELECT t.TransactionID, a.AccountID
FROM Transactions t
INNER JOIN Accounts a ON t.AccountID = a.AccountID;

-- 14. LEFT JOIN: Retrieves all records from the left table and matching records from the right table
SELECT t.TransactionID, a.AccountID
FROM Transactions t
LEFT JOIN Accounts a ON t.AccountID = a.AccountID;

-- 15. RIGHT JOIN: Retrieves all records from the right table and matching records from the left table
SELECT t.TransactionID, a.AccountID
FROM Transactions t
RIGHT JOIN Accounts a ON t.AccountID = a.AccountID;

-- 16. Subquery: Retrieve transactions where the amount is greater than the average amount
SELECT * FROM Transactions
WHERE Amount > (SELECT AVG(Amount) FROM Transactions);

-- 17. Correlated Subquery: Retrieve transactions where the amount is greater than the average amount for the same branch
SELECT * FROM Transactions t1
WHERE Amount > (SELECT AVG(Amount) FROM Transactions t2 WHERE t1.BranchCode = t2.BranchCode);

-- 18. Subquery in FROM clause: Retrieve the total amount for each branch
SELECT BranchCode, SUM(Amount) AS TotalAmount
FROM (SELECT DISTINCT BranchCode, Amount FROM Transactions) AS DistinctTransactions
GROUP BY BranchCode;

-- 19. Subquery in SELECT clause: Retrieve each transaction's amount and the total amount for the same branch
SELECT TransactionID, Amount,
       (SELECT SUM(Amount) FROM Transactions WHERE BranchCode = t.BranchCode) AS BranchTotal
FROM Transactions t;

-- 20. EXISTS: Retrieve transactions where there exists a corresponding account
SELECT * FROM Transactions t
WHERE EXISTS (SELECT 1 FROM Accounts a WHERE a.AccountID = t.AccountID);

-- 21. ROW_NUMBER: Assign a unique row number to each transaction ordered by date
SELECT TransactionID, TransactionDate, Amount,
       ROW_NUMBER() OVER (ORDER BY TransactionDate) AS RowNum
FROM Transactions;

-- 22. NTILE: Divide transactions into 4 equal groups based on amount
SELECT TransactionID, Amount,
       NTILE(4) OVER (ORDER BY Amount DESC) AS Quartile
FROM Transactions;

-- 23. INNER JOIN: Get all accounts with their transactions
SELECT A.AccountID, A.CustomerID, T.TransactionID, T.Amount
FROM Accounts A
INNER JOIN Transactions T ON A.AccountID = T.AccountID;

-- 24. LEFT JOIN: Get all accounts and their transactions (if any)
SELECT A.AccountID, T.TransactionID, T.Amount
FROM Accounts A
LEFT JOIN Transactions T ON A.AccountID = T.AccountID;

-- 25. RIGHT JOIN: Get all transactions and related accounts 
SELECT A.AccountID, T.TransactionID, T.Amount
FROM Accounts A
RIGHT JOIN Transactions T ON A.AccountID = T.AccountID;

-- 26. JOIN with WHERE: Get transactions > 5000
SELECT A.AccountID, T.TransactionID, T.Amount
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE T.Amount > 5000;

-- 27. JOIN with AND operator: Savings accounts with transactions > 5000
SELECT A.AccountID, T.TransactionID, T.Amount
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE A.AccountType = 'Savings' AND T.Amount > 5000;

-- 28. JOIN with OR operator: Accounts of type 'Savings' or transactions of type 'Credit'
SELECT A.AccountID, T.TransactionID, A.AccountType, T.Type
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE A.AccountType = 'Savings' OR T.Type = 'Credit';

-- 28. JOIN and BETWEEN: Transactions between '2024-06-01' and '2024-06-30'
SELECT A.AccountID, T.TransactionID, T.TransactionDate
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE T.TransactionDate BETWEEN '2024-06-01' AND '2024-06-30';

-- 29. JOIN and LIKE: Transactions done via UPI mode
SELECT A.AccountID, T.TransactionID, T.Mode
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE T.Mode LIKE 'UPI';

-- 30. JOIN with NOT operator: Transactions not successful
SELECT A.AccountID, T.TransactionID, T.Status
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE NOT T.Status = 'Success';

-- 31. JOIN and IN operator: Accounts in specific branches with transactions
SELECT A.AccountID, T.TransactionID, A.BranchCode
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE A.BranchCode IN ('SBI001', 'SBI005', 'SBI010');

-- 32. JOIN and comparison: Accounts with balance >= 50,000 and debit transactions
SELECT A.AccountID, T.TransactionID, A.Balance, T.Type
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE A.Balance >= 50000 AND T.Type = 'Debit';

-- 33. JOIN and arithmetic operator (+): Calculate new balance after adding 1000 bonus (temporary)
SELECT A.AccountID, A.Balance, A.Balance + 1000 AS BalanceWithBonus
FROM Accounts A;

-- 34. JOIN and string concatenation: Show full branch and IFSC code
SELECT A.AccountID, CONCAT(A.BranchCode, '-', A.IFSCCode) AS BranchIFSC
FROM Accounts A;

-- 35. JOIN and date comparison: Transactions after '2024-06-15'
SELECT A.AccountID, T.TransactionID, T.TransactionDate
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE T.TransactionDate > '2024-06-15';

-- 36. JOIN and modulus operator: Transactions with even TransactionID
SELECT A.AccountID, T.TransactionID
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE MOD(T.TransactionID, 2) = 0;

-- 37. JOIN and IS NOT NULL: Accounts with at least one transaction and NomineeName set
SELECT A.AccountID, T.TransactionID, A.NomineeName
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE A.NomineeName IS NOT NULL;

-- 38. JOIN and IS NULL: Accounts with no NomineeName but have transactions
SELECT A.AccountID, T.TransactionID, A.Nominee
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
WHERE A.Nominee IS NULL;

-- 39. JOIN with aggregate: Count transactions per account
SELECT A.AccountID, COUNT(T.TransactionID) AS TransactionCount
FROM Accounts A
LEFT JOIN Transactions T ON A.AccountID = T.AccountID
GROUP BY A.AccountID;

-- 40. JOIN and HAVING: Accounts with more than 2 transactions
SELECT A.AccountID, COUNT(T.TransactionID) AS TransactionCount
FROM Accounts A
LEFT JOIN Transactions T ON A.AccountID = T.AccountID
GROUP BY A.AccountID
HAVING COUNT(T.TransactionID) > 2;

-- 41. JOIN and ORDER BY: List transactions ordered by date descending
SELECT A.AccountID, T.TransactionID, T.TransactionDate
FROM Accounts A
JOIN Transactions T ON A.AccountID = T.AccountID
ORDER BY T.TransactionDate DESC;

-- 42. LIMIT clause to fetch top 5 Transaction
SELECT * FROM Transactions LIMIT 3;

-- 43. DDL: Add a new column for account status
ALTER TABLE Transactions ADD transactionDay VARCHAR(20);

-- 44. DML: Update phone number of a Transactions
UPDATE Transactions SET Mode = 'Cheque' WHERE TransactionID = 1006;

-- 45. DML: Delete a Transactions
DELETE FROM Transactions WHERE TransactionID = 1002;

-- 46. Show all Transaction status 
SELECT * FROM Transactions WHERE LENGTH(Status) = 5;

-- 47. Check Transactions with status is not null
SELECT * FROM Transactions WHERE status IS NOT NULL;

-- 48. Filter Transactions with TransactionDate in correct DATE format
SELECT * FROM Transactions WHERE TransactionDate BETWEEN '2024-06-10' AND '2024-07-15';

-- 49. Using = operator
SELECT * FROM Transactions WHERE Amount = '5000.00';

-- 50. Using LIKE operator for Ty starting with 'D'
SELECT * FROM Transactions WHERE Type LIKE 'd%';

-- -----------------------------------------------------------------------------------------------------------------------------------------

-- Table-4: Loans

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(20),
    Amount DECIMAL(12,2),
    StartDate DATE,
    TenureMonths INT,
    InterestRate FLOAT,
    EMI DECIMAL(10,2),
    Status VARCHAR(10),
    BranchCode VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Loans VALUES
(201, 1, 'Home', 2500000.00, '2023-01-01', 240, 7.5, 22345.67, 'Active', 'SBI001'),
(202, 2, 'Car', 800000.00, '2023-05-10', 60, 9.2, 16543.00, 'Active', 'SBI002'),
(203, 3, 'Personal', 200000.00, '2024-01-15', 36, 11.5, 6720.45, 'Active', 'SBI003'),
(204, 4, 'Education', 400000.00, '2022-06-01', 48, 10.0, 10450.30, 'Active', 'SBI004'),
(205, 5, 'Home', 1500000.00, '2023-04-20', 180, 8.0, 15400.00, 'Active', 'SBI005'),
(206, 6, 'Car', 950000.00, '2022-03-01', 60, 9.5, 17250.20, 'Active', 'SBI006'),
(207, 7, 'Business', 1200000.00, '2023-07-10', 84, 8.9, 19300.00, 'Active', 'SBI007'),
(208, 8, 'Education', 350000.00, '2021-08-15', 48, 10.2, 9450.00, 'Active', 'SBI008'),
(209, 9, 'Home', 1800000.00, '2023-09-01', 240, 7.0, 19800.50, 'Active', 'SBI009'),
(210, 10, 'Car', 600000.00, '2022-02-20', 60, 9.1, 13450.00, 'Active', 'SBI010'),
(211, 11, 'Personal', 250000.00, '2023-11-10', 36, 11.2, 7300.00, 'Active', 'SBI011'),
(212, 12, 'Home', 3000000.00, '2022-12-12', 240, 6.9, 24500.00, 'Active', 'SBI012'),
(213, 13, 'Education', 420000.00, '2023-05-01', 60, 10.4, 9900.00, 'Active', 'SBI013'),
(214, 14, 'Car', 700000.00, '2021-10-10', 48, 9.3, 15000.00, 'Active', 'SBI014'),
(215, 15, 'Home', 2200000.00, '2022-01-05', 240, 7.2, 21400.00, 'Active', 'SBI015'),
(216, 16, 'Business', 1000000.00, '2022-06-25', 120, 8.8, 19500.00, 'Active', 'SBI016'),
(217, 17, 'Personal', 300000.00, '2023-04-14', 36, 11.0, 8800.00, 'Active', 'SBI017'),
(218, 18, 'Education', 250000.00, '2022-07-07', 48, 10.5, 7800.00, 'Active', 'SBI018'),
(219, 19, 'Car', 850000.00, '2023-03-03', 60, 9.0, 15800.00, 'Active', 'SBI019'),
(220, 20, 'Personal', 200000.00, '2024-03-20', 36, 11.5, 6720.45, 'Active', 'SBI020');

-- List all home loans above ₹20 lakhs
SELECT * FROM Loans;

-- Clear all loan records
TRUNCATE TABLE Loans;

-- Delete the Loans table from database
DROP TABLE Loans;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. WHERE clause: Filters records where the loan amount is greater than 1,000,000
SELECT * FROM Loans
WHERE Amount > 1000000;

-- 2. ORDER BY clause: Sorts customers by their last name in ascending order
SELECT * FROM Loans
ORDER BY Amount ASC;

-- 3. GROUP BY clause: Groups loans by loan type and calculates the average amount for each group
SELECT LoanType, AVG(Amount) AS AverageAmount
FROM Loans
GROUP BY LoanType;

-- 4. HAVING clause: Filters groups where the average loan amount is greater than 1,000,000
SELECT LoanType, AVG(Amount) AS AverageAmount
FROM Loans
GROUP BY LoanType
HAVING AVG(Amount) > 1000000;

-- 5. LIMIT clause: Retrieves the first 5 records from the loans table
SELECT * FROM Loans LIMIT 5;

-- 6. SELECT JOIN: Retrieves data from multiple tables
SELECT Customers.FullName, Loans.Amount
FROM Customers
JOIN Loans ON Customers.CustomerID = Loans.CustomerID;

-- 7. INNER JOIN: Returns records with matching values in both tables
SELECT Customers.FullName, Loans.Amount
FROM Customers
INNER JOIN Loans ON Customers.CustomerID = Loans.CustomerID;

-- 8. LEFT JOIN: Returns all records from the left table, and matched records from the right table
SELECT Customers.FullName, Loans.Amount
FROM Customers
LEFT JOIN Loans ON Customers.CustomerID = Loans.CustomerID;

-- 9. RIGHT JOIN: Returns all records from the right table, and matched records from the left table
SELECT Customers.FullName, Loans.Amount
FROM Customers
RIGHT JOIN Loans ON Customers.CustomerID = Loans.CustomerID;

-- 10. Subquery in SELECT: Retrieves customers who have loans greater than 1,000,000
SELECT CustomerID, FullName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Loans
    WHERE Amount > 1000000
);

-- 11. Subquery in WHERE: Retrieves loans for customers from Delhi
SELECT LoanID, Amount
FROM Loans
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE Address = 'Delhi'
);

-- 12. Subquery in FROM: Calculates the average loan amount per branch
SELECT BranchCode, AVG(Amount) AS AvgLoanAmount
FROM (
    SELECT BranchCode, Amount
    FROM Loans
) AS LoanData
GROUP BY BranchCode;

-- 13. Subquery in HAVING: Retrieves branches with an average loan amount greater than 1,000,000
SELECT BranchCode, AVG(Amount) AS AvgLoanAmount
FROM Loans
GROUP BY BranchCode
HAVING AVG(Amount) > 1000000;

-- 14. Correlated Subquery: Retrieves customers whose loan amount is greater than their average loan amount
SELECT CustomerID, FullName
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.CustomerID = c.CustomerID
    HAVING SUM(l.Amount) > (SELECT AVG(Amount) FROM Loans WHERE CustomerID = c.CustomerID)
);

-- 15. NTILE: Divides the result set into a specified number of approximately equal groups
SELECT CustomerID, Amount,
       NTILE(4) OVER (PARTITION BY BranchCode ORDER BY Amount DESC) AS Quartile
FROM Loans;

-- 16. Stored Procedure: Retrieves loans for a specific customer
DELIMITER //
CREATE PROCEDURE GetLoansByCustomer(IN custID INT)
BEGIN
    SELECT * FROM Loans
    WHERE CustomerID = custID;
END //
DELIMITER ;

-- 17. Stored Procedure: Updates the loan amount for a specific loan
DELIMITER //
CREATE PROCEDURE UpdateLoanAmount(IN loanID INT, IN newAmount DECIMAL(12,2))
BEGIN
    UPDATE Loans
    SET Amount = newAmount
    WHERE LoanID = loanID;
END //
DELIMITER ;

-- 18. Stored Procedure: Deletes a loan record
DELIMITER //
CREATE PROCEDURE DeleteLoan(IN loanID INT)
BEGIN
    DELETE FROM Loans
    WHERE LoanID = loanID;
END //
DELIMITER ;

-- 19. Stored Procedure: Retrieves all loans with a status of 'Active'
DELIMITER //
CREATE PROCEDURE GetActiveLoans()
BEGIN
    SELECT * FROM Loans
    WHERE Status = 'Active';
END //
DELIMITER ;
 
-- 20. Arithmetic: Increase loan amount by 10%
SELECT LoanID, Amount * 1.10 AS IncreasedAmount FROM Loans;

-- 21. Arithmetic + Modulo: EMI remainder months
SELECT LoanID, TenureMonths % 12 AS RemainderMonths FROM Loans;

-- 22. Comparison: Home loans > ₹2,000,000
SELECT * FROM Loans WHERE LoanType = 'Home' AND Amount > 2000000;

-- 23. Comparison with BETWEEN: mid‑range loan amounts
SELECT * FROM Loans WHERE Amount BETWEEN 500000 AND 1500000;

-- 24. Inequality: exclude interest rate 9.5%
SELECT LoanID, InterestRate FROM Loans WHERE InterestRate <> 9.5;

-- 25. Date comparison: loans starting in 2023–2024
SELECT * FROM Loans WHERE StartDate >= '2023-01-01' AND StartDate <= '2024-12-31';

-- 26. Logical OR + AND: active car or education loans
SELECT * FROM Loans WHERE Status='Active' AND (LoanType='Car' OR LoanType='Education');

-- 27. NOT operator: exclude personal loans
SELECT * FROM Loans WHERE NOT (LoanType='Personal');

-- 28. NULL check via CASE
SELECT LoanID, BranchCode,
  CASE WHEN BranchCode IS NULL THEN 'Missing' ELSE 'Present' END AS BranchStatus
FROM Loans;

-- 29. IN and LIKE: specific branches
SELECT * FROM Loans
WHERE BranchCode IN ('SBI001','SBI005','SBI009') AND CustomerID LIKE '1%';

-- 30. EXISTS + correlated subquery: customer with personal loan
SELECT * FROM Loans l
WHERE EXISTS (
  SELECT 1 FROM Loans
  WHERE CustomerID = l.CustomerID AND LoanType = 'Personal'
);

-- 31. Selfjoin: multiple loans per customer
SELECT l1.LoanID AS LoanA, l2.LoanID AS LoanB
FROM Loans l1 JOIN Loans l2
  ON l1.CustomerID = l2.CustomerID AND l1.LoanID <> l2.LoanID;

-- 32. UNION: home or car loans
SELECT LoanID, LoanType FROM Loans WHERE LoanType = 'Home'
UNION
SELECT LoanID, LoanType FROM Loans WHERE LoanType = 'Car';

-- 33. GROUP BY + HAVING: loan counts by type >1
SELECT LoanType, COUNT(*) AS CountLoans
FROM Loans GROUP BY LoanType HAVING COUNT(*) > 1;

-- 34. Aggregate: average EMI per status
SELECT Status, AVG(EMI) AS AvgEMI
FROM Loans GROUP BY Status;

-- 35. CASE expression: interest rate band
SELECT LoanID,
  CASE
    WHEN InterestRate > 10 THEN 'High'
    WHEN InterestRate BETWEEN 8 AND 10 THEN 'Medium'
    ELSE 'Low'
  END AS RateBand
FROM Loans;

-- 36. UPDATE: Modifies an existing record in the 'Loans' table
UPDATE Loans SET Status = 'Inactive' WHERE LoanID = '202';

-- 37. DELETE: Removes a record from the 'Loans' table
DELETE FROM Loans
WHERE StartDate = '2023-01-01';

-- 38. WHERE clause to filter Personal Loantype
SELECT * FROM Loans WHERE LoanType = 'Personal';

-- 39. ORDER BY clause to sort Branches by State
SELECT * FROM Loans ORDER BY State ASC;

-- 40. GROUP BY clause to count Branches per City
SELECT LoanID, COUNT(*) AS Total FROM Loans GROUP BY LoanID;

-- 41. LIMIT clause to fetch top 5 Loans
SELECT * FROM Loans LIMIT 5;

-- 42. DML: Delete a Branchcode
DELETE FROM Loans WHERE LoanID = '203';

-- 43. Using LIKE operator for Ty starting with 'D'
SELECT * FROM Loans WHERE Status LIKE 'A%';


-- -----------------------------------------------------------------------------------------------------------------------------------------

--  Table-5: Branches

CREATE TABLE Branches (
    BranchCode VARCHAR(10) PRIMARY KEY,
    BranchName VARCHAR(100),
    IFSCCode VARCHAR(11),
    MICRCode VARCHAR(10),
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Contact VARCHAR(15),
    ManagerName VARCHAR(100),
    WorkingHours VARCHAR(50)
);

INSERT INTO Branches VALUES
('SBI001', 'SBI Delhi Main Branch', 'SBIN000001', '110002001', 'Connaught Place, Delhi', 'Delhi', 'Delhi', '01123456789', 'Rajeev Khanna', '9 AM - 4 PM'),
('SBI002', 'SBI Mumbai West Branch', 'SBIN000002', '400002002', 'Bandra, Mumbai', 'Mumbai', 'Maharashtra', '02245678901', 'Sonal Rane', '9 AM - 4 PM'),
('SBI003', 'SBI Kolkata Branch', 'SBIN000003', '700002003', 'Salt Lake, Kolkata', 'Kolkata', 'West Bengal', '03312345678', 'Rakesh Roy', '9 AM - 4 PM'),
('SBI004', 'SBI Chennai Branch', 'SBIN000004', '600002004', 'T Nagar, Chennai', 'Chennai', 'Tamil Nadu', '04423456789', 'Meena Nair', '9 AM - 4 PM'),
('SBI005', 'SBI Bangalore Branch', 'SBIN000005', '560002005', 'MG Road, Bangalore', 'Bangalore', 'Karnataka', '08034567891', 'Anil Sinha', '9 AM - 4 PM'),
('SBI006', 'SBI Hyderabad Branch', 'SBIN000006', '500002006', 'Banjara Hills, Hyderabad', 'Hyderabad', 'Telangana', '04067891234', 'Preeti Rao', '9 AM - 4 PM'),
('SBI007', 'SBI Ahmedabad Branch', 'SBIN000007', '380002007', 'Navrangpura, Ahmedabad', 'Ahmedabad', 'Gujarat', '07945678912', 'Karan Patel', '9 AM - 4 PM'),
('SBI008', 'SBI Surat Branch', 'SBIN000008', '395002008', 'Ring Road, Surat', 'Surat', 'Gujarat', '02612345678', 'Anjali Desai', '9 AM - 4 PM'),
('SBI009', 'SBI Jaipur Branch', 'SBIN000009', '302002009', 'MI Road, Jaipur', 'Jaipur', 'Rajasthan', '01414567890', 'Ravi Sharma', '9 AM - 4 PM'),
('SBI010', 'SBI Bhopal Branch', 'SBIN000010', '462002010', 'New Market, Bhopal', 'Bhopal', 'Madhya Pradesh', '07552678901', 'Neha Joshi', '9 AM - 4 PM'),
('SBI011', 'SBI Lucknow Branch', 'SBIN000011', '226002011', 'Hazratganj, Lucknow', 'Lucknow', 'Uttar Pradesh', '05221234567', 'Saurabh Pandey', '9 AM - 4 PM'),
('SBI012', 'SBI Kanpur Branch', 'SBIN000012', '208002012', 'Mall Road, Kanpur', 'Kanpur', 'Uttar Pradesh', '05122345678', 'Anita Yadav', '9 AM - 4 PM'),
('SBI013', 'SBI Nagpur Branch', 'SBIN000013', '440002013', 'Sitabuldi, Nagpur', 'Nagpur', 'Maharashtra', '07122456789', 'Manoj Deshmukh', '9 AM - 4 PM'),
('SBI014', 'SBI Amritsar Branch', 'SBIN000014', '143002014', 'GT Road, Amritsar', 'Amritsar', 'Punjab', '01832456789', 'Gurpreet Singh', '9 AM - 4 PM'),
('SBI015', 'SBI Guwahati Branch', 'SBIN000015', '781002015', 'Zoo Road, Guwahati', 'Guwahati', 'Assam', '03612456789', 'Bipin Choudhary', '9 AM - 4 PM'),
('SBI016', 'SBI Indore Branch', 'SBIN000016', '452002016', 'Rajwada, Indore', 'Indore', 'Madhya Pradesh', '07312456789', 'Isha Tripathi', '9 AM - 4 PM'),
('SBI017', 'SBI Kota Branch', 'SBIN000017', '324002017', 'Chambal Road, Kota', 'Kota', 'Rajasthan', '07442456789', 'Deepak Verma', '9 AM - 4 PM'),
('SBI018', 'SBI Raipur Branch', 'SBIN000018', '492002018', 'Pandri, Raipur', 'Raipur', 'Chhattisgarh', '07712456789', 'Shweta Chauhan', '9 AM - 4 PM'),
('SBI019', 'SBI Agra Branch', 'SBIN000019', '282002019', 'Sadar Bazar, Agra', 'Agra', 'Uttar Pradesh', '05622456789', 'Abhay Dixit', '9 AM - 4 PM'),
('SBI020', 'SBI Pune Branch', 'SBIN000020', '411002020', 'Kalyani Nagar, Pune', 'Pune', 'Maharashtra', '02024567890', 'Ajay Pawar', '9 AM - 4 PM');

-- View all branches located in Maharashtra
SELECT * FROM Branches;

-- Remove all records from Branches
TRUNCATE TABLE Branches;

-- Drop the entire Branches table
DROP TABLE Branches;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. Filter branches located in Mumbai
SELECT * FROM Branches WHERE City = 'Mumbai';

-- 2. BranchCode from 'SBI005' through 'SBI010'
SELECT * FROM Branches WHERE BranchCode BETWEEN 'SBI005' AND 'SBI010';

-- 3. Branches whose name contains "Main"
SELECT * FROM Branches WHERE BranchName LIKE '%Main%';

-- 4. Sort branches alphabetically by name
SELECT BranchName, City FROM Branches ORDER BY BranchName;

-- 5. Return only the first 5 branches
SELECT * FROM Branches LIMIT 5;

-- 6. Add an Email column
ALTER TABLE Branches ADD Email VARCHAR(100);

-- 7. Remove the Contact column
ALTER TABLE Branches DROP COLUMN Contact;

-- 8. Add the contact column
alter table Branches add column Contact varchar(10);

-- 9. Modify IFSCCode data type to larger length
ALTER TABLE Branches MODIFY IFSCCode VARCHAR(15);

-- 10. Create an index on City to speed up queries
CREATE INDEX idx_city ON Branches(City);

-- 11. Enforce unique manager names
ALTER TABLE Branches ADD CONSTRAINT uq_manager UNIQUE(ManagerName);

-- 12. Ensure City is not empty
ALTER TABLE Branches MODIFY City VARCHAR(50) NOT NULL;

-- 13. Check that Contact starts with '0'
ALTER TABLE Branches ADD CONSTRAINT chk_contact CHECK (Contact LIKE '0%');

-- 14. Set default working hours value
ALTER TABLE Branches ALTER WorkingHours SET DEFAULT '9 AM - 5 PM';

-- 15. Update the city of a branch
UPDATE Branches SET City = 'Pune' WHERE BranchCode = 'SBI020';

-- 16. Delete a specific branch
DELETE FROM Branches WHERE BranchCode = 'SBI021';

-- 17. Set the state to uppercase for branches in 'Pune'
UPDATE Branches SET State = 'MAHARASHTRA' WHERE City = 'Pune';

-- 18. List branches in Mumbai with manager name
SELECT BranchName, ManagerName FROM Branches WHERE City = 'Mumbai';

-- 19. Count branches by state
SELECT State, COUNT(*) AS BranchCount FROM Branches GROUP BY State;

-- 20. List BranchCode and its City sorted
SELECT BranchCode, City FROM Branches ORDER BY City ASC;

-- 21. Show distinct cities present in branches
SELECT DISTINCT City FROM Branches;

-- 22. Find branches managed by someone named 'Desai'
SELECT * FROM Branches WHERE ManagerName LIKE '%Desai%';

-- 23. Join customers to branch names via BranchCode
SELECT
  c.FullName,
  b.BranchName
FROM Customers c
JOIN Branches b ON c.BranchCode = b.BranchCode;

-- 24. Branches in states having more than one branch
SELECT BranchName
FROM Branches
WHERE State IN (
  SELECT State
  FROM Branches
  GROUP BY State
  HAVING COUNT(*) > 1
);

-- 25. Branch with the longest manager name
SELECT *
FROM Branches
WHERE LENGTH(ManagerName) = (
  SELECT MAX(LENGTH(ManagerName))
  FROM Branches
);

-- 26. Select branches whose code is in a subquery-specific list
SELECT * FROM Branches WHERE BranchCode IN (
  SELECT BranchCode FROM Branches WHERE City = 'Mumbai'
);

-- 27. Use EXISTS: check states that have at least one Pune branch
SELECT *
FROM Branches b
WHERE EXISTS (
  SELECT 1 FROM Branches b2
  WHERE b2.State = b.State AND b2.City = 'Pune'
);

-- 28. Count branches per state using window function
SELECT
  BranchCode,
  State,
  COUNT(*) OVER (PARTITION BY State) AS BranchesInState
FROM Branches;

-- 29. Assign rank to cities alphabetically
SELECT
  BranchCode,
  City,
  RANK() OVER (ORDER BY City) AS CityRank
FROM Branches;

-- 30. Audit table to track branch inserts
CREATE TABLE BranchAudit (
  AuditID INT AUTO_INCREMENT PRIMARY KEY,
  BranchCode VARCHAR(10),
  ActionType VARCHAR(10),
  ActionTime DATETIME
);

-- 31. Triggers
DELIMITER //
CREATE PROCEDURE GetBranchesByState(IN p_state VARCHAR(50))
BEGIN
  -- Return all branches in the given state
  SELECT BranchName, City, ManagerName
  FROM Branches
  WHERE State = p_state;
END; //
DELIMITER ;

-- 32. select branchname, city from branch
SELECT BranchName, city AS CityCode FROM Branches;

-- 33. List every branch and any customer linked, if present
SELECT b.BranchName, b.City, c.FullName
FROM Branches b
LEFT JOIN Customers c
  ON b.BranchCode = c.BranchCode;

-- 34. Retrieve each customer’s name with their branch name
SELECT c.FullName, b.BranchName
FROM Customers c
INNER JOIN Branches b
  ON c.BranchCode = b.BranchCode;

-- 35. Retrieve each customer's name and their branch name 
SELECT c.FullName, b.BranchName
FROM Customers c
RIGHT JOIN Branches b
  ON c.BranchCode = b.BranchCode;

-- 36. Retrieve all possible combinations of customers and branches
SELECT c.FullName, b.BranchName
FROM Customers c
CROSS JOIN Branches b;

-- 37. UPDATE: Modifies an existing record in the 'Branches' table
UPDATE Branches SET City = 'Mumbai' WHERE BranchCode = 'SBI021';

-- 38. DELETE: Removes a record from the 'Branches' table
DELETE FROM Branches
WHERE BranchCode = 'SBI021';

-- 39. WHERE clause to filter Karnataka State
SELECT * FROM Branches WHERE State = 'Karnataka';

-- 40. ORDER BY clause to sort Branches by State
SELECT * FROM BRanches ORDER BY State ASC;

-- 41. GROUP BY clause to count Branches per City
SELECT City, COUNT(*) AS Total FROM Branches GROUP BY City;

-- 42. LIMIT clause to fetch top 5 Branches
SELECT * FROM Branches LIMIT 5;

-- 43. DML: Delete a Branchcode
DELETE FROM Branches WHERE BranchCode = 'SBI021';

-- 44. Using LIKE operator for Ty starting with 'D'
SELECT * FROM Branches WHERE City LIKE 'D%';

-- -----------------------------------------------------------------------------------------------------------------------------------------

