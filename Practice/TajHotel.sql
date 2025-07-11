-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database Taj_Hotel;

-- to work on it, you need to use it first
use Taj_Hotel;

-- Delete a database
Drop database Taj_Hotel;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Guests (guest_id, name, email, phone_number, gender, date_of_birth,address, city, nationality, id_proof)

T2 : Rooms (room_id, room_number, room_type, bed_type, price_per_night,status, floor, ac_available, sea_view, max_occupancy) 

T3 : Bookings (booking_id, guest_id, room_id, check_in, check_out,booking_date, status, total_amount, payment_status, booking_source) 

T4 : Staff (staff_id, name, gender, phone_number, email, position,department, hire_date, salary, shift_time)

T5 : Departments (dept_id, dept_name, manager_name, phone_extension, email,floor_number, number_of_staff, established_date, shift_time, status) 

T6 : Payments (payment_id, booking_id, guest_id, amount, payment_date,payment_mode, transaction_id, status, received_by, gst_amount)

T7 : Room_Service (service_id, booking_id, guest_id, service_type, description,request_time, delivered_time, status, staff_assigned, charges)

T8 : Feedback (feedback_id, guest_id, booking_id, feedback_text, rating,feedback_date, response_text, responded_by, status, feedback_type) 

T9 :  Menu (item_id, item_name, description, category, price,is_veg, available, preparation_time, added_by, added_date)

T10 : Inventory (item_id, item_name, category, quantity, unit,last_stocked, supplier_name, cost_per_unit, status, managed_by)

T11 : Events (event_id, event_name, event_date, start_time, end_time,venue, organized_by, contact_number, status, guest_count)

T12 : Suppliers (supplier_id, supplier_name, contact_person, phone_number, email,address, city, state, category_supplied, status) 

T13 : Staff_Attendance (attendance_id, staff_id, staff_name, role, date,check_in, check_out, status, shift, remarks)

T14 : Complaints (complaint_id, guest_id, room_id, complaint_type, description,complaint_date, status, resolved_date, handled_by, remarks)

T15 : Maintenance (maintenance_id, department, issue_description, reported_date, resolved_date,status, assigned_to, cost_estimate, actual_cost, remarks) 

*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Guests
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    gender VARCHAR(10),
    date_of_birth DATE,
    address TEXT,
    city VARCHAR(50),
    nationality VARCHAR(50),
    id_proof VARCHAR(50)
);

-- Insert records into the table
INSERT INTO Guests (guest_id, name, email, phone_number, gender, date_of_birth,address, city, nationality, id_proof)
 VALUES
(1, 'Aarav Mehta', 'aarav.mehta@gmail.com', '9876543210', 'Male', '1995-03-12', '12 MG Road', 'Mumbai', 'Indian', 'Aadhar'),
(2, 'Priya Sharma', 'priya.sharma@yahoo.com', '9867123456', 'Female', '1992-07-25', '56 Nehru Street', 'Delhi', 'Indian', 'Passport'),
(3, 'Rohan Verma', 'rohan.v@gmail.com', '9812345678', 'Male', '1990-11-04', '44 Residency Rd', 'Bangalore', 'Indian', 'Aadhar'),
(4, 'Sneha Iyer', 'sneha.iyer@gmail.com', '9845123789', 'Female', '1998-01-19', '89 Indira Nagar', 'Chennai', 'Indian', 'Voter ID'),
(5, 'Vikram Patel', 'vikramp@outlook.com', '9823456710', 'Male', '1988-06-23', '13 Satellite Road', 'Ahmedabad', 'Indian', 'Driving License'),
(6, 'Anjali Reddy', 'anjali.reddy@gmail.com', '9832145896', 'Female', '1994-04-08', '33 Jubilee Hills', 'Hyderabad', 'Indian', 'Passport'),
(7, 'Karan Singh', 'karan_singh@gmail.com', '9745632187', 'Male', '1993-09-15', '78 Civil Lines', 'Lucknow', 'Indian', 'Aadhar'),
(8, 'Pooja Joshi', 'pooja.j@gmail.com', '9887654321', 'Female', '1996-12-01', '22 Shastri Nagar', 'Pune', 'Indian', 'Voter ID'),
(9, 'Arjun Das', 'arjun.das@yahoo.com', '9723456781', 'Male', '1991-05-17', '66 Park Street', 'Kolkata', 'Indian', 'Passport'),
(10, 'Divya Nair', 'divya.nair@gmail.com', '9765432189', 'Female', '1997-10-10', '14 Marine Drive', 'Cochin', 'Indian', 'Aadhar'),
(11, 'Rahul Jain', 'rahul.jain@rediffmail.com', '9798456123', 'Male', '1989-08-30', '80 Ashok Vihar', 'Jaipur', 'Indian', 'Driving License'),
(12, 'Meera Shah', 'meera.s@zmail.com', '9812345901', 'Female', '1995-02-14', '29 Ghatkopar East', 'Mumbai', 'Indian', 'Aadhar'),
(13, 'Nikhil Aggarwal', 'nikhil.a@gmail.com', '9789023456', 'Male', '1993-07-07', '17 Connaught Place', 'Delhi', 'Indian', 'Passport'),
(14, 'Swati Kulkarni', 'swati.kulkarni@gmail.com', '9876540987', 'Female', '1996-03-05', '42 FC Road', 'Pune', 'Indian', 'Voter ID'),
(15, 'Amitabh Rao', 'amitabh.rao@gmail.com', '9732165478', 'Male', '1987-11-11', '59 MG Road', 'Bangalore', 'Indian', 'Driving License');

-- to display/retrieve table data
SELECT * FROM Guests;               

-- to remove complete data from table
truncate table Guests;

-- to delete complete attributes and records 
drop table Guests;

-- Table 2: Rooms
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE,
    room_type VARCHAR(50),
    bed_type VARCHAR(50),
    price_per_night DECIMAL(10,2),
    status VARCHAR(20),
    floor INT,
    ac_available BOOLEAN,
    sea_view BOOLEAN,
    max_occupancy INT
);

-- Insert records into the table
INSERT INTO Rooms (room_id, room_number, room_type, bed_type, price_per_night,status, floor, ac_available, sea_view, max_occupancy) 
VALUES
(1, '101', 'Deluxe', 'King', 4500.00, 'Available', 1, TRUE, TRUE, 3),
(2, '102', 'Standard', 'Queen', 3000.00, 'Occupied', 1, TRUE, FALSE, 2),
(3, '103', 'Suite', 'King', 7000.00, 'Available', 1, TRUE, TRUE, 4),
(4, '104', 'Executive', 'Twin', 5000.00, 'Cleaning', 1, TRUE, FALSE, 3),
(5, '201', 'Deluxe', 'Queen', 4200.00, 'Available', 2, TRUE, TRUE, 2),
(6, '202', 'Standard', 'Single', 2800.00, 'Occupied', 2, FALSE, FALSE, 1),
(7, '203', 'Suite', 'King', 7500.00, 'Available', 2, TRUE, TRUE, 4),
(8, '204', 'Executive', 'Queen', 4700.00, 'Under Maintenance', 2, TRUE, FALSE, 2),
(9, '301', 'Deluxe', 'Twin', 4300.00, 'Available', 3, TRUE, TRUE, 3),
(10, '302', 'Standard', 'Single', 2500.00, 'Available', 3, FALSE, FALSE, 1),
(11, '303', 'Suite', 'King', 8000.00, 'Occupied', 3, TRUE, TRUE, 4),
(12, '304', 'Executive', 'Twin', 4800.00, 'Available', 3, TRUE, FALSE, 2),
(13, '401', 'Presidential Suite', 'King', 15000.00, 'Reserved', 4, TRUE, TRUE, 5),
(14, '402', 'Deluxe', 'Queen', 4600.00, 'Occupied', 4, TRUE, TRUE, 3),
(15, '403', 'Standard', 'Single', 2700.00, 'Available', 4, FALSE, FALSE, 1);

-- to display/retrieve table data
SELECT * FROM Rooms;               

-- to remove complete data from table
truncate table Rooms;

-- to delete complete attributes and records 
drop table Rooms;

-- Table 3: Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    booking_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    booking_source VARCHAR(50),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Insert records into the table
INSERT INTO Bookings (booking_id, guest_id, room_id, check_in, check_out,booking_date, status, total_amount, payment_status, booking_source)
 VALUES
(1, 1, 1, '2024-07-01', '2024-07-04', '2024-06-20', 'Confirmed', 13500.00, 'Paid', 'Website'),
(2, 2, 2, '2024-07-02', '2024-07-05', '2024-06-21', 'Checked-In', 9000.00, 'Paid', 'App'),
(3, 3, 3, '2024-07-05', '2024-07-09', '2024-06-22', 'Confirmed', 28000.00, 'Unpaid', 'Travel Agent'),
(4, 4, 4, '2024-07-06', '2024-07-07', '2024-06-23', 'Cancelled', 5000.00, 'Refunded', 'Website'),
(5, 5, 5, '2024-07-08', '2024-07-10', '2024-06-24', 'Confirmed', 8400.00, 'Paid', 'Phone'),
(6, 6, 6, '2024-07-10', '2024-07-12', '2024-06-25', 'Checked-In', 5600.00, 'Paid', 'App'),
(7, 7, 7, '2024-07-11', '2024-07-14', '2024-06-26', 'Confirmed', 22500.00, 'Paid', 'Travel Agent'),
(8, 8, 8, '2024-07-15', '2024-07-17', '2024-06-27', 'Cancelled', 9400.00, 'Refunded', 'Phone'),
(9, 9, 9, '2024-07-18', '2024-07-21', '2024-06-28', 'Confirmed', 12900.00, 'Unpaid', 'Website'),
(10, 10, 10, '2024-07-20', '2024-07-22', '2024-06-29', 'Checked-In', 5000.00, 'Paid', 'App'),
(11, 11, 11, '2024-07-22', '2024-07-25', '2024-06-30', 'Confirmed', 24000.00, 'Paid', 'Travel Agent'),
(12, 12, 12, '2024-07-23', '2024-07-26', '2024-07-01', 'Confirmed', 14400.00, 'Unpaid', 'Phone'),
(13, 13, 13, '2024-07-24', '2024-07-28', '2024-07-02', 'Reserved', 60000.00, 'Paid', 'Website'),
(14, 14, 14, '2024-07-25', '2024-07-27', '2024-07-03', 'Confirmed', 9200.00, 'Unpaid', 'App'),
(15, 15, 15, '2024-07-26', '2024-07-29', '2024-07-04', 'Confirmed', 8100.00, 'Paid', 'Phone');

-- to display/retrieve table data
SELECT * FROM Bookings;               

-- to remove complete data from table
truncate table Bookings;

-- to delete complete attributes and records 
drop table Bookings;

-- Table 4: Staff
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    position VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2),
    shift_time VARCHAR(50)
);

-- Insert records into the table
INSERT INTO Staff (staff_id, name, gender, phone_number, email, position,department, hire_date, salary, shift_time)
 VALUES
(1, 'Rajiv Menon', 'Male', '9876543210', 'rajiv.menon@taj.com', 'Manager', 'Front Office', '2019-03-01', 55000.00, 'Morning'),
(2, 'Sunita Nair', 'Female', '9823412789', 'sunita.nair@taj.com', 'Receptionist', 'Front Office', '2020-05-15', 30000.00, 'Morning'),
(3, 'Amitabh Rao', 'Male', '9812345678', 'amitabh.rao@taj.com', 'Chef', 'Kitchen', '2018-11-20', 60000.00, 'Evening'),
(4, 'Neha Joshi', 'Female', '9887654321', 'neha.joshi@taj.com', 'Housekeeper', 'Housekeeping', '2021-01-10', 25000.00, 'Morning'),
(5, 'Rakesh Sharma', 'Male', '9765432189', 'rakesh.sharma@taj.com', 'Security Officer', 'Security', '2017-07-05', 32000.00, 'Night'),
(6, 'Priya Verma', 'Female', '9745632187', 'priya.verma@taj.com', 'Waitress', 'Restaurant', '2022-02-14', 22000.00, 'Evening'),
(7, 'Kunal Mehta', 'Male', '9723456781', 'kunal.mehta@taj.com', 'Electrician', 'Maintenance', '2016-08-25', 27000.00, 'Day'),
(8, 'Swati Kulkarni', 'Female', '9798456123', 'swati.kulkarni@taj.com', 'Spa Therapist', 'Spa', '2019-09-18', 35000.00, 'Morning'),
(9, 'Nikhil Aggarwal', 'Male', '9732165478', 'nikhil.aggarwal@taj.com', 'Manager', 'Restaurant', '2018-12-03', 48000.00, 'Evening'),
(10, 'Pooja Iyer', 'Female', '9812345901', 'pooja.iyer@taj.com', 'Cashier', 'Billing', '2020-06-30', 26000.00, 'Morning'),
(11, 'Anil Kapoor', 'Male', '9834567890', 'anil.kapoor@taj.com', 'Driver', 'Transport', '2017-03-22', 24000.00, 'Day'),
(12, 'Divya Nair', 'Female', '9789023456', 'divya.nair@taj.com', 'Receptionist', 'Front Office', '2021-08-10', 29000.00, 'Night'),
(13, 'Vikram Desai', 'Male', '9841234567', 'vikram.desai@taj.com', 'Technician', 'IT', '2022-01-05', 37000.00, 'Day'),
(14, 'Meera Shah', 'Female', '9867123456', 'meera.shah@taj.com', 'Chef', 'Bakery', '2019-10-01', 44000.00, 'Morning'),
(15, 'Rohan Verma', 'Male', '9891234567', 'rohan.verma@taj.com', 'Bell Boy', 'Front Office', '2022-03-20', 21000.00, 'Evening');

-- to display/retrieve table data
SELECT * FROM Staff;               

-- to remove complete data from table
truncate table Staff;

-- to delete complete attributes and records 
drop table Staff;

-- Table 5: 
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    manager_name VARCHAR(100),
    phone_extension VARCHAR(10),
    email VARCHAR(100),
    floor_number INT,
    number_of_staff INT,
    established_date DATE,
    shift_time VARCHAR(50),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Departments (dept_id, dept_name, manager_name, phone_extension, email,floor_number, number_of_staff, established_date, shift_time, status) 
    VALUES
(1, 'Front Office', 'Rajiv Menon', '101', 'frontoffice@taj.com', 1, 12, '2000-01-15', '24x7', 'Active'),
(2, 'Housekeeping', 'Neha Joshi', '102', 'housekeeping@taj.com', 2, 20, '2002-06-01', 'Morning', 'Active'),
(3, 'Kitchen', 'Amitabh Rao', '103', 'kitchen@taj.com', 1, 25, '1999-12-10', 'Day & Night', 'Active'),
(4, 'Security', 'Rakesh Sharma', '104', 'security@taj.com', 0, 10, '2001-03-22', '24x7', 'Active'),
(5, 'Restaurant', 'Nikhil Aggarwal', '105', 'restaurant@taj.com', 1, 15, '2005-04-05', 'Evening', 'Active'),
(6, 'Spa', 'Swati Kulkarni', '106', 'spa@taj.com', 3, 8, '2010-11-11', 'Morning', 'Active'),
(7, 'Transport', 'Anil Kapoor', '107', 'transport@taj.com', -1, 6, '2003-07-07', 'Day', 'Active'),
(8, 'IT', 'Vikram Desai', '108', 'it@taj.com', 4, 5, '2012-08-15', 'Day', 'Active'),
(9, 'Bakery', 'Meera Shah', '109', 'bakery@taj.com', 1, 6, '2006-02-20', 'Morning', 'Active'),
(10, 'Billing', 'Pooja Iyer', '110', 'billing@taj.com', 1, 4, '2004-09-09', 'Morning', 'Active'),
(11, 'Maintenance', 'Kunal Mehta', '111', 'maintenance@taj.com', -1, 8, '2000-05-01', 'Day', 'Active'),
(12, 'Laundry', 'Rohit Sen', '112', 'laundry@taj.com', -1, 7, '2001-01-01', 'Morning', 'Active'),
(13, 'Event Management', 'Sneha Iyer', '113', 'events@taj.com', 2, 10, '2013-03-03', 'Flexible', 'Active'),
(14, 'Guest Relations', 'Priya Verma', '114', 'guestrelations@taj.com', 1, 5, '2015-06-15', 'Morning', 'Active'),
(15, 'HR', 'Divya Nair', '115', 'hr@taj.com', 5, 3, '2011-10-10', 'Day', 'Active');

-- to display/retrieve table data
SELECT * FROM Departments;               

-- to remove complete data from table
truncate table Departments;

-- to delete complete attributes and records 
drop table Departments;

-- Table 6: Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    guest_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(50),
    transaction_id VARCHAR(100),
    status VARCHAR(20),
    received_by VARCHAR(100),
    gst_amount DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id)
);

-- Insert records into the table
INSERT INTO Payments (payment_id, booking_id, guest_id, amount, payment_date,payment_mode, transaction_id, status, received_by, gst_amount)
 VALUES
(1, 1, 1, 13500.00, '2024-06-21', 'Credit Card', 'TXN1001', 'Paid', 'Rajiv Menon', 1620.00),
(2, 2, 2, 9000.00, '2024-06-22', 'UPI', 'TXN1002', 'Paid', 'Sunita Nair', 1080.00),
(3, 3, 3, 0.00, NULL, 'Cash', NULL, 'Pending', NULL, 0.00),
(4, 4, 4, 0.00, NULL, 'Net Banking', NULL, 'Refunded', NULL, 0.00),
(5, 5, 5, 8400.00, '2024-06-25', 'UPI', 'TXN1005', 'Paid', 'Pooja Iyer', 1008.00),
(6, 6, 6, 5600.00, '2024-06-26', 'Cash', 'TXN1006', 'Paid', 'Rakesh Sharma', 672.00),
(7, 7, 7, 22500.00, '2024-06-27', 'Credit Card', 'TXN1007', 'Paid', 'Priya Verma', 2700.00),
(8, 8, 8, 0.00, NULL, 'Net Banking', NULL, 'Refunded', NULL, 0.00),
(9, 9, 9, 0.00, NULL, 'UPI', NULL, 'Unpaid', NULL, 0.00),
(10, 10, 10, 5000.00, '2024-06-30', 'Cash', 'TXN1010', 'Paid', 'Neha Joshi', 600.00),
(11, 11, 11, 24000.00, '2024-07-01', 'UPI', 'TXN1011', 'Paid', 'Rohan Verma', 2880.00),
(12, 12, 12, 0.00, NULL, 'Credit Card', NULL, 'Unpaid', NULL, 0.00),
(13, 13, 13, 60000.00, '2024-07-02', 'Net Banking', 'TXN1013', 'Paid', 'Swati Kulkarni', 7200.00),
(14, 14, 14, 0.00, NULL, 'UPI', NULL, 'Unpaid', NULL, 0.00),
(15, 15, 15, 8100.00, '2024-07-04', 'Cash', 'TXN1015', 'Paid', 'Anil Kapoor', 972.00);

-- to display/retrieve table data
SELECT * FROM Payments;               

-- to remove complete data from table
truncate table Payments;

-- to delete complete attributes and records 
drop table Payments;

-- Table 7: Room_Service
CREATE TABLE Room_Service (
    service_id INT PRIMARY KEY,
    booking_id INT,
    guest_id INT,
    service_type VARCHAR(100),
    description TEXT,
    request_time DATETIME,
    delivered_time DATETIME,
    status VARCHAR(20),
    staff_assigned VARCHAR(100),
    charges DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id)
);

-- Insert records into the table
INSERT INTO Room_Service (service_id, booking_id, guest_id, service_type, description,request_time, delivered_time, status, staff_assigned, charges)
    VALUES
(1, 1, 1, 'Food Delivery', 'Paneer Butter Masala & Naan', '2024-07-01 13:00:00', '2024-07-01 13:30:00', 'Completed', 'Priya Verma', 450.00),
(2, 2, 2, 'Laundry', '2 Shirts, 1 Trousers', '2024-07-02 09:00:00', '2024-07-02 18:00:00', 'Completed', 'Rakesh Sharma', 300.00),
(3, 3, 3, 'Extra Towels', 'Need 2 extra bath towels', '2024-07-05 10:15:00', '2024-07-05 10:30:00', 'Completed', 'Neha Joshi', 0.00),
(4, 4, 4, 'Food Delivery', 'Idli & Sambhar', '2024-07-06 08:00:00', '2024-07-06 08:30:00', 'Cancelled', 'Sunita Nair', 220.00),
(5, 5, 5, 'Room Cleaning', 'Full room cleaning requested', '2024-07-08 11:00:00', '2024-07-08 12:00:00', 'Completed', 'Kunal Mehta', 0.00),
(6, 6, 6, 'Laundry', '5 clothing items', '2024-07-10 15:00:00', '2024-07-10 20:00:00', 'Completed', 'Meera Shah', 500.00),
(7, 7, 7, 'Tea Service', '2 cups masala chai', '2024-07-11 07:30:00', '2024-07-11 07:50:00', 'Completed', 'Pooja Iyer', 100.00),
(8, 8, 8, 'Food Delivery', 'Chicken Biryani', '2024-07-15 14:00:00', NULL, 'Pending', 'Amitabh Rao', 350.00),
(9, 9, 9, 'WiFi Assistance', 'WiFi not working properly', '2024-07-18 19:00:00', '2024-07-18 19:30:00', 'Completed', 'Vikram Desai', 0.00),
(10, 10, 10, 'Spa Booking', 'Head Massage appointment', '2024-07-20 16:00:00', '2024-07-20 16:15:00', 'Completed', 'Swati Kulkarni', 1200.00),
(11, 11, 11, 'Food Delivery', 'Veg Thali', '2024-07-22 13:30:00', '2024-07-22 14:00:00', 'Completed', 'Rajiv Menon', 400.00),
(12, 12, 12, 'Wake-Up Call', 'Call at 6:00 AM', '2024-07-23 05:50:00', '2024-07-23 06:00:00', 'Completed', 'Divya Nair', 0.00),
(13, 13, 13, 'Extra Bed', 'Requesting one extra bed', '2024-07-24 21:00:00', '2024-07-24 21:30:00', 'Completed', 'Rohan Verma', 700.00),
(14, 14, 14, 'Laundry', 'Urgent ironing', '2024-07-25 08:00:00', '2024-07-25 10:00:00', 'Completed', 'Neha Joshi', 200.00),
(15, 15, 15, 'Food Delivery', 'Tandoori Chicken', '2024-07-26 20:00:00', '2024-07-26 20:45:00', 'Completed', 'Priya Verma', 480.00);

-- to display/retrieve table data
SELECT * FROM Room_Service;               

-- to remove complete data from table
truncate table Room_Service;

-- to delete complete attributes and records 
drop table Room_Service;

-- Table 8: FeedBack
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    guest_id INT,
    booking_id INT,
    feedback_text TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    feedback_date DATE,
    response_text TEXT,
    responded_by VARCHAR(100),
    status VARCHAR(20),
    feedback_type VARCHAR(50),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Insert records into the table
INSERT INTO Feedback (feedback_id, guest_id, booking_id, feedback_text, rating,feedback_date, response_text, responded_by, status, feedback_type) 
VALUES
(1, 1, 1, 'Excellent service and room quality.', 5, '2024-07-04', 'Thank you!', 'Rajiv Menon', 'Responded', 'Room'),
(2, 2, 2, 'Great staff and food.', 4, '2024-07-06', 'Glad you enjoyed.', 'Pooja Iyer', 'Responded', 'Food'),
(3, 3, 3, 'Room was good but WiFi was slow.', 3, '2024-07-09', 'We are upgrading WiFi.', 'Vikram Desai', 'Responded', 'Facilities'),
(4, 4, 4, 'Booking was cancelled. Still awaiting refund.', 2, '2024-07-07', 'Refund issued.', 'Sunita Nair', 'Resolved', 'Booking'),
(5, 5, 5, 'Clean and peaceful environment.', 5, '2024-07-10', 'Thank you for your kind words.', 'Neha Joshi', 'Responded', 'General'),
(6, 6, 6, 'Laundry was delayed.', 3, '2024-07-12', 'We apologize.', 'Meera Shah', 'Responded', 'Laundry'),
(7, 7, 7, 'Loved the view from the room.', 5, '2024-07-14', 'We appreciate your feedback.', 'Rajiv Menon', 'Responded', 'Room'),
(8, 8, 8, 'Food was cold when delivered.', 2, '2024-07-17', 'Will improve delivery time.', 'Amitabh Rao', 'Responded', 'Food'),
(9, 9, 9, 'Check-in was very slow.', 2, '2024-07-21', 'Staff retrained.', 'Sunita Nair', 'Resolved', 'Service'),
(10, 10, 10, 'Spa service was very relaxing.', 5, '2024-07-22', 'Thank you.', 'Swati Kulkarni', 'Responded', 'Spa'),
(11, 11, 11, 'Housekeeping was excellent.', 5, '2024-07-25', 'We’ll share with the team.', 'Neha Joshi', 'Responded', 'Housekeeping'),
(12, 12, 12, 'Wake-up call was missed.', 2, '2024-07-26', 'We regret the error.', 'Divya Nair', 'Responded', 'Service'),
(13, 13, 13, 'Event room was well decorated.', 4, '2024-07-28', 'Glad you liked it.', 'Sneha Iyer', 'Responded', 'Events'),
(14, 14, 14, 'Check-out was smooth and quick.', 5, '2024-07-27', 'Thank you.', 'Priya Verma', 'Responded', 'General'),
(15, 15, 15, 'Loved the tandoori chicken!', 5, '2024-07-29', 'Chef is happy to hear that!', 'Amitabh Rao', 'Responded', 'Food');

-- to display/retrieve table data
SELECT * FROM Feedback;               

-- to remove complete data from table
truncate table Feedback;

-- to delete complete attributes and records 
drop table Feedback;

-- Table 9: Menu
CREATE TABLE Menu (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    description TEXT,
    category VARCHAR(50),
    price DECIMAL(10,2),
    is_veg BOOLEAN,
    available BOOLEAN,
    preparation_time INT, -- in minutes
    added_by VARCHAR(100),
    added_date DATE
);

 -- Insert records into the table
INSERT INTO Menu (item_id, item_name, description, category, price,is_veg, available, preparation_time, added_by, added_date)
 VALUES
(1, 'Paneer Butter Masala', 'Rich tomato gravy with soft paneer cubes', 'Main Course', 320.00, TRUE, TRUE, 20, 'Amitabh Rao', '2024-07-01'),
(2, 'Chicken Biryani', 'Aromatic basmati rice with marinated chicken', 'Main Course', 350.00, FALSE, TRUE, 25, 'Amitabh Rao', '2024-07-01'),
(3, 'Masala Dosa', 'Crispy dosa with spicy potato filling', 'South Indian', 120.00, TRUE, TRUE, 15, 'Meera Shah', '2024-07-01'),
(4, 'Tandoori Chicken', 'Char-grilled chicken marinated in spices', 'Starter', 380.00, FALSE, TRUE, 30, 'Amitabh Rao', '2024-07-01'),
(5, 'Veg Thali', 'Assorted veg dishes, roti, rice, and dessert', 'Combo', 250.00, TRUE, TRUE, 18, 'Pooja Iyer', '2024-07-01'),
(6, 'Butter Naan', 'Soft and fluffy naan with butter', 'Breads', 40.00, TRUE, TRUE, 8, 'Meera Shah', '2024-07-01'),
(7, 'Gulab Jamun', 'Sweet milk-based dumplings in syrup', 'Dessert', 90.00, TRUE, TRUE, 5, 'Meera Shah', '2024-07-01'),
(8, 'Cold Coffee', 'Chilled coffee with cream and ice', 'Beverages', 110.00, TRUE, TRUE, 5, 'Rohan Verma', '2024-07-01'),
(9, 'Tomato Soup', 'Fresh tomato puree with herbs', 'Soup', 100.00, TRUE, TRUE, 10, 'Amitabh Rao', '2024-07-01'),
(10, 'Idli Sambhar', 'Steamed rice cakes with tangy sambhar', 'South Indian', 110.00, TRUE, TRUE, 10, 'Meera Shah', '2024-07-01'),
(11, 'Fish Curry', 'Spicy and tangy Goan-style fish curry', 'Main Course', 360.00, FALSE, TRUE, 22, 'Amitabh Rao', '2024-07-01'),
(12, 'Jeera Rice', 'Basmati rice tempered with cumin', 'Rice', 140.00, TRUE, TRUE, 12, 'Meera Shah', '2024-07-01'),
(13, 'Spring Rolls', 'Crispy rolls stuffed with veggies', 'Starter', 160.00, TRUE, TRUE, 15, 'Pooja Iyer', '2024-07-01'),
(14, 'Sweet Lassi', 'Chilled yogurt-based sweet drink', 'Beverages', 90.00, TRUE, TRUE, 5, 'Rohan Verma', '2024-07-01'),
(15, 'Mutton Rogan Josh', 'Kashmiri mutton curry with spices', 'Main Course', 420.00, FALSE, TRUE, 30, 'Amitabh Rao', '2024-07-01');

-- to display/retrieve table data
SELECT * FROM Menu;               

-- to remove complete data from table
truncate table Menu;

-- to delete complete attributes and records 
drop table Menu;

-- Table 10: Inventory
CREATE TABLE Inventory (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit VARCHAR(20),
    last_stocked DATE,
    supplier_name VARCHAR(100),
    cost_per_unit DECIMAL(10,2),
    status VARCHAR(20),
    managed_by VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Inventory (item_id, item_name, category, quantity, unit,last_stocked, supplier_name, cost_per_unit, status, managed_by)
 VALUES
(1, 'Basmati Rice', 'Grains', 200, 'Kg', '2024-07-01', 'Shiv Agro Foods', 70.00, 'Available', 'Kunal Mehta'),
(2, 'Paneer', 'Dairy', 50, 'Kg', '2024-07-02', 'Amul Distributors', 300.00, 'Available', 'Meera Shah'),
(3, 'Butter', 'Dairy', 30, 'Kg', '2024-07-03', 'Amul Distributors', 420.00, 'Available', 'Meera Shah'),
(4, 'Chicken', 'Meat', 80, 'Kg', '2024-07-01', 'Farm Fresh Meats', 220.00, 'Available', 'Amitabh Rao'),
(5, 'Mutton', 'Meat', 40, 'Kg', '2024-07-02', 'Farm Fresh Meats', 550.00, 'Low Stock', 'Amitabh Rao'),
(6, 'Wheat Flour', 'Grains', 150, 'Kg', '2024-07-03', 'Shiv Agro Foods', 40.00, 'Available', 'Kunal Mehta'),
(7, 'Spices Pack', 'Spices', 100, 'Packets', '2024-07-02', 'Indian Masala Co.', 60.00, 'Available', 'Meera Shah'),
(8, 'Tea Leaves', 'Beverages', 70, 'Kg', '2024-07-01', 'Tata Tea Pvt Ltd', 190.00, 'Available', 'Pooja Iyer'),
(9, 'Coffee Powder', 'Beverages', 60, 'Kg', '2024-07-01', 'Bru Suppliers', 320.00, 'Available', 'Pooja Iyer'),
(10, 'Detergent', 'Housekeeping', 40, 'Litre', '2024-07-03', 'CleanCo India', 110.00, 'Available', 'Neha Joshi'),
(11, 'Shampoo Sachets', 'Toiletries', 500, 'Pieces', '2024-07-02', 'Dove India', 6.00, 'Available', 'Neha Joshi'),
(12, 'Bath Towels', 'Linen', 120, 'Pieces', '2024-07-01', 'Bombay Dyeing', 200.00, 'Available', 'Neha Joshi'),
(13, 'Toilet Paper Rolls', 'Toiletries', 300, 'Rolls', '2024-07-02', 'CleanCo India', 20.00, 'Available', 'Neha Joshi'),
(14, 'Mineral Water Bottles', 'Beverages', 250, 'Bottles', '2024-07-03', 'Bisleri Pvt Ltd', 20.00, 'Available', 'Rakesh Sharma'),
(15, 'Cooking Oil', 'Grocery', 100, 'Litres', '2024-07-01', 'Saffola India', 150.00, 'Available', 'Meera Shah');

-- to display/retrieve table data
SELECT * FROM Inventory;               

-- to remove complete data from table
truncate table Inventory;

-- to delete complete attributes and records 
drop table Inventory;

-- Table 11: Events
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    start_time TIME,
    end_time TIME,
    venue VARCHAR(100),
    organized_by VARCHAR(100),
    contact_number VARCHAR(15),
    status VARCHAR(20),
    guest_count INT
);

-- Insert records into the table
INSERT INTO Events (event_id, event_name, event_date, start_time, end_time,venue, organized_by, contact_number, status, guest_count)
 VALUES
(1, 'Royal Wedding Reception', '2024-08-10', '18:00:00', '23:00:00', 'Ballroom', 'Aarav Sharma', '9876543210', 'Confirmed', 300),
(2, 'Business Conference', '2024-08-12', '10:00:00', '17:00:00', 'Conference Hall A', 'Riya Patel', '9898989898', 'Confirmed', 120),
(3, 'Book Launch Event', '2024-08-15', '16:00:00', '19:00:00', 'Banquet Room', 'Neelam Singh', '9823456789', 'Scheduled', 80),
(4, 'Classical Music Night', '2024-08-18', '19:00:00', '22:00:00', 'Main Lawn', 'Rahul Verma', '9845123498', 'Confirmed', 200),
(5, 'Fashion Show', '2024-08-20', '17:00:00', '21:00:00', 'Banquet Hall B', 'Kavita Joshi', '9789456123', 'Scheduled', 150),
(6, 'Corporate Award Ceremony', '2024-08-25', '18:30:00', '22:30:00', 'Ballroom', 'Siddharth Iyer', '9756123098', 'Confirmed', 250),
(7, 'Engagement Ceremony', '2024-08-28', '17:00:00', '22:00:00', 'Terrace Garden', 'Meena Kapoor', '9765412034', 'Confirmed', 180),
(8, 'Startup Pitch Day', '2024-08-30', '09:00:00', '15:00:00', 'Conference Hall B', 'Nikhil Deshmukh', '9854761230', 'Scheduled', 70),
(9, 'Charity Gala Dinner', '2024-09-01', '19:00:00', '23:00:00', 'Ballroom', 'Sanjana Mehta', '9876123401', 'Confirmed', 220),
(10, 'Art Exhibition', '2024-09-05', '11:00:00', '18:00:00', 'Lobby Gallery', 'Tanvi Nair', '9834012345', 'Scheduled', 60),
(11, 'Film Screening', '2024-09-08', '18:00:00', '20:00:00', 'Theater Room', 'Manoj Pandey', '9812345678', 'Confirmed', 90),
(12, 'Cookery Workshop', '2024-09-10', '10:00:00', '13:00:00', 'Hotel Kitchen', 'Chef Meera Shah', '9867543210', 'Scheduled', 30),
(13, 'Cocktail Evening', '2024-09-12', '20:00:00', '23:00:00', 'Rooftop Bar', 'Rohan Sinha', '9887654321', 'Confirmed', 110),
(14, 'Baby Shower', '2024-09-15', '16:00:00', '20:00:00', 'Banquet Room A', 'Sneha Gupta', '9845236712', 'Confirmed', 70),
(15, 'Alumni Meet', '2024-09-18', '10:00:00', '14:00:00', 'Conference Hall C', 'Aditya Kulkarni', '9890123456', 'Scheduled', 95);

-- to display/retrieve table data
SELECT * FROM Events;               

-- to remove complete data from table
truncate table Events;

-- to delete complete attributes and records 
drop table Events;

-- Table 12: Suppliers
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    category_supplied VARCHAR(50),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Suppliers (supplier_id, supplier_name, contact_person, phone_number, email,address, city, state, category_supplied, status) 
VALUES
(1, 'Shiv Agro Foods', 'Ravi Mahajan', '9876543210', 'shivagro@gmail.com', 'Sector 15, Navi Mumbai', 'Mumbai', 'Maharashtra', 'Grains', 'Active'),
(2, 'Amul Distributors', 'Neha Trivedi', '9823456789', 'amuldist@gmail.com', 'Ashram Road', 'Ahmedabad', 'Gujarat', 'Dairy', 'Active'),
(3, 'Farm Fresh Meats', 'Imran Khan', '9812345678', 'farmmeat@outlook.com', 'M.G. Road', 'Bhopal', 'Madhya Pradesh', 'Meat', 'Active'),
(4, 'CleanCo India', 'Sujata Patil', '9876123401', 'cleanco@india.com', 'Baner Road', 'Pune', 'Maharashtra', 'Cleaning Supplies', 'Active'),
(5, 'Tata Tea Pvt Ltd', 'Ramesh Naik', '9834567890', 'tata.tea@tata.com', 'Whitefield', 'Bangalore', 'Karnataka', 'Beverages', 'Active'),
(6, 'Bisleri Pvt Ltd', 'Anita Dube', '9867894321', 'bisleri@gmail.com', 'Charni Road', 'Mumbai', 'Maharashtra', 'Mineral Water', 'Active'),
(7, 'Indian Masala Co.', 'Rajesh Iyer', '9887654321', 'masalaco@gmail.com', 'Adyar', 'Chennai', 'Tamil Nadu', 'Spices', 'Active'),
(8, 'Bombay Dyeing', 'Ritika Shah', '9845678901', 'bdtextile@bd.com', 'Marine Lines', 'Mumbai', 'Maharashtra', 'Linen', 'Active'),
(9, 'Dove India', 'Arjun Bhat', '9890123456', 'doveindia@hll.com', 'Koramangala', 'Bangalore', 'Karnataka', 'Toiletries', 'Active'),
(10, 'Saffola India', 'Sneha Chavan', '9821345678', 'saffola@marico.com', 'Ellis Bridge', 'Ahmedabad', 'Gujarat', 'Cooking Oil', 'Active'),
(11, 'Bru Suppliers', 'Sunil Shetty', '9856237412', 'bru@nestle.com', 'Jubilee Hills', 'Hyderabad', 'Telangana', 'Beverages', 'Active'),
(12, 'PaperMart India', 'Kalyani Deshpande', '9834123456', 'papermart@pm.com', 'Salt Lake', 'Kolkata', 'West Bengal', 'Stationery', 'Active'),
(13, 'Elite Crockery', 'Vikas Rao', '9843012345', 'elitecrockery@gmail.com', 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh', 'Kitchenware', 'Active'),
(14, 'Fresh Greens Supply', 'Manisha Verma', '9812341234', 'greens@fresh.com', 'Vasant Vihar', 'Delhi', 'Delhi', 'Vegetables', 'Active'),
(15, 'Metro Gas Services', 'Akhil Yadav', '9870987654', 'metrogas@mg.com', 'Sahibabad', 'Ghaziabad', 'Uttar Pradesh', 'Gas Supply', 'Active');

-- to display/retrieve table data
SELECT * FROM Suppliers;               

-- to remove complete data from table
truncate table Suppliers;

-- to delete complete attributes and records 
drop table Suppliers;

-- Table 13: Staff_Attendance
CREATE TABLE Staff_Attendance (
    attendance_id INT PRIMARY KEY,
    staff_id INT,
    staff_name VARCHAR(100),
    role VARCHAR(50),
    date DATE,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20),
    shift VARCHAR(20),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Staff_Attendance (attendance_id, staff_id, staff_name, role, date,check_in, check_out, status, shift, remarks)
 VALUES
(1, 101, 'Rajiv Menon', 'Receptionist', '2024-07-01', '09:00:00', '18:00:00', 'Present', 'Morning', 'On time'),
(2, 102, 'Neha Joshi', 'Housekeeping', '2024-07-01', '08:30:00', '17:30:00', 'Present', 'Morning', 'Worked full shift'),
(3, 103, 'Rakesh Sharma', 'Security', '2024-07-01', '07:00:00', '15:00:00', 'Present', 'Morning', 'Patrolled entire premises'),
(4, 104, 'Pooja Iyer', 'Manager', '2024-07-01', '10:00:00', '19:00:00', 'Present', 'General', 'Meeting with vendors'),
(5, 105, 'Meera Shah', 'Chef', '2024-07-01', '12:00:00', '21:00:00', 'Present', 'Evening', 'Handled lunch & dinner'),
(6, 106, 'Amitabh Rao', 'Waiter', '2024-07-01', '14:00:00', '23:00:00', 'Present', 'Evening', 'Table service & billing'),
(7, 107, 'Swati Kulkarni', 'Spa Therapist', '2024-07-01', '11:00:00', '20:00:00', 'Present', 'General', '3 sessions handled'),
(8, 108, 'Rohan Verma', 'Bartender', '2024-07-01', '15:00:00', '00:00:00', 'Present', 'Night', 'Handled party orders'),
(9, 109, 'Sunita Nair', 'Concierge', '2024-07-01', '09:00:00', '18:00:00', 'Absent', 'Morning', 'Sick leave'),
(10, 110, 'Kunal Mehta', 'Inventory Manager', '2024-07-01', '08:00:00', '17:00:00', 'Present', 'Morning', 'Checked delivery'),
(11, 111, 'Divya Nair', 'Front Desk Assistant', '2024-07-01', '09:30:00', '18:30:00', 'Present', 'Morning', 'Checked-in 5 guests'),
(12, 112, 'Vikram Desai', 'IT Support', '2024-07-01', '10:00:00', '19:00:00', 'Present', 'General', 'Fixed internet outage'),
(13, 113, 'Tanvi Nair', 'Event Manager', '2024-07-01', '13:00:00', '22:00:00', 'Present', 'Evening', 'Planned wedding event'),
(14, 114, 'Arjun Bhat', 'Maintenance', '2024-07-01', '07:00:00', '16:00:00', 'Present', 'Morning', 'AC repair in Room 202'),
(15, 115, 'Sneha Gupta', 'Marketing Executive', '2024-07-01', '10:30:00', '19:30:00', 'Present', 'General', 'Updated online campaigns');

-- to display/retrieve table data
SELECT * FROM Staff_Attendance;               

-- to remove complete data from table
truncate table Staff_Attendance;

-- to delete complete attributes and records 
drop table Staff_Attendance;

-- Table 14: Complaints
CREATE TABLE Complaints (
    complaint_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    complaint_type VARCHAR(100),
    description TEXT,
    complaint_date DATE,
    status VARCHAR(20),
    resolved_date DATE,
    handled_by VARCHAR(100),
    remarks TEXT
);

-- Insert records into the table	
INSERT INTO Complaints (complaint_id, guest_id, room_id, complaint_type, description,complaint_date, status, resolved_date, handled_by, remarks)
 VALUES
(1, 1, 101, 'AC Not Working', 'The AC is not cooling properly.', '2024-07-02', 'Resolved', '2024-07-03', 'Arjun Bhat', 'Gas refilled'),
(2, 2, 102, 'TV Not Responding', 'Remote is not working.', '2024-07-03', 'Resolved', '2024-07-03', 'Vikram Desai', 'Remote replaced'),
(3, 3, 103, 'Bathroom Leakage', 'Water leakage from tap.', '2024-07-04', 'Pending', NULL, 'Arjun Bhat', 'Plumber scheduled'),
(4, 4, 104, 'Noise Issue', 'Loud noise from adjacent room.', '2024-07-05', 'Resolved', '2024-07-05', 'Sunita Nair', 'Requested neighbor to reduce volume'),
(5, 5, 105, 'WiFi Slow', 'Internet connection is very slow.', '2024-07-05', 'Resolved', '2024-07-06', 'Vikram Desai', 'Router reset'),
(6, 6, 106, 'Unclean Linen', 'Bed sheets were not clean.', '2024-07-06', 'Resolved', '2024-07-06', 'Neha Joshi', 'Linen replaced'),
(7, 7, 107, 'Room Not Cleaned', 'Housekeeping skipped cleaning.', '2024-07-07', 'Resolved', '2024-07-07', 'Neha Joshi', 'Room cleaned'),
(8, 8, 108, 'Food Delay', 'Order was delayed by 1 hour.', '2024-07-07', 'Resolved', '2024-07-08', 'Meera Shah', 'Apology & 10% discount'),
(9, 9, 109, 'No Hot Water', 'Geyser not working.', '2024-07-08', 'Pending', NULL, 'Arjun Bhat', 'Technician assigned'),
(10, 10, 110, 'Key Card Not Working', 'Unable to access room with key card.', '2024-07-08', 'Resolved', '2024-07-08', 'Sunita Nair', 'Card re-issued'),
(11, 11, 111, 'Late Check-in', 'Waited too long at reception.', '2024-07-09', 'Resolved', '2024-07-09', 'Rajiv Menon', 'Apology sent'),
(12, 12, 112, 'Billing Error', 'Extra charges in bill.', '2024-07-09', 'Resolved', '2024-07-10', 'Rohan Verma', 'Adjusted and corrected'),
(13, 13, 113, 'Bad Odor in Room', 'Room smells bad.', '2024-07-10', 'Resolved', '2024-07-10', 'Neha Joshi', 'Room freshener applied'),
(14, 14, 114, 'Intercom Not Working', 'Cannot call reception.', '2024-07-11', 'Pending', NULL, 'Vikram Desai', 'Line repair scheduled'),
(15, 15, 115, 'Spa Overcharged', 'Extra charges added to bill.', '2024-07-11', 'Resolved', '2024-07-12', 'Swati Kulkarni', 'Refund issued');
    
-- to display/retrieve table data
SELECT * FROM Complaints;               

-- to remove complete data from table
truncate table Complaints;

-- to delete complete attributes and records 
drop table Complaints;
    
-- Table 15: Maintenance
CREATE TABLE Maintenance (
    maintenance_id INT PRIMARY KEY,
    department VARCHAR(50),
    issue_description TEXT,
    reported_date DATE,
    resolved_date DATE,
    status VARCHAR(20),
    assigned_to VARCHAR(100),
    cost_estimate DECIMAL(10,2),
    actual_cost DECIMAL(10,2),
    remarks TEXT
);

 -- Insert records into the table
INSERT INTO Maintenance (maintenance_id, department, issue_description, reported_date, resolved_date,status, assigned_to, cost_estimate, actual_cost, remarks) 
    VALUES
(1, 'Electrical', 'Power outage on 2nd floor', '2024-07-01', '2024-07-02', 'Resolved', 'Arjun Bhat', 5000.00, 4800.00, 'Main breaker repaired'),
(2, 'Plumbing', 'Leak in Room 103 bathroom', '2024-07-02', '2024-07-03', 'Resolved', 'Amit Malhotra', 1500.00, 1500.00, 'Tap replaced'),
(3, 'HVAC', 'AC not cooling in lobby', '2024-07-03', '2024-07-04', 'Resolved', 'Ravi Shekhar', 3500.00, 3400.00, 'Coolant refilled'),
(4, 'Housekeeping', 'Broken housekeeping trolley', '2024-07-04', '2024-07-05', 'Resolved', 'Kavita Iyer', 800.00, 850.00, 'Wheel repaired'),
(5, 'Kitchen', 'Exhaust fan not working', '2024-07-05', '2024-07-06', 'Resolved', 'Suresh Nair', 1200.00, 1100.00, 'Fan motor replaced'),
(6, 'Linen', 'Shortage of clean towels', '2024-07-06', NULL, 'Pending', 'Neha Joshi', 2000.00, 0.00, 'Stock awaited'),
(7, 'Security', 'CCTV not working in parking', '2024-07-07', '2024-07-08', 'Resolved', 'Rakesh Sharma', 6000.00, 5800.00, 'Rewiring done'),
(8, 'Pool', 'Water filter malfunction', '2024-07-08', '2024-07-09', 'Resolved', 'Manoj Rao', 4500.00, 4400.00, 'Filter cleaned and fixed'),
(9, 'Lighting', 'Dim lights in banquet hall', '2024-07-09', '2024-07-10', 'Resolved', 'Arjun Bhat', 2000.00, 1900.00, 'Bulbs replaced'),
(10, 'Elevator', 'Lift no. 2 not functioning', '2024-07-10', NULL, 'In Progress', 'Rajeev Kulkarni', 15000.00, 0.00, 'Spare part ordered'),
(11, 'Garden', 'Sprinklers not working', '2024-07-10', '2024-07-11', 'Resolved', 'Hari Singh', 1800.00, 1750.00, 'Replaced sprinkler heads'),
(12, 'IT', 'WiFi outage on 4th floor', '2024-07-11', '2024-07-11', 'Resolved', 'Vikram Desai', 1200.00, 1150.00, 'Router rebooted'),
(13, 'Guest Room', 'Wall paint chipped in 203', '2024-07-11', NULL, 'Pending', 'Amit Malhotra', 1000.00, 0.00, 'To be scheduled'),
(14, 'Restaurant', 'Dishwasher leakage', '2024-07-11', '2024-07-12', 'Resolved', 'Meera Shah', 3000.00, 2950.00, 'Pipe replaced'),
(15, 'Reception', 'Printer not printing receipts', '2024-07-12', '2024-07-13', 'Resolved', 'Vikram Desai', 2000.00, 2000.00, 'Printer driver updated');

-- to display/retrieve table data
SELECT * FROM Maintenance;               

-- to remove complete data from table
truncate table Maintenance;

-- to delete complete attributes and records 
drop table Maintenance;