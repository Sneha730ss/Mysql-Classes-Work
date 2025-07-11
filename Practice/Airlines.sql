-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database Airlines;

-- to work on it, you need to use it first
use Airlines;

-- Delete a database
Drop database Airlines;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Passengers (passenger_id, name, gender, date_of_birth, email,phone_number, passport_number, nationality, address, frequent_flyer_status)  

T2 : Flights (flight_id, airline_name, flight_number, source, destination,departure_time, arrival_time, duration, flight_type, status) 

T3 : Bookings (booking_id, passenger_id, flight_id, booking_date, travel_date,seat_number, booking_status, payment_mode, fare, remarks) 

T4 : Tickets (ticket_id, booking_id, ticket_number, issue_date, travel_class,seat_number, gate, boarding_time, status, barcode) 

T5 : Employees (emp_id, name, designation, department, email,phone_number, joining_date, salary, shift, status)

T6 : Airports (airport_id, name, code, city, state, country,terminal_count, contact_number, status, established_year) 

T7 : Aircrafts (aircraft_id, model, manufacturer, capacity, registration_number,purchase_date, maintenance_due, status, base_airport_id, age_years) 

T8 : Crew (crew_id, flight_id, emp_id, role, assigned_date,shift, duty_status, experience_years, remarks, contact_number)

T9 : Maintenance (maintenance_id, aircraft_id, emp_id, check_type, scheduled_date,completed_date, status, remarks, duration_days, cost)

T10 : Feedback (feedback_id, user_id, flight_id, rating, comments,feedback_date, service_quality, punctuality, staff_behavior, suggestions) 

T11 : Travel_Insurance (insurance_id, user_id, flight_id, provider_name, policy_number,insured_amount, purchase_date, coverage_start, coverage_end, claim_status) 

T12 : Baggage_Tracking (baggage_id, passenger_id, flight_id, tag_number,checkin_time, loaded_time, unload_time, delivery_status,current_location, remarks) 

T13 : InFlight_Services (service_id, flight_id, service_type, description,availability_status, provider_name, cost, feedback_score,service_time, remarks) 

T14 : Lounge_Access (access_id, passenger_id, lounge_name, airport_code,access_time, access_date, duration_minutes, access_type,amenities_used, feedback_rating)

T15 : Airport_Services (service_id, passenger_id, airport_code, service_type, request_date,status, provider_name, remarks, request_time, contact_number)


*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Passengers
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    passport_number VARCHAR(20),
    nationality VARCHAR(50),
    address TEXT,
    frequent_flyer_status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Passengers (passenger_id, name, gender, date_of_birth, email,phone_number, passport_number, nationality, address, frequent_flyer_status) 
VALUES
(1, 'Rahul Mehra', 'Male', '1990-02-15', 'rahul.mehra@example.com', '9876543001', 'INP123456', 'Indian', 'Delhi, India', 'Gold'),
(2, 'Priya Sharma', 'Female', '1992-06-20', 'priya.sharma@example.com', '9876543002', 'INP234567', 'Indian', 'Mumbai, India', 'Silver'),
(3, 'Amit Verma', 'Male', '1988-11-05', 'amit.verma@example.com', '9876543003', 'INP345678', 'Indian', 'Bangalore, India', 'None'),
(4, 'Sneha Nair', 'Female', '1995-09-12', 'sneha.nair@example.com', '9876543004', 'INP456789', 'Indian', 'Chennai, India', 'Platinum'),
(5, 'Rakesh Rathi', 'Male', '1985-01-25', 'rakesh.rathi@example.com', '9876543005', 'INP567890', 'Indian', 'Hyderabad, India', 'Gold'),
(6, 'Neha Joshi', 'Female', '1993-07-30', 'neha.joshi@example.com', '9876543006', 'INP678901', 'Indian', 'Pune, India', 'Silver'),
(7, 'Vikas Singh', 'Male', '1991-04-18', 'vikas.singh@example.com', '9876543007', 'INP789012', 'Indian', 'Lucknow, India', 'None'),
(8, 'Divya Patil', 'Female', '1994-08-22', 'divya.patil@example.com', '9876543008', 'INP890123', 'Indian', 'Nagpur, India', 'Silver'),
(9, 'Manoj Shetty', 'Male', '1987-10-09', 'manoj.shetty@example.com', '9876543009', 'INP901234', 'Indian', 'Kochi, India', 'Platinum'),
(10, 'Pooja Rao', 'Female', '1990-03-17', 'pooja.rao@example.com', '9876543010', 'INP012345', 'Indian', 'Goa, India', 'None'),
(11, 'Ankur Jain', 'Male', '1992-05-12', 'ankur.jain@example.com', '9876543011', 'INP112345', 'Indian', 'Bhopal, India', 'Gold'),
(12, 'Ritu Chaudhary', 'Female', '1989-12-25', 'ritu.chaudhary@example.com', '9876543012', 'INP212345', 'Indian', 'Indore, India', 'Silver'),
(13, 'Ajay Tripathi', 'Male', '1993-02-19', 'ajay.tripathi@example.com', '9876543013', 'INP312345', 'Indian', 'Ranchi, India', 'None'),
(14, 'Megha Desai', 'Female', '1991-06-10', 'megha.desai@example.com', '9876543014', 'INP412345', 'Indian', 'Vadodara, India', 'Platinum'),
(15, 'Nitin Malhotra', 'Male', '1986-11-27', 'nitin.malhotra@example.com', '9876543015', 'INP512345', 'Indian', 'Jaipur, India', 'Gold');

-- to display/retrieve table data
SELECT * FROM Passengers;               

-- to remove complete data from table
truncate table Passengers;

-- to delete complete attributes and records 
drop table Passengers;

-- Table 2: Flights
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    airline_name VARCHAR(100),
    flight_number VARCHAR(20),
    source VARCHAR(100),
    destination VARCHAR(100),
    departure_time TIME,
    arrival_time TIME,
    duration VARCHAR(20),
    flight_type VARCHAR(20),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Flights (flight_id, airline_name, flight_number, source, destination,departure_time, arrival_time, duration, flight_type, status) 
VALUES
(1, 'Air India', 'AI101', 'Delhi', 'Mumbai', '06:00:00', '08:00:00', '2h', 'Domestic', 'On Time'),
(2, 'IndiGo', '6E202', 'Bangalore', 'Delhi', '09:30:00', '12:30:00', '3h', 'Domestic', 'On Time'),
(3, 'SpiceJet', 'SG303', 'Hyderabad', 'Chennai', '14:00:00', '15:30:00', '1.5h', 'Domestic', 'Delayed'),
(4, 'Vistara', 'UK404', 'Mumbai', 'Goa', '13:15:00', '14:45:00', '1.5h', 'Domestic', 'On Time'),
(5, 'Air India', 'AI505', 'Kolkata', 'Delhi', '07:00:00', '10:00:00', '3h', 'Domestic', 'On Time'),
(6, 'IndiGo', '6E606', 'Pune', 'Ahmedabad', '11:20:00', '13:00:00', '1.8h', 'Domestic', 'On Time'),
(7, 'Vistara', 'UK707', 'Delhi', 'Dubai', '22:00:00', '01:30:00', '3.5h', 'International', 'On Time'),
(8, 'Air India', 'AI808', 'Mumbai', 'Singapore', '00:30:00', '07:30:00', '7h', 'International', 'On Time'),
(9, 'SpiceJet', 'SG909', 'Chennai', 'Colombo', '06:45:00', '08:45:00', '2h', 'International', 'Delayed'),
(10, 'IndiGo', '6E010', 'Delhi', 'Bangkok', '23:00:00', '04:30:00', '5.5h', 'International', 'On Time'),
(11, 'Air India', 'AI111', 'Goa', 'Hyderabad', '17:00:00', '18:30:00', '1.5h', 'Domestic', 'On Time'),
(12, 'SpiceJet', 'SG212', 'Mumbai', 'Kolkata', '12:00:00', '15:00:00', '3h', 'Domestic', 'Cancelled'),
(13, 'IndiGo', '6E313', 'Ahmedabad', 'Delhi', '16:00:00', '18:00:00', '2h', 'Domestic', 'On Time'),
(14, 'Vistara', 'UK414', 'Bangalore', 'Singapore', '01:00:00', '07:30:00', '6.5h', 'International', 'On Time'),
(15, 'Air India', 'AI515', 'Delhi', 'New York', '21:00:00', '07:00:00', '16h', 'International', 'On Time');

-- to display/retrieve table data
SELECT * FROM Flights;               

-- to remove complete data from table
truncate table Flights;

-- to delete complete attributes and records 
drop table Flights;

-- Table 3: Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    travel_date DATE,
    seat_number VARCHAR(10),
    booking_status VARCHAR(20),
    payment_mode VARCHAR(20),
    fare DECIMAL(10,2),
    remarks TEXT,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert records into the table
INSERT INTO Bookings (booking_id, passenger_id, flight_id, booking_date, travel_date,seat_number, booking_status, payment_mode, fare, remarks) 
VALUES
(1, 1, 1, '2024-06-20', '2024-07-01', '12A', 'Confirmed', 'UPI', 4500.00, 'Window seat'),
(2, 2, 2, '2024-06-21', '2024-07-02', '18C', 'Confirmed', 'Credit Card', 5200.00, ''),
(3, 3, 3, '2024-06-22', '2024-07-03', '14B', 'Cancelled', 'Debit Card', 3000.00, 'Rescheduled'),
(4, 4, 4, '2024-06-23', '2024-07-04', '10A', 'Confirmed', 'Net Banking', 2800.00, ''),
(5, 5, 5, '2024-06-24', '2024-07-05', '22D', 'Confirmed', 'UPI', 5100.00, 'Paid in full'),
(6, 6, 6, '2024-06-25', '2024-07-06', '19B', 'Pending', 'UPI', 3300.00, 'Payment awaiting'),
(7, 7, 7, '2024-06-26', '2024-07-07', '1F', 'Confirmed', 'Credit Card', 12000.00, 'International trip'),
(8, 8, 8, '2024-06-27', '2024-07-08', '2A', 'Confirmed', 'Debit Card', 15000.00, ''),
(9, 9, 9, '2024-06-28', '2024-07-09', '9E', 'Confirmed', 'Credit Card', 6700.00, ''),
(10, 10, 10, '2024-06-29', '2024-07-10', '11D', 'Confirmed', 'UPI', 9500.00, ''),
(11, 11, 11, '2024-06-30', '2024-07-11', '17A', 'Confirmed', 'UPI', 4100.00, ''),
(12, 12, 12, '2024-07-01', '2024-07-12', '23C', 'Cancelled', 'Credit Card', 5400.00, 'Cancelled by airline'),
(13, 13, 13, '2024-07-02', '2024-07-13', '8B', 'Pending', 'UPI', 4200.00, ''),
(14, 14, 14, '2024-07-03', '2024-07-14', '6C', 'Confirmed', 'Net Banking', 13300.00, ''),
(15, 15, 15, '2024-07-04', '2024-07-15', '3E', 'Confirmed', 'UPI', 56000.00, 'Business class');

-- to display/retrieve table data
SELECT * FROM Bookings;               

-- to remove complete data from table
truncate table Bookings;

-- to delete complete attributes and records 
drop table Bookings;

-- Table 4: Tickets
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    booking_id INT,
    ticket_number VARCHAR(50),
    issue_date DATE,
    travel_class VARCHAR(20),
    seat_number VARCHAR(10),
    gate VARCHAR(10),
    boarding_time TIME,
    status VARCHAR(20),
    barcode TEXT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Insert records into the table
INSERT INTO Tickets (ticket_id, booking_id, ticket_number, issue_date, travel_class,seat_number, gate, boarding_time, status, barcode) 
VALUES
(1, 1, 'AI101-001', '2024-06-20', 'Economy', '12A', 'G5', '05:30:00', 'Issued', 'BAR001'),
(2, 2, '6E202-002', '2024-06-21', 'Economy', '18C', 'G3', '09:00:00', 'Issued', 'BAR002'),
(3, 3, 'SG303-003', '2024-06-22', 'Economy', '14B', 'G2', '13:30:00', 'Cancelled', 'BAR003'),
(4, 4, 'UK404-004', '2024-06-23', 'Economy', '10A', 'G1', '12:45:00', 'Issued', 'BAR004'),
(5, 5, 'AI505-005', '2024-06-24', 'Economy', '22D', 'G7', '06:30:00', 'Issued', 'BAR005'),
(6, 6, '6E606-006', '2024-06-25', 'Economy', '19B', 'G4', '10:50:00', 'Pending', 'BAR006'),
(7, 7, 'UK707-007', '2024-06-26', 'Business', '1F', 'G6', '21:15:00', 'Issued', 'BAR007'),
(8, 8, 'AI808-008', '2024-06-27', 'Business', '2A', 'G8', '23:45:00', 'Issued', 'BAR008'),
(9, 9, 'SG909-009', '2024-06-28', 'Economy', '9E', 'G2', '06:15:00', 'Issued', 'BAR009'),
(10, 10, '6E010-010', '2024-06-29', 'Economy', '11D', 'G9', '22:30:00', 'Issued', 'BAR010'),
(11, 11, 'AI111-011', '2024-06-30', 'Economy', '17A', 'G5', '16:30:00', 'Issued', 'BAR011'),
(12, 12, 'SG212-012', '2024-07-01', 'Economy', '23C', 'G1', '11:30:00', 'Cancelled', 'BAR012'),
(13, 13, '6E313-013', '2024-07-02', 'Economy', '8B', 'G6', '15:30:00', 'Pending', 'BAR013'),
(14, 14, 'UK414-014', '2024-07-03', 'Business', '6C', 'G3', '00:30:00', 'Issued', 'BAR014'),
(15, 15, 'AI515-015', '2024-07-04', 'Business', '3E', 'G10', '20:30:00', 'Issued', 'BAR015');

-- to display/retrieve table data
SELECT * FROM Tickets;               

-- to remove complete data from table
truncate table Tickets;

-- to delete complete attributes and records 
drop table Tickets;

-- Table 5: Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(50),
    department VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    joining_date DATE,
    salary DECIMAL(10,2),
    shift VARCHAR(20),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Employees (emp_id, name, designation, department, email,phone_number, joining_date, salary, shift, status)
    VALUES
(1, 'Rohit Sharma', 'Pilot', 'Flight Crew', 'rohit.sharma@airlines.com', '9876500001', '2018-05-01', 150000.00, 'Morning', 'Active'),
(2, 'Anjali Mehta', 'Cabin Crew', 'Flight Crew', 'anjali.mehta@airlines.com', '9876500002', '2019-03-12', 75000.00, 'Evening', 'Active'),
(3, 'Suresh Iyer', 'Ground Staff', 'Ground Operations', 'suresh.iyer@airlines.com', '9876500003', '2020-07-20', 40000.00, 'Night', 'Active'),
(4, 'Nidhi Gupta', 'Cabin Crew', 'Flight Crew', 'nidhi.gupta@airlines.com', '9876500004', '2017-11-11', 72000.00, 'Morning', 'Active'),
(5, 'Rajesh Menon', 'Pilot', 'Flight Crew', 'rajesh.menon@airlines.com', '9876500005', '2016-04-08', 145000.00, 'Evening', 'Active'),
(6, 'Meera Nair', 'Security Officer', 'Security', 'meera.nair@airlines.com', '9876500006', '2019-01-18', 50000.00, 'Night', 'Active'),
(7, 'Vikram Patil', 'Technician', 'Maintenance', 'vikram.patil@airlines.com', '9876500007', '2021-06-10', 55000.00, 'Morning', 'Active'),
(8, 'Divya Joshi', 'HR Executive', 'Human Resources', 'divya.joshi@airlines.com', '9876500008', '2020-08-22', 60000.00, 'Day', 'Active'),
(9, 'Amitabh Singh', 'Cabin Crew', 'Flight Crew', 'amitabh.singh@airlines.com', '9876500009', '2018-10-02', 78000.00, 'Evening', 'Active'),
(10, 'Pooja Rane', 'Ticketing Agent', 'Customer Service', 'pooja.rane@airlines.com', '9876500010', '2017-12-15', 48000.00, 'Day', 'Active'),
(11, 'Ravi Shankar', 'Pilot', 'Flight Crew', 'ravi.shankar@airlines.com', '9876500011', '2015-06-05', 160000.00, 'Night', 'Active'),
(12, 'Snehal Deshmukh', 'Ground Staff', 'Ground Operations', 'snehal.deshmukh@airlines.com', '9876500012', '2016-09-29', 42000.00, 'Morning', 'Active'),
(13, 'Manish Tiwari', 'Security Officer', 'Security', 'manish.tiwari@airlines.com', '9876500013', '2018-02-17', 51000.00, 'Evening', 'Active'),
(14, 'Kavita Shetty', 'Technician', 'Maintenance', 'kavita.shetty@airlines.com', '9876500014', '2022-03-03', 54000.00, 'Night', 'Active'),
(15, 'Yash Saxena', 'IT Support', 'Technical', 'yash.saxena@airlines.com', '9876500015', '2019-04-01', 58000.00, 'Day', 'Active');

-- to display/retrieve table data
SELECT * FROM Employees;               

-- to remove complete data from table
truncate table Employees;

-- to delete complete attributes and records 
drop table Employees;

-- Table 6: Airports
CREATE TABLE Airports (
    airport_id INT PRIMARY KEY,
    name VARCHAR(100),
    code VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    terminal_count INT,
    contact_number VARCHAR(15),
    status VARCHAR(20),
    established_year INT
);

-- Insert records into the table
INSERT INTO Airports (airport_id, name, code, city, state, country,terminal_count, contact_number, status, established_year) 
VALUES
(1, 'Indira Gandhi International Airport', 'DEL', 'Delhi', 'Delhi', 'India', 3, '01124656000', 'Operational', 1986),
(2, 'Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'Mumbai', 'Maharashtra', 'India', 2, '02266851010', 'Operational', 1942),
(3, 'Kempegowda International Airport', 'BLR', 'Bangalore', 'Karnataka', 'India', 2, '08066782251', 'Operational', 2008),
(4, 'Rajiv Gandhi International Airport', 'HYD', 'Hyderabad', 'Telangana', 'India', 1, '04066546370', 'Operational', 2008),
(5, 'Chennai International Airport', 'MAA', 'Chennai', 'Tamil Nadu', 'India', 2, '04422560551', 'Operational', 1954),
(6, 'Netaji Subhas Chandra Bose International Airport', 'CCU', 'Kolkata', 'West Bengal', 'India', 2, '03325119020', 'Operational', 1924),
(7, 'Sardar Vallabhbhai Patel International Airport', 'AMD', 'Ahmedabad', 'Gujarat', 'India', 2, '07922869201', 'Operational', 1937),
(8, 'Goa International Airport', 'GOI', 'Goa', 'Goa', 'India', 1, '08322401430', 'Operational', 1955),
(9, 'Cochin International Airport', 'COK', 'Kochi', 'Kerala', 'India', 1, '04842610511', 'Operational', 1999),
(10, 'Jaipur International Airport', 'JAI', 'Jaipur', 'Rajasthan', 'India', 1, '01412725555', 'Operational', 2005),
(11, 'Biju Patnaik International Airport', 'BBI', 'Bhubaneswar', 'Odisha', 'India', 1, '06742595100', 'Operational', 1962),
(12, 'Lokpriya Gopinath Bordoloi International Airport', 'GAU', 'Guwahati', 'Assam', 'India', 1, '03612600380', 'Operational', 1958),
(13, 'Lal Bahadur Shastri International Airport', 'VNS', 'Varanasi', 'Uttar Pradesh', 'India', 1, '05422433995', 'Operational', 1990),
(14, 'Sri Guru Ram Dass Jee International Airport', 'ATQ', 'Amritsar', 'Punjab', 'India', 1, '01832210123', 'Operational', 1981),
(15, 'Dr. Babasaheb Ambedkar International Airport', 'NAG', 'Nagpur', 'Maharashtra', 'India', 1, '07122281771', 'Operational', 2005);

-- to display/retrieve table data
SELECT * FROM Airports;               

-- to remove complete data from table
truncate table Airports;

-- to delete complete attributes and records 
drop table Airports;

-- Table 7: Aircrafts
CREATE TABLE Aircrafts (
    aircraft_id INT PRIMARY KEY,
    model VARCHAR(50),
    manufacturer VARCHAR(50),
    capacity INT,
    registration_number VARCHAR(20),
    purchase_date DATE,
    maintenance_due DATE,
    status VARCHAR(20),
    base_airport_id INT,
    age_years INT,
    FOREIGN KEY (base_airport_id) REFERENCES Airports(airport_id)
);

-- Insert records into the table
INSERT INTO Aircrafts (aircraft_id, model, manufacturer, capacity, registration_number,purchase_date, maintenance_due, status, base_airport_id, age_years) 
VALUES
(1, 'A320', 'Airbus', 180, 'VT-AIA', '2018-01-15', '2025-01-15', 'Active', 1, 6),
(2, 'B737', 'Boeing', 189, 'VT-BJB', '2017-06-20', '2024-06-20', 'Active', 2, 7),
(3, 'A321', 'Airbus', 220, 'VT-AKC', '2019-09-10', '2026-09-10', 'Active', 3, 5),
(4, 'B787', 'Boeing', 242, 'VT-BLD', '2020-03-25', '2025-03-25', 'Active', 4, 4),
(5, 'A330', 'Airbus', 277, 'VT-ALE', '2015-11-01', '2024-11-01', 'Maintenance', 5, 9),
(6, 'B777', 'Boeing', 312, 'VT-BMF', '2016-12-12', '2024-12-12', 'Active', 6, 8),
(7, 'A319', 'Airbus', 144, 'VT-ANG', '2021-04-05', '2026-04-05', 'Active', 7, 3),
(8, 'B737 MAX', 'Boeing', 210, 'VT-BPH', '2022-01-18', '2025-01-18', 'Active', 8, 2),
(9, 'A350', 'Airbus', 300, 'VT-AQI', '2020-10-10', '2025-10-10', 'Active', 9, 4),
(10, 'B777', 'Boeing', 314, 'VT-BRJ', '2014-07-25', '2024-07-25', 'Maintenance', 10, 10),
(11, 'A310', 'Airbus', 280, 'VT-ASK', '2013-03-05', '2023-03-05', 'Retired', 11, 11),
(12, 'B737', 'Boeing', 180, 'VT-BTL', '2018-06-30', '2025-06-30', 'Active', 12, 6),
(13, 'A321neo', 'Airbus', 244, 'VT-AMM', '2019-12-12', '2024-12-12', 'Active', 13, 5),
(14, 'B757', 'Boeing', 243, 'VT-BUN', '2015-01-10', '2024-01-10', 'Retired', 14, 9),
(15, 'A220', 'Airbus', 135, 'VT-AOP', '2023-05-01', '2026-05-01', 'Active', 15, 1);

-- to display/retrieve table data
SELECT * FROM Aircrafts;               

-- to remove complete data from table
truncate table Aircrafts;

-- to delete complete attributes and records 
drop table Aircrafts;

-- Table 8: Crew
CREATE TABLE Crew (
    crew_id INT PRIMARY KEY,
    flight_id INT,
    emp_id INT,
    role VARCHAR(50),
    assigned_date DATE,
    shift VARCHAR(20),
    duty_status VARCHAR(20),
    experience_years INT,
    remarks TEXT,
    contact_number VARCHAR(15),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Crew (crew_id, flight_id, emp_id, role, assigned_date,shift, duty_status, experience_years, remarks, contact_number)
 VALUES
(1, 1, 1, 'Pilot', '2024-06-25', 'Morning', 'Active', 12, 'Captain', '9876500001'),
(2, 2, 2, 'Cabin Crew', '2024-06-26', 'Evening', 'Active', 5, 'Fluent in Hindi/English', '9876500002'),
(3, 3, 4, 'Cabin Crew', '2024-06-27', 'Morning', 'Active', 6, 'Handles aisle row', '9876500004'),
(4, 4, 5, 'Pilot', '2024-06-27', 'Evening', 'Active', 14, 'Senior pilot', '9876500005'),
(5, 5, 6, 'Security', '2024-06-28', 'Night', 'Active', 7, 'Flight security check', '9876500006'),
(6, 6, 7, 'Technician', '2024-06-28', 'Morning', 'Active', 4, 'Pre-flight check', '9876500007'),
(7, 7, 9, 'Cabin Crew', '2024-06-29', 'Evening', 'Active', 9, 'International crew', '9876500009'),
(8, 8, 11, 'Pilot', '2024-06-30', 'Night', 'Active', 16, 'Experienced international pilot', '9876500011'),
(9, 9, 3, 'Ground Staff', '2024-06-30', 'Morning', 'Active', 5, 'Gate entry check', '9876500003'),
(10, 10, 10, 'Ticketing Agent', '2024-07-01', 'Day', 'Active', 6, 'Check-in support', '9876500010'),
(11, 11, 12, 'Ground Staff', '2024-07-01', 'Morning', 'Active', 8, 'Luggage counter', '9876500012'),
(12, 12, 13, 'Security', '2024-07-02', 'Evening', 'Active', 6, 'Baggage scan', '9876500013'),
(13, 13, 14, 'Technician', '2024-07-03', 'Night', 'Active', 4, 'Engine check', '9876500014'),
(14, 14, 8, 'HR Executive', '2024-07-03', 'Day', 'Active', 3, 'Crew welfare support', '9876500008'),
(15, 15, 15, 'IT Support', '2024-07-04', 'Day', 'Active', 5, 'E-ticketing helpdesk', '9876500015');

-- to display/retrieve table data
SELECT * FROM Crew;               

-- to remove complete data from table
truncate table Crew;

-- to delete complete attributes and records 
drop table Crew;

-- Table 9: Maintenance
CREATE TABLE Maintenance (
    maintenance_id INT PRIMARY KEY,
    aircraft_id INT,
    emp_id INT,
    check_type VARCHAR(50),
    scheduled_date DATE,
    completed_date DATE,
    status VARCHAR(20),
    remarks TEXT,
    duration_days INT,
    cost DECIMAL(10,2),
    FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Maintenance (maintenance_id, aircraft_id, emp_id, check_type, scheduled_date,completed_date, status, remarks, duration_days, cost)
 VALUES
(1, 1, 7, 'Routine Check', '2024-06-01', '2024-06-02', 'Completed', 'No issues found', 1, 50000.00),
(2, 2, 14, 'Engine Check', '2024-06-03', '2024-06-05', 'Completed', 'Engine filter changed', 2, 150000.00),
(3, 3, 7, 'Avionics', '2024-06-06', '2024-06-07', 'Completed', 'Software updated', 1, 80000.00),
(4, 4, 14, 'Hydraulic Test', '2024-06-08', '2024-06-09', 'Completed', 'Hydraulic oil replaced', 1, 120000.00),
(5, 5, 7, 'Major Overhaul', '2024-06-10', '2024-06-15', 'Completed', '5-day full checkup', 5, 300000.00),
(6, 6, 14, 'Landing Gear', '2024-06-12', '2024-06-14', 'Completed', 'Gear realigned', 2, 90000.00),
(7, 7, 7, 'Electrical Systems', '2024-06-15', '2024-06-16', 'Completed', 'Battery replaced', 1, 60000.00),
(8, 8, 14, 'Routine Check', '2024-06-18', '2024-06-18', 'Completed', 'All clear', 0, 40000.00),
(9, 9, 7, 'Cabin Inspection', '2024-06-20', '2024-06-20', 'Completed', 'Seats cleaned', 0, 35000.00),
(10, 10, 14, 'Fuel System', '2024-06-22', '2024-06-23', 'Completed', 'Fuel valve checked', 1, 70000.00),
(11, 11, 7, 'Routine Check', '2024-06-24', '2024-06-24', 'Pending', 'Scheduled', 0, 45000.00),
(12, 12, 14, 'Engine Check', '2024-06-25', '2024-06-26', 'Completed', 'Oil leakage fixed', 1, 130000.00),
(13, 13, 7, 'Avionics', '2024-06-27', '2024-06-27', 'Completed', 'Navigation calibrated', 0, 75000.00),
(14, 14, 14, 'Routine Check', '2024-06-28', '2024-06-28', 'Pending', 'Awaiting approval', 0, 50000.00),
(15, 15, 7, 'Hydraulic Test', '2024-06-29', '2024-06-30', 'Completed', 'Repaired leak', 1, 110000.00);

-- to display/retrieve table data
SELECT * FROM Maintenance;               

-- to remove complete data from table
truncate table Maintenance;

-- to delete complete attributes and records 
drop table Maintenance;

-- Table 10: Feedback
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    user_id INT,
    flight_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE,
    service_quality VARCHAR(50),
    punctuality VARCHAR(50),
    staff_behavior VARCHAR(50),
    suggestions TEXT,
    FOREIGN KEY (user_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert records into the table
INSERT INTO Feedback (feedback_id, user_id, flight_id, rating, comments,feedback_date, service_quality, punctuality, staff_behavior, suggestions) 
VALUES
(1, 1, 1, 5, 'Very smooth experience.', '2024-07-01', 'Excellent', 'On Time', 'Polite', 'Keep up the good work!'),
(2, 2, 2, 4, 'Food was good.', '2024-07-02', 'Good', 'Delayed', 'Friendly', 'Try to be more punctual.'),
(3, 3, 3, 3, 'Average flight.', '2024-07-03', 'Average', 'Late', 'Decent', 'Improve punctuality.'),
(4, 4, 4, 5, 'Cabin crew was amazing!', '2024-07-04', 'Excellent', 'On Time', 'Courteous', 'No suggestions.'),
(5, 5, 5, 2, 'Seats were uncomfortable.', '2024-07-05', 'Poor', 'Late', 'Okay', 'Upgrade seats.'),
(6, 6, 6, 4, 'Boarding was smooth.', '2024-07-06', 'Good', 'On Time', 'Nice', 'Maintain service.'),
(7, 7, 7, 5, 'Great pilot and landing.', '2024-07-07', 'Excellent', 'On Time', 'Excellent', 'None.'),
(8, 8, 8, 3, 'Baggage delay issue.', '2024-07-08', 'Average', 'Delayed', 'Supportive', 'Improve ground services.'),
(9, 9, 9, 4, 'Nice flight overall.', '2024-07-09', 'Good', 'On Time', 'Warm', 'Add more meal options.'),
(10, 10, 10, 1, 'Very poor experience.', '2024-07-10', 'Poor', 'Late', 'Rude', 'Need serious improvements.'),
(11, 11, 11, 4, 'Fast boarding and good food.', '2024-07-11', 'Good', 'On Time', 'Good', 'Keep it up.'),
(12, 12, 12, 5, 'Best flight till now!', '2024-07-12', 'Excellent', 'On Time', 'Excellent', 'Perfect experience.'),
(13, 13, 13, 2, 'Flight was too cold.', '2024-07-13', 'Below Average', 'Delayed', 'Okay', 'Control cabin temperature.'),
(14, 14, 14, 3, 'Staff could be more attentive.', '2024-07-14', 'Average', 'On Time', 'Indifferent', 'Training needed.'),
(15, 15, 15, 5, 'Loved the service!', '2024-07-15', 'Excellent', 'On Time', 'Excellent', 'No suggestions!');

-- to display/retrieve table data
SELECT * FROM Feedback;               

-- to remove complete data from table
truncate table Feedback;

-- to delete complete attributes and records 
drop table Feedback;

-- Table 11: Travel_Insurance
CREATE TABLE Travel_Insurance (
    insurance_id INT PRIMARY KEY,
    user_id INT,
    flight_id INT,
    provider_name VARCHAR(100),
    policy_number VARCHAR(50),
    insured_amount DECIMAL(10,2),
    purchase_date DATE,
    coverage_start DATE,
    coverage_end DATE,
    claim_status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert records into the table
INSERT INTO Travel_Insurance (insurance_id, user_id, flight_id, provider_name, policy_number,insured_amount, purchase_date, coverage_start, coverage_end, claim_status) 
VALUES
(1, 1, 1, 'LIC', 'LICAIR001', 500000.00, '2024-06-01', '2024-07-01', '2024-07-10', 'No Claim'),
(2, 2, 2, 'ICICI Lombard', 'ICICI102', 300000.00, '2024-06-02', '2024-07-02', '2024-07-11', 'No Claim'),
(3, 3, 3, 'HDFC Ergo', 'HDFC303', 400000.00, '2024-06-03', '2024-07-03', '2024-07-12', 'No Claim'),
(4, 4, 4, 'TATA AIG', 'TATA404', 250000.00, '2024-06-04', '2024-07-04', '2024-07-13', 'Claimed'),
(5, 5, 5, 'Bajaj Allianz', 'BAJ505', 350000.00, '2024-06-05', '2024-07-05', '2024-07-14', 'No Claim'),
(6, 6, 6, 'Star Health', 'STAR606', 300000.00, '2024-06-06', '2024-07-06', '2024-07-15', 'Claimed'),
(7, 7, 7, 'Reliance General', 'REL707', 500000.00, '2024-06-07', '2024-07-07', '2024-07-16', 'No Claim'),
(8, 8, 8, 'Oriental Insurance', 'ORI808', 400000.00, '2024-06-08', '2024-07-08', '2024-07-17', 'No Claim'),
(9, 9, 9, 'National Insurance', 'NAT909', 450000.00, '2024-06-09', '2024-07-09', '2024-07-18', 'Claimed'),
(10, 10, 10, 'United India', 'UI010', 250000.00, '2024-06-10', '2024-07-10', '2024-07-19', 'No Claim'),
(11, 11, 11, 'Future Generali', 'FG111', 300000.00, '2024-06-11', '2024-07-11', '2024-07-20', 'Claimed'),
(12, 12, 12, 'New India Assurance', 'NIA1212', 500000.00, '2024-06-12', '2024-07-12', '2024-07-21', 'No Claim'),
(13, 13, 13, 'SBI General', 'SBI1313', 400000.00, '2024-06-13', '2024-07-13', '2024-07-22', 'No Claim'),
(14, 14, 14, 'Bharti AXA', 'BXA1414', 350000.00, '2024-06-14', '2024-07-14', '2024-07-23', 'Claimed'),
(15, 15, 15, 'IFFCO Tokio', 'IFF1515', 450000.00, '2024-06-15', '2024-07-15', '2024-07-24', 'No Claim');

-- to display/retrieve table data
SELECT * FROM Travel_Insurance;               

-- to remove complete data from table
truncate table Travel_Insurance;

-- to delete complete attributes and records 
drop table Travel_Insurance;

-- Table 12: Baggage_Tracking
CREATE TABLE Baggage_Tracking (
    baggage_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    tag_number VARCHAR(50),
    checkin_time TIME,
    loaded_time TIME,
    unload_time TIME,
    delivery_status VARCHAR(50),
    current_location VARCHAR(100),
    remarks TEXT,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert records into the table
INSERT INTO Baggage_Tracking (baggage_id, passenger_id, flight_id, tag_number,checkin_time, loaded_time, unload_time, delivery_status,current_location, remarks) 
VALUES
(1, 1, 1, 'BAG001IND', '08:30:00', '09:00:00', '11:20:00', 'Delivered', 'Delhi Terminal 3', 'No issues'),
(2, 2, 2, 'BAG002MUM', '07:45:00', '08:10:00', '10:00:00', 'Delivered', 'Mumbai Terminal 2', 'On time'),
(3, 3, 3, 'BAG003BLR', '09:10:00', '09:30:00', '11:55:00', 'In Transit', 'Bangalore Gate 4', 'Delayed arrival'),
(4, 4, 4, 'BAG004HYD', '10:00:00', '10:20:00', '12:15:00', 'Delivered', 'Hyderabad Belt 2', 'Slight damage'),
(5, 5, 5, 'BAG005CCU', '11:15:00', '11:40:00', '13:00:00', 'Delivered', 'Kolkata Belt 3', 'No remarks'),
(6, 6, 6, 'BAG006COK', '06:20:00', '06:45:00', '08:10:00', 'Lost', 'Unknown', 'Filed complaint'),
(7, 7, 7, 'BAG007AMD', '12:00:00', '12:30:00', '14:10:00', 'Delivered', 'Ahmedabad Terminal 1', 'Handled well'),
(8, 8, 8, 'BAG008GOI', '13:30:00', '13:55:00', '15:20:00', 'Delivered', 'Goa Belt 1', 'Good'),
(9, 9, 9, 'BAG009JAI', '07:00:00', '07:25:00', '09:00:00', 'Delivered', 'Jaipur Arrival', 'No damage'),
(10, 10, 10, 'BAG010BBI', '14:15:00', '14:45:00', '16:00:00', 'Delayed', 'Bhubaneswar Hold Area', 'Under check'),
(11, 11, 11, 'BAG011VNS', '08:40:00', '09:10:00', '11:10:00', 'Delivered', 'Varanasi Belt 5', 'All clear'),
(12, 12, 12, 'BAG012ATQ', '09:30:00', '09:55:00', '12:00:00', 'Delivered', 'Amritsar Terminal 2', 'Ok'),
(13, 13, 13, 'BAG013GAU', '10:25:00', '10:50:00', '13:10:00', 'Delivered', 'Guwahati Belt 1', 'Fine'),
(14, 14, 14, 'BAG014NAG', '06:00:00', '06:30:00', '08:00:00', 'Delivered', 'Nagpur Exit', 'Perfect'),
(15, 15, 15, 'BAG015DEL', '11:50:00', '12:20:00', '14:15:00', 'Lost', 'Unknown', 'Investigation ongoing');

-- to display/retrieve table data
SELECT * FROM Baggage_Tracking;               

-- to remove complete data from table
truncate table Baggage_Tracking;

-- to delete complete attributes and records 
drop table Baggage_Tracking;

-- Table 13: InFlight_Services
CREATE TABLE InFlight_Services (
    service_id INT PRIMARY KEY,
    flight_id INT,
    service_type VARCHAR(50),
    description TEXT,
    availability_status VARCHAR(20),
    provider_name VARCHAR(100),
    cost DECIMAL(10,2),
    feedback_score FLOAT,
    service_time TIME,
    remarks TEXT,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert records into the table
INSERT INTO InFlight_Services (service_id, flight_id, service_type, description,availability_status, provider_name, cost, feedback_score,service_time, remarks) 
VALUES
(1, 1, 'Meal', 'Veg thali with dessert', 'Available', 'IndiChef Pvt Ltd', 350.00, 4.5, '12:30:00', 'Well received'),
(2, 2, 'Wi-Fi', 'Internet access up to 500MB', 'Available', 'Airtel Sky', 200.00, 4.2, '13:00:00', 'Stable connection'),
(3, 3, 'Entertainment', 'Hindi and English movies', 'Available', 'JetScreen', 0.00, 4.7, '12:15:00', 'Good selection'),
(4, 4, 'Meal', 'South Indian meal', 'Available', 'Taj Catering', 300.00, 4.3, '13:45:00', 'Hot and fresh'),
(5, 5, 'Wi-Fi', 'Unlimited browsing', 'Unavailable', 'JioSky', 0.00, 0.0, '13:20:00', 'Service down'),
(6, 6, 'Entertainment', 'Live TV and shows', 'Available', 'TataSkyAir', 100.00, 4.0, '14:00:00', 'Few lags'),
(7, 7, 'Meal', 'Non-veg meal with drink', 'Available', 'Air Spice Kitchen', 450.00, 4.6, '12:00:00', 'Tasty'),
(8, 8, 'Wi-Fi', 'Premium internet', 'Available', 'VistaraNet', 250.00, 4.1, '14:15:00', 'Good speed'),
(9, 9, 'Entertainment', 'Games and apps', 'Available', 'GameOnAir', 0.00, 4.3, '12:45:00', 'Fun for kids'),
(10, 10, 'Meal', 'Gujarati thali', 'Available', 'Navratna Foods', 280.00, 4.4, '13:30:00', 'Excellent'),
(11, 11, 'Meal', 'Sandwich with juice', 'Available', 'SnackPoint India', 220.00, 4.0, '12:20:00', 'Fresh'),
(12, 12, 'Wi-Fi', '500MB package', 'Available', 'BSNL AirNet', 150.00, 3.8, '13:10:00', 'Average performance'),
(13, 13, 'Entertainment', 'Music & Podcasts', 'Available', 'Saavn AirPlay', 0.00, 4.2, '12:50:00', 'Relaxing'),
(14, 14, 'Meal', 'Kids special meal', 'Available', 'Chhota Chef Pvt Ltd', 250.00, 4.5, '13:40:00', 'Perfect for children'),
(15, 15, 'Wi-Fi', 'High speed 1GB', 'Unavailable', 'Vodafone SkyNet', 0.00, 0.0, '14:30:00', 'Technical issue');

-- to display/retrieve table data
SELECT * FROM InFlight_Services;               

-- to remove complete data from table
truncate table InFlight_Services;

-- to delete complete attributes and records 
drop table InFlight_Services;

-- Table 14: Lounge_Access
CREATE TABLE Lounge_Access (
    access_id INT PRIMARY KEY,
    passenger_id INT,
    lounge_name VARCHAR(100),
    airport_code VARCHAR(10),
    access_time TIME,
    access_date DATE,
    duration_minutes INT,
    access_type VARCHAR(50),
    amenities_used TEXT,
    feedback_rating INT CHECK (feedback_rating BETWEEN 1 AND 5),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

-- Insert records into the table
INSERT INTO Lounge_Access (access_id, passenger_id, lounge_name, airport_code,access_time, access_date, duration_minutes, access_type,amenities_used, feedback_rating)
 VALUES
(1, 1, 'Maharaja Lounge', 'DEL', '08:00:00', '2024-07-01', 90, 'Premium', 'Wi-Fi, Snacks, Rest Area', 5),
(2, 2, 'Travel Club', 'BOM', '09:15:00', '2024-07-02', 60, 'Standard', 'Beverages, Magazines', 4),
(3, 3, 'Above Ground Lounge', 'BLR', '10:00:00', '2024-07-03', 75, 'Premium', 'Snacks, Work Desk', 4),
(4, 4, 'TFS Lounge', 'HYD', '07:45:00', '2024-07-04', 80, 'Standard', 'Wi-Fi, Juice Bar', 3),
(5, 5, 'Plaza Premium', 'CCU', '06:30:00', '2024-07-05', 90, 'Premium', 'Massage Chair, Breakfast', 5),
(6, 6, 'Clipper Lounge', 'COK', '11:20:00', '2024-07-06', 50, 'Standard', 'Tea, News Papers', 3),
(7, 7, 'Port Lounge', 'AMD', '12:10:00', '2024-07-07', 70, 'Premium', 'Buffet, Recliner Seats', 5),
(8, 8, 'VIP Sky Lounge', 'GOI', '13:00:00', '2024-07-08', 60, 'Standard', 'Coffee, Sofa Area', 4),
(9, 9, 'Fly Lounge', 'JAI', '14:25:00', '2024-07-09', 65, 'Premium', 'Fruit Platter, Music', 4),
(10, 10, 'Sky Hospitality', 'BBI', '10:10:00', '2024-07-10', 45, 'Standard', 'Water, Wi-Fi', 3),
(11, 11, 'Airspace Lounge', 'VNS', '08:35:00', '2024-07-11', 85, 'Premium', 'Mini Meal, Work Area', 5),
(12, 12, 'Serenity Lounge', 'ATQ', '09:00:00', '2024-07-12', 70, 'Premium', 'Coffee, Phone Charging', 4),
(13, 13, 'Departure Lounge', 'GAU', '07:50:00', '2024-07-13', 90, 'Standard', 'Soft Drinks, AC Zone', 3),
(14, 14, 'Sky Delight', 'NAG', '11:15:00', '2024-07-14', 60, 'Premium', 'Sandwich, Work Pod', 5),
(15, 15, 'Elite Lounge', 'DEL', '13:45:00', '2024-07-15', 75, 'Premium', 'TV, Snacks, Wi-Fi', 4);

-- to display/retrieve table data
SELECT * FROM Lounge_Access;               

-- to remove complete data from table
truncate table Lounge_Access;

-- to delete complete attributes and records 
drop table Lounge_Access;

-- Table 15: Airport_Services
CREATE TABLE Airport_Services (
    service_id INT PRIMARY KEY,
    passenger_id INT,
    airport_code VARCHAR(10),
    service_type VARCHAR(50),
    request_date DATE,
    status VARCHAR(20),
    provider_name VARCHAR(100),
    remarks TEXT,
    request_time TIME,
    contact_number VARCHAR(15),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

-- Insert records into the table
INSERT INTO Airport_Services (service_id, passenger_id, airport_code, service_type, request_date,status, provider_name, remarks, request_time, contact_number)
 VALUES
(1, 1, 'DEL', 'Wheelchair', '2024-07-01', 'Completed', 'Delhi Ground Staff', 'Delivered to gate', '07:30:00', '9876543210'),
(2, 2, 'BOM', 'Buggy Ride', '2024-07-02', 'Pending', 'Mumbai Terminal Assist', 'Delayed due to crowd', '08:00:00', '9812345670'),
(3, 3, 'BLR', 'Porter', '2024-07-03', 'Completed', 'Bangalore Porter Svc', 'Handled with care', '09:15:00', '9123456781'),
(4, 4, 'HYD', 'Wheelchair', '2024-07-04', 'Completed', 'Hyderabad Mobility', 'On-time service', '10:20:00', '8899001122'),
(5, 5, 'CCU', 'Escort', '2024-07-05', 'Completed', 'Kolkata Helpers', 'Escorted to lounge', '07:40:00', '7788990011'),
(6, 6, 'COK', 'Buggy Ride', '2024-07-06', 'Cancelled', 'Cochin Services', 'Passenger rescheduled', '06:55:00', '9988776655'),
(7, 7, 'AMD', 'Porter', '2024-07-07', 'Completed', 'Ahmedabad Porter', 'Luggage safe', '09:30:00', '7665544332'),
(8, 8, 'GOI', 'Wheelchair', '2024-07-08', 'Pending', 'Goa Mobility Help', 'Assigned but delayed', '08:45:00', '9432109876'),
(9, 9, 'JAI', 'Escort', '2024-07-09', 'Completed', 'Jaipur Airport Crew', 'Smooth transition', '10:10:00', '8123456790'),
(10, 10, 'BBI', 'Buggy Ride', '2024-07-10', 'Completed', 'Bhubaneswar Assist', 'Timely and smooth', '11:00:00', '9700012345'),
(11, 11, 'VNS', 'Porter', '2024-07-11', 'Completed', 'Varanasi Helpdesk', 'Handled professionally', '09:20:00', '7012345678'),
(12, 12, 'ATQ', 'Wheelchair', '2024-07-12', 'Completed', 'Amritsar Mobility', 'Quick assistance', '07:50:00', '9321008765'),
(13, 13, 'GAU', 'Escort', '2024-07-13', 'Completed', 'Guwahati Service', 'Senior citizen help', '08:40:00', '8888777766'),
(14, 14, 'NAG', 'Buggy Ride', '2024-07-14', 'Completed', 'Nagpur Quick Move', 'Comfortable ride', '09:35:00', '9090909090'),
(15, 15, 'DEL', 'Porter', '2024-07-15', 'Completed', 'Delhi Porter Boys', 'All bags handled', '10:25:00', '8008008008');

-- to display/retrieve table data
SELECT * FROM Airport_Services;               

-- to remove complete data from table
truncate table Airport_Services;

-- to delete complete attributes and records 
drop table Airport_Services;

