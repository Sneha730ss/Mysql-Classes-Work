-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
CREATE DATABASE Healthcare_System;

-- To work on it, you need to use it first
USE Healthcare_System;

-- delete database
-- DROP DATABASE Healthcare_System;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : Patients(patient_id, name, age, gender, contact, address)

T2  : Doctors(doctor_id, name, specialty, phone_number, email)

T3  : Appointments(appointment_id, patient_id, doctor_id, date, time, status)

T4  : Medical_History(history_id, patient_id, diagnosis, treatment, notes)

T5  : Medications(medication_id, name, type, price, description)

T6  : Prescriptions(prescription_id, patient_id, medication_id, date_provided, dosage)

T7  : Bills(bill_id, patient_id, total_amount, payment_status, date)

T8  : Staff(staff_id, name, role, contact, shift)

T9  : Departments(department_id, name, location, phone)

T10 : Facilities(facility_id, name, type, cost, availability_status)
*/

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-1 Patients
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age > 0),
    Gender VARCHAR(10),
    Contact VARCHAR(15) UNIQUE,
    Address TEXT NOT NULL
);

-- Insert 10 records into Patients table
INSERT INTO Patients VALUES
(1, 'Anjali Sharma', 32, 'Female', '9876543210', 'Delhi'),
(2, 'Rajesh Kumar', 45, 'Male', '9876543211', 'Mumbai'),
(3, 'Sneha Patil', 28, 'Female', '9876543212', 'Pune'),
(4, 'Amit Verma', 35, 'Male', '9876543213', 'Lucknow'),
(5, 'Pooja Nair', 40, 'Female', '9876543214', 'Kochi'),
(6, 'Rahul Yadav', 30, 'Male', '9876543215', 'Kanpur'),
(7, 'Meena Reddy', 26, 'Female', '9876543216', 'Hyderabad'),
(8, 'Suresh Das', 55, 'Male', '9876543217', 'Kolkata'),
(9, 'Kiran Joshi', 38, 'Male', '9876543218', 'Ahmedabad'),
(10, 'Priya Iyer', 29, 'Female', '9876543219', 'Chennai');

-- to display/retrieve table data
SELECT * FROM Patients;               

-- to remove complete data from table
truncate table Patients;

-- to delete complete attributes and records 
drop table Patients;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-2 Doctors
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Specialty VARCHAR(50),
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE
);

-- Insert 10 records into Doctors table
INSERT INTO Doctors VALUES
(1, 'Dr. Ramesh Iyer', 'Cardiology', '9998800011', 'ramesh.iyer@hospital.in'),
(2, 'Dr. Neha Gupta', 'Dermatology', '9998800012', 'neha.gupta@hospital.in'),
(3, 'Dr. Arvind Sharma', 'Orthopedics', '9998800013', 'arvind.sharma@hospital.in'),
(4, 'Dr. Pooja Reddy', 'Gynecology', '9998800014', 'pooja.reddy@hospital.in'),
(5, 'Dr. Imran Khan', 'Neurology', '9998800015', 'imran.khan@hospital.in'),
(6, 'Dr. Swati Deshmukh', 'Pediatrics', '9998800016', 'swati.deshmukh@hospital.in'),
(7, 'Dr. Manoj Sinha', 'ENT', '9998800017', 'manoj.sinha@hospital.in'),
(8, 'Dr. Anjali Menon', 'General Medicine', '9998800018', 'anjali.menon@hospital.in'),
(9, 'Dr. Vivek Dubey', 'Psychiatry', '9998800019', 'vivek.dubey@hospital.in'),
(10, 'Dr. Kavita Joshi', 'Ophthalmology', '9998800020', 'kavita.joshi@hospital.in');

-- to display/retrieve table data
SELECT * FROM Doctors;               

-- to remove complete data from table
truncate table Doctors;

-- to delete complete attributes and records 
drop table Doctors;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-3 Appointments
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- Insert 10 records into Appointments table
INSERT INTO Appointments VALUES
(1, 1, 1, '2025-07-22', '10:00:00', 'Scheduled'),
(2, 2, 2, '2025-07-23', '11:00:00', 'Completed'),
(3, 3, 3, '2025-07-24', '09:30:00', 'Scheduled'),
(4, 4, 4, '2025-07-25', '14:00:00', 'Cancelled'),
(5, 5, 5, '2025-07-26', '12:00:00', 'Scheduled'),
(6, 6, 6, '2025-07-27', '10:30:00', 'Completed'),
(7, 7, 7, '2025-07-28', '15:00:00', 'Scheduled'),
(8, 8, 8, '2025-07-29', '13:00:00', 'Completed'),
(9, 9, 9, '2025-07-30', '16:00:00', 'Scheduled'),
(10, 10, 10, '2025-07-31', '11:30:00', 'Scheduled');

-- to display/retrieve table data
SELECT * FROM Appointments;               

-- to remove complete data from table
truncate table Appointments;

-- to delete complete attributes and records 
drop table Appointments;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-4 Medical_history
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Medical_History (
    History_ID INT PRIMARY KEY,
    Patient_ID INT,
    Diagnosis TEXT,
    Treatment TEXT,
    Notes TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Insert 10 records into Medical_History table
INSERT INTO Medical_History VALUES
(1, 1, 'Hypertension', 'Medication and lifestyle changes', 'Patient advised low-sodium diet.'),
(2, 2, 'Diabetes Type 2', 'Metformin prescribed', 'Follow-up after 1 month.'),
(3, 3, 'Migraine', 'Pain relievers and rest', 'Stress reduction recommended.'),
(4, 4, 'PCOD', 'Hormonal therapy', 'Ultrasound reviewed.'),
(5, 5, 'Thyroid Disorder', 'Thyroxine tablets', 'Regular monitoring needed.'),
(6, 6, 'Asthma', 'Inhaler prescribed', 'Avoid dusty environments.'),
(7, 7, 'Anemia', 'Iron supplements', 'Dietary plan shared.'),
(8, 8, 'Arthritis', 'Painkillers and physiotherapy', 'Movement exercises advised.'),
(9, 9, 'Depression', 'Counseling and medication', 'Weekly sessions scheduled.'),
(10, 10, 'Eye Infection', 'Antibiotic drops', 'Avoid touching eyes with hands.');

-- to display/retrieve table data
SELECT * FROM Medical_History;               

-- to remove complete data from table
truncate table Medical_History;

-- to delete complete attributes and records 
drop table Medical_History;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-5 Medications
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Medications (
    Medication_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Type VARCHAR(50),
    Price DECIMAL(10,2),
    Description TEXT
);

-- Insert 10 records into Medications table
INSERT INTO Medications VALUES
(1, 'Crocin', 'Tablet', 15.00, 'Used for fever and mild pain relief'),
(2, 'Metformin', 'Tablet', 25.50, 'Used to control blood sugar in type 2 diabetes'),
(3, 'Azee 500', 'Antibiotic', 75.00, 'Azithromycin used to treat bacterial infections'),
(4, 'Thyronorm', 'Tablet', 40.00, 'Used for thyroid hormone replacement'),
(5, 'Montair LC', 'Tablet', 90.00, 'Anti-allergic for sneezing and runny nose'),
(6, 'Asthalin Inhaler', 'Inhaler', 120.00, 'Relieves asthma symptoms'),
(7, 'Liv 52', 'Syrup', 95.00, 'Supports liver health'),
(8, 'Zandu Balm', 'Ointment', 30.00, 'Pain relief balm for headaches and muscle pain'),
(9, 'Soframycin', 'Cream', 50.00, 'Topical antibiotic for wounds and burns'),
(10, 'Dolo 650', 'Tablet', 20.00, 'Pain reliever and fever reducer');

-- to display/retrieve table data
SELECT * FROM Medications;               

-- to remove complete data from table
truncate table Medications;

-- to delete complete attributes and records 
drop table Medications;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-6 Prescriptions
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Prescriptions (
    Prescription_ID INT PRIMARY KEY,
    Patient_ID INT,
    Medication_ID INT,
    Date_Provided DATE,
    Dosage VARCHAR(100),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Medication_ID) REFERENCES Medications(Medication_ID)
);

-- Insert 10 records into Prescriptions table
INSERT INTO Prescriptions VALUES
(1, 1, 1, '2025-07-20', '1 tablet twice a day after meals'),
(2, 2, 2, '2025-07-18', '1 tablet before breakfast daily'),
(3, 3, 3, '2025-07-19', '1 tablet once daily for 3 days'),
(4, 4, 4, '2025-07-17', '1 tablet every morning on empty stomach'),
(5, 5, 5, '2025-07-16', '1 tablet at night after food'),
(6, 6, 6, '2025-07-15', '2 puffs twice daily'),
(7, 7, 7, '2025-07-14', '2 teaspoons twice a day'),
(8, 8, 8, '2025-07-13', 'Apply to affected area twice daily'),
(9, 9, 9, '2025-07-12', 'Apply on wounds 3 times a day'),
(10, 10, 10, '2025-07-11', '1 tablet every 6 hours if fever persists');

-- to display/retrieve table data
SELECT * FROM Prescriptions;               

-- to remove complete data from table
truncate table Prescriptions;

-- to delete complete attributes and records 
drop table Prescriptions;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-7 Bills
-- --------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT,
    Total_Amount DECIMAL(10,2),
    Payment_Status VARCHAR(20),
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Insert 10 records into Bills table
INSERT INTO Bills VALUES
(1, 1, 750.00, 'Paid', '2025-07-20'),
(2, 2, 1200.00, 'Unpaid', '2025-07-18'),
(3, 3, 900.00, 'Paid', '2025-07-19'),
(4, 4, 1500.00, 'Paid', '2025-07-17'),
(5, 5, 1100.00, 'Unpaid', '2025-07-16'),
(6, 6, 650.00, 'Paid', '2025-07-15'),
(7, 7, 1300.00, 'Unpaid', '2025-07-14'),
(8, 8, 850.00, 'Paid', '2025-07-13'),
(9, 9, 2000.00, 'Unpaid', '2025-07-12'),
(10, 10, 500.00, 'Paid', '2025-07-11');

-- to display/retrieve table data
SELECT * FROM Bills;               

-- to remove complete data from table
truncate table Bills;

-- to delete complete attributes and records 
drop table Bills;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-8 Staff
-- --------------------------------------------------------------------------------------------------------------------------
create table staff (
    staff_id int primary key,
    name varchar(100) not null,
    role varchar(100) not null,
    contact varchar(15),
    shift enum('Morning', 'Evening', 'Night')
);

-- Insert 10 records into Staff table
INSERT INTO Staff VALUES
(1, 'Sunita Sharma', 'Nurse', '9123456780', 'Morning'),
(2, 'Ravi Yadav', 'Receptionist', '9123456781', 'Evening'),
(3, 'Meena Joshi', 'Pharmacist', '9123456782', 'Morning'),
(4, 'Amit Verma', 'Ward Boy', '9123456783', 'Night'),
(5, 'Poonam Rani', 'Cleaner', '9123456784', 'Evening'),
(6, 'Suresh Das', 'Security Guard', '9123456785', 'Night'),
(7, 'Anita Nair', 'Lab Technician', '9123456786', 'Morning'),
(8, 'Vinod Kumar', 'Cashier', '9123456787', 'Evening'),
(9, 'Komal Reddy', 'Receptionist', '9123456788', 'Morning'),
(10, 'Manoj Sen', 'Electrician', '9123456789', 'Night');

-- to display/retrieve table data
SELECT * FROM Staff;               

-- to remove complete data from table
truncate table Staff;

-- to delete complete attributes and records 
drop table Staff;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-9 Departments
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Location VARCHAR(100),
    Phone VARCHAR(15)
);

-- Insert 10 records into Departments table
INSERT INTO Departments VALUES
(1, 'Cardiology', 'Block A, 1st Floor', '9111111111'),
(2, 'Neurology', 'Block B, 2nd Floor', '9111111112'),
(3, 'Orthopedics', 'Block A, Ground Floor', '9111111113'),
(4, 'Gynecology', 'Block C, 1st Floor', '9111111114'),
(5, 'Pediatrics', 'Block D, 2nd Floor', '9111111115'),
(6, 'ENT', 'Block B, Ground Floor', '9111111116'),
(7, 'Dermatology', 'Block C, 2nd Floor', '9111111117'),
(8, 'Psychiatry', 'Block E, 1st Floor', '9111111118'),
(9, 'General Medicine', 'Block A, 2nd Floor', '9111111119'),
(10, 'Ophthalmology', 'Block F, Ground Floor', '9111111120');

-- to display/retrieve table data
SELECT * FROM Departments;               

-- to remove complete data from table
truncate table Departments;

-- to delete complete attributes and records 
drop table Departments;

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-10 Facilities
-- --------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Facilities (
    Facility_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Type VARCHAR(50),
    Cost DECIMAL(10,2),
    Availability_Status VARCHAR(20)
);

-- Insert 10 records into Facilities table
INSERT INTO Facilities VALUES
(1, 'ICU', 'Emergency', 5000.00, 'Available'),
(2, 'X-Ray', 'Diagnostic', 800.00, 'Available'),
(3, 'MRI Scan', 'Diagnostic', 4500.00, 'Unavailable'),
(4, 'CT Scan', 'Diagnostic', 4000.00, 'Available'),
(5, 'Operation Theatre', 'Surgical', 7000.00, 'Available'),
(6, 'Ambulance', 'Transport', 1500.00, 'Unavailable'),
(7, 'Pathology Lab', 'Diagnostic', 1200.00, 'Available'),
(8, 'Pharmacy', 'Medical Supply', 0.00, 'Available'),
(9, 'Dialysis Unit', 'Treatment', 3500.00, 'Available'),
(10, 'Blood Bank', 'Emergency', 1000.00, 'Available');

-- to display/retrieve table data
SELECT * FROM Facilities;               

-- to remove complete data from table
truncate table Facilities;

-- to delete complete attributes and records 
drop table Facilities;

-- --------------------------------------------------------------------------------------------------------------------------
--  QUERIES :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. SELECT Queries
-- ------------------------------------------------------
-- a. Select all patients above age 40
SELECT * FROM Patients WHERE Age > 40;

-- b. Select doctors who are specialists in 'Cardiology'
SELECT * FROM Doctors WHERE Specialty = 'Cardiology';

-- c. Select appointments that are scheduled today
SELECT * FROM Appointments WHERE Date = CURDATE();

-- d. Select medications that cost more than ₹50
SELECT * FROM Medications WHERE Price > 50;

-- e. Select staff working the Night shift
SELECT * FROM Staff WHERE Shift = 'Night';

-- f. Select medical history where diagnosis includes 'Diabetes'
SELECT * FROM Medical_History WHERE Diagnosis LIKE '%Diabetes%';

-- g. Select prescriptions given in July 2025
SELECT * FROM Prescriptions WHERE MONTH(Date_Provided) = 7 AND YEAR(Date_Provided) = 2025;

-- h. Select bills with payment status as 'Unpaid'
SELECT * FROM Bills WHERE Payment_Status = 'Unpaid';

-- i. Select departments located in 'Mumbai'
SELECT * FROM Departments WHERE Location = 'Mumbai';

-- j. Select available facilities costing less than ₹500
SELECT * FROM Facilities WHERE Availability_Status = 'Available' AND Cost < 500;

-- ------------------------------------------------------
-- 2. RENAME Queries
-- ------------------------------------------------------

-- 1. Rename table 'Patients' to 'Patient_Records'
RENAME TABLE Patients TO Patient_Records;

-- 2. Rename table 'Doctors' to 'Doctor_Info'
RENAME TABLE Doctors TO Doctor_Info;

-- 3. Rename column 'Name' to 'Full_Name' in Doctor_Info table
ALTER TABLE Doctor_Info CHANGE Name Full_Name VARCHAR(50);

-- 4. Rename column 'Gender' to 'Sex' in Patient_Records table
ALTER TABLE Patient_Records CHANGE Gender Sex VARCHAR(10);

-- 5. Rename table 'Appointments' to 'Patient_Appointments'
RENAME TABLE Appointments TO Patient_Appointments;

-- 6. Rename column 'Status' to 'Appointment_Status' in Patient_Appointments
ALTER TABLE Patient_Appointments CHANGE Status Appointment_Status VARCHAR(20);

-- 7. Rename table 'Bills' to 'Billing_Details'
RENAME TABLE Bills TO Billing_Details;

-- 8. Rename column 'Total_Amount' to 'Amount' in Billing_Details
ALTER TABLE Billing_Details CHANGE Total_Amount Amount DECIMAL(10,2);

-- 9. Rename table 'Staff' to 'Hospital_Staff'
RENAME TABLE Staff TO Hospital_Staff;

-- 10. Rename column 'Role' to 'Position' in Hospital_Staff
ALTER TABLE Hospital_Staff CHANGE Role Position VARCHAR(100);

-- ------------------------------------------------------
-- 3. UPDATE Queries
-- ------------------------------------------------------
-- 1. Update patient contact info
UPDATE Patient_Records SET Contact = '9876543210' WHERE Patient_ID = 1;

-- 2. Update a doctor's specialty
UPDATE Doctor_Info SET Specialty = 'Neurology' WHERE Doctor_ID = 3;

-- 3. Update appointment status to 'Completed'
UPDATE Patient_Appointments SET Appointment_Status = 'Completed' WHERE Appointment_ID = 5;

-- 4. Update a medication price
UPDATE Medications SET Price = 850.00 WHERE Medication_ID = 2;

-- 5. Update billing status to 'Paid'
UPDATE Billing_Details SET Payment_Status = 'Paid' WHERE Bill_ID = 4;

-- 6. Update staff shift to 'Evening'
UPDATE Hospital_Staff SET Shift = 'Evening' WHERE Staff_ID = 7;

-- 7. Update a department's phone number
UPDATE Departments SET Phone = '0221234567' WHERE Department_ID = 2;

-- 8. Update facility availability to 'Unavailable'
UPDATE Facilities SET Availability_Status = 'Unavailable' WHERE Facility_ID = 6;

-- 9. Update prescription dosage
UPDATE Prescriptions SET Dosage = '1 tablet twice daily after food' WHERE Prescription_ID = 3;

-- 10. Update a medical history diagnosis note
UPDATE Medical_History SET Notes = 'Patient recovering well' WHERE History_ID = 9;

/*
What is SQL_SAFE_UPDATES?
In MySQL, SQL_SAFE_UPDATES prevents UPDATE or DELETE statements that don't use a WHERE clause or a LIMIT clause, 
reducing the risk of accidental mass data modification.
*/
-- Enable SQL_SAFE_UPDATES
set sql_safe_updates = 0;
set sql_safe_updates = 1;

-- ------------------------------------------------------
-- 4. ALTER Queries
-- ------------------------------------------------------
-- 1. Add a column 'Blood_Group' to Patient_Records
ALTER TABLE Patient_Records
ADD Blood_Group VARCHAR(5);

-- 2. Modify column 'Full_Name' in Doctor_Info to allow longer names
ALTER TABLE Doctor_Info
MODIFY Full_Name VARCHAR(100);

-- 3. Add a column 'Emergency_Service' to Facilities
ALTER TABLE Facilities
ADD Emergency_Service BOOLEAN DEFAULT FALSE;

-- 4. Add a new column 'Room_Number' to Patient_Appointments
ALTER TABLE Patient_Appointments
ADD Room_Number INT;

-- 5. Modify column 'Appointment_Status' to have a default value 'Pending'
ALTER TABLE Patient_Appointments
ALTER COLUMN Appointment_Status SET DEFAULT 'Pending';

-- 6. Add a column 'Discount' to Billing_Details
ALTER TABLE Billing_Details
ADD Discount DECIMAL(10,2) DEFAULT 0.00;

-- 7. Rename column 'Phone' to 'Contact_Number' in Departments
ALTER TABLE Departments
RENAME COLUMN Phone TO Contact_Number;

-- 8. Modify 'Shift' column in Hospital_Staff to increase size
ALTER TABLE Hospital_Staff
MODIFY Shift ENUM('Morning', 'Evening', 'Night', 'Flexible');

-- 9. Add a column 'Email' to Hospital_Staff
ALTER TABLE Hospital_Staff
ADD Email VARCHAR(100) UNIQUE;

-- 10. Add a new column 'Opening_Hours' to Departments
ALTER TABLE Departments
ADD Opening_Hours VARCHAR(50);

-- ------------------------------------------------------
-- 5. DELETE Queries
-- ------------------------------------------------------

-- 1. Delete doctor_info whose email is 'anil.rana@hospital.in'
DELETE FROM Doctor_info
WHERE Email = 'anil.rana@hospital.in';

-- 2. Delete all appointments scheduled before '2024-01-01'
DELETE FROM Patient_Appointments
WHERE Date < '2024-01-01';

-- 3. Delete department named 'Dermatology'
DELETE FROM Departments
WHERE Name = 'Dermatology';

-- 4. Delete facilities where type is 'Parking'
DELETE FROM Facilities
WHERE Type = 'Parking';

-- 5. Delete prescriptions issued before '2023-06-01'
DELETE FROM Prescriptions
WHERE Date_Provided < '2023-06-01';

-- 15. Delete billing record for patient with ID = 4
DELETE FROM Billing_Details
WHERE Patient_ID = 4;

-- 7. Delete all departments located at 'Block C'
DELETE FROM Departments
WHERE Location = 'Block C';

-- 8. Delete patient record where name is 'Kavita Desai'
DELETE FROM Patient_records
WHERE Name = 'Kavita Desai';

-- 9. Delete prescriptions with dosage '1 tablet daily'
DELETE FROM Prescriptions
WHERE Dosage = '1 tablet daily';

-- 10. Delete facility records where availability is marked as 'Unavailable'
DELETE FROM Facilities
WHERE Availability_Status = 'Unavailable';

-- --------------------------------------------------------------------------------------------------------------------------
-- BUILT-IN FUNCTIONS :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. STRING Functions
-- ------------------------------------------------------
-- 1. UPPER(): Convert patient name to uppercase
SELECT UPPER(Name) AS UpperName FROM Patient_Records;

-- 2. LOWER(): Convert doctor name to lowercase
SELECT LOWER(Full_Name) AS LowerName FROM Doctor_Info;

-- 3. LENGTH(): Find length of department names
SELECT Name, LENGTH(Name) AS NameLength FROM Departments;

-- 4. CONCAT(): Combine first and last name (assuming full name is stored)
SELECT CONCAT('Dr. ', Full_Name) AS FullName FROM Doctor_Info;

-- 5. SUBSTRING(): Get first 5 characters of facility name
SELECT SUBSTRING(Name, 1, 5) AS ShortName FROM Facilities;

-- ------------------------------------------------------
-- 2. NUMERIC Functions
-- ------------------------------------------------------
-- 1. Add ₹100 consultation fee to all Billing_Details
SELECT Bill_ID, Amount, Amount + 100 AS Updated_Amount FROM Billing_Details;

-- 2. Calculate discounted price (10%) on medications
SELECT Name, Price, Price - (Price * 0.10) AS Discounted_Price FROM Medications;

-- 3. Multiply medication price by 2 to show price for 2 doses
SELECT Name, Price, Price * 2 AS Price_For_2_Doses FROM Medications;

-- 4. Divide bill amount into 2 installments
SELECT Bill_ID, Amount, Amount / 2 AS Half_Installment FROM Billing_Details;

-- 5. Show remainder when age is divided by 5
SELECT Name, Age, Age % 5 AS Remainder FROM Patient_Records;

-- ------------------------------------------------------
-- 3. DATE & TIME Functions
-- ------------------------------------------------------
-- 1. CURRENT_DATE: Show current date along with patient names
SELECT Name, CURRENT_DATE AS Today_Date FROM Patient_Records;

-- 2. DATEDIFF: Find how many days have passed since a patient’s last appointment
SELECT Appointment_ID, Patient_ID, Date, DATEDIFF(CURRENT_DATE, Date) AS Days_Since_Appointment FROM Patient_Appointments;

-- 3. MONTH(): Get the month of prescription issue
SELECT Prescription_ID, Date_Provided, MONTH(Date_Provided) AS Issue_Month FROM Prescriptions;

-- 4. YEAR(): Extract year from bill date
SELECT Bill_ID, Date, YEAR(Date) AS Billing_Year FROM Billing_Details;

-- 5. TIME_FORMAT(): Format appointment time in 12-hour format
SELECT Appointment_ID, TIME_FORMAT(Time, '%h:%i %p') AS Formatted_Time FROM Patient_Appointments;

-- ------------------------------------------------------
-- 4. Aggregate Functions with GROUP-BY
-- ------------------------------------------------------
-- 1. Count number of appointments per doctor
SELECT Doctor_ID, COUNT(*) AS Total_Appointments
FROM Patient_Appointments
GROUP BY Doctor_ID;

-- 2. Total number of prescriptions given per medication
SELECT Medication_ID, COUNT(*) AS Total_Prescriptions
FROM Prescriptions
GROUP BY Medication_ID;

-- 3. Average medication price by type
SELECT Type, AVG(Price) AS Avg_Price
FROM Medications
GROUP BY Type;

-- 4. Count of patients by gender
SELECT sex, COUNT(*) AS Number_Of_Patients
FROM Patient_Records
GROUP BY sex;

-- 5. Maximum bill paid per payment status
SELECT Payment_Status, MAX(Amount) AS Max_Bill
FROM Billing_Details
GROUP BY Payment_Status;

-- ------------------------------------------------------
-- 5. CONDITIONAL Functions (IF & CASE)
-- ------------------------------------------------------
-- 1. IF: Check if patient is above 60, mark as 'Senior'
SELECT Name, Age, IF(Age > 60, 'Senior', 'Adult') AS Age_Group
FROM Patient_Records;

-- 2. CASE: Categorize bill payment status
SELECT Bill_ID, Amount, 
  CASE 
    WHEN Payment_Status = 'Paid' THEN 'Cleared'
    WHEN Payment_Status = 'Pending' THEN 'Due'
    ELSE 'Unknown'
  END AS Payment_Stage
FROM Billing_Details;

-- 3. CASE: Show doctor type based on specialty
SELECT Full_Name, Specialty,
  CASE 
    WHEN Specialty = 'Cardiology' THEN 'Heart Specialist'
    WHEN Specialty = 'Pediatrics' THEN 'Child Specialist'
    ELSE 'General Doctor'
  END AS Doctor_Type
FROM Doctor_Info;

-- 4. IF: Check if medication is costly (above ₹500)
SELECT Name, Price, IF(Price > 500, 'Costly', 'Affordable') AS Price_Tag
FROM Medications;

-- 5. CASE: Show appointment status message
SELECT Appointment_ID, Appointment_Status,
  CASE 
    WHEN Appointment_Status = 'Scheduled' THEN 'Upcoming'
    WHEN Appointment_Status = 'Completed' THEN 'Done'
    WHEN Appointment_Status = 'Cancelled' THEN 'Removed'
    ELSE 'Unknown'
  END AS Status_Description
FROM Patient_Appointments;

-- --------------------------------------------------------------------------------------------------------------------------
-- OPERATORS & ALIAS Concepts :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. COMPARISON Operators
-- ------------------------------------------------------
-- 1. Patients older than 50
SELECT * FROM Patient_Records
WHERE Age > 50;

-- 2. Medications priced less than or equal to ₹300
SELECT * FROM Medications
WHERE Price <= 300;

-- 3. Bills not paid (status not equal to 'Paid')
SELECT * FROM Billing_Details
WHERE Payment_Status != 'Paid';

-- 4. Doctors with specialty 'Dermatology'
SELECT * FROM Doctor_Info
WHERE Specialty = 'Dermatology';

-- 5. Appointments scheduled after 2025-07-15
SELECT * FROM Patient_Appointments
WHERE Date > '2025-07-15';

-- ------------------------------------------------------
-- 2. LOGICAL Operators
-- ------------------------------------------------------
-- 1. Patients above 40 AND living in 'Delhi'
SELECT * FROM Patient_Records WHERE Age > 40 AND Address LIKE '%Delhi%';

-- 2. Doctors in 'Cardiology' OR 'Neurology'
SELECT * FROM Doctor_Info WHERE Specialty = 'Cardiology' OR Specialty = 'Neurology';

-- 3. NOT: List medications that are NOT of type 'Tablet'
SELECT * FROM Medications WHERE NOT Type = 'Tablet';

-- 4. Appointments with date after '2025-07-15' AND status 'Scheduled'
SELECT * FROM Patient_Appointments WHERE Date > '2025-07-15' AND Appointment_Status = 'Scheduled';

-- 5. Bills where amount > 1000 OR payment not done
SELECT * FROM Billing_Details
WHERE Amount > 1000 OR Payment_Status != 'Paid';

-- ------------------------------------------------------
-- 3. ARITHMETIC Operators
-- ------------------------------------------------------
-- 1. Increase medication price by 10%
SELECT Name, Price, Price * 1.10 AS New_Price
FROM Medications;

-- 2. Show bill with discount of ₹100
SELECT Bill_ID, Amount, Amount - 100 AS Discounted_Amount
FROM Billing_Details;

-- 3. Calculate daily dosage (e.g., total dosage per 3 days)
SELECT Prescription_ID, Dosage, '500mg' AS Total_3_Day_Dose
FROM Prescriptions;

-- 4. Convert bill amount into 3 EMI installments
SELECT Bill_ID, Amount, Amount / 3 AS EMI_Installment
FROM Billing_Details;

-- 5. Check if Patient_ID is even or odd using modulo
SELECT Patient_ID, Name,
  CASE 
    WHEN Patient_ID % 2 = 0 THEN 'Even ID'
    ELSE 'Odd ID'
  END AS ID_Type
FROM Patient_Records;

-- ------------------------------------------------------
-- 4. STRING Operators
-- ------------------------------------------------------
-- 1. Patients whose name starts with 'A'
SELECT * FROM Patient_Records WHERE Name LIKE 'A%';

-- 2. Doctors whose email ends with 'gmail.com'
SELECT * FROM Doctor_Info WHERE Email LIKE '%gmail.com';

-- 3. Facilities where name contains 'Scan'
SELECT * FROM Facilities WHERE Name LIKE '%Scan%';

-- 4. Medications whose type starts with 'Cap'
SELECT * FROM Medications WHERE Type LIKE 'Cap%';

-- 5. Staff whose name has exactly 5 letters
SELECT * FROM Hospital_Staff WHERE Name LIKE '_____';

-- ------------------------------------------------------
-- 5. ALIAS USAGE
-- ------------------------------------------------------
-- 1. Show patient names with alias
SELECT Name AS Patient_Name, Age
FROM Patient_Records;

-- 2. Doctor's name and specialty with alias
SELECT Full_Name AS Doctor_Name, Specialty AS Field
FROM Doctor_Info;

-- 3. Bill amount with alias for final bill
SELECT Amount AS Bill_Amount, Payment_Status AS Status
FROM Billing_Details;

-- 4. Show medication price with alias as 'MRP'
SELECT Name, Price AS MRP
FROM Medications;

-- 5. Facility name and cost with alias
SELECT Name AS Facility_Name, Cost AS Charges
FROM Facilities;
-- --------------------------------------------------------------------------------------------------------------------------
-- REAL-WORLD USE CASES:
-- --------------------------------------------------------------------------------------------------------------------------
/*
1. Patient Registration & Records:
          --> The system helps in registering new patients, storing their personal details, and maintaining their full medical history. 
          This helps doctors understand the patient’s past treatment and make better decisions.

2. Appointment Scheduling:
          --> Patients can schedule appointments with available doctors at their convenience. The hospital can also avoid overlapping appointments.

3. Doctor Availability & Department Info:
          --> Doctors are listed with their specialties and department details. Patients can choose the right doctor based on their medical need.

4. Medical History Tracking:
          --> All previous diagnoses, treatments, and prescribed medicines are stored in the medical history table. 
         This helps in treating chronic patients more effectively.

5. Billing Management:
          --> The system auto-generates bills after treatment and keeps track of payment status. It ensures accurate billing and avoids manual errors.

6. Facility Management:
          --> Hospitals can manage rooms, equipment, labs, and test services. Availability and cost of facilities can be tracked and updated.

7. Medication Records:
          --> A separate medication table helps in managing drug availability, price, and descriptions for accurate prescriptions.

8. Staff Shift Management:
          --> Staff members are assigned shifts, which help hospitals run smoothly throughout the day and night.
*/
-- --------------------------------------------------------------------------------------------------------------------------
-- REAL-LIFE ANALYSIS QUERIES :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. List patient names and their appointment dates with doctor names
SELECT P.Name AS Patient, A.Date, D.Full_Name AS Doctor
FROM Patient_Records P
JOIN Patient_Appointments A ON P.Patient_ID = A.Patient_ID
JOIN Doctor_Info D ON A.Doctor_ID = D.Doctor_ID
ORDER BY A.Date;

-- 2. Find billing details of patients who haven’t paid yet
SELECT B.Bill_ID, P.Name, B.Amount, B.Payment_Status
FROM Billing_Details B
JOIN Patient_Records P ON B.Patient_ID = P.Patient_ID
WHERE B.Payment_Status = 'Unpaid';

-- 3. Show all appointments for Dr. Neha Sharma ordered by time
SELECT A.Appointment_ID, P.Name AS Patient, A.Date, A.Time
FROM Patient_Appointments A
JOIN Doctor_Info D ON A.Doctor_ID = D.Doctor_ID
JOIN Patient_Records P ON A.Patient_ID = P.Patient_ID
WHERE D.Full_Name = 'Dr. Neha Sharma'
ORDER BY A.Date, A.Time;

-- 4. List all medications prescribed to patient 'Ravi Kumar'
SELECT M.Name AS Medication, PR.Date_Provided, PR.Dosage
FROM Prescriptions PR
JOIN Medications M ON PR.Medication_ID = M.Medication_ID
JOIN Patient_Records P ON PR.Patient_ID = P.Patient_ID
WHERE P.Name = 'Ravi Kumar';

-- 5. Show departments and number of doctors in each
SELECT Dept.Name, COUNT(D.Doctor_ID) AS Total_Doctors
FROM Departments Dept
JOIN Doctor_Info D ON D.Department_id = Dept.Department_id
GROUP BY Dept.Name;

-- 6. List all staff working night shifts
SELECT Name FROM Hospital_Staff
WHERE Shift = 'Night';

-- 7. Show total billing amount per patient
SELECT P.Name, SUM(B.Amount) AS Total_Billed
FROM Billing_Details B
JOIN Patient_Records P ON B.Patient_ID = P.Patient_ID
GROUP BY P.Name;

-- 8. Retrieve all available facilities under 2000 cost
SELECT Name, Type, Cost FROM Facilities
WHERE Availability_Status = 'Available' AND Cost < 2000
ORDER BY Cost;

-- 9. Show patients with more than 2 medical history records
SELECT P.Name, COUNT(MH.History_ID) AS Records
FROM Medical_History MH
JOIN Patient_Records P ON MH.Patient_ID = P.Patient_ID
GROUP BY P.Name
HAVING COUNT(MH.History_ID) > 2;

-- 10: Get the list of all upcoming appointments with doctor and patient names, ordered by date
SELECT 
    a.Appointment_ID,
    p.Name AS Patient_Name,
    d.Full_Name AS Doctor_Name,
    a.Date,
    a.Time
FROM Patient_Appointments a
JOIN Patient_Records p ON a.Patient_ID = p.Patient_ID
JOIN Doctor_Info d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Date >= CURDATE()
ORDER BY a.Date, a.Time;

-- 11. Show top 5 recent appointments
SELECT A.Appointment_ID, P.Name AS Patient, A.Date, A.Time
FROM Patient_Appointments A
JOIN Patient_Records P ON A.Patient_ID = P.Patient_ID
ORDER BY A.Date DESC, A.Time DESC
LIMIT 5;

-- 12. Show bills paid by 'Kiran Desai'
SELECT B.Bill_ID, B.Amount, B.Date
FROM Billing_Details B
JOIN Patient_Records P ON B.Patient_ID = P.Patient_ID
WHERE P.Name = 'Kiran Desai' AND B.Payment_Status = 'Paid';

-- 13. List medications and how many times each was prescribed
SELECT M.Name, COUNT(PR.Medication_ID) AS Times_Prescribed
FROM Medications M
JOIN Prescriptions PR ON M.Medication_ID = PR.Medication_ID
GROUP BY M.Name
ORDER BY Times_Prescribed DESC;

-- 14. Show available staff with contact numbers by shift
SELECT Name, Contact, Shift FROM Hospital_Staff
ORDER BY Shift;

-- 15. Retrieve all appointments scheduled for today
SELECT A.Appointment_ID, P.Name AS Patient, D.Full_Name AS Doctor, A.Time
FROM Patient_Appointments A
JOIN Patient_Records P ON A.Patient_ID = P.Patient_ID
JOIN Doctor_Info D ON A.Doctor_ID = D.Doctor_ID
WHERE A.Date = CURDATE();

-- 16: Get all prescriptions with patient name and medication details provided in the last 30 days
SELECT pr.Prescription_ID, p.Name AS Patient_Name,m.Name AS Medication_Name,pr.Date_Provided,pr.Dosage
FROM Prescriptions pr
JOIN Patient_Records p ON pr.Patient_ID = p.Patient_ID
JOIN Medications m ON pr.Medication_ID = m.Medication_ID
WHERE pr.Date_Provided >= CURDATE() - INTERVAL 30 DAY
ORDER BY pr.Date_Provided DESC;










