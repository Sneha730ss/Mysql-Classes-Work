-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
CREATE DATABASE E_Learning_Platform1;

-- to work on it, you need to use it first
USE E_Learning_Platform1;

-- delete database
-- DROP DATABASE E_Learning_Platform;

-- ---------------------------------------- Database Analysis ----------------------------------------

/*
T1 : Students(StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID)

T2 : Teachers(TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status)

T3 : Courses(CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status)

T4 : Enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus)

T5 : Classes(ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate)

T6 : Assignments(AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink)

T7 : Submissions(SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission)

T8 : Exams(ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished)

T9 : Payments(PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments)

T10: DiscussionForum(PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink)

*/

-- --------------------------------------- Table Related Queries ---------------------------------

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DateOfBirth DATE,
    Address VARCHAR(255),
    EnrollmentDate DATE,
    Status VARCHAR(20),
    ClassID INT
);

-- Insert 10 records into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '2005-05-10', 'Delhi, India', '2023-06-01', 'Active', 101),
(2, 'Saanvi', 'Verma', 'saanvi.verma@example.com', '9876543211', '2004-11-23', 'Mumbai, India', '2023-06-02', 'Active', 101),
(3, 'Vivaan', 'Patel', 'vivaan.patel@example.com', '9876543212', '2006-01-15', 'Ahmedabad, India', '2023-06-03', 'Active', 102),
(4, 'Ananya', 'Singh', 'ananya.singh@example.com', '9876543213', '2005-08-30', 'Lucknow, India', '2023-06-04', 'Active', 102),
(5, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876543214', '2005-03-18', 'Hyderabad, India', '2023-06-05', 'Active', 103),
(6, 'Ishaan', 'Nair', 'ishaan.nair@example.com', '9876543215', '2006-12-11', 'Kochi, India', '2023-06-06', 'Active', 103),
(7, 'Diya', 'Mishra', 'diya.mishra@example.com', '9876543216', '2004-07-09', 'Pune, India', '2023-06-07', 'Active', 104),
(8, 'Kabir', 'Joshi', 'kabir.joshi@example.com', '9876543217', '2005-02-20', 'Bengaluru, India', '2023-06-08', 'Active', 104),
(9, 'Myra', 'Kaur', 'myra.kaur@example.com', '9876543218', '2006-04-14', 'Chandigarh, India', '2023-06-09', 'Active', 105),
(10, 'Ayaan', 'Yadav', 'ayaan.yadav@example.com', '9876543219', '2005-09-25', 'Jaipur, India', '2023-06-10', 'Active', 105);

-- to display/retrieve table data
SELECT * FROM Students;

-- to remove complete data from table
truncate table Students;

-- to delete complete attributes and records 
drop table Students;

-- -------------------------------------------- Clause ----------------------------------------------
-- 1. Shows only first and last names of students
SELECT FirstName, LastName FROM Students;

-- 2. Shows students who are in class 101
SELECT * FROM Students WHERE ClassID = 101;

-- 3. Shows active students in class 101
SELECT * FROM Students WHERE ClassID = 101 AND Status = 'Active';

-- 4.Shows students in class 101 or 102
SELECT * FROM Students WHERE ClassID = 101 OR ClassID = 102;

-- 5. Shows all students ordered by first name (A-Z)
SELECT * FROM Students ORDER BY FirstName ASC;

-- 6. Shows students ordered by latest enrollment date first
SELECT * FROM Students ORDER BY EnrollmentDate DESC;

-- 7. Finds students whose email ends with @example.com
SELECT * FROM Students WHERE Email LIKE '%@example.com';

-- 8. Shows students in class 101 or 103
SELECT * FROM Students WHERE ClassID IN (101, 103);

-- 9. Shows students not in class 101 or 103
SELECT * FROM Students WHERE ClassID NOT IN (101, 103);

-- 10. Shows students born in the year 2005
SELECT * FROM Students WHERE DateOfBirth BETWEEN '2005-01-01' AND '2005-12-31';

-- 11. Shows students who have no phone number
SELECT * FROM Students WHERE Phone IS NULL;

-- 12. Shows students who have email addresses
SELECT * FROM Students WHERE Email IS NOT NULL;

-- 13. Shows unique class IDs
SELECT DISTINCT ClassID FROM Students;

-- 14. Shows only the first 5 students
SELECT * FROM Students LIMIT 5;

-- 15. Counts total number of students
SELECT COUNT(*) FROM Students;

-- 16. Counts how many students are active
SELECT COUNT(*) FROM Students WHERE Status = 'Active';

-- 17. Shows number of students in each class
SELECT ClassID, COUNT(*) FROM Students GROUP BY ClassID;

-- 18. Shows classes with more than 1 student
SELECT ClassID, COUNT(*) AS Total FROM Students GROUP BY ClassID HAVING COUNT(*) > 1;

-- 19. Marks student with ID 10 as Inactive
UPDATE Students SET Status = 'Inactive' WHERE StudentID = 10;

-- 20. Deletes student with ID 9
DELETE FROM Students WHERE StudentID = 9;

-- 21. Shows youngest and oldest students' birthdates
SELECT MIN(DateOfBirth), MAX(DateOfBirth) FROM Students;

-- 22. Shows full names by combining first and last names
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Students;

-- 23. Count total email
SELECT COUNT(*) AS Totalemail FROM Students;

-- 24. Shows information by combining Address and EnrollmentDate
SELECT CONCAT(Address, ' ', EnrollmentDate) AS FullName FROM Students;

-- 25. Get current date
SELECT CURRENT_DATE AS Today;

-- -------------------------------------------------------------------------------------------------------------------------

-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2),
    Experience INT,
    Status VARCHAR(20)
);

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9998887770', 'Mathematics', '2015-01-15', 75000.00, 10, 'Active'),
(2, 'Anita', 'Desai', 'anita.desai@example.com', '9998887771', 'Science', '2016-02-20', 70000.00, 9, 'Active'),
(3, 'Sanjay', 'Gupta', 'sanjay.gupta@example.com', '9998887772', 'English', '2014-03-25', 80000.00, 11, 'Active'),
(4, 'Priya', 'Sharma', 'priya.sharma@example.com', '9998887773', 'History', '2017-04-30', 68000.00, 8, 'Active'),
(5, 'Rakesh', 'Mehta', 'rakesh.mehta@example.com', '9998887774', 'Geography', '2013-05-10', 85000.00, 12, 'Active'),
(6, 'Kavita', 'Singh', 'kavita.singh@example.com', '9998887775', 'Computer Science', '2018-06-15', 72000.00, 6, 'Active'),
(7, 'Ajay', 'Patel', 'ajay.patel@example.com', '9998887776', 'Physics', '2012-07-20', 90000.00, 13, 'Active'),
(8, 'Sunita', 'Nair', 'sunita.nair@example.com', '9998887777', 'Chemistry', '2019-08-25', 71000.00, 5, 'Active'),
(9, 'Vikram', 'Rao', 'vikram.rao@example.com', '9998887778', 'Economics', '2011-09-30', 95000.00, 14, 'Active'),
(10, 'Meena', 'Joshi', 'meena.joshi@example.com', '9998887779', 'Biology', '2020-10-05', 68000.00, 4, 'Active');

-- to display/retrieve table data
SELECT * FROM Teachers;

-- to remove complete data from table
truncate table Teachers;

-- to delete complete attributes and records 
drop table Teachers;

-- ------------------------------------- Queries --------------------------------------------------
-- 1. Add a new column 'DeptID' to Teachers table
ALTER TABLE Teachers ADD DeptID INT;

-- 2. Assign department ID 1 (Science) to teacher with ID 2
UPDATE Teachers SET DeptID = 1 WHERE TeacherID = 2;

-- 3. Show all teachers' names and specializations
SELECT FirstName, LastName, Specialization FROM Teachers;

-- 4. Find teachers who have more than 10 years of experience
SELECT * FROM Teachers WHERE Experience > 10;

-- 5. List teachers by salary in descending order
SELECT FirstName, LastName, Salary FROM Teachers ORDER BY Salary DESC;

-- 6. Find teachers whose email ends with 'example.com'
SELECT * FROM Teachers WHERE Email LIKE '%@example.com';

-- 7. Find teachers who specialize in Science or English
SELECT * FROM Teachers WHERE Specialization IN ('Science', 'English');

-- 8. Show teachers with salary between 70000 and 80000
SELECT * FROM Teachers WHERE Salary BETWEEN 70000 AND 80000;

-- 9. Find teachers who don't have a department assigned
SELECT * FROM Teachers WHERE DeptID IS NULL;

-- 10. Show first 5 teachers
SELECT * FROM Teachers LIMIT 5;

-- 11. List all unique specializations
SELECT DISTINCT Specialization FROM Teachers;

-- 12. Count number of active teachers
SELECT COUNT(*) AS ActiveTeachers FROM Teachers WHERE Status = 'Active';

-- 13. Average salary of all teachers
SELECT AVG(Salary) AS AvgSalary FROM Teachers;

-- 14. Get highest salary
SELECT MAX(Salary) AS HighestSalary FROM Teachers;

-- 15. Count of teachers per specialization
SELECT Specialization, COUNT(*) AS Total FROM Teachers GROUP BY Specialization;

-- 16. Show specializations with more than 1 teacher
SELECT Specialization, COUNT(*) AS Total FROM Teachers GROUP BY Specialization HAVING COUNT(*) > 1;

-- 17. Delete a teacher with ID 10
DELETE FROM Teachers WHERE TeacherID = 10;

-- 18. Rename table from Teachers to Faculty
RENAME TABLE Teachers TO Faculty;

-- 19. Make Email column NOT NULL
ALTER TABLE Faculty MODIFY Email VARCHAR(100) NOT NULL;

-- 20. display full name in single column
SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Specialization FROM Faculty;

-- 21. Delete teachers salary less than 68000 
DELETE FROM Faculty WHERE Salary < 68000;

-- 22. to search the email
CREATE INDEX idx_email ON Faculty(Email);

-- 23. Retrieve Faculty earning between ₹70,000 and ₹85,000
SELECT FirstName, LastName, Salary
FROM Faculty
WHERE Salary >= 70000 AND Salary <= 85000;

-- 24. Show teachers whose last name starts with 'S'
SELECT TeacherID, FirstName, LastName
FROM Faculty
WHERE LastName LIKE 'S%';

-- 25. Retrieve teachers earning between ₹70,000 and ₹85,000
SELECT FirstName, LastName, Salary
FROM Faculty
WHERE Salary >= 70000 AND Salary <= 85000;

-- ------------------------------------------------------------------------------------------------------------------------------------
-- Table 3: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Description TEXT,
    Credits INT,
    Category VARCHAR(50),
    DurationWeeks INT,
    TeacherID INT,
    Level VARCHAR(20),
    Language VARCHAR(30),
    Status VARCHAR(20),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

INSERT INTO Courses (CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status) VALUES
(1, 'Mathematics 101', 'Introductory math course', 4, 'STEM', 12, 1, 'Beginner', 'English', 'Active'),
(2, 'Science Basics', 'Foundation in science', 3, 'STEM', 10, 2, 'Beginner', 'English', 'Active'),
(3, 'English Grammar', 'Grammar essentials', 2, 'Languages', 8, 3, 'Intermediate', 'English', 'Active'),
(4, 'World History', 'Global historical events', 3, 'Social Studies', 10, 4, 'Intermediate', 'English', 'Active'),
(5, 'Physical Geography', 'Earth’s features', 3, 'Social Studies', 10, 5, 'Intermediate', 'English', 'Active'),
(6, 'Python Programming', 'Basics of Python', 4, 'Computer Science', 12, 6, 'Beginner', 'English', 'Active'),
(7, 'Physics Concepts', 'Mechanics and waves', 4, 'STEM', 12, 7, 'Intermediate', 'English', 'Active'),
(8, 'Organic Chemistry', 'Carbon compounds', 4, 'STEM', 12, 8, 'Advanced', 'English', 'Active'),
(9, 'Macroeconomics', 'National economy', 3, 'Commerce', 10, 9, 'Advanced', 'English', 'Active'),
(10, 'Botany Basics', 'Plant biology', 3, 'Science', 10, 10, 'Beginner', 'English', 'Active');

-- to display/retrieve table data
SELECT * FROM Courses;

-- to remove complete data from table
truncate table Courses;

-- to delete complete attributes and records 
drop table Courses;

-- ------------------------------------ Queries ---------------------------------------------------------------------------

-- 1. Ensure Credits always has a value
ALTER TABLE Courses MODIFY Credits INT NOT NULL;

-- 2. Guarantee each CourseName is unique
ALTER TABLE Courses ADD CONSTRAINT uq_course_name UNIQUE (CourseName);

-- 3. CHECK: Enforce Credits to be positive
ALTER TABLE Courses ADD CONSTRAINT chk_credits_positive CHECK (Credits > 0);

-- 5. DEFAULT: Set default Status to 'Inactive'
ALTER TABLE Courses ALTER Status SET DEFAULT 'Inactive';

-- 6. CREATE VIEW: Simplify access to active courses
CREATE VIEW ActiveCourses AS SELECT * FROM Courses WHERE Status = 'Active';

-- 7. INSERT: Add a new course via DML
INSERT INTO Courses VALUES (11, 'Data Structures', 'Intro DS', 4, 'CS', 12, 6, 'Intermediate', 'English', 'Active');

-- 9. UPDATE: Change a course’s level
UPDATE Courses SET Level = 'Advanced' WHERE CourseID = 2;

-- 10. DELETE: Remove a discontinued course
DELETE FROM Courses WHERE Status = 'Inactive';

-- 11. Comparison: Select high-credit courses
SELECT * FROM Courses WHERE Credits >= 4;

-- 12. BETWEEN: Find courses with 10 to 12 weeks duration
SELECT * FROM Courses WHERE DurationWeeks BETWEEN 10 AND 12;

-- 13. AND/OR: Intermediate STEM courses or short beginner courses
SELECT * FROM Courses WHERE (Category = 'STEM' AND Level = 'Intermediate') OR (Level = 'Beginner' AND DurationWeeks < 10);

-- 14. LIKE: Courses whose name starts with 'P'
SELECT CourseID, CourseName FROM Courses WHERE CourseName LIKE 'P%';

-- 15. IN: Courses taught by Teachers 1, 3, or 5
SELECT * FROM Courses WHERE TeacherID IN (1, 3, 5);

-- 16. UPPER: Show course names in uppercase
SELECT CourseID, UPPER(CourseName) AS UCName FROM Courses;

-- 17. CONCAT: Combine name and category
SELECT CONCAT(CourseName, ' [', Category, ']') AS FullTitle FROM Courses;

-- 18. COUNT/AVG: Number of courses and average credits
SELECT COUNT(*) AS NumCourses, AVG(Credits) AS AvgCredits FROM Courses;

-- 19. YEAR: Group teachers by hire year
SELECT YEAR(HireDate) AS YearHired, COUNT(*) AS NumHired FROM Teachers GROUP BY YEAR(HireDate);

-- 20. NOW: Show current datetime
SELECT NOW() AS CurrentDateTime;

-- 21. INNER JOIN: List courses with their teachers
SELECT c.CourseName, t.FirstName, t.LastName
FROM Courses c
INNER JOIN Teachers t ON c.TeacherID = t.TeacherID;

-- 22. LEFT JOIN: List all teachers and any courses they teach
SELECT t.FirstName, t.LastName, c.CourseName
FROM Teachers t
LEFT JOIN Courses c ON t.TeacherID = c.TeacherID;

-- 23. RIGHT JOIN: List all courses with teachers, even if teacher record missing
SELECT c.CourseName, t.FirstName
FROM Courses c
RIGHT JOIN Teachers t ON c.TeacherID = t.TeacherID;

-- 24. Multiple JOINs: Teachers with active courses
SELECT t.FirstName, c.CourseName
FROM Teachers t
JOIN Courses c ON t.TeacherID = c.TeacherID
WHERE t.Status = 'Active' AND c.Status = 'Active';

-- 25. Aggregated join with HAVING: Teachers who teach ≥2 courses
SELECT t.FirstName, COUNT(c.CourseID) AS NumCourses
FROM Teachers t
JOIN Courses c ON t.TeacherID = c.TeacherID
GROUP BY t.TeacherID
HAVING COUNT(c.CourseID) >= 2;

-- ------------------------------------------------------------------------------------------------------------------

-- Table 4: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Progress INT,
    CompletionDate DATE,
    Grade VARCHAR(5),
    Feedback TEXT,
    Status VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus) VALUES
(1, 1, 1, '2023-06-01', 50, NULL, NULL, 'Doing well', 'In Progress', 'Paid'),
(2, 2, 1, '2023-06-02', 60, NULL, NULL, 'Excellent', 'In Progress', 'Paid'),
(3, 3, 2, '2023-06-03', 45, NULL, NULL, 'Needs improvement', 'In Progress', 'Pending'),
(4, 4, 3, '2023-06-04', 70, NULL, NULL, 'Great participation', 'In Progress', 'Paid'),
(5, 5, 4, '2023-06-05', 40, NULL, NULL, 'Struggling', 'In Progress', 'Paid'),
(6, 6, 5, '2023-06-06', 55, NULL, NULL, 'Average', 'In Progress', 'Paid'),
(7, 7, 6, '2023-06-07', 65, NULL, NULL, 'Above average', 'In Progress', 'Paid'),
(8, 8, 7, '2023-06-08', 35, NULL, NULL, 'Needs assistance', 'In Progress', 'Pending'),
(9, 9, 8, '2023-06-09', 80, NULL, NULL, 'Outstanding', 'In Progress', 'Paid'),
(10, 10, 9, '2023-06-10', 50, NULL, NULL, 'Good effort', 'In Progress', 'Paid');

-- to display/retrieve table data
SELECT * FROM Enrollments;

-- to remove complete data from table
truncate table Enrollments;

-- to delete complete attributes and records 
drop table Enrollments;

-- --------------------------------------- Queries -------------------------------------------------------------
-- 1. Show all students whose progress is more than 50
SELECT * FROM Enrollments WHERE Progress > 50;

-- 2. List all enrollments sorted by EnrollmentDate
SELECT * FROM Enrollments ORDER BY EnrollmentDate;

-- 3. Count how many students are in each payment status
SELECT PaymentStatus, COUNT(*) FROM Enrollments GROUP BY PaymentStatus;

-- 4. Show enrollments where feedback is not 'Excellent'
SELECT * FROM Enrollments WHERE Feedback != 'Excellent';

-- 5. Show enrollments between 2023-06-01 and 2023-06-05
SELECT * FROM Enrollments WHERE EnrollmentDate BETWEEN '2023-06-01' AND '2023-06-05';

-- 6. Add a new enrollment
INSERT INTO Enrollments VALUES (11, 11, 2, '2023-06-11', 0, NULL, NULL, NULL, 'Not Started', 'Pending');

-- 7. Change progress of student with ID 1
UPDATE Enrollments SET Progress = 75 WHERE StudentID = 1;

-- 8. Remove enrollment with EnrollmentID 11
DELETE FROM Enrollments WHERE EnrollmentID = 11;

-- 9. SELECT with specific columns
SELECT StudentID, CourseID, Status FROM Enrollments;

-- 10. Progress greater than 50
SELECT * FROM Enrollments WHERE Progress > 50;

-- 11. PaymentStatus is 'Pending' OR Progress less than 40
SELECT * FROM Enrollments WHERE PaymentStatus = 'Pending' OR Progress < 40;

-- 12. Status is not 'Completed'
SELECT * FROM Enrollments WHERE Status <> 'Completed';

-- 13. Progress between 40 and 60
SELECT * FROM Enrollments WHERE Progress BETWEEN 40 AND 60;

-- 14. Combine AND + OR
SELECT * FROM Enrollments WHERE Progress > 50 AND PaymentStatus = 'Paid';

-- 15. Join Enrollments with Courses
SELECT E.EnrollmentID, C.CourseName, E.Status
FROM Enrollments E
JOIN Courses C ON E.CourseID = C.CourseID;

-- 16. Count enrollments per course
SELECT C.CourseName, COUNT(*) AS TotalEnrollments
FROM Enrollments E
JOIN Courses C ON E.CourseID = C.CourseID
GROUP BY C.CourseName;

-- 17. COUNT total enrollments
SELECT COUNT(*) FROM Enrollments;

-- 18. AVG progress
SELECT AVG(Progress) FROM Enrollments;

-- 19. MAX and MIN progress
SELECT MAX(Progress), MIN(Progress) FROM Enrollments;

-- 20. LENGTH of feedback
SELECT Feedback, LENGTH(Feedback) FROM Enrollments;

-- 21. CONCAT feedback and grade
SELECT CONCAT(Feedback, ' (Grade: ', Grade, ')') AS FeedbackGrade FROM Enrollments;

-- 22. Progress between 80 and 100
SELECT * FROM Enrollments WHERE Progress BETWEEN 80 AND 100;

-- 23. Change progress of student with ID 6
UPDATE Enrollments SET Progress = 50 WHERE StudentID = 6;

-- 24.

-- --------------------------------------------------------------------------------------------------------------

-- Table 5: Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    Schedule VARCHAR(50),
    RoomNumber VARCHAR(20),
    Capacity INT,
    CourseID INT,
    TeacherID INT,
    Semester VARCHAR(10),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


INSERT INTO Classes (ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate) VALUES
(101, 'Math A', 'Mon-Wed 10am', 'R101', 30, 1, 1, '2023S1', '2023-06-01', '2023-08-31'),
(102, 'Science B', 'Tue-Thu 11am', 'R102', 25, 2, 2, '2023S1', '2023-06-01', '2023-08-31'),
(103, 'English C', 'Mon-Wed 2pm', 'R103', 20, 3, 3, '2023S1', '2023-06-01', '2023-08-31'),
(104, 'History D', 'Tue-Thu 1pm', 'R104', 30, 4, 4, '2023S1', '2023-06-01', '2023-08-31'),
(105, 'Geography E', 'Fri 9am', 'R105', 15, 5, 5, '2023S1', '2023-06-01', '2023-08-31'),
(106, 'Python F', 'Mon 3pm', 'R106', 20, 6, 6, '2023S1', '2023-06-01', '2023-08-31'),
(107, 'Physics G', 'Wed 10am', 'R107', 25, 7, 7, '2023S1', '2023-06-01', '2023-08-31'),
(108, 'Chemistry H', 'Thu 2pm', 'R108', 20, 8, 8, '2023S1', '2023-06-01', '2023-08-31'),
(109, 'Economics I', 'Fri 11am', 'R109', 30, 9, 9, '2023S1', '2023-06-01', '2023-08-31'),
(110, 'Botany J', 'Tue 4pm', 'R110', 15, 10, 10, '2023S1', '2023-06-01', '2023-08-31');

-- to display/retrieve table data
SELECT * FROM Classes;

-- to remove complete data from table
truncate table Classes;

-- to delete complete attributes and records 
drop table Classes;

-- --------------------------------------- Queries -------------------------------------------------------------

-- 1. Retrieve classes with a capacity greater than 20
SELECT * FROM Classes WHERE Capacity > 20;

-- 2. Retrieve classes ordered by StartDate in ascending order
SELECT * FROM Classes ORDER BY StartDate ASC;

-- 3. Count classes by Semester
SELECT Semester, COUNT(*) FROM Classes GROUP BY Semester;

-- 4. Retrieve semesters with more than 2 classes
SELECT Semester, COUNT(*) FROM Classes GROUP BY Semester HAVING COUNT(*) > 2;

-- 5. Retrieve the first 5 classes
SELECT * FROM Classes LIMIT 5;

-- 6. Update the Capacity of class with ClassID 111
UPDATE Classes SET Capacity = 35 WHERE ClassID = 111;

-- 7. Delete the class with ClassID 111
DELETE FROM Classes WHERE ClassID = 111;

-- 8. Retrieve classes ordered by StartDate in ascending order
SELECT * FROM Classes ORDER BY StartDate ASC;

-- 9. Count classes by Semester
SELECT Semester, COUNT(*) FROM Classes GROUP BY Semester;

-- 10. Select classes with Capacity equal to 30
SELECT * FROM Classes WHERE Capacity = 30;

-- 11. Select classes with Capacity greater than 20
SELECT * FROM Classes WHERE Capacity > 20;

-- 12. Select classes with Capacity between 15 and 30
SELECT * FROM Classes WHERE Capacity BETWEEN 15 AND 30;

-- 13. Select classes where ClassName contains 'Math'
SELECT * FROM Classes WHERE ClassName LIKE '%Math%';

-- 14. Select classes where Capacity > 20 AND RoomNumber starts with 'R1'
SELECT * FROM Classes WHERE Capacity > 20 AND RoomNumber LIKE 'R1%';

-- 15. SELF JOIN example: find pairs of classes with same TeacherID
SELECT a.ClassName AS Class1, b.ClassName AS Class2
FROM Classes a
JOIN Classes b ON a.TeacherID = b.TeacherID AND a.ClassID <> b.ClassID;

-- 16. Select only ClassName and Capacity columns
SELECT ClassName, Capacity FROM Classes;

-- 17. Select classes where Capacity is less than 25
SELECT * FROM Classes WHERE Capacity < 25;

-- 18. Select classes ordered by Capacity descending
SELECT * FROM Classes ORDER BY Capacity DESC;

-- 19. Select count of classes grouped by TeacherID
SELECT TeacherID, COUNT(*) AS NumberOfClasses FROM Classes GROUP BY TeacherID;

-- 20. Select classes that start on or after '2023-06-01'
SELECT * FROM Classes WHERE StartDate >= '2023-06-01';

-- 21. Select classes where Semester is '2023S1'
SELECT * FROM Classes WHERE Semester = '2023S1';

-- 22. Select classes having Capacity more than average Capacity
SELECT * FROM Classes WHERE Capacity > (SELECT AVG(Capacity) FROM Classes);

-- 23. Update RoomNumber of ClassID 102 to 'R202'
UPDATE Classes SET RoomNumber = 'R202' WHERE ClassID = 102;

-- 24. Add UNIQUE constraint on RoomNumber
ALTER TABLE Classes ADD CONSTRAINT UniqueRoom UNIQUE (RoomNumber);

-- 25. Add NOT NULL constraint on ClassName 
ALTER TABLE Classes MODIFY ClassName VARCHAR(100) NOT NULL;

-- --------------------------------------------------------------------------------------------------------------
-- Table 6: Assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    CourseID INT,
    ClassID INT,
    MaxMarks INT,
    AssignedDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Assignments (AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink) VALUES
(1, 'Algebra HW', 'Practice algebra problems', '2023-07-15', 1, 101, 100, '2023-06-15', 'Open', 'link1'),
(2, 'Physics Quiz', 'Concepts of motion', '2023-07-20', 7, 107, 50, '2023-06-18', 'Open', 'link2'),
(3, 'Essay', 'Write on World Wars', '2023-07-25', 4, 104, 100, '2023-06-20', 'Open', 'link3'),
(4, 'Python Project', 'Basic calculator app', '2023-07-30', 6, 106, 100, '2023-06-22', 'Open', 'link4'),
(5, 'Grammar Test', 'Tenses exercise', '2023-07-10', 3, 103, 50, '2023-06-10', 'Open', 'link5'),
(6, 'Botany Diagram', 'Label plant parts', '2023-07-12', 10, 110, 30, '2023-06-12', 'Open', 'link6'),
(7, 'Chemistry Lab', 'Acid-base reactions', '2023-07-28', 8, 108, 70, '2023-06-25', 'Open', 'link7'),
(8, 'Economic Report', 'Indian GDP growth', '2023-07-22', 9, 109, 80, '2023-06-19', 'Open', 'link8'),
(9, 'Geography Map', 'Continents labeling', '2023-07-17', 5, 105, 60, '2023-06-16', 'Open', 'link9'),
(10, 'Science Experiment', 'Simple circuits', '2023-07-18', 2, 102, 90, '2023-06-14', 'Open', 'link10');

-- to display/retrieve table data
SELECT * FROM Assignments;

-- to remove complete data from table
truncate table Assignments;

-- to delete complete attributes and records 
drop table Assignments;

-- --------------------------------------- Queries -------------------------------------------------------------
-- 1. Select assignments with MaxMarks greater than 60
SELECT * FROM Assignments WHERE MaxMarks > 60;

-- 2. Select assignments ordered by DueDate ascending
SELECT * FROM Assignments ORDER BY DueDate ASC;

-- 3. Select assignments where Title contains 'Test'
SELECT * FROM Assignments WHERE Title LIKE '%Test%';

-- 4. Select distinct Status values from Assignments
SELECT DISTINCT Status FROM Assignments;

-- 5. Select assignments grouped by Status and count them
SELECT Status, COUNT(*) AS AssignmentCount FROM Assignments GROUP BY Status;

-- 6. Insert a new assignment record
INSERT INTO Assignments (AssignmentID, Title, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status)
VALUES (11, 'History Presentation', '2023-08-05', 4, 104, 100, '2023-07-01', 'Open');

-- 7. Update Status of AssignmentID 3 to 'Closed'
UPDATE Assignments SET Status = 'Closed' WHERE AssignmentID = 3;

-- 8. Add new column 'Remarks' to Assignments table
ALTER TABLE Assignments ADD Remarks VARCHAR(255);

-- 9. Drop the 'Remarks' column from Assignments table
ALTER TABLE Assignments DROP COLUMN Remarks;

-- 10. Add NOT NULL constraint on Title column
ALTER TABLE Assignments MODIFY Title VARCHAR(100) NOT NULL;

-- 11. Add UNIQUE constraint on AttachmentLink
ALTER TABLE Assignments ADD CONSTRAINT UniqueAttachment UNIQUE (AttachmentLink);

-- 12. Add CHECK constraint to ensure MaxMarks > 0
ALTER TABLE Assignments ADD CONSTRAINT CheckMaxMarks CHECK (MaxMarks > 0);

-- 13. Drop UNIQUE constraint on AttachmentLink (syntax may vary)
ALTER TABLE Assignments DROP CONSTRAINT UniqueAttachment;

-- 14. MaxMarks not equal to 100
SELECT * FROM Assignments WHERE MaxMarks <> 100;

-- 15. MaxMarks greater than or equal to 70
SELECT * FROM Assignments WHERE MaxMarks >= 70;

-- 16. DueDate less than '2023-07-20'
SELECT * FROM Assignments WHERE DueDate < '2023-07-20';

-- 17. Status is NULL
SELECT * FROM Assignments WHERE Status IS NULL;

-- 18. Title contains 'Report' or 'Quiz'
SELECT * FROM Assignments WHERE Title LIKE '%Report%' OR Title LIKE '%Quiz%';

-- 19. Join Assignments with Classes to get ClassName
SELECT a.Title, c.ClassName
FROM Assignments a
JOIN Classes c ON a.ClassID = c.ClassID;

-- 20. Join Assignments with Courses to get CourseName
SELECT a.Title, co.CourseName
FROM Assignments a
JOIN Courses co ON a.CourseID = co.CourseID;

-- 21. Join Assignments, Classes and Courses together
SELECT a.Title, c.ClassName, co.CourseName
FROM Assignments a
JOIN Classes c ON a.ClassID = c.ClassID
JOIN Courses co ON a.CourseID = co.CourseID;

-- 22. Left join Assignments with Classes (show all assignments)
SELECT a.Title, c.ClassName
FROM Assignments a
LEFT JOIN Classes c ON a.ClassID = c.ClassID;

-- 23. Find assignments without classes (if any)
SELECT a.Title
FROM Assignments a
LEFT JOIN Classes c ON a.ClassID = c.ClassID
WHERE c.ClassID IS NULL;

-- 24. Find average MaxMarks
SELECT AVG(MaxMarks) FROM Assignments;

-- 25. Get earliest DueDate
SELECT MIN(DueDate) FROM Assignments;

-- 26. Get length of Description
SELECT LENGTH(Description) FROM Assignments;

-- --------------------------------------------------------------------------------------------------------------

-- Table 7: Submissions
CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY,
    AssignmentID INT,
    StudentID INT,
    SubmissionDate DATE,
    MarksObtained INT,
    Feedback TEXT,
    Status VARCHAR(20),
    FileLink VARCHAR(255),
    PlagiarismScore DECIMAL(5,2),
    LateSubmission BOOLEAN,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Submissions (SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission) VALUES
(1, 1, 1, '2023-07-14', 90, 'Excellent work', 'Graded', 'sub_link1', 5.00, FALSE),
(2, 2, 2, '2023-07-19', 45, 'Good effort', 'Graded', 'sub_link2', 10.00, FALSE),
(3, 3, 3, '2023-07-24', 70, 'Needs clarity', 'Graded', 'sub_link3', 0.00, FALSE),
(4, 4, 4, '2023-07-29', 95, 'Outstanding project', 'Graded', 'sub_link4', 2.50, FALSE),
(5, 5, 5, '2023-07-09', 48, 'Improve grammar', 'Graded', 'sub_link5', 15.00, TRUE),
(6, 6, 6, '2023-07-11', 25, 'Incomplete submission', 'Graded', 'sub_link6', 0.00, TRUE),
(7, 7, 7, '2023-07-27', 60, 'Well done', 'Graded', 'sub_link7', 5.00, FALSE),
(8, 8, 8, '2023-07-21', 78, 'Very detailed', 'Graded', 'sub_link8', 7.50, FALSE),
(9, 9, 9, '2023-07-16', 55, 'Good attempt', 'Graded', 'sub_link9', 3.00, FALSE),
(10, 10, 10, '2023-07-17', 65, 'Nice experiment', 'Graded', 'sub_link10', 12.00, FALSE);

-- to display/retrieve table data
SELECT * FROM Submissions;

-- to remove complete data from table
truncate table Submissions;

-- to delete complete attributes and records 
drop table Submissions;

-- --------------------------------------- Queries -------------------------------------------------------------

-- 1. Select submissions with marks greater than or equal to 60
SELECT * FROM Submissions WHERE MarksObtained >= 60;

-- 2. Select SubmissionID and PlagiarismScore only
SELECT SubmissionID, PlagiarismScore FROM Submissions;

-- 3. Select submissions ordered by PlagiarismScore descending
SELECT * FROM Submissions ORDER BY PlagiarismScore DESC;

-- 4. Select distinct Status values
SELECT DISTINCT Status FROM Submissions;

-- 5. Group submissions by LateSubmission and count them
SELECT LateSubmission, COUNT(*) AS CountByLate FROM Submissions GROUP BY LateSubmission;

-- 6. Update MarksObtained for SubmissionID 2
UPDATE Submissions SET MarksObtained = 50 WHERE SubmissionID = 2;

-- 7. Delete submission with SubmissionID 6
DELETE FROM Submissions WHERE SubmissionID = 6;

-- 8. Add new column 'ReviewedBy' to Submissions
ALTER TABLE Submissions ADD ReviewedBy VARCHAR(50);

-- 9. Drop the 'ReviewedBy' column
ALTER TABLE Submissions DROP COLUMN ReviewedBy;

-- 10. Alter Submissions to add SubmittedAt column with DATETIME type
ALTER TABLE Submissions ADD SubmittedAt DATETIME;

-- 11. Update SubmittedAt to current timestamp
UPDATE Submissions SET SubmittedAt = CURRENT_TIMESTAMP WHERE SubmissionID = 1;

-- 12. Marks not equal to 100
SELECT * FROM Submissions WHERE MarksObtained <> 100;

-- 13. Marks between 50 and 90
SELECT * FROM Submissions WHERE MarksObtained BETWEEN 50 AND 90;

-- 14. PlagiarismScore less than 10 or LateSubmission TRUE
SELECT * FROM Submissions WHERE PlagiarismScore < 10 OR LateSubmission = TRUE;

-- 15. Status is NULL
SELECT * FROM Submissions WHERE Status IS NULL;

-- 16. Feedback contains 'good' using LIKE
SELECT * FROM Submissions WHERE Feedback LIKE '%good%';

-- 17. Join Submissions with Assignments to get Title
SELECT s.SubmissionID, a.Title
FROM Submissions s
JOIN Assignments a ON s.AssignmentID = a.AssignmentID;

-- 18. Left join Submissions to Assignments (all submissions)
SELECT s.SubmissionID, a.Title
FROM Submissions s
LEFT JOIN Assignments a ON s.AssignmentID = a.AssignmentID;

-- 19. Find submissions without matching assignment (if any)
SELECT s.SubmissionID
FROM Submissions s
LEFT JOIN Assignments a ON s.AssignmentID = a.AssignmentID
WHERE a.AssignmentID IS NULL;

-- 20. Count total submissions
SELECT COUNT(*) FROM Submissions;

-- 21. Maximum PlagiarismScore
SELECT Max(PlagiarismScore) AS MaxPlag FROM Submissions;

-- 22. Average MarksObtained
SELECT AVG(MarksObtained) AS AvgMarks FROM Submissions;

-- 23. Minimum PlagiarismScore
SELECT MIN(PlagiarismScore) AS MinPlag FROM Submissions;

-- 24. Convert Status to uppercase
SELECT UPPER(Status) FROM Submissions;

-- 25. Round PlagiarismScore to nearest integer
SELECT ROUND(PlagiarismScore) AS RoundedPlag FROM Submissions;

-- --------------------------------------------------------------------------------------------------------------

-- Table 8: Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    ExamName VARCHAR(100),
    Date DATE,
    DurationMinutes INT,
    TotalMarks INT,
    CourseID INT,
    ClassID INT,
    Type VARCHAR(30),
    Status VARCHAR(20),
    ResultPublished BOOLEAN,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Exams (ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished) VALUES
(1, 'Math Midterm', '2023-07-20', 90, 100, 1, 101, 'Written', 'Completed', TRUE),
(2, 'Science Quiz', '2023-07-22', 60, 50, 2, 102, 'Online', 'Completed', TRUE),
(3, 'English Final', '2023-07-30', 120, 100, 3, 103, 'Written', 'Upcoming', FALSE),
(4, 'History Exam', '2023-07-28', 90, 100, 4, 104, 'Written', 'Completed', TRUE),
(5, 'Geography Test', '2023-07-25', 60, 50, 5, 105, 'Online', 'Upcoming', FALSE),
(6, 'Python Practical', '2023-07-29', 90, 100, 6, 106, 'Practical', 'Upcoming', FALSE),
(7, 'Physics Theory', '2023-07-23', 90, 100, 7, 107, 'Written', 'Completed', TRUE),
(8, 'Chemistry Lab', '2023-07-27', 60, 50, 8, 108, 'Practical', 'Upcoming', FALSE),
(9, 'Economics Exam', '2023-07-24', 90, 100, 9, 109, 'Written', 'Completed', TRUE),
(10, 'Botany Assessment', '2023-07-26', 60, 50, 10, 110, 'Written', 'Upcoming', FALSE);

-- to display/retrieve table data
SELECT * FROM Exams;

-- to remove complete data from table
truncate table Exams;

-- to delete complete attributes and records 
drop table Exams;

-- --------------------------------------- Queries -------------------------------------------------------------
-- 1. Select all written exams
SELECT * FROM Exams WHERE Type = 'Written';

-- 2. Select exams with TotalMarks greater than 50
SELECT * FROM Exams WHERE TotalMarks > 50;

-- 3. Select distinct types of exams
SELECT DISTINCT Type FROM Exams;

-- 4. Select exams grouped by Status and count them
SELECT Status, COUNT(*) FROM Exams GROUP BY Status;

-- 5. Select exams ordered by Date descending
SELECT * FROM Exams ORDER BY Date DESC;

-- 6. Add NOT NULL constraint on ExamName
ALTER TABLE Exams MODIFY ExamName VARCHAR(100) NOT NULL;

-- 7. Add CHECK constraint for DurationMinutes > 0
ALTER TABLE Exams ADD CONSTRAINT chk_Duration CHECK (DurationMinutes > 0);

-- 8. Add UNIQUE constraint to ExamName
ALTER TABLE Exams ADD CONSTRAINT unique_exam_name UNIQUE (ExamName);

-- 9. Drop CHECK constraint (name may vary by DBMS)
ALTER TABLE Exams DROP CONSTRAINT chk_Duration;

-- 10. Update Type to 'Written' for ExamID 5
UPDATE Exams SET Type = 'Written' WHERE ExamID = 5;

-- 11. Delete exams where ResultPublished = FALSE
DELETE FROM Exams WHERE ResultPublished = FALSE;

-- 12. Update all Completed exams to ResultPublished = TRUE
UPDATE Exams SET ResultPublished = TRUE WHERE Status = 'Completed';

-- 13. Select all online exams
SELECT * FROM Exams WHERE Type = 'Online';

-- 14. Find exams scheduled after July 25
SELECT * FROM Exams WHERE Date > '2023-07-25';

-- 15. Count how many practical exams are there
SELECT COUNT(*) AS PracticalExamCount FROM Exams WHERE Type = 'Practical';

-- 16. Get the average duration of exams
SELECT AVG(DurationMinutes) AS AverageDuration FROM Exams;

-- 17. Select all exams and show their names in uppercase
SELECT UPPER(ExamName) AS UpperExamName FROM Exams;

-- 18. Exams where marks are not equal to 100
SELECT * FROM Exams WHERE TotalMarks <> 100;

-- 19. Exams where duration is between 60 and 90 minutes
SELECT * FROM Exams WHERE DurationMinutes BETWEEN 60 AND 90;

-- 20. Exams with type either 'Online' or 'Practical'
SELECT * FROM Exams WHERE Type = 'Online' OR Type = 'Practical';

-- 21. Exams where result is not yet published
SELECT * FROM Exams WHERE ResultPublished = FALSE;

-- 22. Exams whose name contains 'Test'
SELECT * FROM Exams WHERE ExamName LIKE '%Test%';

-- 23. Join Exams with Courses to get Course Name
SELECT e.ExamName, c.CourseName
FROM Exams e
JOIN Courses c ON e.CourseID = c.CourseID;

-- 24. Join Exams with Classes to get ClassName
SELECT e.ExamName, cl.ClassName
FROM Exams e
JOIN Classes cl ON e.ClassID = cl.ClassID;

-- 25. Join all three tables: Exams, Courses, and Classes
SELECT e.ExamName, c.CourseName, cl.ClassName
FROM Exams e
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Classes cl ON e.ClassID = cl.ClassID;

-- 26. Find exams for classes with room R101
SELECT e.ExamName, cl.RoomNumber
FROM Exams e
JOIN Classes cl ON e.ClassID = cl.ClassID
WHERE cl.RoomNumber = 'R101';

-- --------------------------------------------------------------------------------------------------------------

-- Table 9: Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    StudentID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    Status VARCHAR(20),
    TransactionID VARCHAR(50),
    PaymentFor VARCHAR(100),
    ReceiptLink VARCHAR(255),
    Comments TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Payments (PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments) VALUES
(1, 1, 5000.00, '2023-06-01', 'Card', 'Completed', 'TXN001', 'Course Fee', 'receipt1', 'First installment'),
(2, 2, 5200.00, '2023-06-02', 'UPI', 'Completed', 'TXN002', 'Course Fee', 'receipt2', ''),
(3, 3, 5300.00, '2023-06-03', 'NetBanking', 'Completed', 'TXN003', 'Course Fee', 'receipt3', 'On time'),
(4, 4, 5500.00, '2023-06-04', 'Card', 'Completed', 'TXN004', 'Course Fee', 'receipt4', ''),
(5, 5, 5100.00, '2023-06-05', 'UPI', 'Pending', 'TXN005', 'Course Fee', 'receipt5', 'Awaiting clearance'),
(6, 6, 5400.00, '2023-06-06', 'Cash', 'Completed', 'TXN006', 'Course Fee', 'receipt6', 'Paid at center'),
(7, 7, 5000.00, '2023-06-07', 'Card', 'Completed', 'TXN007', 'Course Fee', 'receipt7', ''),
(8, 8, 5200.00, '2023-06-08', 'NetBanking', 'Completed', 'TXN008', 'Course Fee', 'receipt8', ''),
(9, 9, 5300.00, '2023-06-09', 'UPI', 'Completed', 'TXN009', 'Course Fee', 'receipt9', ''),
(10, 10, 5500.00, '2023-06-10', 'Card', 'Completed', 'TXN010', 'Course Fee', 'receipt10', 'Final installment');

-- to display/retrieve table data
SELECT * FROM Payments;

-- to remove complete data from table
truncate table Payments;

-- to delete complete attributes and records 
drop table Payments;

-- --------------------------------------- Queries -------------------------------------------------------------

-- 1. Select all payments made using 'Card'
SELECT * FROM Payments WHERE PaymentMethod = 'Card';

-- 2. Select payments with amount greater than 5200
SELECT * FROM Payments WHERE Amount > 5200;

-- 3. Get only distinct payment methods used
SELECT DISTINCT PaymentMethod FROM Payments;

-- 4. Group payments by Status and show total number in each
SELECT Status, COUNT(*) AS Count FROM Payments GROUP BY Status;

-- 5. Show all payments ordered by PaymentDate descending
SELECT * FROM Payments ORDER BY PaymentDate DESC;

-- 6. Add NOT NULL constraint on Amount
ALTER TABLE Payments MODIFY Amount DECIMAL(10,2) NOT NULL;

-- 7. Add CHECK constraint on positive amount
ALTER TABLE Payments ADD CONSTRAINT chk_Amount CHECK (Amount > 0);

-- 8. Add UNIQUE constraint on TransactionID
ALTER TABLE Payments ADD CONSTRAINT unq_TransactionID UNIQUE (TransactionID);

-- 9. Add new column for PaymentConfirmationCode
ALTER TABLE Payments ADD PaymentConfirmationCode VARCHAR(50);

-- 10. Rename the Payments table
ALTER TABLE Payments RENAME TO StudentPayments;

-- 11. Drop column PaymentConfirmationCode
ALTER TABLE StudentPayments DROP COLUMN PaymentConfirmationCode;

-- 12. Select all payments made via UPI
SELECT * FROM Payments WHERE PaymentMethod = 'UPI';

-- 13. Count how many payments are marked Completed
SELECT COUNT(*) AS CompletedCount FROM Payments WHERE Status = 'Completed';

-- 14. Find total amount collected
SELECT SUM(Amount) AS TotalCollected FROM Payments;

-- 15. Get average payment amount
SELECT AVG(Amount) AS AveragePayment FROM Payments;

-- 16. List students who paid more than 5300
SELECT StudentID, Amount FROM Payments WHERE Amount > 5300;

-- 17. Payments made by UPI or Card
SELECT * FROM Payments WHERE PaymentMethod = 'UPI' OR PaymentMethod = 'Card';

-- 18. Payments with no comments
SELECT * FROM Payments WHERE Comments IS NULL OR Comments = '';

-- 19. Payments with comment containing 'installment'
SELECT * FROM Payments WHERE Comments LIKE '%installment%';

-- 20. Get all payments and student contact info
SELECT p.*, s.Email
FROM Payments p
JOIN Students s ON p.StudentID = s.StudentID;

-- 21. Count total payments
SELECT COUNT(*) AS TotalPayments FROM Payments;

-- 22. Get average amount paid
SELECT AVG(Amount) AS AvgAmount FROM Payments;

-- 23. Round all amounts to nearest 100
SELECT PaymentID, ROUND(Amount, -2) AS RoundedAmount FROM Payments;

-- 24. Get max and min payment amounts
SELECT MAX(Amount) AS MaxAmt, MIN(Amount) AS MinAmt FROM Payments;

-- 25. Get current date
SELECT CURRENT_DATE AS Today;

-- --------------------------------------------------------------------------------------------------------------

-- Table 10: DiscussionForum
CREATE TABLE DiscussionForum (
    PostID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Title VARCHAR(150),
    Content TEXT,
    PostDate DATE,
    ReplyCount INT,
    LastReplyDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO DiscussionForum (PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink) VALUES
(1, 1, 1, 'Doubt in Algebra', 'How to solve quadratic equations?', '2023-07-01', 5, '2023-07-03', 'Open', 'forum_link1'),
(2, 2, 1, 'Math formulas', 'Request for formula sheet', '2023-07-02', 3, '2023-07-04', 'Closed', 'forum_link2'),
(3, 3, 2, 'Science Project', 'Need help with model ideas', '2023-07-05', 2, '2023-07-06', 'Open', 'forum_link3'),
(4, 4, 3, 'English Essay', 'Tips for writing essays?', '2023-07-07', 4, '2023-07-08', 'Open', 'forum_link4'),
(5, 5, 4, 'History Timeline', 'Where can I get a good timeline?', '2023-07-09', 1, '2023-07-10', 'Closed', 'forum_link5'),
(6, 6, 5, 'Map Reading', 'Help with latitude and longitude', '2023-07-11', 0, NULL, 'Open', 'forum_link6'),
(7, 7, 6, 'Python Installation', 'Installation error on Windows', '2023-07-12', 3, '2023-07-13', 'Open', 'forum_link7'),
(8, 8, 7, 'Physics Formulas', 'Derivation of kinematic equations', '2023-07-14', 2, '2023-07-15', 'Open', 'forum_link8'),
(9, 9, 8, 'Chemistry Lab', 'Safety precautions for experiments', '2023-07-16', 1, '2023-07-17', 'Open', 'forum_link9'),
(10, 10, 9, 'Economic Data', 'Where to find recent GDP figures?', '2023-07-18', 4, '2023-07-19', 'Closed', 'forum_link10');

-- to display/retrieve table data
SELECT * FROM DiscussionForum;

-- to remove complete data from table
truncate table DiscussionForum;

-- to delete complete attributes and records 
drop table DiscussionForum;
-- --------------------------------------- Queries -------------------------------------------------------------

-- select all forms are having How to solve quadratic equations?
SELECT * FROM DiscussionForum WHERE Content = 'How to solve quadratic equations?';

-- select where forms are Closed
select * from DiscussionForum where Status= 'closed';

-- select 

-- --------------------------------------------------------------------------------------------------------------