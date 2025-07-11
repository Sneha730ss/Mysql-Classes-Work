-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database University;

-- to work on it, you need to use it first
use University;

-- Delete a database
Drop database University;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Students (student_id, first_name, last_name, gender, date_of_birth,contact_number, email, department, year_of_study, address) 

T2 : Courses (course_id, course_name, department, credits, semester,instructor_name, schedule_days, schedule_time, course_type, status)

T3 : Faculties (faculty_id, first_name, last_name, gender, contact_number,email, department, designation, joining_date, address) 

T4 : Departments (dept_id, dept_name, head_of_department, contact_number, email,building_name, floor, established_year, total_faculty, total_students)

T5 : Subjects (subject_id, subject_name, course_id, department, faculty_id,semester, credit_hours, subject_type, max_marks, passing_marks) 

T6 : Exams (exam_id, subject_id, course_id, exam_type, exam_date,start_time, end_time, total_marks, exam_room, invigilator_name)

T7 : Results (result_id, student_id, course_id, subject_id, exam_id,marks_obtained, total_marks, percentage, grade, result_status)

T8 : Attendance (attendance_id, student_id, subject_id, course_id, date,status, period, faculty_id, remarks, semester) 

T9 : Library (book_id, title, author, department, publication_year,isbn, copies_available, shelf_number, added_date, status) 

T10 : Hostel (hostel_id, name, warden_name, contact_number, capacity,occupied_rooms, total_rooms, location, gender_allowed, status)

T11 : Hostel_Residents (resident_id, student_id, hostel_id, room_number, bed_number,joining_date, leaving_date, status, guardian_name, contact_number) 

T12 : Events (event_id, event_name, department, coordinator_name, event_date,event_time, venue, participants_expected, budget, status) 

T13 : Event_Participants (participant_id, event_id, student_id, registration_date, participation_status,certificate_issued, feedback_given, score, position, remarks)

T14 : Staff (staff_id, name, designation, department, contact_number,email, joining_date, salary, employment_type, status) 

T15 :  Transport (vehicle_id, vehicle_number, driver_name, driver_contact, route_name,capacity, occupied_seats, start_point, end_point, status) 

*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    department VARCHAR(50),
    year_of_study INT,
    address TEXT
);

-- Insert records into the table
INSERT INTO Students (student_id, first_name, last_name, gender, date_of_birth,contact_number, email, department, year_of_study, address) 
VALUES
(1, 'Aarav', 'Sharma', 'Male', '2003-06-15', '9876543210', 'aarav.sharma@uni.edu', 'Computer Science', 3, 'Delhi'),
(2, 'Diya', 'Patel', 'Female', '2004-08-10', '9876543211', 'diya.patel@uni.edu', 'Mechanical', 2, 'Ahmedabad'),
(3, 'Rohan', 'Verma', 'Male', '2002-12-22', '9876543212', 'rohan.verma@uni.edu', 'Civil', 4, 'Jaipur'),
(4, 'Sneha', 'Iyer', 'Female', '2003-01-15', '9876543213', 'sneha.iyer@uni.edu', 'Electrical', 3, 'Mumbai'),
(5, 'Kabir', 'Khan', 'Male', '2001-11-05', '9876543214', 'kabir.khan@uni.edu', 'Electronics', 4, 'Lucknow'),
(6, 'Ananya', 'Mishra', 'Female', '2004-04-20', '9876543215', 'ananya.mishra@uni.edu', 'Computer Science', 2, 'Bhopal'),
(7, 'Raj', 'Singh', 'Male', '2003-03-12', '9876543216', 'raj.singh@uni.edu', 'Mechanical', 3, 'Patna'),
(8, 'Meera', 'Nair', 'Female', '2005-07-19', '9876543217', 'meera.nair@uni.edu', 'Biotech', 1, 'Kochi'),
(9, 'Yash', 'Desai', 'Male', '2002-10-30', '9876543218', 'yash.desai@uni.edu', 'Computer Science', 4, 'Surat'),
(10, 'Pooja', 'Joshi', 'Female', '2003-09-11', '9876543219', 'pooja.joshi@uni.edu', 'Civil', 3, 'Pune'),
(11, 'Aman', 'Thakur', 'Male', '2004-02-25', '9876543220', 'aman.thakur@uni.edu', 'Electrical', 2, 'Shimla'),
(12, 'Nisha', 'Reddy', 'Female', '2005-06-07', '9876543221', 'nisha.reddy@uni.edu', 'Mechanical', 1, 'Hyderabad'),
(13, 'Dev', 'Chatterjee', 'Male', '2003-12-17', '9876543222', 'dev.chatterjee@uni.edu', 'Biotech', 3, 'Kolkata'),
(14, 'Tanya', 'Kapoor', 'Female', '2004-05-29', '9876543223', 'tanya.kapoor@uni.edu', 'Computer Science', 2, 'Noida'),
(15, 'Harsh', 'Mehta', 'Male', '2002-08-13', '9876543224', 'harsh.mehta@uni.edu', 'Civil', 4, 'Rajkot');

-- to display/retrieve table data
SELECT * FROM Students;               

-- to remove complete data from table
truncate table Students;

-- to delete complete attributes and records 
drop table Students;

-- Table 2: Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(50),
    credits INT,
    semester INT,
    instructor_name VARCHAR(100),
    schedule_days VARCHAR(20),
    schedule_time VARCHAR(20),
    course_type VARCHAR(30),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Courses (course_id, course_name, department, credits, semester,instructor_name, schedule_days, schedule_time, course_type, status)
 VALUES
(1, 'Data Structures', 'Computer Science', 4, 3, 'Prof. Anil Kumar', 'Mon-Wed', '10:00-11:30', 'Core', 'Active'),
(2, 'Thermodynamics', 'Mechanical', 4, 3, 'Dr. Neha Bhatt', 'Tue-Thu', '11:00-12:30', 'Core', 'Active'),
(3, 'Structural Analysis', 'Civil', 4, 5, 'Prof. Ravi Malhotra', 'Mon-Wed', '09:00-10:30', 'Core', 'Active'),
(4, 'Digital Electronics', 'Electronics', 3, 4, 'Dr. Sushma Jain', 'Tue-Thu', '01:00-02:30', 'Core', 'Active'),
(5, 'Operating Systems', 'Computer Science', 4, 4, 'Dr. Manoj Bansal', 'Mon-Fri', '12:00-01:00', 'Core', 'Active'),
(6, 'Circuit Theory', 'Electrical', 3, 2, 'Prof. Alok Rathi', 'Wed-Fri', '02:00-03:30', 'Core', 'Active'),
(7, 'Fluid Mechanics', 'Mechanical', 4, 4, 'Dr. Sneha Deshmukh', 'Mon-Wed', '09:00-10:30', 'Elective', 'Active'),
(8, 'Environmental Engineering', 'Civil', 3, 6, 'Prof. Deepak Nair', 'Tue-Thu', '11:00-12:30', 'Elective', 'Active'),
(9, 'Microprocessors', 'Electronics', 3, 5, 'Dr. Priya Seth', 'Mon-Wed', '01:30-03:00', 'Core', 'Active'),
(10, 'DBMS', 'Computer Science', 4, 5, 'Prof. Naveen Mehra', 'Mon-Fri', '10:00-11:00', 'Core', 'Active'),
(11, 'Power Systems', 'Electrical', 4, 6, 'Dr. Ravi Tiwari', 'Tue-Thu', '01:00-02:30', 'Elective', 'Active'),
(12, 'Machine Design', 'Mechanical', 4, 6, 'Prof. Sanjay Yadav', 'Wed-Fri', '03:00-04:30', 'Core', 'Active'),
(13, 'Geotechnical Engineering', 'Civil', 4, 5, 'Dr. Lata Ghosh', 'Tue-Thu', '10:00-11:30', 'Core', 'Active'),
(14, 'Java Programming', 'Computer Science', 3, 3, 'Prof. Rajat Khanna', 'Mon-Wed', '02:00-03:30', 'Elective', 'Active'),
(15, 'Renewable Energy', 'Electrical', 3, 5, 'Dr. Rakesh Solanki', 'Mon-Fri', '11:00-12:00', 'Elective', 'Active');

-- to display/retrieve table data
SELECT * FROM Courses;               

-- to remove complete data from table
truncate table Courses;

-- to delete complete attributes and records 
drop table Courses;

-- Table 3: Faculties
CREATE TABLE Faculties (
    faculty_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    department VARCHAR(50),
    designation VARCHAR(50),
    joining_date DATE,
    address TEXT
);

-- Insert records into the table
INSERT INTO Faculties (faculty_id, first_name, last_name, gender, contact_number,email, department, designation, joining_date, address) 
VALUES
(1, 'Anil', 'Kumar', 'Male', '9876510001', 'anil.kumar@uni.edu', 'Computer Science', 'Professor', '2010-07-15', 'Delhi'),
(2, 'Neha', 'Bhatt', 'Female', '9876510002', 'neha.bhatt@uni.edu', 'Mechanical', 'Associate Professor', '2012-06-20', 'Ahmedabad'),
(3, 'Ravi', 'Malhotra', 'Male', '9876510003', 'ravi.malhotra@uni.edu', 'Civil', 'Assistant Professor', '2015-08-05', 'Jaipur'),
(4, 'Sushma', 'Jain', 'Female', '9876510004', 'sushma.jain@uni.edu', 'Electronics', 'Professor', '2009-05-10', 'Mumbai'),
(5, 'Manoj', 'Bansal', 'Male', '9876510005', 'manoj.bansal@uni.edu', 'Computer Science', 'Associate Professor', '2013-09-01', 'Lucknow'),
(6, 'Alok', 'Rathi', 'Male', '9876510006', 'alok.rathi@uni.edu', 'Electrical', 'Assistant Professor', '2016-01-12', 'Bhopal'),
(7, 'Sneha', 'Deshmukh', 'Female', '9876510007', 'sneha.deshmukh@uni.edu', 'Mechanical', 'Lecturer', '2018-02-28', 'Pune'),
(8, 'Deepak', 'Nair', 'Male', '9876510008', 'deepak.nair@uni.edu', 'Civil', 'Professor', '2008-11-23', 'Kochi'),
(9, 'Priya', 'Seth', 'Female', '9876510009', 'priya.seth@uni.edu', 'Electronics', 'Assistant Professor', '2014-04-19', 'Chennai'),
(10, 'Naveen', 'Mehra', 'Male', '9876510010', 'naveen.mehra@uni.edu', 'Computer Science', 'Lecturer', '2019-07-17', 'Delhi'),
(11, 'Ravi', 'Tiwari', 'Male', '9876510011', 'ravi.tiwari@uni.edu', 'Electrical', 'Professor', '2011-03-05', 'Indore'),
(12, 'Sanjay', 'Yadav', 'Male', '9876510012', 'sanjay.yadav@uni.edu', 'Mechanical', 'Associate Professor', '2010-09-09', 'Varanasi'),
(13, 'Lata', 'Ghosh', 'Female', '9876510013', 'lata.ghosh@uni.edu', 'Civil', 'Assistant Professor', '2017-06-14', 'Kolkata'),
(14, 'Rajat', 'Khanna', 'Male', '9876510014', 'rajat.khanna@uni.edu', 'Computer Science', 'Lecturer', '2020-01-22', 'Noida'),
(15, 'Rakesh', 'Solanki', 'Male', '9876510015', 'rakesh.solanki@uni.edu', 'Electrical', 'Professor', '2007-12-01', 'Udaipur');

-- to display/retrieve table data
SELECT * FROM Faculties;               

-- to remove complete data from table
truncate table Faculties;

-- to delete complete attributes and records 
drop table Faculties;

-- Table 4: Departments
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    head_of_department VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    building_name VARCHAR(50),
    floor INT,
    established_year INT,
    total_faculty INT,
    total_students INT
);

-- Insert records into the table
INSERT INTO Departments (dept_id, dept_name, head_of_department, contact_number, email,building_name, floor, established_year, total_faculty, total_students)
 VALUES
(1, 'Computer Science', 'Dr. Anil Kumar', '9876511001', 'cs@university.edu', 'Aryabhata', 2, 2001, 18, 450),
(2, 'Mechanical', 'Dr. Neha Bhatt', '9876511002', 'mech@university.edu', 'Newton', 3, 1998, 20, 400),
(3, 'Civil', 'Dr. Ravi Malhotra', '9876511003', 'civil@university.edu', 'Visvesvaraya', 1, 1995, 15, 380),
(4, 'Electrical', 'Dr. Alok Rathi', '9876511004', 'ee@university.edu', 'Tesla', 2, 2000, 17, 360),
(5, 'Electronics', 'Dr. Sushma Jain', '9876511005', 'ece@university.edu', 'Galileo', 4, 2002, 16, 340),
(6, 'Biotechnology', 'Dr. Deepak Nair', '9876511006', 'biotech@university.edu', 'Pasteur', 3, 2005, 12, 220),
(7, 'Mathematics', 'Dr. Sunil Rao', '9876511007', 'maths@university.edu', 'Euler', 1, 1990, 10, 200),
(8, 'Physics', 'Dr. Priya Seth', '9876511008', 'physics@university.edu', 'Einstein', 2, 1985, 11, 180),
(9, 'Chemistry', 'Dr. Lata Ghosh', '9876511009', 'chemistry@university.edu', 'Curie', 3, 1989, 13, 210),
(10, 'Humanities', 'Dr. Ramesh Nair', '9876511010', 'humanities@university.edu', 'Tagore', 1, 1993, 9, 160),
(11, 'Management', 'Dr. Rakesh Solanki', '9876511011', 'mba@university.edu', 'Chanakya', 2, 2007, 14, 300),
(12, 'Architecture', 'Prof. Kavita Sharma', '9876511012', 'arch@university.edu', 'Laurie Baker', 4, 2004, 8, 120),
(13, 'Environmental Science', 'Dr. Rohit Desai', '9876511013', 'envsci@university.edu', 'GreenBlock', 2, 2008, 7, 100),
(14, 'Psychology', 'Dr. Meera Iyer', '9876511014', 'psy@university.edu', 'MindHouse', 1, 2010, 6, 90),
(15, 'Law', 'Dr. Nikhil Tiwari', '9876511015', 'law@university.edu', 'Justice Hall', 3, 2003, 10, 250);

-- to display/retrieve table data
SELECT * FROM Departments;               

-- to remove complete data from table
truncate table Departments;

-- to delete complete attributes and records 
drop table Departments;

-- Table 5: Subjects
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    course_id INT,
    department VARCHAR(100),
    faculty_id INT,
    semester INT,
    credit_hours INT,
    subject_type VARCHAR(50),
    max_marks INT,
    passing_marks INT
);

-- Insert records into the table
INSERT INTO Subjects (subject_id, subject_name, course_id, department, faculty_id,semester, credit_hours, subject_type, max_marks, passing_marks) 
VALUES
(1, 'Data Structures & Algorithms', 1, 'Computer Science', 1, 3, 4, 'Theory', 100, 40),
(2, 'Thermal Engineering', 2, 'Mechanical', 2, 4, 4, 'Theory', 100, 40),
(3, 'Surveying and Levelling', 3, 'Civil', 3, 3, 3, 'Practical', 50, 20),
(4, 'Digital Circuits', 4, 'Electronics', 4, 4, 4, 'Theory', 100, 40),
(5, 'Operating Systems Concepts', 5, 'Computer Science', 5, 4, 4, 'Theory', 100, 40),
(6, 'Electrical Machines', 6, 'Electrical', 6, 3, 4, 'Theory', 100, 40),
(7, 'Kinematics of Machines', 7, 'Mechanical', 7, 5, 4, 'Theory', 100, 40),
(8, 'Soil Mechanics', 8, 'Civil', 8, 5, 3, 'Theory', 100, 40),
(9, 'Analog Electronics', 9, 'Electronics', 9, 5, 4, 'Theory', 100, 40),
(10, 'Database Management Systems', 10, 'Computer Science', 10, 5, 4, 'Theory', 100, 40),
(11, 'Power Electronics', 11, 'Electrical', 11, 6, 3, 'Theory', 100, 40),
(12, 'Heat Transfer', 12, 'Mechanical', 12, 6, 3, 'Theory', 100, 40),
(13, 'Foundation Engineering', 13, 'Civil', 13, 6, 3, 'Theory', 100, 40),
(14, 'Web Technologies', 14, 'Computer Science', 14, 3, 3, 'Practical', 50, 20),
(15, 'Renewable Energy Systems', 15, 'Electrical', 15, 5, 3, 'Theory', 100, 40);

-- to display/retrieve table data
SELECT * FROM Subjects;               

-- to remove complete data from table
truncate table Subjects;

-- to delete complete attributes and records 
drop table Subjects;

-- Table 6: Exams
CREATE TABLE Exams (
    exam_id INT PRIMARY KEY,
    subject_id INT,
    course_id INT,
    exam_type VARCHAR(50),
    exam_date DATE,
    start_time TIME,
    end_time TIME,
    total_marks INT,
    exam_room VARCHAR(20),
    invigilator_name VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Exams (exam_id, subject_id, course_id, exam_type, exam_date,start_time, end_time, total_marks, exam_room, invigilator_name)
 VALUES
(1, 1, 1, 'Mid Term', '2024-10-10', '10:00:00', '12:00:00', 50, 'CS101', 'Dr. Anil Kumar'),
(2, 2, 2, 'End Term', '2024-11-15', '13:00:00', '16:00:00', 100, 'ME201', 'Dr. Neha Bhatt'),
(3, 3, 3, 'Practical', '2024-10-20', '09:00:00', '11:00:00', 50, 'CV102', 'Dr. Ravi Malhotra'),
(4, 4, 4, 'Mid Term', '2024-10-22', '10:00:00', '12:00:00', 50, 'EC301', 'Dr. Sushma Jain'),
(5, 5, 5, 'End Term', '2024-11-18', '14:00:00', '17:00:00', 100, 'CS302', 'Dr. Manoj Bansal'),
(6, 6, 6, 'Mid Term', '2024-10-25', '11:00:00', '13:00:00', 50, 'EE101', 'Dr. Alok Rathi'),
(7, 7, 7, 'End Term', '2024-11-20', '10:00:00', '13:00:00', 100, 'ME103', 'Dr. Sneha Deshmukh'),
(8, 8, 8, 'Mid Term', '2024-10-28', '10:00:00', '12:00:00', 50, 'CV203', 'Dr. Deepak Nair'),
(9, 9, 9, 'End Term', '2024-11-22', '09:30:00', '12:30:00', 100, 'EC102', 'Dr. Priya Seth'),
(10, 10, 10, 'Mid Term', '2024-10-30', '11:00:00', '13:00:00', 50, 'CS303', 'Prof. Naveen Mehra'),
(11, 11, 11, 'End Term', '2024-11-24', '12:00:00', '15:00:00', 100, 'EE202', 'Dr. Ravi Tiwari'),
(12, 12, 12, 'Mid Term', '2024-11-01', '10:00:00', '12:00:00', 50, 'ME202', 'Dr. Sanjay Yadav'),
(13, 13, 13, 'End Term', '2024-11-26', '09:00:00', '12:00:00', 100, 'CV303', 'Dr. Lata Ghosh'),
(14, 14, 14, 'Practical', '2024-11-03', '14:00:00', '16:00:00', 50, 'CS104', 'Prof. Rajat Khanna'),
(15, 15, 15, 'End Term', '2024-11-28', '13:00:00', '16:00:00', 100, 'EE301', 'Dr. Rakesh Solanki');

-- to display/retrieve table data
SELECT * FROM Exams;               

-- to remove complete data from table
truncate table Exams;

-- to delete complete attributes and records 
drop table Exams;

-- Table 7: Results
CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    subject_id INT,
    exam_id INT,
    marks_obtained INT,
    total_marks INT,
    percentage DECIMAL(5,2),
    grade VARCHAR(5),
    result_status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Results (result_id, student_id, course_id, subject_id, exam_id,marks_obtained, total_marks, percentage, grade, result_status)
 VALUES
(1, 1, 1, 1, 1, 42, 50, 84.00, 'A', 'Pass'),
(2, 2, 2, 2, 2, 76, 100, 76.00, 'B+', 'Pass'),
(3, 3, 3, 3, 3, 40, 50, 80.00, 'A', 'Pass'),
(4, 4, 4, 4, 4, 45, 50, 90.00, 'A+', 'Pass'),
(5, 5, 5, 5, 5, 88, 100, 88.00, 'A+', 'Pass'),
(6, 6, 6, 6, 6, 39, 50, 78.00, 'B+', 'Pass'),
(7, 7, 7, 7, 7, 91, 100, 91.00, 'A+', 'Pass'),
(8, 8, 8, 8, 8, 44, 50, 88.00, 'A+', 'Pass'),
(9, 9, 9, 9, 9, 73, 100, 73.00, 'B', 'Pass'),
(10, 10, 10, 10, 10, 46, 50, 92.00, 'A+', 'Pass'),
(11, 11, 11, 11, 11, 69, 100, 69.00, 'C+', 'Pass'),
(12, 12, 12, 12, 12, 38, 50, 76.00, 'B+', 'Pass'),
(13, 13, 13, 13, 13, 82, 100, 82.00, 'A', 'Pass'),
(14, 14, 14, 14, 14, 47, 50, 94.00, 'A+', 'Pass'),
(15, 15, 15, 15, 15, 60, 100, 60.00, 'C', 'Pass');

-- to display/retrieve table data
SELECT * FROM Results;               

-- to remove complete data from table
truncate table Results;

-- to delete complete attributes and records 
drop table Results;

-- Table 8: Attendance
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    course_id INT,
    date DATE,
    status VARCHAR(10),
    period INT,
    faculty_id INT,
    remarks TEXT,
    semester INT
);

-- Insert records into the table
INSERT INTO Attendance (attendance_id, student_id, subject_id, course_id, date,status, period, faculty_id, remarks, semester) 
VALUES
(1, 1, 1, 1, '2024-08-01', 'Present', 1, 1, 'On time', 3),
(2, 2, 2, 2, '2024-08-01', 'Absent', 2, 2, 'Sick leave', 3),
(3, 3, 3, 3, '2024-08-01', 'Present', 1, 3, 'Participated actively', 3),
(4, 4, 4, 4, '2024-08-01', 'Late', 3, 4, 'Came 10 mins late', 3),
(5, 5, 5, 5, '2024-08-01', 'Present', 2, 5, 'On time', 4),
(6, 6, 6, 6, '2024-08-01', 'Present', 1, 6, 'Submitted assignment', 2),
(7, 7, 7, 7, '2024-08-01', 'Absent', 2, 7, 'Family reason', 4),
(8, 8, 8, 8, '2024-08-01', 'Present', 3, 8, 'Answered questions', 5),
(9, 9, 9, 9, '2024-08-01', 'Present', 1, 9, 'Attentive', 5),
(10, 10, 10, 10, '2024-08-01', 'Present', 1, 10, 'Good participation', 5),
(11, 11, 11, 11, '2024-08-01', 'Absent', 2, 11, 'No prior notice', 6),
(12, 12, 12, 12, '2024-08-01', 'Late', 3, 12, 'Traffic delay', 6),
(13, 13, 13, 13, '2024-08-01', 'Present', 1, 13, 'Well prepared', 6),
(14, 14, 14, 14, '2024-08-01', 'Present', 2, 14, 'Active listener', 3),
(15, 15, 15, 15, '2024-08-01', 'Present', 1, 15, 'On time', 3);

-- to display/retrieve table data
SELECT * FROM Attendance;               

-- to remove complete data from table
truncate table Attendance;

-- to delete complete attributes and records 
drop table Attendance;

-- Table 9: Library
CREATE TABLE Library (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author VARCHAR(100),
    department VARCHAR(100),
    publication_year INT,
    isbn VARCHAR(20),
    copies_available INT,
    shelf_number VARCHAR(20),
    added_date DATE,
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Library (book_id, title, author, department, publication_year,isbn, copies_available, shelf_number, added_date, status) 
VALUES
(1, 'Programming in C', 'E. Balagurusamy', 'Computer Science', 2018, '9788176563581', 5, 'CS-A1', '2022-07-01', 'Available'),
(2, 'Engineering Mechanics', 'R.K. Bansal', 'Mechanical', 2017, '9788121915730', 4, 'ME-B3', '2021-06-15', 'Available'),
(3, 'Soil Mechanics', 'B.C. Punmia', 'Civil', 2016, '9788131808192', 3, 'CV-C2', '2020-05-10', 'Available'),
(4, 'Digital Logic Design', 'M. Morris Mano', 'Electronics', 2019, '9789332542523', 6, 'EC-D4', '2023-08-10', 'Available'),
(5, 'Operating System Concepts', 'Silberschatz', 'Computer Science', 2021, '9788126512682', 2, 'CS-B2', '2022-01-05', 'Available'),
(6, 'Electrical Machines', 'P.S. Bimbhra', 'Electrical', 2020, '9788120331241', 4, 'EE-E1', '2023-02-12', 'Available'),
(7, 'Machine Design', 'V.B. Bhandari', 'Mechanical', 2018, '9780070681798', 3, 'ME-F3', '2022-11-09', 'Available'),
(8, 'Environmental Engineering', 'S.K. Garg', 'Civil', 2015, '9788121908831', 2, 'CV-G1', '2021-09-07', 'Available'),
(9, 'Electronic Devices', 'Boylestad', 'Electronics', 2017, '9789332542608', 5, 'EC-H2', '2022-10-11', 'Available'),
(10, 'DBMS Concepts', 'Korth', 'Computer Science', 2019, '9780071289597', 3, 'CS-C5', '2022-04-18', 'Available'),
(11, 'Power Systems', 'C.L. Wadhwa', 'Electrical', 2016, '9788120335607', 4, 'EE-I4', '2021-07-25', 'Available'),
(12, 'Engineering Thermodynamics', 'P.K. Nag', 'Mechanical', 2018, '9789352606426', 6, 'ME-J6', '2020-08-21', 'Available'),
(13, 'Surveying Vol.1', 'B.C. Punmia', 'Civil', 2017, '9788170088530', 3, 'CV-K2', '2023-03-15', 'Available'),
(14, 'Web Technologies', 'Uttam K. Roy', 'Computer Science', 2021, '9780199456412', 5, 'CS-D1', '2023-06-01', 'Available'),
(15, 'Renewable Energy', 'G.D. Rai', 'Electrical', 2015, '9788185091315', 2, 'EE-L5', '2021-12-12', 'Available');

-- to display/retrieve table data
SELECT * FROM Library;               

-- to remove complete data from table
truncate table Library;

-- to delete complete attributes and records 
drop table Library;

-- Table 10: Hostel
CREATE TABLE Hostel (
    hostel_id INT PRIMARY KEY,
    name VARCHAR(100),
    warden_name VARCHAR(100),
    contact_number VARCHAR(15),
    capacity INT,
    occupied_rooms INT,
    total_rooms INT,
    location VARCHAR(100),
    gender_allowed VARCHAR(10),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Hostel (hostel_id, name, warden_name, contact_number, capacity,occupied_rooms, total_rooms, location, gender_allowed, status)
 VALUES
(1, 'Ashoka Bhavan', 'Suresh Rathi', '9876500001', 200, 180, 100, 'North Campus', 'Male', 'Active'),
(2, 'Saraswati Hostel', 'Meena Verma', '9876500002', 150, 130, 80, 'South Campus', 'Female', 'Active'),
(3, 'Tagore House', 'Ramesh Naik', '9876500003', 180, 160, 90, 'East Campus', 'Male', 'Active'),
(4, 'Gargi Hostel', 'Sunita Iyer', '9876500004', 160, 140, 85, 'West Campus', 'Female', 'Active'),
(5, 'Vivekananda Hostel', 'Ajay Dubey', '9876500005', 210, 190, 110, 'North Campus', 'Male', 'Active'),
(6, 'Kalpana Bhavan', 'Shalini Joshi', '9876500006', 170, 150, 90, 'South Campus', 'Female', 'Active'),
(7, 'Dr. Kalam Hostel', 'Sanjay Kulkarni', '9876500007', 200, 175, 100, 'East Campus', 'Male', 'Active'),
(8, 'Rani Laxmi Bai Hostel', 'Rekha Sharma', '9876500008', 140, 120, 70, 'West Campus', 'Female', 'Active'),
(9, 'Bhagat Singh Bhavan', 'Deepak Tiwari', '9876500009', 160, 145, 85, 'North Campus', 'Male', 'Active'),
(10, 'Ahilyabai Hostel', 'Anita Desai', '9876500010', 130, 110, 65, 'South Campus', 'Female', 'Active'),
(11, 'Netaji Hostel', 'Rajesh Bhatt', '9876500011', 190, 170, 95, 'Central Campus', 'Male', 'Active'),
(12, 'Indira Bhavan', 'Seema Nair', '9876500012', 150, 135, 75, 'Central Campus', 'Female', 'Active'),
(13, 'Aryabhata House', 'Vinay Rao', '9876500013', 170, 150, 80, 'East Campus', 'Male', 'Active'),
(14, 'Maitreyi Hostel', 'Kavita Singh', '9876500014', 120, 100, 60, 'West Campus', 'Female', 'Active'),
(15, 'Chandrasekhar Bhavan', 'Umesh Patil', '9876500015', 180, 165, 90, 'North Campus', 'Male', 'Active');

-- to display/retrieve table data
SELECT * FROM Hostel;               

-- to remove complete data from table
truncate table Hostel;

-- to delete complete attributes and records 
drop table Hostel;

-- Table 11: Hostel_Residents
CREATE TABLE Hostel_Residents (
    resident_id INT PRIMARY KEY,
    student_id INT,
    hostel_id INT,
    room_number VARCHAR(10),
    bed_number INT,
    joining_date DATE,
    leaving_date DATE,
    status VARCHAR(20),
    guardian_name VARCHAR(100),
    contact_number VARCHAR(15)
);

-- Insert records into the table
INSERT INTO Hostel_Residents (resident_id, student_id, hostel_id, room_number, bed_number,joining_date, leaving_date, status, guardian_name, contact_number) 
VALUES
(1, 1, 1, 'A101', 1, '2023-08-01', NULL, 'Active', 'Rajesh Kumar', '9876543210'),
(2, 2, 2, 'B202', 2, '2023-08-01', NULL, 'Active', 'Meera Sharma', '9876543211'),
(3, 3, 3, 'C303', 1, '2023-08-01', NULL, 'Active', 'Sunil Verma', '9876543212'),
(4, 4, 4, 'D101', 1, '2023-08-01', NULL, 'Active', 'Lata Singh', '9876543213'),
(5, 5, 5, 'E202', 2, '2023-08-01', NULL, 'Active', 'Ravi Shankar', '9876543214'),
(6, 6, 6, 'F303', 3, '2023-08-01', NULL, 'Active', 'Suman Joshi', '9876543215'),
(7, 7, 7, 'G101', 1, '2023-08-01', NULL, 'Active', 'Alok Nair', '9876543216'),
(8, 8, 8, 'H202', 2, '2023-08-01', NULL, 'Active', 'Nidhi Desai', '9876543217'),
(9, 9, 9, 'I303', 3, '2023-08-01', NULL, 'Active', 'Rajiv Rathi', '9876543218'),
(10, 10, 10, 'J101', 1, '2023-08-01', NULL, 'Active', 'Rekha Patil', '9876543219'),
(11, 11, 11, 'K202', 2, '2023-08-01', NULL, 'Active', 'Mahesh Rao', '9876543220'),
(12, 12, 12, 'L303', 3, '2023-08-01', NULL, 'Active', 'Anita Bhatt', '9876543221'),
(13, 13, 13, 'M101', 1, '2023-08-01', NULL, 'Active', 'Prakash Jain', '9876543222'),
(14, 14, 14, 'N202', 2, '2023-08-01', NULL, 'Active', 'Kiran Mehta', '9876543223'),
(15, 15, 15, 'O303', 3, '2023-08-01', NULL, 'Active', 'Neeta Kulkarni', '9876543224');

-- to display/retrieve table data
SELECT * FROM Hostel_Residents;               

-- to remove complete data from table
truncate table Hostel_Residents;

-- to delete complete attributes and records 
drop table Hostel_Residents;

-- Table 12: Events
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    department VARCHAR(100),
    coordinator_name VARCHAR(100),
    event_date DATE,
    event_time TIME,
    venue VARCHAR(100),
    participants_expected INT,
    budget DECIMAL(10,2),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Events (event_id, event_name, department, coordinator_name, event_date,event_time, venue, participants_expected, budget, status) 
VALUES
(1, 'Tech Fest', 'Computer Science', 'Anil Kumar', '2024-09-15', '10:00:00', 'Auditorium', 200, 50000.00, 'Scheduled'),
(2, 'Mech Expo', 'Mechanical', 'Suresh Rathi', '2024-09-20', '11:00:00', 'Workshop Hall', 150, 30000.00, 'Scheduled'),
(3, 'Civil Conclave', 'Civil', 'Manish Joshi', '2024-09-25', '09:30:00', 'Seminar Room', 100, 20000.00, 'Scheduled'),
(4, 'Electrothon', 'Electronics', 'Ritika Shah', '2024-10-01', '10:30:00', 'Lab Block', 120, 25000.00, 'Scheduled'),
(5, 'Hackathon', 'Computer Science', 'Ravi Deshmukh', '2024-10-05', '09:00:00', 'Auditorium', 250, 60000.00, 'Scheduled'),
(6, 'Robotics Challenge', 'Mechanical', 'Deepika Nair', '2024-10-10', '11:00:00', 'Ground Arena', 180, 45000.00, 'Scheduled'),
(7, 'Green Building Seminar', 'Civil', 'Ajay Patel', '2024-10-15', '10:00:00', 'Seminar Hall', 80, 15000.00, 'Scheduled'),
(8, 'IoT Workshop', 'Electronics', 'Kavita Rao', '2024-10-20', '10:30:00', 'Lab 3', 100, 30000.00, 'Scheduled'),
(9, 'AI Summit', 'Computer Science', 'Naveen Kumar', '2024-10-25', '10:00:00', 'Main Hall', 220, 55000.00, 'Scheduled'),
(10, 'AutoCAD Training', 'Mechanical', 'Shalini Mehra', '2024-11-01', '11:30:00', 'CAD Lab', 90, 20000.00, 'Scheduled'),
(11, 'Bridge Design Comp.', 'Civil', 'Rajesh Singh', '2024-11-05', '10:00:00', 'Workshop', 70, 18000.00, 'Scheduled'),
(12, 'Sensor Tech Seminar', 'Electronics', 'Arvind Tiwari', '2024-11-10', '10:15:00', 'Lab Block', 110, 22000.00, 'Scheduled'),
(13, 'Web Dev Bootcamp', 'Computer Science', 'Sneha Gupta', '2024-11-15', '09:45:00', 'Auditorium', 210, 40000.00, 'Scheduled'),
(14, 'Machine Design Talk', 'Mechanical', 'Ankit Verma', '2024-11-20', '11:00:00', 'Classroom A2', 100, 17000.00, 'Scheduled'),
(15, 'Smart City Conf.', 'Civil', 'Lalit Chawla', '2024-11-25', '10:00:00', 'Seminar Hall', 130, 26000.00, 'Scheduled');

-- to display/retrieve table data
SELECT * FROM Events;               

-- to remove complete data from table
truncate table Events;

-- to delete complete attributes and records 
drop table Events;

-- Table 13: Event_Participants
CREATE TABLE Event_Participants (
    participant_id INT PRIMARY KEY,
    event_id INT,
    student_id INT,
    registration_date DATE,
    participation_status VARCHAR(20),
    certificate_issued BOOLEAN,
    feedback_given BOOLEAN,
    score INT,
    position VARCHAR(20),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Event_Participants (participant_id, event_id, student_id, registration_date, participation_status,certificate_issued, feedback_given, score, position, remarks)
 VALUES
(1, 1, 1, '2024-08-20', 'Attended', TRUE, TRUE, 85, '2nd', 'Great performance'),
(2, 1, 2, '2024-08-21', 'Attended', TRUE, FALSE, 92, '1st', 'Excellent'),
(3, 2, 3, '2024-08-22', 'Absent', FALSE, FALSE, 0, '-', 'Did not attend'),
(4, 2, 4, '2024-08-22', 'Attended', TRUE, TRUE, 76, '-', 'Participated actively'),
(5, 3, 5, '2024-08-23', 'Attended', TRUE, TRUE, 81, '3rd', 'Well done'),
(6, 4, 6, '2024-08-24', 'Attended', TRUE, TRUE, 70, '-', 'Completed'),
(7, 4, 7, '2024-08-24', 'Attended', TRUE, FALSE, 88, '1st', 'Winner'),
(8, 5, 8, '2024-08-25', 'Absent', FALSE, FALSE, 0, '-', 'Medical reason'),
(9, 6, 9, '2024-08-26', 'Attended', TRUE, TRUE, 75, '-', 'Good effort'),
(10, 6, 10, '2024-08-26', 'Attended', TRUE, TRUE, 90, '1st', 'Excellent demo'),
(11, 7, 11, '2024-08-27', 'Attended', TRUE, FALSE, 68, '-', 'Completed'),
(12, 8, 12, '2024-08-28', 'Attended', TRUE, TRUE, 80, '2nd', 'Innovative ideas'),
(13, 9, 13, '2024-08-29', 'Attended', TRUE, TRUE, 95, '1st', 'Outstanding'),
(14, 10, 14, '2024-08-30', 'Attended', TRUE, FALSE, 72, '-', 'Well prepared'),
(15, 11, 15, '2024-08-31', 'Absent', FALSE, FALSE, 0, '-', 'No response');

-- to display/retrieve table data
SELECT * FROM Event_Participants;               

-- to remove complete data from table
truncate table Event_Participants;

-- to delete complete attributes and records 
drop table Event_Participants;

-- Table 14: Staff
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(100),
    department VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    joining_date DATE,
    salary DECIMAL(10,2),
    employment_type VARCHAR(20),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Staff (staff_id, name, designation, department, contact_number,email, joining_date, salary, employment_type, status) 
VALUES
(1, 'Amit Sharma', 'Professor', 'Computer Science', '9876543101', 'amit.sharma@univ.edu', '2018-06-01', 95000.00, 'Permanent', 'Active'),
(2, 'Neha Gupta', 'Associate Prof.', 'Electronics', '9876543102', 'neha.gupta@univ.edu', '2019-07-10', 85000.00, 'Permanent', 'Active'),
(3, 'Ravi Verma', 'Lab Assistant', 'Mechanical', '9876543103', 'ravi.verma@univ.edu', '2020-01-20', 40000.00, 'Contract', 'Active'),
(4, 'Kavita Iyer', 'Clerk', 'Admin', '9876543104', 'kavita.iyer@univ.edu', '2017-09-01', 35000.00, 'Permanent', 'Active'),
(5, 'Sunil Joshi', 'Professor', 'Civil', '9876543105', 'sunil.joshi@univ.edu', '2016-05-15', 93000.00, 'Permanent', 'Active'),
(6, 'Meera Deshmukh', 'Asst. Professor', 'Electrical', '9876543106', 'meera.d@univ.edu', '2021-08-18', 78000.00, 'Permanent', 'Active'),
(7, 'Suresh Rao', 'Security Officer', 'Security', '9876543107', 'suresh.rao@univ.edu', '2015-12-10', 32000.00, 'Permanent', 'Active'),
(8, 'Sneha Jain', 'Admin Officer', 'Admin', '9876543108', 'sneha.jain@univ.edu', '2019-03-25', 50000.00, 'Permanent', 'Active'),
(9, 'Rajiv Menon', 'Assistant', 'Library', '9876543109', 'rajiv.menon@univ.edu', '2020-11-01', 37000.00, 'Contract', 'Active'),
(10, 'Pooja Rathi', 'Accountant', 'Accounts', '9876543110', 'pooja.rathi@univ.edu', '2018-02-14', 48000.00, 'Permanent', 'Active'),
(11, 'Manoj Bhatt', 'Technician', 'Electronics', '9876543111', 'manoj.bhatt@univ.edu', '2016-08-22', 42000.00, 'Permanent', 'Active'),
(12, 'Ritika Shah', 'HOD', 'Mechanical', '9876543112', 'ritika.shah@univ.edu', '2015-04-05', 100000.00, 'Permanent', 'Active'),
(13, 'Deepak Kulkarni', 'System Admin', 'IT', '9876543113', 'deepak.k@univ.edu', '2017-06-30', 60000.00, 'Permanent', 'Active'),
(14, 'Anjali Singh', 'Counselor', 'Student Affairs', '9876543114', 'anjali.s@univ.edu', '2022-01-10', 55000.00, 'Contract', 'Active'),
(15, 'Naveen Chauhan', 'Professor', 'Computer Science', '9876543115', 'naveen.c@univ.edu', '2014-07-12', 97000.00, 'Permanent', 'Active');

-- to display/retrieve table data
SELECT * FROM Staff;               

-- to remove complete data from table
truncate table Staff;

-- to delete complete attributes and records 
drop table Staff;

-- Table 15: Transport
CREATE TABLE Transport (
    vehicle_id INT PRIMARY KEY,
    vehicle_number VARCHAR(20),
    driver_name VARCHAR(100),
    driver_contact VARCHAR(15),
    route_name VARCHAR(100),
    capacity INT,
    occupied_seats INT,
    start_point VARCHAR(100),
    end_point VARCHAR(100),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Transport (vehicle_id, vehicle_number, driver_name, driver_contact, route_name,capacity, occupied_seats, start_point, end_point, status) 
VALUES
(1, 'MH12AB1234', 'Rajesh Pawar', '9876543301', 'Pune to Campus', 40, 35, 'Pune Station', 'University Gate', 'Running'),
(2, 'MH12CD5678', 'Vijay Shinde', '9876543302', 'Nigdi to Campus', 50, 45, 'Nigdi Chowk', 'Campus', 'Running'),
(3, 'MH14EF9012', 'Sunil More', '9876543303', 'Swargate to Campus', 35, 30, 'Swargate Depot', 'Univ Stop', 'Running'),
(4, 'MH13GH3456', 'Anil Jagtap', '9876543304', 'Katraj to Campus', 40, 36, 'Katraj Chowk', 'Main Building', 'Running'),
(5, 'MH12IJ7890', 'Prakash Khot', '9876543305', 'Hadapsar to Campus', 42, 38, 'Hadapsar Depot', 'North Block', 'Running'),
(6, 'MH12KL2345', 'Sandeep Patil', '9876543306', 'Shivajinagar to Campus', 48, 40, 'Shivaji Nagar', 'Library Stop', 'Running'),
(7, 'MH15MN6789', 'Nilesh Kale', '9876543307', 'Warje to Campus', 40, 32, 'Warje Depot', 'Admin Gate', 'Running'),
(8, 'MH12OP1234', 'Ramesh Gaikwad', '9876543308', 'Sinhgad to Campus', 45, 39, 'Sinhgad Road', 'South Gate', 'Running'),
(9, 'MH16QR5678', 'Shivaji Salve', '9876543309', 'Viman Nagar to Campus', 50, 46, 'Viman Nagar', 'Hostel Stop', 'Running'),
(10, 'MH14ST9012', 'Manoj Joshi', '9876543310', 'Baner to Campus', 38, 34, 'Baner Phata', 'East Wing', 'Running'),
(11, 'MH12UV3456', 'Ravindra Rane', '9876543311', 'Aundh to Campus', 40, 35, 'Aundh Road', 'Science Block', 'Running'),
(12, 'MH13WX7890', 'Kiran Jadhav', '9876543312', 'Koregaon Park to Campus', 30, 27, 'KP Plaza', 'South Wing', 'Running'),
(13, 'MH12YZ2345', 'Yogesh Mane', '9876543313', 'Magarpatta to Campus', 44, 41, 'Magarpatta City', 'Main Gate', 'Running'),
(14, 'MH14AA6789', 'Ganesh Bhosale', '9876543314', 'Wakad to Campus', 50, 48, 'Wakad Chowk', 'North Entry', 'Running'),
(15, 'MH13BB1234', 'Sachin Londhe', '9876543315', 'Camp to Campus', 36, 33, 'Camp Area', 'Admin Block', 'Running');

-- to display/retrieve table data
SELECT * FROM Transport;               

-- to remove complete data from table
truncate table Transport;

-- to delete complete attributes and records 
drop table Transport;