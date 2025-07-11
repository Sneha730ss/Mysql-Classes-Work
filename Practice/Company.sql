-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database Company;

-- to work on it, you need to use it first
use Company;

-- Delete a database
Drop database Company;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Employees (emp_id, full_name, gender, date_of_birth, email,phone_number, designation, department, join_date, salary) 

T2 : Departments (dept_id, dept_name, manager_name, contact_email, contact_number,location, floor_no, total_employees, established_year, status)

T3 : Projects (project_id, project_name, dept_id, manager_name, start_date,end_date, budget, status, client_name, location)

T4 : Clients (client_id, client_name, industry_type, contact_person, email,phone_number, city, state, country, status)

T5 : Attendance (attendance_id, emp_id, date, check_in, check_out, work_hours,status, remarks, approved_by, approval_status) 

T6 : Salaries (salary_id, emp_id, basic_pay, hra, special_allowance, deductions,bonus, month, year, net_salary) 

T7 : Leaves (leave_id, emp_id, leave_type, start_date, end_date,total_days, reason, status, applied_on, approved_by)

T8 : Assets (asset_id, emp_id, asset_name, asset_type, serial_number,issue_date, return_date, status, remarks)

T9 : Training_Programs (program_id, program_name, dept_id, trainer_name, start_date,end_date, duration_days, mode, status, feedback_rating) 

T10 : Vendors (vendor_id, vendor_name, contact_person, email, phone_number,address, city, state, gst_number, status) 

T11 : Meetings (meeting_id, topic, dept_id, organizer, meeting_date,start_time, end_time, mode, status, notes) 

T12 : Client_Feedback (feedback_id, project_id, client_name, rating, feedback_text,feedback_date, submitted_by, designation, response_status, response_date) 

T13 : Salary_Payments (payment_id, emp_id, payment_date, month_year, basic_salary,hra, bonus, deductions, net_salary, status)

T14 : Announcements (announcement_id, title, message, dept_id, posted_by,designation, post_date, valid_until, priority_level, status) 

T15 : Employee_Assets (asset_id, emp_id, asset_type, asset_name, serial_number,issued_date, return_date, condition_status, issued_by, remarks)


*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    designation VARCHAR(50),
    department VARCHAR(50),
    join_date DATE,
    salary DECIMAL(10,2)
);

-- Insert records into the table
INSERT INTO Employees (emp_id, full_name, gender, date_of_birth, email,phone_number, designation, department, join_date, salary) 
VALUES
(1, 'Ravi Sharma', 'Male', '1990-06-15', 'ravi.sharma@company.in', '9876543210', 'Manager', 'Sales', '2015-04-01', 65000.00),
(2, 'Priya Mehta', 'Female', '1992-09-22', 'priya.mehta@company.in', '9876504321', 'Software Engineer', 'IT', '2018-07-12', 55000.00),
(3, 'Anil Kapoor', 'Male', '1985-03-30', 'anil.kapoor@company.in', '9876112233', 'HR Executive', 'HR', '2014-03-18', 48000.00),
(4, 'Neha Joshi', 'Female', '1991-11-10', 'neha.joshi@company.in', '9876987456', 'Accountant', 'Finance', '2017-01-10', 50000.00),
(5, 'Amit Deshmukh', 'Male', '1988-05-25', 'amit.deshmukh@company.in', '9876432123', 'Team Lead', 'IT', '2016-09-23', 60000.00),
(6, 'Sneha Patil', 'Female', '1993-12-08', 'sneha.patil@company.in', '9876123456', 'Marketing Exec.', 'Marketing', '2020-02-01', 47000.00),
(7, 'Rahul Verma', 'Male', '1990-01-05', 'rahul.verma@company.in', '9876234512', 'Developer', 'IT', '2019-06-14', 53000.00),
(8, 'Pooja Nair', 'Female', '1994-07-17', 'pooja.nair@company.in', '9876778899', 'Support Officer', 'Customer Support', '2021-03-05', 42000.00),
(9, 'Vikram Singh', 'Male', '1987-08-29', 'vikram.singh@company.in', '9876540987', 'Sales Exec.', 'Sales', '2013-11-25', 46000.00),
(10, 'Deepa Reddy', 'Female', '1990-10-12', 'deepa.reddy@company.in', '9876212345', 'Recruiter', 'HR', '2019-10-01', 45000.00),
(11, 'Sanjay Gupta', 'Male', '1986-04-18', 'sanjay.gupta@company.in', '9876345678', 'Finance Analyst', 'Finance', '2012-08-01', 52000.00),
(12, 'Komal Jain', 'Female', '1995-02-28', 'komal.jain@company.in', '9876451234', 'Content Writer', 'Marketing', '2022-01-10', 41000.00),
(13, 'Manoj Kumar', 'Male', '1989-06-06', 'manoj.kumar@company.in', '9876789054', 'Data Analyst', 'IT', '2018-12-15', 54000.00),
(14, 'Nikita Shah', 'Female', '1996-01-20', 'nikita.shah@company.in', '9876554321', 'Intern', 'HR', '2023-07-01', 25000.00),
(15, 'Rajiv Iyer', 'Male', '1984-10-05', 'rajiv.iyer@company.in', '9876012345', 'Admin Head', 'Admin', '2010-04-11', 58000.00);

-- to display/retrieve table data
SELECT * FROM Employees;               

-- to remove complete data from table
truncate table Employees;

-- to delete complete attributes and records 
drop table Employees;

-- Table 2: Departments
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    manager_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_number VARCHAR(15),
    location VARCHAR(100),
    floor_no INT,
    total_employees INT,
    established_year INT,
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Departments (dept_id, dept_name, manager_name, contact_email, contact_number,location, floor_no, total_employees, established_year, status)
 VALUES
(1, 'IT', 'Ravi Sharma', 'it@company.in', '9876543210', 'Mumbai', 3, 50, 2010, 'Active'),
(2, 'HR', 'Anil Kapoor', 'hr@company.in', '9876112233', 'Delhi', 2, 20, 2011, 'Active'),
(3, 'Finance', 'Neha Joshi', 'finance@company.in', '9876987456', 'Bangalore', 4, 15, 2009, 'Active'),
(4, 'Marketing', 'Amit Deshmukh', 'marketing@company.in', '9876432123', 'Pune', 3, 25, 2013, 'Active'),
(5, 'Sales', 'Vikram Singh', 'sales@company.in', '9876540987', 'Kolkata', 5, 30, 2012, 'Active'),
(6, 'Customer Support', 'Pooja Nair', 'support@company.in', '9876778899', 'Mumbai', 1, 18, 2014, 'Active'),
(7, 'Admin', 'Rajiv Iyer', 'admin@company.in', '9876012345', 'Chennai', 1, 10, 2008, 'Active'),
(8, 'Legal', 'Sanjay Gupta', 'legal@company.in', '9876345678', 'Hyderabad', 6, 8, 2016, 'Active'),
(9, 'R&D', 'Manoj Kumar', 'rnd@company.in', '9876789054', 'Bangalore', 7, 22, 2015, 'Active'),
(10, 'Procurement', 'Deepa Reddy', 'procurement@company.in', '9876212345', 'Delhi', 2, 12, 2017, 'Active'),
(11, 'Logistics', 'Rahul Verma', 'logistics@company.in', '9876234512', 'Ahmedabad', 4, 16, 2018, 'Active'),
(12, 'Quality Control', 'Sneha Patil', 'qc@company.in', '9876123456', 'Nagpur', 3, 14, 2019, 'Active'),
(13, 'Design', 'Komal Jain', 'design@company.in', '9876451234', 'Mumbai', 5, 11, 2020, 'Active'),
(14, 'Production', 'Nikita Shah', 'production@company.in', '9876554321', 'Chennai', 6, 28, 2013, 'Active'),
(15, 'Security', 'Priya Mehta', 'security@company.in', '9876504321', 'Pune', 1, 9, 2011, 'Active');

-- to display/retrieve table data
SELECT * FROM Departments;               

-- to remove complete data from table
truncate table Departments;

-- to delete complete attributes and records 
drop table Departments;

-- Table 3: Projects
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    manager_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2),
    status VARCHAR(30),
    client_name VARCHAR(100),
    location VARCHAR(100),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Projects (project_id, project_name, dept_id, manager_name, start_date,end_date, budget, status, client_name, location)
 VALUES
(1, 'ERP Implementation', 1, 'Ravi Sharma', '2023-01-10', '2023-08-30', 1200000.00, 'Completed', 'Infosys', 'Mumbai'),
(2, 'Payroll Automation', 2, 'Anil Kapoor', '2023-02-05', '2023-06-20', 450000.00, 'Completed', 'TCS', 'Delhi'),
(3, 'Tax Compliance System', 3, 'Neha Joshi', '2023-03-01', '2023-09-10', 700000.00, 'Ongoing', 'ICICI Bank', 'Bangalore'),
(4, 'Digital Campaign', 4, 'Amit Deshmukh', '2023-04-10', '2023-10-15', 500000.00, 'Ongoing', 'Amazon India', 'Pune'),
(5, 'CRM Setup', 5, 'Vikram Singh', '2023-05-15', '2023-12-01', 650000.00, 'Ongoing', 'Flipkart', 'Kolkata'),
(6, 'Support System Upgrade', 6, 'Pooja Nair', '2023-06-01', '2023-11-20', 300000.00, 'Ongoing', 'HDFC Bank', 'Mumbai'),
(7, 'Office Automation', 7, 'Rajiv Iyer', '2023-07-10', '2023-09-25', 280000.00, 'Completed', 'Bajaj Finance', 'Chennai'),
(8, 'Legal Portal Design', 8, 'Sanjay Gupta', '2023-08-05', '2024-01-15', 400000.00, 'Planning', 'Supreme Court', 'Hyderabad'),
(9, 'AI Research Pilot', 9, 'Manoj Kumar', '2023-09-01', '2024-06-30', 1500000.00, 'Ongoing', 'IIT Bombay', 'Bangalore'),
(10, 'Vendor Platform', 10, 'Deepa Reddy', '2023-10-12', '2024-04-10', 320000.00, 'Ongoing', 'Reliance Retail', 'Delhi'),
(11, 'Warehouse Optimization', 11, 'Rahul Verma', '2023-11-01', '2024-03-31', 375000.00, 'Planning', 'BigBasket', 'Ahmedabad'),
(12, 'QC Automation', 12, 'Sneha Patil', '2023-12-10', '2024-05-10', 500000.00, 'Ongoing', 'Maruti Suzuki', 'Nagpur'),
(13, 'UX Revamp', 13, 'Komal Jain', '2024-01-15', '2024-07-15', 275000.00, 'Ongoing', 'Zomato', 'Mumbai'),
(14, 'Production Line AI', 14, 'Nikita Shah', '2024-02-01', '2024-08-01', 1100000.00, 'Planning', 'Tata Steel', 'Chennai'),
(15, 'Surveillance Upgrade', 15, 'Priya Mehta', '2024-03-01', '2024-09-30', 450000.00, 'Ongoing', 'DRDO', 'Pune');

-- to display/retrieve table data
SELECT * FROM Projects;               

-- to remove complete data from table
truncate table Projects;

-- to delete complete attributes and records 
drop table Projects;

-- Table 4: Clients
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100),
    industry_type VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Clients (client_id, client_name, industry_type, contact_person, email,phone_number, city, state, country, status)
 VALUES
(1, 'Infosys', 'IT Services', 'Ramesh Kumar', 'ramesh.k@infosys.com', '9876543210', 'Bengaluru', 'Karnataka', 'India', 'Active'),
(2, 'TCS', 'Consulting', 'Meena Joshi', 'meena.j@tcs.com', '9876501234', 'Mumbai', 'Maharashtra', 'India', 'Active'),
(3, 'ICICI Bank', 'Banking', 'Vikrant Singh', 'vikrant.s@icici.com', '9876123456', 'Mumbai', 'Maharashtra', 'India', 'Active'),
(4, 'Amazon India', 'E-commerce', 'Neha Sharma', 'neha.s@amazon.in', '9876234567', 'Hyderabad', 'Telangana', 'India', 'Active'),
(5, 'Flipkart', 'E-commerce', 'Kunal Desai', 'kunal.d@flipkart.com', '9876345678', 'Bengaluru', 'Karnataka', 'India', 'Active'),
(6, 'HDFC Bank', 'Finance', 'Sanjay Patel', 'sanjay.p@hdfcbank.com', '9876456789', 'Ahmedabad', 'Gujarat', 'India', 'Active'),
(7, 'Bajaj Finance', 'Finance', 'Ankita Rathi', 'ankita.r@bajaj.com', '9876567890', 'Pune', 'Maharashtra', 'India', 'Active'),
(8, 'Supreme Court', 'Legal', 'Adv. Reena Rao', 'reena.r@supremecourt.in', '9876678901', 'Delhi', 'Delhi', 'India', 'Active'),
(9, 'IIT Bombay', 'Education', 'Prof. Arvind Mehta', 'arvind.m@iitb.ac.in', '9876789012', 'Mumbai', 'Maharashtra', 'India', 'Active'),
(10, 'Reliance Retail', 'Retail', 'Tanvi Jain', 'tanvi.j@reliance.in', '9876890123', 'Mumbai', 'Maharashtra', 'India', 'Active'),
(11, 'BigBasket', 'Grocery', 'Nikhil Shetty', 'nikhil.s@bigbasket.com', '9876901234', 'Bengaluru', 'Karnataka', 'India', 'Active'),
(12, 'Maruti Suzuki', 'Automobile', 'Divya Kapoor', 'divya.k@marutisuzuki.com', '9876012345', 'Gurgaon', 'Haryana', 'India', 'Active'),
(13, 'Zomato', 'Food Delivery', 'Rajesh Yadav', 'rajesh.y@zomato.com', '9876123450', 'Gurgaon', 'Haryana', 'India', 'Active'),
(14, 'Tata Steel', 'Manufacturing', 'Nikita Iyer', 'nikita.i@tatasteel.com', '9876234560', 'Jamshedpur', 'Jharkhand', 'India', 'Active'),
(15, 'DRDO', 'Defence', 'Dr. Ashok Rao', 'ashok.r@drdo.gov.in', '9876345670', 'Hyderabad', 'Telangana', 'India', 'Active');

-- to display/retrieve table data
SELECT * FROM Clients;               

-- to remove complete data from table
truncate table Clients;

-- to delete complete attributes and records 
drop table Clients;

-- Table 5: Attendance
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    emp_id INT,
    date DATE,
    check_in TIME,
    check_out TIME,
    work_hours DECIMAL(4,2),
    status VARCHAR(20),
    remarks TEXT,
    approved_by VARCHAR(100),
    approval_status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Attendance (attendance_id, emp_id, date, check_in, check_out, work_hours,status, remarks, approved_by, approval_status) 
VALUES
(1, 1, '2025-07-01', '09:00:00', '17:00:00', 8.00, 'Present', 'On time', 'Ravi Sharma', 'Approved'),
(2, 2, '2025-07-01', '09:15:00', '17:10:00', 7.92, 'Present', 'Slightly late', 'Priya Mehta', 'Approved'),
(3, 3, '2025-07-01', '09:00:00', '16:30:00', 7.50, 'Present', 'Left early', 'Anil Kapoor', 'Approved'),
(4, 4, '2025-07-01', '09:30:00', '17:30:00', 8.00, 'Present', 'Late login', 'Neha Joshi', 'Approved'),
(5, 5, '2025-07-01', '09:00:00', '18:00:00', 9.00, 'Present', 'Extra hours', 'Amit Deshmukh', 'Approved'),
(6, 6, '2025-07-01', NULL, NULL, 0.00, 'Absent', 'Sick Leave', 'Sneha Patil', 'Approved'),
(7, 7, '2025-07-01', '09:05:00', '17:05:00', 8.00, 'Present', 'On time', 'Rahul Verma', 'Approved'),
(8, 8, '2025-07-01', '09:10:00', '17:15:00', 8.08, 'Present', 'Regular hours', 'Pooja Nair', 'Approved'),
(9, 9, '2025-07-01', '08:55:00', '16:55:00', 8.00, 'Present', 'Punctual', 'Vikram Singh', 'Approved'),
(10, 10, '2025-07-01', '10:00:00', '17:00:00', 7.00, 'Late', 'Traffic issue', 'Deepa Reddy', 'Pending'),
(11, 11, '2025-07-01', '09:00:00', '17:00:00', 8.00, 'Present', 'Regular day', 'Sanjay Gupta', 'Approved'),
(12, 12, '2025-07-01', '09:20:00', '17:30:00', 8.17, 'Present', 'Extra 10 min', 'Komal Jain', 'Approved'),
(13, 13, '2025-07-01', '08:45:00', '17:15:00', 8.50, 'Present', 'Good day', 'Manoj Kumar', 'Approved'),
(14, 14, '2025-07-01', NULL, NULL, 0.00, 'Absent', 'Uninformed Leave', 'Nikita Shah', 'Rejected'),
(15, 15, '2025-07-01', '09:00:00', '17:00:00', 8.00, 'Present', 'Normal shift', 'Rajiv Iyer', 'Approved');

-- to display/retrieve table data
SELECT * FROM Attendance;               

-- to remove complete data from table
truncate table Attendance;

-- to delete complete attributes and records 
drop table Attendance;

-- Table 6: Salaries
CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    emp_id INT,
    basic_pay DECIMAL(10,2),
    hra DECIMAL(10,2),
    special_allowance DECIMAL(10,2),
    deductions DECIMAL(10,2),
    bonus DECIMAL(10,2),
    month VARCHAR(15),
    year INT,
    net_salary DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Salaries (salary_id, emp_id, basic_pay, hra, special_allowance, deductions,bonus, month, year, net_salary) 
VALUES
(1, 1, 40000.00, 10000.00, 8000.00, 2000.00, 5000.00, 'June', 2025, 61000.00),
(2, 2, 35000.00, 9000.00, 7000.00, 1500.00, 3000.00, 'June', 2025, 52500.00),
(3, 3, 30000.00, 8000.00, 6000.00, 1000.00, 2500.00, 'June', 2025, 55500.00),
(4, 4, 28000.00, 7500.00, 6500.00, 2000.00, 1000.00, 'June', 2025, 50500.00),
(5, 5, 37000.00, 9500.00, 8500.00, 1800.00, 3200.00, 'June', 2025, 63900.00),
(6, 6, 25000.00, 7000.00, 5000.00, 1000.00, 1200.00, 'June', 2025, 42200.00),
(7, 7, 33000.00, 8500.00, 6000.00, 1100.00, 2800.00, 'June', 2025, 59300.00),
(8, 8, 24000.00, 6800.00, 4800.00, 800.00, 900.00, 'June', 2025, 45600.00),
(9, 9, 31000.00, 8200.00, 6500.00, 1200.00, 1500.00, 'June', 2025, 55500.00),
(10, 10, 27000.00, 7000.00, 5500.00, 900.00, 1100.00, 'June', 2025, 50700.00),
(11, 11, 36000.00, 9200.00, 7700.00, 1600.00, 2800.00, 'June', 2025, 63000.00),
(12, 12, 23000.00, 6400.00, 4500.00, 700.00, 600.00, 'June', 2025, 44800.00),
(13, 13, 34000.00, 8700.00, 7400.00, 1400.00, 2000.00, 'June', 2025, 59700.00),
(14, 14, 15000.00, 4000.00, 3000.00, 200.00, 500.00, 'June', 2025, 27300.00),
(15, 15, 38000.00, 9800.00, 8600.00, 1700.00, 3100.00, 'June', 2025, 61800.00);

-- to display/retrieve table data
SELECT * FROM Salaries;               

-- to remove complete data from table
truncate table Salaries;

-- to delete complete attributes and records 
drop table Salaries;

-- Table 7: Leaves
CREATE TABLE Leaves (
    leave_id INT PRIMARY KEY,
    emp_id INT,
    leave_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    total_days INT,
    reason TEXT,
    status VARCHAR(20),
    applied_on DATE,
    approved_by VARCHAR(100),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Leaves (leave_id, emp_id, leave_type, start_date, end_date,total_days, reason, status, applied_on, approved_by)
 VALUES
(1, 1, 'Sick Leave', '2025-06-10', '2025-06-12', 3, 'Fever and cold', 'Approved', '2025-06-09', 'Ravi Sharma'),
(2, 2, 'Casual Leave', '2025-06-15', '2025-06-16', 2, 'Personal work', 'Approved', '2025-06-14', 'Priya Mehta'),
(3, 3, 'Annual Leave', '2025-05-20', '2025-05-25', 6, 'Family trip', 'Approved', '2025-05-10', 'Anil Kapoor'),
(4, 4, 'Sick Leave', '2025-06-05', '2025-06-07', 3, 'Stomach upset', 'Approved', '2025-06-04', 'Neha Joshi'),
(5, 5, 'Casual Leave', '2025-06-18', '2025-06-18', 1, 'Bank work', 'Approved', '2025-06-17', 'Amit Deshmukh'),
(6, 6, 'Sick Leave', '2025-06-01', '2025-06-03', 3, 'Covid symptoms', 'Approved', '2025-05-31', 'Sneha Patil'),
(7, 7, 'Annual Leave', '2025-07-01', '2025-07-07', 7, 'Vacation', 'Pending', '2025-06-25', 'Rahul Verma'),
(8, 8, 'Casual Leave', '2025-06-22', '2025-06-23', 2, 'House shifting', 'Approved', '2025-06-20', 'Pooja Nair'),
(9, 9, 'Sick Leave', '2025-06-28', '2025-06-30', 3, 'Tooth pain', 'Approved', '2025-06-27', 'Vikram Singh'),
(10, 10, 'Casual Leave', '2025-06-19', '2025-06-19', 1, 'Documents verification', 'Approved', '2025-06-18', 'Deepa Reddy'),
(11, 11, 'Annual Leave', '2025-06-11', '2025-06-15', 5, 'Attending wedding', 'Approved', '2025-06-09', 'Sanjay Gupta'),
(12, 12, 'Casual Leave', '2025-06-08', '2025-06-09', 2, 'Urgent travel', 'Approved', '2025-06-07', 'Komal Jain'),
(13, 13, 'Sick Leave', '2025-06-04', '2025-06-05', 2, 'High fever', 'Approved', '2025-06-03', 'Manoj Kumar'),
(14, 14, 'Casual Leave', '2025-06-26', '2025-06-27', 2, 'Family event', 'Approved', '2025-06-25', 'Nikita Shah'),
(15, 15, 'Annual Leave', '2025-06-15', '2025-06-21', 7, 'Pilgrimage', 'Approved', '2025-06-10', 'Rajiv Iyer');

-- to display/retrieve table data
SELECT * FROM Leaves;               

-- to remove complete data from table
truncate table Leaves;

-- to delete complete attributes and records 
drop table Leaves;

-- Table 8: Assets
CREATE TABLE Assets (
    asset_id INT PRIMARY KEY,
    emp_id INT,
    asset_name VARCHAR(100),
    asset_type VARCHAR(50),
    serial_number VARCHAR(50),
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20),
    remarks TEXT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Assets (asset_id, emp_id, asset_name, asset_type, serial_number,issue_date, return_date, status, remarks)
 VALUES
(1, 1, 'Dell Latitude 5420', 'Laptop', 'DLT5420IND001', '2025-06-01', NULL, 'Issued', 'For development tasks'),
(2, 2, 'iPhone 13', 'Mobile', 'IPHN13IND002', '2025-06-05', NULL, 'Issued', 'Client communication'),
(3, 3, 'HP LaserJet Pro', 'Printer', 'HPLJIND003', '2025-05-20', NULL, 'In Use', 'Department printer'),
(4, 4, 'Jabra Wireless Headset', 'Headset', 'JBRHDIND004', '2025-06-10', NULL, 'Issued', 'For Zoom meetings'),
(5, 5, 'Lenovo ThinkPad E14', 'Laptop', 'LTPDE14IND005', '2025-04-25', NULL, 'Issued', 'Sales demo system'),
(6, 6, 'Samsung Galaxy M14', 'Mobile', 'SMM14IND006', '2025-06-28', NULL, 'Issued', 'Customer support device'),
(7, 7, 'iBall Mouse', 'Mouse', 'IBMSEIND007', '2025-07-01', NULL, 'Issued', 'With desktop system'),
(8, 8, 'Zebronics Keyboard', 'Keyboard', 'ZBKBDIND008', '2025-06-18', NULL, 'Issued', 'Issued with workstation'),
(9, 9, 'Asus VivoBook', 'Laptop', 'ASVVBKIND009', '2025-05-10', NULL, 'Issued', 'Project lead system'),
(10, 10, 'iPad 9th Gen', 'Tablet', 'IPD9GENIND010', '2025-07-04', NULL, 'Issued', 'App testing device'),
(11, 11, 'Canon Scanner', 'Scanner', 'CNSCANIND011', '2025-06-12', NULL, 'In Use', 'Used in HR dept'),
(12, 12, 'TP-Link Router', 'Router', 'TPLINKIND012', '2025-06-22', NULL, 'Issued', 'Remote branch device'),
(13, 13, 'Sony Webcam', 'Webcam', 'SNWCAMIND013', '2025-07-05', NULL, 'Issued', 'Video calls'),
(14, 14, 'SanDisk 64GB', 'Pen Drive', 'SNPDRIND014', '2025-07-06', NULL, 'Issued', 'Data sharing'),
(15, 15, 'HP ProDesk 400', 'Desktop', 'HPDSKIND015', '2025-07-01', NULL, 'Issued', 'New employee workstation');

-- to display/retrieve table data
SELECT * FROM Assets;               

-- to remove complete data from table
truncate table Assets;

-- to delete complete attributes and records 
drop table Assets;

-- Table 9: Training_Programs
CREATE TABLE Training_Programs (
    program_id INT PRIMARY KEY,
    program_name VARCHAR(100),
    dept_id INT,
    trainer_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    duration_days INT,
    mode VARCHAR(30),
    status VARCHAR(20),
    feedback_rating DECIMAL(3,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Training_Programs (program_id, program_name, dept_id, trainer_name, start_date,end_date, duration_days, mode, status, feedback_rating) 
VALUES
(1, 'Advanced Java', 1, 'Rohit Sharma', '2025-06-01', '2025-06-10', 10, 'Online', 'Completed', 4.5),
(2, 'Payroll Management', 2, 'Meera Iyer', '2025-05-15', '2025-05-20', 6, 'Offline', 'Completed', 4.2),
(3, 'Financial Reporting', 3, 'Nikhil Rao', '2025-06-10', '2025-06-18', 9, 'Online', 'Completed', 4.6),
(4, 'Digital Marketing', 4, 'Asha Nair', '2025-07-01', '2025-07-08', 8, 'Offline', 'Ongoing', 4.3),
(5, 'Sales Techniques', 5, 'Anuj Singh', '2025-06-20', '2025-06-25', 6, 'Online', 'Completed', 4.4),
(6, 'Customer Service Excellence', 6, 'Ritika Mehta', '2025-06-05', '2025-06-10', 6, 'Offline', 'Completed', 4.7),
(7, 'Office Administration', 7, 'Rajesh Pillai', '2025-06-15', '2025-06-20', 6, 'Online', 'Completed', 4.1),
(8, 'Legal Documentation', 8, 'Sneha Tiwari', '2025-06-10', '2025-06-12', 3, 'Offline', 'Completed', 4.5),
(9, 'AI for R&D', 9, 'Dr. Ankit Sinha', '2025-07-05', '2025-07-15', 11, 'Online', 'Ongoing', 4.8),
(10, 'Vendor Management', 10, 'Poonam Joshi', '2025-06-01', '2025-06-07', 7, 'Offline', 'Completed', 4.2),
(11, 'Warehouse Safety', 11, 'Vivek Kapoor', '2025-06-22', '2025-06-25', 4, 'Offline', 'Completed', 4.0),
(12, 'Product Quality', 12, 'Kajal Rao', '2025-06-18', '2025-06-22', 5, 'Online', 'Completed', 4.6),
(13, 'UX Design Basics', 13, 'Rhea Shah', '2025-07-01', '2025-07-05', 5, 'Offline', 'Ongoing', 4.4),
(14, 'Production Process', 14, 'Manoj Khanna', '2025-06-10', '2025-06-16', 7, 'Offline', 'Completed', 4.3),
(15, 'Security Awareness', 15, 'Ragini Desai', '2025-06-05', '2025-06-06', 2, 'Online', 'Completed', 4.9);

-- to display/retrieve table data
SELECT * FROM Training_Programs;               

-- to remove complete data from table
truncate table Training_Programs;

-- to delete complete attributes and records 
drop table Training_Programs;

-- Table 10: Vendors
CREATE TABLE Vendors (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    gst_number VARCHAR(20),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Vendors (vendor_id, vendor_name, contact_person, email, phone_number,address, city, state, gst_number, status) 
VALUES
(1, 'TechnoSource Pvt Ltd', 'Amit Shah', 'amit@technosource.in', '9876543210', '101 MG Road', 'Mumbai', 'Maharashtra', '27AABCT1234Q1ZP', 'Active'),
(2, 'OfficeMart India', 'Neha Reddy', 'neha@officemart.in', '9876501234', '5th Avenue, Banjara Hills', 'Hyderabad', 'Telangana', '36BBBCD5678G1ZX', 'Active'),
(3, 'IT World Solutions', 'Kunal Desai', 'kunal@itworld.com', '9876123456', '12 Sector 44', 'Noida', 'Uttar Pradesh', '09AAACI7654H1Z3', 'Active'),
(4, 'SmartEdge Systems', 'Divya Kapoor', 'divya@smartedge.com', '9876234567', 'Green Park', 'Delhi', 'Delhi', '07AABFS3344P1Z8', 'Inactive'),
(5, 'Aarya Stationery', 'Manish Jain', 'manish@aaryastores.com', '9876345678', 'Near Railway Station', 'Ahmedabad', 'Gujarat', '24AACCV7766M1Z1', 'Active'),
(6, 'PrintZone', 'Sneha Iyer', 'sneha@printzone.in', '9876456789', 'Bhosari Industrial Area', 'Pune', 'Maharashtra', '27AADFP3333J1Z2', 'Active'),
(7, 'Bright Tech India', 'Ravi Nair', 'ravi@brighttech.in', '9876567890', 'Outer Ring Road', 'Bengaluru', 'Karnataka', '29AACCB8765T1Z4', 'Inactive'),
(8, 'FurniCrafts', 'Tanya Mehta', 'tanya@furnicrafts.com', '9876678901', 'Sadar Bazaar', 'Nagpur', 'Maharashtra', '27AABCE2222Q1Z5', 'Active'),
(9, 'Global IT Hub', 'Rahul Yadav', 'rahul@globalithub.com', '9876789012', 'DLF Cyber City', 'Gurgaon', 'Haryana', '06AABCT5555R1Z7', 'Active'),
(10, 'DesignXperts', 'Pooja Sinha', 'pooja@designxperts.in', '9876890123', 'Salt Lake Sector V', 'Kolkata', 'West Bengal', '19AACDG4567B1Z6', 'Active'),
(11, 'NetPro Systems', 'Nikhil Verma', 'nikhil@netpro.in', '9876901234', 'Park Street', 'Kolkata', 'West Bengal', '19ABACR3344U1Z1', 'Inactive'),
(12, 'BuildRight Infra', 'Deepak Ghosh', 'deepak@buildright.com', '9876012345', 'Howrah Bridge Road', 'Kolkata', 'West Bengal', '19AADCB9988V1Z3', 'Active'),
(13, 'Ace Developers', 'Komal Sharma', 'komal@acedevelopers.in', '9876123450', 'Jubilee Hills', 'Hyderabad', 'Telangana', '36AAACC1234K1Z6', 'Active'),
(14, 'Syscore Pvt Ltd', 'Vikas Rana', 'vikas@syscore.com', '9876234560', 'Infocity Road', 'Gandhinagar', 'Gujarat', '24ABDFH1111J1Z9', 'Active'),
(15, 'QuickFix Services', 'Riya Deshpande', 'riya@quickfix.in', '9876345670', 'Kothrud Main Road', 'Pune', 'Maharashtra', '27AACDQ3333M1Z0', 'Active');

-- to display/retrieve table data
SELECT * FROM Vendors;               

-- to remove complete data from table
truncate table Vendors;

-- to delete complete attributes and records 
drop table Vendors;

-- Table 11: Meetings
CREATE TABLE Meetings (
    meeting_id INT PRIMARY KEY,
    topic VARCHAR(200),
    dept_id INT,
    organizer VARCHAR(100),
    meeting_date DATE,
    start_time TIME,
    end_time TIME,
    mode VARCHAR(30),
    status VARCHAR(20),
    notes TEXT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Meetings (meeting_id, topic, dept_id, organizer, meeting_date,start_time, end_time, mode, status, notes) 
VALUES
(1, 'Q2 Target Review', 1, 'Ravi Sharma', '2025-07-05', '10:00:00', '11:30:00', 'Offline', 'Completed', 'Discussed Q2 goals'),
(2, 'Salary Policy Update', 2, 'Meera Iyer', '2025-07-03', '14:00:00', '15:00:00', 'Online', 'Completed', 'New salary bands shared'),
(3, 'Budget Allocation', 3, 'Nikhil Rao', '2025-07-04', '11:00:00', '12:30:00', 'Offline', 'Completed', 'Planned Q3 spending'),
(4, 'Marketing Strategy', 4, 'Asha Nair', '2025-07-06', '09:30:00', '10:45:00', 'Online', 'Completed', 'Focused on digital ads'),
(5, 'Sales Funnel Optimization', 5, 'Anuj Singh', '2025-07-02', '16:00:00', '17:00:00', 'Offline', 'Completed', 'Lead conversion improvement'),
(6, 'Customer Feedback', 6, 'Ritika Mehta', '2025-07-01', '11:15:00', '12:15:00', 'Online', 'Completed', 'CSAT scores discussed'),
(7, 'Office Reallocation Plan', 7, 'Rajesh Pillai', '2025-07-07', '15:00:00', '16:00:00', 'Offline', 'Ongoing', 'Desk reshuffling'),
(8, 'Legal Briefing', 8, 'Sneha Tiwari', '2025-07-03', '12:00:00', '13:30:00', 'Offline', 'Completed', 'Policy updates discussed'),
(9, 'R&D Product Testing', 9, 'Dr. Ankit Sinha', '2025-07-04', '10:30:00', '12:00:00', 'Online', 'Completed', 'Prototype results reviewed'),
(10, 'Vendor Contract Review', 10, 'Poonam Joshi', '2025-07-02', '13:00:00', '14:00:00', 'Online', 'Completed', 'Renewal status checked'),
(11, 'Warehouse SOP Review', 11, 'Vivek Kapoor', '2025-07-05', '11:45:00', '12:45:00', 'Offline', 'Completed', 'Updated loading rules'),
(12, 'Product Launch Plan', 12, 'Kajal Rao', '2025-07-06', '09:00:00', '10:00:00', 'Offline', 'Ongoing', 'New SKU planning'),
(13, 'UI/UX Review', 13, 'Rhea Shah', '2025-07-01', '15:15:00', '16:45:00', 'Online', 'Completed', 'Homepage layout update'),
(14, 'Production Bottlenecks', 14, 'Manoj Khanna', '2025-07-04', '14:30:00', '15:30:00', 'Offline', 'Completed', 'Time delay fixes'),
(15, 'Data Privacy Policy', 15, 'Ragini Desai', '2025-07-03', '16:00:00', '17:00:00', 'Online', 'Completed', 'Legal requirements discussed');

-- to display/retrieve table data
SELECT * FROM Meetings;               

-- to remove complete data from table
truncate table Meetings;

-- to delete complete attributes and records 
drop table Meetings;

-- Table 12: Client_Feedback
CREATE TABLE Client_Feedback (
    feedback_id INT PRIMARY KEY,
    project_id INT,
    client_name VARCHAR(100),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    feedback_text TEXT,
    feedback_date DATE,
    submitted_by VARCHAR(100),
    designation VARCHAR(50),
    response_status VARCHAR(30),
    response_date DATE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Insert records into the table
INSERT INTO Client_Feedback (feedback_id, project_id, client_name, rating, feedback_text,feedback_date, submitted_by, designation, response_status, response_date) 
VALUES
(1, 1, 'Tata Motors', 5, 'Excellent UI and performance.', '2025-07-06', 'Amit Rane', 'IT Head', 'Addressed', '2025-07-07'),
(2, 2, 'Infosys', 4, 'Payroll logic works well.', '2025-06-28', 'Meena Iyer', 'HR Manager', 'Addressed', '2025-06-29'),
(3, 3, 'Reliance Retail', 5, 'Great integration with CRM.', '2025-07-04', 'Kunal Bhatt', 'Retail Ops', 'In Progress', NULL),
(4, 4, 'Godrej', 4, 'App is smoother now.', '2025-07-03', 'Sneha Pillai', 'Sales Lead', 'Addressed', '2025-07-04'),
(5, 5, 'Blue Dart', 3, 'Delay in tracking update.', '2025-06-15', 'Rajeev Shetty', 'Logistics Manager', 'Addressed', '2025-06-16'),
(6, 6, 'Mahindra Group', 5, 'HRMS looks more user-friendly.', '2025-06-25', 'Anjali Sinha', 'HR Lead', 'Closed', '2025-06-26'),
(7, 7, 'DMart', 4, 'Some login issues remain.', '2025-07-02', 'Rohit Singh', 'Procurement Head', 'In Progress', NULL),
(8, 8, 'BharatPe', 5, 'AI bot responds well.', '2025-07-06', 'Tanvi Das', 'Tech Lead', 'Pending', NULL),
(9, 9, 'Wipro', 4, 'Compliance checks run fine.', '2025-06-11', 'Puneet Nanda', 'Finance Officer', 'Closed', '2025-06-12'),
(10, 10, 'Flipkart', 5, 'App is live and loved.', '2025-06-01', 'Priya Reddy', 'Customer Care Lead', 'Closed', '2025-06-02'),
(11, 11, 'L&T', 3, 'Tracker UI is confusing.', '2025-07-03', 'Harshita Rao', 'Legal Officer', 'Under Review', NULL),
(12, 12, 'Amazon India', 5, 'Inventory update is smooth.', '2025-07-01', 'Arjun Deshmukh', 'Ops Manager', 'Closed', '2025-07-02'),
(13, 13, 'Asian Paints', 4, 'Slight lag during peak time.', '2025-06-16', 'Geeta Joshi', 'Production Analyst', 'Addressed', '2025-06-17'),
(14, 14, 'Bank of Baroda', 5, 'Security features are solid.', '2025-07-05', 'Manoj Thakur', 'IT Security Head', 'Closed', '2025-07-06'),
(15, 15, 'ICICI Bank', 4, 'UX is clean and efficient.', '2025-07-06', 'Neelam Mehra', 'UX Supervisor', 'In Progress', NULL);

-- to display/retrieve table data
SELECT * FROM Client_Feedback;               

-- to remove complete data from table
truncate table Client_Feedback;

-- to delete complete attributes and records 
drop table Client_Feedback;

-- Table 13: Salary_Payments
CREATE TABLE Salary_Payments (
    payment_id INT PRIMARY KEY,
    emp_id INT,
    payment_date DATE,
    month_year VARCHAR(10),
    basic_salary DECIMAL(10,2),
    hra DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deductions DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Salary_Payments (payment_id, emp_id, payment_date, month_year, basic_salary,hra, bonus, deductions, net_salary, status) 
VALUES
(1, 1, '2025-07-01', 'Jun-2025', 30000, 12000, 2000, 1500, 42500, 'Paid'),
(2, 2, '2025-07-01', 'Jun-2025', 28000, 11000, 1500, 1000, 39500, 'Paid'),
(3, 3, '2025-07-01', 'Jun-2025', 32000, 13000, 1800, 1200, 45800, 'Paid'),
(4, 4, '2025-07-01', 'Jun-2025', 35000, 14000, 2500, 1700, 49800, 'Paid'),
(5, 5, '2025-07-01', 'Jun-2025', 40000, 16000, 3000, 2000, 57000, 'Paid'),
(6, 6, '2025-07-01', 'Jun-2025', 27000, 10000, 1000, 800, 37200, 'Paid'),
(7, 7, '2025-07-01', 'Jun-2025', 26000, 9000, 900, 700, 35200, 'Paid'),
(8, 8, '2025-07-01', 'Jun-2025', 29000, 10500, 1200, 600, 40900, 'Paid'),
(9, 9, '2025-07-01', 'Jun-2025', 31000, 12500, 2000, 1000, 44500, 'Paid'),
(10, 10, '2025-07-01', 'Jun-2025', 33000, 13500, 1500, 1500, 46500, 'Paid'),
(11, 11, '2025-07-01', 'Jun-2025', 24000, 8500, 800, 400, 32700, 'Paid'),
(12, 12, '2025-07-01', 'Jun-2025', 37000, 15000, 1800, 1500, 52300, 'Paid'),
(13, 13, '2025-07-01', 'Jun-2025', 36000, 14500, 2200, 1000, 51700, 'Paid'),
(14, 14, '2025-07-01', 'Jun-2025', 38000, 15500, 2400, 2000, 53900, 'Paid'),
(15, 15, '2025-07-01', 'Jun-2025', 34000, 14000, 2100, 1200, 50900, 'Paid');

-- to display/retrieve table data
SELECT * FROM Salary_Payments;               

-- to remove complete data from table
truncate table Salary_Payments;

-- to delete complete attributes and records 
drop table Salary_Payments;

-- Table 14: Announcements
CREATE TABLE Announcements (
    announcement_id INT PRIMARY KEY,
    title VARCHAR(150),
    message TEXT,
    dept_id INT,
    posted_by VARCHAR(100),
    designation VARCHAR(50),
    post_date DATE,
    valid_until DATE,
    priority_level VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Announcements (announcement_id, title, message, dept_id, posted_by,designation, post_date, valid_until, priority_level, status) 
VALUES
(1, 'Holiday Notice', 'Office will remain closed on 15th Aug for Independence Day.', 1, 'Ravi Sharma', 'HR Manager', '2025-07-01', '2025-08-15', 'High', 'Active'),
(2, 'Appraisal Update', 'Annual performance review to be held in August.', 2, 'Meera Iyer', 'Finance Head', '2025-07-03', '2025-08-31', 'High', 'Active'),
(3, 'Tech Workshop', 'Workshop on AI tools scheduled next week.', 9, 'Dr. Ankit Sinha', 'R&D Head', '2025-07-04', '2025-07-15', 'Medium', 'Active'),
(4, 'Dress Code Reminder', 'Formal dress code is mandatory from Monday to Thursday.', 1, 'Ravi Sharma', 'HR Manager', '2025-07-05', '2025-08-31', 'Low', 'Active'),
(5, 'Client Visit', 'Godrej officials will visit on 10th July.', 5, 'Anuj Singh', 'Sales Manager', '2025-07-06', '2025-07-10', 'High', 'Active'),
(6, 'Data Backup Alert', 'Monthly backup scheduled on 8th July.', 3, 'Nikhil Rao', 'Finance Officer', '2025-07-02', '2025-07-08', 'Medium', 'Active'),
(7, 'Training Invite', 'Sales training open for registration.', 5, 'Anuj Singh', 'Sales Manager', '2025-07-01', '2025-07-09', 'Medium', 'Active'),
(8, 'Policy Update', 'Updated Leave Policy shared via email.', 2, 'Meera Iyer', 'Finance Head', '2025-07-03', '2025-08-01', 'High', 'Active'),
(9, 'Fire Drill', 'Mandatory fire drill on 12th July at 3 PM.', 15, 'Ragini Desai', 'Security Head', '2025-07-05', '2025-07-12', 'High', 'Active'),
(10, 'Vendor Day', 'Annual Vendor Day planned on 20th July.', 10, 'Poonam Joshi', 'Vendor Lead', '2025-07-07', '2025-07-20', 'Medium', 'Active'),
(11, 'App Launch', 'New internal app launching on 18th July.', 13, 'Rhea Shah', 'UX Head', '2025-07-01', '2025-07-18', 'High', 'Active'),
(12, 'Maintenance Notice', 'Server maintenance on 14th July from 10 PM.', 12, 'Kajal Rao', 'Quality Lead', '2025-07-05', '2025-07-14', 'Medium', 'Active'),
(13, 'Workshop Result', 'Best presentation awards will be announced soon.', 9, 'Dr. Ankit Sinha', 'R&D Head', '2025-07-06', '2025-07-20', 'Low', 'Active'),
(14, 'Festival Celebration', 'Ganesh Chaturthi celebration on 6th Sep.', 1, 'Ravi Sharma', 'HR Manager', '2025-07-04', '2025-09-06', 'Medium', 'Upcoming'),
(15, 'Security Upgrade', 'New ID cards will be issued to all staff.', 15, 'Ragini Desai', 'Security Head', '2025-07-01', '2025-07-31', 'High', 'Active');

-- to display/retrieve table data
SELECT * FROM Announcements;               

-- to remove complete data from table
truncate table Announcements;

-- to delete complete attributes and records 
drop table Announcements;

-- Table 15: Employee_Assets
CREATE TABLE Employee_Assets (
    asset_id INT PRIMARY KEY,
    emp_id INT,
    asset_type VARCHAR(50),
    asset_name VARCHAR(100),
    serial_number VARCHAR(100),
    issued_date DATE,
    return_date DATE,
    condition_status VARCHAR(30),
    issued_by VARCHAR(100),
    remarks TEXT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Employee_Assets (asset_id, emp_id, asset_type, asset_name, serial_number,issued_date, return_date, condition_status, issued_by, remarks)
 VALUES
(1, 1, 'Laptop', 'Dell Inspiron', 'SNDEL12345', '2025-06-01', NULL, 'Good', 'Ravi Sharma', 'Assigned for remote work'),
(2, 2, 'Mobile', 'Samsung M14', 'SNMOB9887', '2025-06-05', NULL, 'Good', 'Meera Iyer', 'For official calls'),
(3, 3, 'Laptop', 'HP ProBook', 'SNHP5566', '2025-05-15', NULL, 'Excellent', 'Nikhil Rao', 'Team lead assignment'),
(4, 4, 'Headset', 'Jabra 65', 'SNHS7845', '2025-06-20', NULL, 'Good', 'Asha Nair', 'Online meetings'),
(5, 5, 'Laptop', 'Lenovo ThinkPad', 'SNLEN9921', '2025-04-10', NULL, 'Good', 'Anuj Singh', 'Sales demo device'),
(6, 6, 'Mobile', 'Redmi Note 13', 'SNMOB2234', '2025-06-25', NULL, 'New', 'Ritika Mehta', 'Customer feedback team'),
(7, 7, 'Laptop', 'Acer Aspire', 'SNAC2235', '2025-07-01', NULL, 'Good', 'Rajesh Pillai', 'Field usage'),
(8, 8, 'ID Card', 'Employee ID', 'SNID8766', '2025-06-30', NULL, 'Valid', 'Sneha Tiwari', 'New joiner'),
(9, 9, 'Tablet', 'iPad 9th Gen', 'SNIPD4352', '2025-06-15', NULL, 'Fair', 'Dr. Ankit Sinha', 'For testing app interface'),
(10, 10, 'Mouse', 'Logitech M185', 'SNMOU1235', '2025-07-03', NULL, 'Good', 'Poonam Joshi', 'Issued with laptop'),
(11, 11, 'Keyboard', 'Dell KB216', 'SNKEY8899', '2025-06-10', NULL, 'Good', 'Vivek Kapoor', 'Back-office device'),
(12, 12, 'Laptop', 'Asus VivoBook', 'SNASU3234', '2025-06-20', NULL, 'Good', 'Kajal Rao', 'QA usage'),
(13, 13, 'Pen Drive', 'SanDisk 32GB', 'SNPEN2003', '2025-06-22', NULL, 'Excellent', 'Rhea Shah', 'UX asset transfer'),
(14, 14, 'Laptop', 'MS Surface', 'SNMSS8456', '2025-05-05', NULL, 'Excellent', 'Manoj Khanna', 'Production reports'),
(15, 15, 'Router', 'TP-Link Archer', 'SNWIF4771', '2025-07-05', NULL, 'New', 'Ragini Desai', 'Remote team connectivity');

-- to display/retrieve table data
SELECT * FROM Employee_Assets;               

-- to remove complete data from table
truncate table Employee_Assets;

-- to delete complete attributes and records 
drop table Employee_Assets;



