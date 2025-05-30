/*
Analysis
-- Patients (FirstName, LastName, Gender, Phone, Address)
-- Doctors (FirstName, LastName, Specialty, Phone, DepartmentID)
-- Departments (DepartmentID, DepartmentName, Head, Location, Contact)
-- Appointments (PatientID, DoctorID, AppointmentDate, Status)
-- Medications (MedicationName, Manufacturer, ExpiryDate, Price)
-- Prescriptions (AppointmentID, MedicationID, Dosage, Duration)
-- Nurses (FirstName, LastName, Phone, DepartmentID)
-- Rooms (RoomNumber, RoomType, DepartmentID, Availability)
-- MedicalRecords (PatientID, Diagnosis, Treatment, RecordDate)
*/

-- Create Database
CREATE DATABASE  HospitalDB;

-- to work  on this database , you need to use it first
USE HospitalDB;

-- 1. Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

-- insert value in a table
INSERT INTO Patients (FirstName, LastName, Gender, Phone, Address) VALUES
('Amit', 'Sharma', 'Male', '9876543210', 'Delhi'),
('Priya', 'Singh', 'Female', '9123456780', 'Mumbai'),
('Rohit', 'Kumar', 'Male', '9988776655', 'Bangalore'),
('Sneha', 'Patel', 'Female', '9012345678', 'Ahmedabad'),
('Vikram', 'Gupta', 'Male', '9876501234', 'Chennai'),
('Anjali', 'Reddy', 'Female', '9988001122', 'Hyderabad'),
('Rajesh', 'Mehta', 'Male', '9000112233', 'Pune'),
('Kavita', 'Joshi', 'Female', '9011223344', 'Kolkata'),
('Suresh', 'Iyer', 'Male', '9122334455', 'Coimbatore'),
('Divya', 'Nair', 'Female', '9344556677', 'Thiruvananthapuram');


-- display table
select * from Patients;

-- to remove complete data from table
truncate table Patients;

-- to delete complete attributes and records 
drop table Patients;

-- 2. Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(50),
    Phone VARCHAR(15),
    DepartmentID INT
);

-- insert value in a table
INSERT INTO Doctors (FirstName, LastName, Specialty, Phone, DepartmentID) VALUES
('Dr. Rajiv', 'Kapoor', 'Cardiology', '9876543211', 1),
('Dr. Neha', 'Sharma', 'Neurology', '9123456781', 2),
('Dr. Arjun', 'Singh', 'Orthopedics', '9988776656', 3),
('Dr. Meera', 'Patel', 'Pediatrics', '9012345679', 4),
('Dr. Karan', 'Gupta', 'Dermatology', '9876501235', 5),
('Dr. Asha', 'Reddy', 'Gynecology', '9988001123', 6),
('Dr. Rohit', 'Mehta', 'ENT', '9000112234', 7),
('Dr. Kavya', 'Joshi', 'Psychiatry', '9011223345', 8),
('Dr. Suresh', 'Iyer', 'General Surgery', '9122334456', 9),
('Dr. Divya', 'Nair', 'Radiology', '9344556678', 10);

-- display table
select * from Doctors;

-- to remove complete data from table
truncate table Doctors;

-- to delete complete attributes and records 
drop table Doctors;


-- 3. Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Head VARCHAR(50),
    Location VARCHAR(50),
    Contact VARCHAR(15)
);

-- insert value in a table
INSERT INTO Departments (DepartmentID, DepartmentName, Head, Location, Contact) VALUES
(1, 'Cardiology', 'Dr. Rajiv Kapoor', 'Building A', '9876543211'),
(2, 'Neurology', 'Dr. Neha Sharma', 'Building B', '9123456781'),
(3, 'Orthopedics', 'Dr. Arjun Singh', 'Building C', '9988776656'),
(4, 'Pediatrics', 'Dr. Meera Patel', 'Building D', '9012345679'),
(5, 'Dermatology', 'Dr. Karan Gupta', 'Building E', '9876501235'),
(6, 'Gynecology', 'Dr. Asha Reddy', 'Building F', '9988001123'),
(7, 'ENT', 'Dr. Rohit Mehta', 'Building G', '9000112234'),
(8, 'Psychiatry', 'Dr. Kavya Joshi', 'Building H', '9011223345'),
(9, 'General Surgery', 'Dr. Suresh Iyer', 'Building I', '9122334456'),
(10, 'Radiology', 'Dr. Divya Nair', 'Building J', '9344556678');

-- display table
select * from Departments;

-- to remove complete data from table
truncate table Departments;

-- to delete complete attributes and records 
drop table Departments;

-- 4. Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- insert value in a table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, '2025-06-01', 'Scheduled'),
(2, 2, '2025-06-02', 'Completed'),
(3, 3, '2025-06-03', 'Cancelled'),
(4, 4, '2025-06-04', 'Scheduled'),
(5, 5, '2025-06-05', 'Completed'),
(6, 6, '2025-06-06', 'Scheduled'),
(7, 7, '2025-06-07', 'Completed'),
(8, 8, '2025-06-08', 'Scheduled'),
(9, 9, '2025-06-09', 'Completed'),
(10, 10, '2025-06-10', 'Scheduled');

-- display table
select * from Appointments;

-- to remove complete data from table
truncate table Appointments;

-- to delete complete attributes and records 
drop table Appointments;

-- 5. Medications Table
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY AUTO_INCREMENT,
    MedicationName VARCHAR(50),
    Manufacturer VARCHAR(50),
    ExpiryDate DATE,
    Price DECIMAL(10,2)
);

-- insert value in a table
INSERT INTO Medications (MedicationName, Manufacturer, ExpiryDate, Price) VALUES
('Paracetamol', 'Cipla', '2026-12-31', 20.00),
('Amoxicillin', 'Sun Pharma', '2025-11-30', 50.00),
('Metformin', 'Dr. Reddy', '2027-01-15', 40.00),
('Cetirizine', 'Torrent', '2025-09-20', 30.00),
('Azithromycin', 'Lupin', '2026-05-10', 70.00),
('Omeprazole', 'Cadila', '2026-08-25', 60.00),
('Ibuprofen', 'Zydus', '2027-03-17', 25.00),
('Cefixime', 'Alkem', '2025-07-22', 80.00),
('Ranitidine', 'Glenmark', '2026-10-10', 35.00),
('Levocetirizine', 'Wockhardt', '2027-02-05', 45.00);

-- display table
select * from Medications;

-- to remove complete data from table
truncate table Medications;

-- to delete complete attributes and records 
drop table Medications;

-- 6. Prescriptions Table
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT,
    MedicationID INT,
    Dosage VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

-- insert value in a table
INSERT INTO Prescriptions (AppointmentID, MedicationID, Dosage, Duration) VALUES
(1, 1, '500 mg twice a day', '5 days'),
(2, 2, '250 mg thrice a day', '7 days'),
(4, 3, '500 mg once a day', '10 days'),
(5, 4, '10 mg once a day', '3 days'),
(6, 5, '500 mg twice a day', '5 days'),
(7, 6, '20 mg once a day', '14 days'),
(8, 7, '400 mg thrice a day', '7 days'),
(9, 8, '200 mg twice a day', '5 days'),
(10, 9, '150 mg once a day', '10 days'),
(1, 10, '5 mg once a day', '30 days');

-- display table
select * from Prescriptions;

-- to remove complete data from table
truncate table Prescriptions;

-- to delete complete attributes and records 
drop table Prescriptions;

-- 7. Nurses Table
CREATE TABLE Nurses (
    NurseID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    DepartmentID INT
);

-- insert value in a table
INSERT INTO Nurses (FirstName, LastName, Phone, DepartmentID) VALUES
('Sunita', 'Kumar', '9876500001', 1),
('Geeta', 'Singh', '9123456002', 2),
('Pooja', 'Patel', '9988766003', 3),
('Anita', 'Sharma', '9012300004', 4),
('Kiran', 'Gupta', '9876501236', 5),
('Lata', 'Reddy', '9988001100', 6),
('Seema', 'Mehta', '9000110007', 7),
('Neeta', 'Joshi', '9011200344', 8),
('Radha', 'Iyer', '9122300455', 9),
('Manisha', 'Nair', '9344500677', 10);

-- display table
select * from Nurses;

-- to remove complete data from table
truncate table Nurses;

-- to delete complete attributes and records 
drop table Nurses;

-- 8. Rooms Table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber VARCHAR(10),
    RoomType VARCHAR(20),
    DepartmentID INT,
    Availability VARCHAR(10)
);

-- insert value in a table
INSERT INTO Rooms (RoomNumber, RoomType, DepartmentID, Availability) VALUES
('101', 'Single', 1, 'Available'),
('102', 'Double', 2, 'Occupied'),
('103', 'Single', 3, 'Available'),
('104', 'ICU', 4, 'Occupied'),
('105', 'Single', 5, 'Available'),
('106', 'Double', 6, 'Available'),
('107', 'ICU', 7, 'Occupied'),
('108', 'Single', 8, 'Available'),
('109', 'Double', 9, 'Available'),
('110', 'Single', 10, 'Occupied');

-- display table
select * from Rooms;

-- to remove complete data from table
truncate table Rooms;

-- to delete complete attributes and records 
drop table Rooms;

-- 9. Billing Table
CREATE TABLE Billing (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    Amount DECIMAL(10,2),
    BillDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- insert value in a table
INSERT INTO Billing (PatientID, Amount, BillDate, Status) VALUES
(1, 5000.00, '2025-06-01', 'Paid'),
(2, 7000.00, '2025-06-02', 'Unpaid'),
(3, 3000.00, '2025-06-03', 'Paid'),
(4, 4500.00, '2025-06-04', 'Unpaid'),
(5, 6000.00, '2025-06-05', 'Paid'),
(6, 3500.00, '2025-06-06', 'Paid'),
(7, 4000.00, '2025-06-07', 'Unpaid'),
(8, 8000.00, '2025-06-08', 'Paid'),
(9, 2000.00, '2025-06-09', 'Unpaid'),
(10, 7500.00, '2025-06-10', 'Paid');

-- display table
select * from Billing;

-- to remove complete data from table
truncate table Billing;

-- to delete complete attributes and records 
drop table Billing;

-- 10. MedicalRecords Table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    Diagnosis VARCHAR(100),
    Treatment VARCHAR(100),
    RecordDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- insert value in a table
INSERT INTO MedicalRecords (PatientID, Diagnosis, Treatment, RecordDate) VALUES
(1, 'Hypertension', 'Medication and Lifestyle Changes', '2025-01-10'),
(2, 'Migraine', 'Pain Relievers', '2025-02-15'),
(3, 'Fracture', 'Cast and Rest', '2025-03-20'),
(4, 'Asthma', 'Inhalers', '2025-04-25'),
(5, 'Skin Allergy', 'Antihistamines', '2025-05-30'),
(6, 'PCOS', 'Hormonal Treatment', '2025-06-05'),
(7, 'Sinusitis', 'Antibiotics', '2025-07-10'),
(8, 'Depression', 'Counseling and Medication', '2025-08-15'),
(9, 'Appendicitis', 'Surgery', '2025-09-20'),
(10, 'Lung Infection', 'Antibiotics', '2025-10-25');

-- display table
select * from MedicalRecords;

-- to remove complete data from table
truncate table MedicalRecords;

-- to delete complete attributes and records 
drop table MedicalRecords;

