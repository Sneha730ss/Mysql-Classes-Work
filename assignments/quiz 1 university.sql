-- create a database 
create database university1;

-- use the created database
use university1;

-- create a table for the database

-- Table 1: Students
 create table students(
 student_id int auto_increment primary key not null, -- primary key should be not null and unique
 student_name varchar(50) not null,
 student_dob varchar(50) not null,
 student_location varchar(50) not null,
 student_phone varchar(10) not null);
 
 insert into students( student_name,student_dob,student_location,student_phone)
 values
( 'priya singh', '2004-05-12', 'Mumbai', '9874656712'),
( 'ashmita gupta', '2004-05-15', 'Mumbai', '9874654512'),
( 'saniya soni', '2004-07-02', 'Mumbai', '8974656712'),
( 'saina samanta', '2004-12-16', 'Mumbai', '9875656712'), 
( 'pooja kumar', '2004-11-22', 'Mumbai', '9874609712'),
( 'priya soni', '2004-09-10', 'Mumbai', '9856656712');

-- display table
select * from students;

-- to remove complete data from table
truncate table students;

-- to delete complete attributes and records 
drop table students; 

-- select queries
-- 1. students where student_name Is not null
  SELECT * FROM students where student_name Is not null;
  
  -- 2. select students having  student_name student_dob along with its student_dob and its count.
select student_name, student_dob,char_length(student_dob) as character_count from students where student_name ='ashmita gupta';

-- 3. select a students by student_name
Select * FROM students WHERE student_name ='saina samanta';

-- 4. Select students with a student_phone student_name longer than 10 characters
select * from students where char_length(student_phone) >10;

-- 5. select specific columns
select student_name, student_phone from students;

-- 6. Select students in a specific student_name
select * from students where student_name ='pooja kumar';

-- 7. select students with student_location='Mumbai'
select * from students where student_location='Mumbai';

-- 8. Select students student_dob  in secific date
select * from students where (student_dob) ='2004-05-12';

-- 9. Select students ordered by student_phone in Descending order
select*from students order by student_phone Desc;

-- 10. select students with student_phone '9875656712'.
select * from students where student_phone='9875656712';

-- 11. select students with a student_name containing a specific word
select * from students where student_name like 'saina%';

-- 12. select students established after a certain Date
select * from students where student_dob>'2000-05-15';

-- 13. Count the number of students in Each student_name
select student_name, count(*)  as student_count from students group by student_name;

-- 14. select student ordered by student_name in ascending order
select*from students order by student_name asc;

-- 15. slect students where display only student_dob
select student_dob from students;

-- 16. Select students ordered by student_dob in Descending order
select*from students order by student_dob Desc;

-- 17. select students with student_name='priya soni'
select * from students where student_name='priya soni';

-- 18.  Select students with a student_name student_name longer than 10 characters
select * from students where char_length(student_name) >12;

-- 19. select students with a student_name containing a specific word
select * from students where student_name like '%gupta';

-- 20.  Select students student_dob  in secific id
select * from students where (student_id) ='5';

-- ---------------------------------- update queries -------------------------------------
-- 1. Update student name by ID
UPDATE students SET student_name = 'Priya Sharma' WHERE student_id = 1;

-- 2. Change location for a student
UPDATE students SET student_location = 'Pune' WHERE student_id = 2;

-- 3. Update phone number of a student
UPDATE students SET student_phone = '9999999999' WHERE student_id = 3;

 select * from students;
-- 4. Update date of birth for a student
UPDATE students SET student_dob = '2004-01-01' WHERE student_id = 4;

-- 5. Change name for student with a specific phone number
UPDATE students SET student_name = 'Pooja Mehta' WHERE student_phone = '9874609712';

-- 6. Update location for all students in Mumbai to Delhi
UPDATE students SET student_location = 'Delhi' WHERE student_location = 'Mumbai';

-- 7. Change phone number for all students whose name starts with 'priya'
UPDATE students SET student_phone = '8888888888' WHERE student_name LIKE 'priya%';

-- 8. Change location for students born after '2004-09-01'
UPDATE students SET student_location = 'Chennai' WHERE student_dob > '2004-09-01';

-- 9. Update phone number for students in Delhi
UPDATE students SET student_phone = '7777777777' WHERE student_location = 'Delhi';

-- 10. Update name to uppercase for all students named 'saniya soni'
UPDATE students SET student_name = UPPER(student_name) WHERE student_name = 'saniya soni';

-- 11. selcetcity name to the location
UPDATE students SET student_location = CONCAT(student_location, ' City');

-- 12. Replace 'soni' with 'sharma' in student names
UPDATE students SET student_name = REPLACE(student_name, 'soni', 'sharma');

-- 13. Set phone number to NULL where DOB is before 2004-06-01
UPDATE students SET student_phone = not null  WHERE student_dob < '2004-06-01';

-- 14. Change location to 'Noida' for students with name containing 'samanta'
UPDATE students SET student_location = 'Noida' WHERE student_name LIKE '%samanta%';

-- 15. update date of birth for a student
UPDATE students SET student_dob = '2004-01-05' WHERE student_id = 4;

-- 16. Temporarily change all phone numbers for testing
UPDATE students SET student_phone = '1234567890';

-- 17. Reset student names to 'Test Student'
UPDATE students SET student_name = 'Test Student';

-- 18. Set location to 'Unknown' if it's currently empty (though none are in your data)
UPDATE students SET student_location = 'Unknown' WHERE student_location = '';

-- 19. Truncate DOB to only show year
UPDATE students SET student_dob = LEFT(student_dob, 4);

-- 20. Revert all student names with 'Test' back to 'Unknown Name'
UPDATE students SET student_name = 'Unknown Name' WHERE student_name LIKE 'Test%';

-- ----------------------------------------- Alter queries --------------------------------

-- 1. Add a column for email
ALTER TABLE students ADD student_email VARCHAR(100);

-- 2. Add a column for gender
ALTER TABLE students ADD gender VARCHAR(10);

-- Add a column for the last_yr
alter table students add last_yr varchar(10);

-- 4. Add a column for student status (active/inactive)
ALTER TABLE students ADD status VARCHAR(10) DEFAULT 'active';

-- 5. Add a column for marks (optional)
ALTER TABLE students ADD marks INT;

-- 6. Increase length of student_name
ALTER TABLE students MODIFY student_name VARCHAR(100);

-- 7. Change a column for the last_yr
alter table students modify marks varchar(10);

-- 8. Change student_phone to store 15 digits
ALTER TABLE students MODIFY student_phone VARCHAR(15);

-- 9. Make student_location column nullable
ALTER TABLE students MODIFY student_location VARCHAR(50) NULL;

-- 10.Increase length of student_location
ALTER TABLE students MODIFY student_location VARCHAR(100);

-- 11. Rename column student_location to city
ALTER TABLE students RENAME COLUMN student_location TO city;

-- 12. Rename column student_phone to contact_number
ALTER TABLE students RENAME COLUMN student_phone TO contact_number;

-- 13. Rename table to student_info
ALTER TABLE students RENAME TO student_info;

-- 14. Drop the column 'marks'
ALTER TABLE student_info DROP COLUMN marks;

-- 15. Drop the column 'gender'
ALTER TABLE student_info DROP COLUMN gender;

-- 16. Drop the unique constraint on student_name
ALTER TABLE student_info DROP INDEX unique_student_name;

-- 17. Add a NOT NULL constraint to email
ALTER TABLE student_info MODIFY student_email VARCHAR(100) NOT NULL;

-- 18. Add a CHECK constraint on status column
ALTER TABLE student_info ADD CONSTRAINT chk_status CHECK (status IN ('active', 'inactive'));

-- 19. Add a default value to contact_number
ALTER TABLE student_info ALTER contact_number SET DEFAULT '0000000000';

-- 20. Drop the column student_phone
ALTER TABLE student_info DROP COLUMN student_phone;
 
 -- ---------------------------------------------- delete queries -------------------------------------------
 
 -- 1. Delete student by student_id = 1
DELETE FROM students WHERE student_id = 1;

-- 2. Delete student by student_name 'priya singh'
DELETE FROM students WHERE student_name = 'priya singh';

-- 3. Delete students from Mumbai location
DELETE FROM students WHERE student_location = 'Mumbai';

-- 4. Delete student by student_phone '9874656712'
DELETE FROM students WHERE student_phone = '9874656712';

-- 5. Delete student born on '2004-05-15'
DELETE FROM students WHERE student_dob = '2004-05-15';

-- 6. Delete student named 'ashmita gupta' from Mumbai
DELETE FROM students WHERE student_name = 'ashmita gupta' AND student_location = 'Mumbai';

-- 7. Delete students whose name starts with 'p'
DELETE FROM students WHERE student_name LIKE 'p%';

-- 8. Delete students whose phone number starts with '9874'
DELETE FROM students WHERE student_phone LIKE '9874%';

-- 9. Delete students born before '2004-07-01'
DELETE FROM students WHERE student_dob < '2004-07-01';

-- 10. Delete students whose name contains 'soni'
DELETE FROM students WHERE student_name LIKE '%soni%';

-- 11. Delete student with student_id greater than 3
DELETE FROM students WHERE student_id > 3;

-- 12. Delete students with phone number ending in '6712'
DELETE FROM students WHERE student_phone LIKE '%6712';

-- 13. Delete students born in the month of November (2004-11)
DELETE FROM students WHERE student_dob LIKE '2004-11-%';

-- 14. Delete students whose name length is more than 12 characters
DELETE FROM students WHERE LENGTH(student_name) > 12;

-- 15. Delete students whose phone number is exactly 10 digits 
DELETE FROM students WHERE LENGTH(student_phone) = 10;

-- 16. Delete students from Mumbai whose DOB is after '2004-08-01'
DELETE FROM students WHERE student_location = 'Mumbai' AND student_dob > '2004-08-01';

-- 17. Delete students named 'priya soni'
DELETE FROM students WHERE student_name = 'priya soni';

-- 18. Delete students whose phone number starts with '985'
DELETE FROM students WHERE student_phone LIKE '985%';

-- 19.  Delete students whose phone number starts with '988'
DELETE FROM students WHERE student_phone LIKE '988%';

-- 20. Delete students born on or after '2004-12-01'
DELETE FROM students WHERE student_dob >= '2004-12-01';


-- table 2: table 2: Teachers
 create table Teachers(
 Teacher_id int primary key not null, -- primary key should be not null and unique
 Teacher_name varchar(50) not null,
 Teacher_department varchar(50) not null,
 Teacher_location varchar(50) not null,
 Teacher_phone varchar(10) not null); 
 
 insert into teachers values
 (1, 'ashi behera' ,'botany', 'Mumbai','8765892345'),
(2, 'kajal meena','IT','Delhi','8755487234'),
(3, 'sonal shah','BMS','Gujarat','9874566734'),
(4, 'sonakshi singh','BAF','surat','7865789876'),
(5, 'priya khar','BCOM','Assam', '8769567834');

-- display table
select * from teachers;

-- to remove complete data from table
truncate table Teachers;

-- to delete complete attributes and records 
drop table Teachers; 

-- --------------------------------------------- select queries ----------------------------------------------------
-- 1. Teachers where student_name Is not null
  SELECT * FROM Teachers where Teacher_name Is not null;
  
  -- 2. select Teachers having  student_name student_dob along with its student_dob and its count.
select Teacher_name, Teacher_department,char_length(Teacher_department) as character_count from Teachers where Teacher_name ='kajal meena';

-- 3. select a Teachers by Teacher_department
Select * FROM Teachers WHERE Teacher_department ='BCOM';

-- 4. Select Teachers with a student_phone Teacher_phone longer than 10 characters
select * from Teachers where char_length(Teacher_phone) >10;

-- 5. select specific columns
select Teacher_name, Teacher_phone from Teachers;

-- 6. Select Teachers in a specific Teacher_name
select * from Teachers where Teacher_name ='priya khar';

-- 7. select Teachers with Teacher_location='Mumbai'
select * from Teachers where Teacher_location='Mumbai';

-- 8. Select Teachers Teacher_department  in secific dept
select * from Teachers where (Teacher_department) ='BMS';

-- 9. Select Teachers ordered by Teacher_phone in Descending order
select*from Teachers order by Teacher_phone Desc;

-- 10. select Teachers with Teacher_phone '9874566734'.
select * from Teachers where Teacher_phone='9874566734';

-- 11. select Teachers with a Teacher_name containing a specific word
select * from Teachers where Teacher_name like '%singh';

-- 12. select Teachers with  a certain location
select * from Teachers where Teacher_location>'Gujarat';

-- 13. Count the number of Teachers in Each student_name
select Teacher_name, count(*)  as teacher_count from Teachers group by Teacher_name;

-- 14. select Teachers ordered by  Teacher_location in ascending order
select*from Teachers order by  Teacher_location asc;

-- 15. slect Teachers where display only  Teacher_location
select  Teacher_location from Teachers;

-- 16. Select Teachers ordered by  Teacher_location in Descending order
select*from Teachers order by  Teacher_location Desc;

-- 17. select Teachers with Teacher_name='kajal meena'
select * from Teachers where Teacher_name='kajal meena';

-- 18.  Select Teachers with a Teacher_name  longer than 12 characters
select * from Teachers where char_length(Teacher_name) >12;

-- 19. select Teachers with a Teacher_name containing a specific word
select * from Teachers where Teacher_name like '%shah';

-- 20.  Select Teachers student_dob  in secific Teacher_phone
select * from Teachers where (Teacher_phone) ='8769567834';

-- --------------------------- update queries ------------------------------------------------
-- 1. Update teacher name for teacher_id 1
UPDATE Teachers SET Teacher_name = 'Ashi Behera' WHERE Teacher_id = 1;

-- 2. Update department of teacher_id 2
UPDATE Teachers SET Teacher_department = 'Computer Science' WHERE Teacher_id = 2;

-- 3. Update location of teacher_id 3
UPDATE Teachers SET Teacher_location = 'Ahmedabad' WHERE Teacher_id = 3;

-- 4. Update phone number of teacher_id 4
UPDATE Teachers SET Teacher_phone = '9998887776' WHERE Teacher_id = 4;

-- 5. Update name and location of teacher_id 5
UPDATE Teachers SET Teacher_name = 'Priya Kharwar', Teacher_location = 'Guwahati' WHERE Teacher_id = 5;

-- 6. Change department of teacher_id 1 to 'Zoology'
UPDATE Teachers SET Teacher_department = 'Zoology' WHERE Teacher_id = 1;

-- 7. Update location for teacher_id 2 to 'Noida'
UPDATE Teachers SET Teacher_location = 'Noida' WHERE Teacher_id = 2;

-- 8. Update name for teacher_id 3 to capitalized format
UPDATE Teachers SET Teacher_name = 'Sonal Shah' WHERE Teacher_id = 3;

-- 9. Update phone number of teacher_id 5 to a new number
UPDATE Teachers SET Teacher_phone = '8889990001' WHERE Teacher_id = 5;

-- 10. Change department of teacher_id 4 from 'BAF' to 'Finance'
UPDATE Teachers SET Teacher_department = 'Finance' WHERE Teacher_id = 4;

-- 11. Update name and department for teacher_id 2
UPDATE Teachers SET Teacher_name = 'Kajal Sharma', Teacher_department = 'Software Engineering' WHERE Teacher_id = 2;

-- 12. Change location and phone of teacher_id 1
UPDATE Teachers SET Teacher_location = 'Pune', Teacher_phone = '7778889990' WHERE Teacher_id = 1;

-- 13. Correct department name for teacher_id 3
UPDATE Teachers SET Teacher_department = 'Business Management' WHERE Teacher_id = 3;

-- 14. Modify teacher_id 4's name and phone
UPDATE Teachers SET Teacher_name = 'Sonakshi S.', Teacher_phone = '7665487632' WHERE Teacher_id = 4;

-- 15. Change all fields for teacher_id 5
UPDATE Teachers 
SET Teacher_name = 'Priya Mehta',
                     Teacher_department = 'Commerce',
                    Teacher_location = 'Shillong',
                Teacher_phone = '8899776655'
WHERE Teacher_id = 5;

-- 16. Update teacher_id 1's department to 'Environmental Science'
UPDATE Teachers SET Teacher_department = 'Environmental Science' WHERE Teacher_id = 1;

-- 17. Update teacher_id 2's location to 'Chandigarh'
UPDATE Teachers SET Teacher_location = 'Chandigarh' WHERE Teacher_id = 2;

-- 18. Change teacher_id 3's phone number
UPDATE Teachers SET Teacher_phone = '7008123456' WHERE Teacher_id = 3;

-- 19. Change teacher_id 4's department to 'Accounting'
UPDATE Teachers SET Teacher_department = 'Accounting' WHERE Teacher_id = 4;

-- 20. Fix teacher_id 5's name format
UPDATE Teachers SET Teacher_name = 'Priya Khar' WHERE Teacher_id = 5;

-- ----------------------------- Alter  Queries -----------------------------------------
-- 1. Add a new column for teacher's email
ALTER TABLE Teachers ADD Teacher_email VARCHAR(100);

-- 2. Add a new column for date of joining
ALTER TABLE Teachers ADD Date_of_joining DATE;

-- 3. Add a new column for gender
ALTER TABLE Teachers ADD Gender VARCHAR(10);

-- 4. Add a default value for Teacher_location
ALTER TABLE Teachers ALTER COLUMN Teacher_location SET DEFAULT 'Unknown';

-- 5. add a new column for experience
ALTER TABLE Teachers ADD Experience VARCHAR(10);

select * from teachers;
-- 6. Rename column Teacher_name to Full_Name
ALTER TABLE Teachers RENAME COLUMN Teacher_name TO Full_Name;

-- 7. Rename column Teacher_department to Department
ALTER TABLE Teachers RENAME COLUMN Teacher_department TO Department;

-- 8. Rename column Teacher_location to Location
ALTER TABLE Teachers RENAME COLUMN Teacher_location TO Location;

-- 9. Add a new column for teacher’s salary
ALTER TABLE Teachers ADD Salary INT;

select * from teachers;

-- 11. Drop the Gender column 
ALTER TABLE Teachers DROP COLUMN Gender;

-- 12. add a new column for teachers details
alter table teachers add details varchar(50);

-- 13. Add a constraint that Salary must be positive
ALTER TABLE Teachers ADD CONSTRAINT chk_salary_positive CHECK (Salary >= 0);

-- 14. Add a unique constraint to Teacher_email
ALTER TABLE Teachers ADD CONSTRAINT unique_email UNIQUE (Teacher_email);

-- 15. Rename table Teachers to Faculty
ALTER TABLE Teachers RENAME TO Faculty;

-- 16. Add a new column for subject specialization
ALTER TABLE Faculty ADD Subject_Specialization VARCHAR(50);

-- 17. Add a default value to Salary as 30000
ALTER TABLE Faculty ALTER COLUMN Salary SET DEFAULT 30000;

-- 18. Drop the default value for Teacher_location
ALTER TABLE Faculty ALTER COLUMN Location DROP DEFAULT;

-- 19. Drop the column Date_of_joining
ALTER TABLE Faculty DROP COLUMN Date_of_joining;

-- 20. Add a constraint that phone number must be 10 to 15 characters
ALTER TABLE Faculty ADD CONSTRAINT chk_phone_length CHECK (LENGTH(Teacher_phone) BETWEEN 10 AND 15);

-- ----------------------- delete queries -------------------------------------- 

-- 1. Delete teacher with Teacher_id = 1
DELETE FROM Teachers WHERE Teacher_id = 1;

-- 2. Delete teacher with name 'kajal meena'
DELETE FROM Teachers WHERE Teacher_name = 'kajal meena';

-- 3. Delete all teachers from department 'BMS'
DELETE FROM Teachers WHERE Teacher_department = 'BMS';

-- 4. Delete teachers located in 'surat'
DELETE FROM Teachers WHERE Teacher_location = 'surat';

-- 5. Delete teacher with phone number '8769567834'
DELETE FROM Teachers WHERE Teacher_phone = '8769567834';

-- 6. Delete teacher whose name contains 'sonal'
DELETE FROM Teachers WHERE Teacher_name LIKE '%sonal%';

-- 7. Delete teacher whose department is 'BCOM'
DELETE FROM Teachers WHERE Teacher_department = 'BCOM';

-- 8. Delete all teachers from 'Delhi'
DELETE FROM Teachers WHERE Teacher_location = 'Delhi';

-- 9. Delete teacher whose name is 'ashi behera' and department is 'botany'
DELETE FROM Teachers WHERE Teacher_name = 'ashi behera' AND Teacher_department = 'botany';

-- 10. Delete teachers whose name starts with 'p'
DELETE FROM Teachers WHERE Teacher_name LIKE 'p%';

-- 11. Delete teachers whose department ends with 'T'
DELETE FROM Teachers WHERE Teacher_department LIKE '%T';

-- 12. Delete teachers from 'Gujarat' or 'Assam'
DELETE FROM Teachers WHERE Teacher_location IN ('Gujarat', 'Assam');

-- 13. Delete teacher where phone number starts with '87'
DELETE FROM Teachers WHERE Teacher_phone LIKE '87%';

-- 14. Delete teachers from departments 'IT' and 'BMS'
DELETE FROM Teachers WHERE Teacher_department IN ('IT', 'BMS');

-- 15. Delete teacher with Teacher_id = 5 and location = 'Assam'
DELETE FROM Teachers WHERE Teacher_id = 5 AND Teacher_location = 'Assam';

-- 16. Delete teacher with exact name match 
DELETE FROM Teachers WHERE Teacher_name = 'sonakshi singh';

-- 17. Delete all teachers whose names are shorter than 10 characters
DELETE FROM Teachers WHERE LENGTH(Teacher_name) < 10;

-- 18. Delete all teachers with phone numbers of length > 10 
DELETE FROM Teachers WHERE LENGTH(Teacher_phone) > 10;

-- 19. Delete teachers whose name ends with 'a'
DELETE FROM Teachers WHERE Teacher_name LIKE '%a';

-- 20. Delete all rows 
DELETE FROM Teachers;

-- table 3: attendance
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    total_classes INT,
    attended_classes INT
);

INSERT INTO Attendance VALUES 
(1, 1, 101, 100, 92),
(2, 2, 102, 100, 85),
(3, 3, 103, 100, 76),
(4, 4, 104, 100, 60),
(5, 5, 105, 100, 88);

-- display table
select * from attendance;

-- to remove complete data from table
truncate table Attendance;

-- to delete complete attributes and records 
drop table Attendance; 

-- 1. Select few / selected records
SELECT  course_id,total_classes from Attendance;

-- 2. Select students with attendance greater than 80
SELECT * FROM Attendance WHERE attended_classes > 80;

-- 3. Select student_id and attended_classes
SELECT student_id, attended_classes FROM Attendance;

-- 4. Calculate attendance percentage
SELECT student_id, ( total_classes) AS attendance_percentage FROM Attendance;

-- 5. Students with attendance below 75%
SELECT * FROM Attendance WHERE (total_classes) < 75;

-- 6. Get course_id with highest attendance
SELECT course_id FROM Attendance ORDER BY attended_classes DESC LIMIT 1;

-- 7. Select first 3 students
SELECT * FROM Attendance LIMIT 3;

-- 8. Count total records
SELECT COUNT(*) FROM Attendance;

-- 9. select average attendance
SELECT AVG(attended_classes) FROM Attendance;

-- 10. select total classes attended by all students
SELECT SUM(attended_classes) FROM Attendance;

-- 11. Select distinct course IDs
SELECT DISTINCT course_id FROM Attendance;

-- 12. Find students with 100% attendance
SELECT * FROM Attendance WHERE attended_classes = total_classes;

-- 13. Students ordered by lowest attendance
SELECT * FROM Attendance ORDER BY attended_classes ASC;

-- 14. Students ordered by highest attendance
SELECT * FROM Attendance ORDER BY attended_classes DESC;

-- 15. Attendance range between 70 and 90
SELECT * FROM Attendance WHERE attended_classes BETWEEN 70 AND 90;

-- 16. Students with exactly 88 classes attended
SELECT * FROM Attendance WHERE attended_classes = 88;

-- 17. Group by course_id and count students
SELECT course_id, COUNT(*) FROM Attendance GROUP BY course_id;

-- 18. Find max attended classes
SELECT MAX(attended_classes) FROM Attendance;

-- 19. Find min attended classes
SELECT MIN(attended_classes) FROM Attendance;

-- 20. Check for any student with zero attendance
SELECT * FROM Attendance WHERE attended_classes = 0;
 
 -- ---------------------------update queries ------------------------------
-- 1. Increase attended_classes by 1 for student_id = 1
UPDATE Attendance SET attended_classes = attended_classes + 1 WHERE student_id = 1;


set SQL_safe_updates = 0;
-- 2. Set attended_classes to 90 for student_id = 2
UPDATE Attendance SET attended_classes = 90 WHERE student_id = 2;

select * from attendance;

-- 3. update total_classes to 120 for all
UPDATE Attendance SET total_classes = 120;

-- 4. Reduce attended_classes by 5 for student_id = 3
UPDATE Attendance SET attended_classes = attended_classes - 5 WHERE student_id = 3;

-- 5. Set attendance to 100% for student_id = 4
UPDATE Attendance SET attended_classes = total_classes WHERE student_id = 4;

-- 6. Set attended_classes to 0 for student_id = 5
UPDATE Attendance SET attended_classes = 0 WHERE student_id = 5;

-- 7. Update total_classes to 110 where course_id = 101
UPDATE Attendance SET total_classes = 110 WHERE course_id = 101;

-- 8. UPDATE Attendance SET attended_classes = '50'
UPDATE Attendance SET attended_classes = '50';

-- 9. Add 2 bonus classes attended for all students
UPDATE Attendance SET attended_classes = attended_classes + 2;

-- 10. Cap attended_classes to max 100
UPDATE Attendance SET attended_classes = 100 WHERE attended_classes > 100;

-- 11. Change course_id from 105 to 106
UPDATE Attendance SET course_id = 106 WHERE course_id = 105;

-- 12. Add 5 to total_classes for all
UPDATE Attendance SET total_classes = total_classes;

-- 13. Mark all students with attended_classes < 70 as 0
UPDATE Attendance SET attended_classes = 0 WHERE attended_classes < 70;

-- 14. Set total_classes to 100 if it’s not already
UPDATE Attendance SET total_classes = 100 WHERE total_classes = 100;

-- 15. Change course_id from 106 to 107
UPDATE Attendance SET course_id = 107 WHERE course_id = 106;

-- 16. Change student_id = 5’s course_id to 110
UPDATE Attendance SET course_id = 110 WHERE student_id = 5;

-- 17. Set attended_classes to null for student_id = 1
UPDATE Attendance SET attended_classes = NULL WHERE student_id = 1;

-- 18. Increase all total_classes by 10%
UPDATE Attendance SET total_classes = total_classes ;

-- 19. Set all student_ids above 3 to 3
UPDATE Attendance SET student_id = 3 WHERE student_id > 3;

-- 20. update total_classes to 120 for all
UPDATE Attendance SET total_classes = 120;

-- ---------------------------------------------alter queries--------------------------
-- 1. Add a column for semester
ALTER TABLE Attendance ADD semester VARCHAR(10);

-- 2. Add column for remarks
ALTER TABLE Attendance ADD remarks TEXT;

-- 3. Drop semester column
ALTER TABLE Attendance DROP COLUMN semester;

-- 4. Rename table
ALTER TABLE Attendance RENAME TO StudentAttendance;

-- 5. Rename back
ALTER TABLE StudentAttendance RENAME TO Attendance;

-- 6. Add a column for result
ALTER TABLE Attendance ADD result varchar(50);

select * from attendance;

-- 7. Add constraint for total_classes > 0
ALTER TABLE Attendance ADD CHECK (total_classes > 0);

-- 8. Add column last_updated
ALTER TABLE Attendance ADD last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 9. Add index on student_id
ALTER TABLE Attendance ADD INDEX idx_student_id (student_id);

-- 10. Drop index on student_id
ALTER TABLE Attendance DROP INDEX idx_student_id;

-- 11. Add default value for course_id
ALTER TABLE Attendance ALTER course_id SET DEFAULT 100;

-- 12. Drop default for course_id
ALTER TABLE Attendance ALTER course_id DROP DEFAULT;

-- 13. Rename column remarks to comments
ALTER TABLE Attendance RENAME COLUMN remarks TO comments;

-- 14. Add NOT NULL constraint to student_id
ALTER TABLE Attendance MODIFY student_id INT NOT NULL;

-- 15. Add unique constraint on (student_id, course_id)
ALTER TABLE Attendance ADD CONSTRAINT unique_student_course UNIQUE(student_id, course_id);

-- 16. Drop unique constraint
ALTER TABLE Attendance DROP INDEX unique_student_course;

-- 17. CRename column comments to suggestions
ALTER TABLE Attendance RENAME COLUMN comments TO suggestions;

select * from attendance;

-- 18. Set default for attended_classes to 0
ALTER TABLE Attendance ALTER attended_classes SET DEFAULT 0;

-- 19. Drop column suggestions
ALTER TABLE Attendance DROP COLUMN suggestions;

-- 20. Add default value for course_id
ALTER TABLE Attendance ALTER course_id SET DEFAULT 100;

-- ------------------------------------ delete queries --------------------------------------------------
-- 1. Delete student with student_id = 1
DELETE FROM Attendance WHERE student_id = 1;

-- 2. Delete all students with attendance < 60
DELETE FROM Attendance WHERE attended_classes < 60;

-- 3. Delete all students in course 104
DELETE FROM Attendance WHERE course_id = 104;

-- 4. Delete student_id = 2
DELETE FROM Attendance WHERE student_id = 2;

-- 5. Delete students with full attendance
DELETE FROM Attendance WHERE attended_classes = total_classes;

-- 6. Delete all records
DELETE FROM Attendance;

-- 7. Delete students who attended exactly 76 classes
DELETE FROM Attendance WHERE attended_classes = 76;

-- 8. Delete students with attendance between 80 and 90
DELETE FROM Attendance WHERE attended_classes BETWEEN 80 AND 90;

-- 9. Delete students from course_id 101
DELETE FROM Attendance WHERE course_id = 101;

-- 10. Delete by attendance_id = 3
DELETE FROM Attendance WHERE attendance_id = 3;

-- 11. Delete students with 0 attendance
DELETE FROM Attendance WHERE attended_classes = 0;

-- 12. Delete students where total_classes > 100
DELETE FROM Attendance WHERE total_classes > 100;

-- 13. Delete students with attendance_id > 4
DELETE FROM Attendance WHERE attendance_id > 4;

-- 14. Delete top 1 student by lowest attendance
DELETE FROM Attendance ORDER BY attended_classes ASC LIMIT 1;

-- 15. Delete all but top 3 students
delete from attendance where student_id=2;

-- 16. Delete all students from course 104
DELETE FROM Attendance WHERE course_id = 104;

-- 17. Delete where student_id = 5
DELETE FROM Attendance WHERE student_id = 5;

-- 18. Delete where attendance_id = 4
DELETE FROM Attendance WHERE attendance_id = 4;

-- 19. Delete all students from course 105
DELETE FROM Attendance WHERE course_id = 105;

-- 20. Delete all students from course 101
DELETE FROM Attendance WHERE course_id = 101;

-- table 4: results
CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester INT,
    percentage DECIMAL(5,2)
);

INSERT INTO Results VALUES 
(1, 1, 101, 6, 88.75),
(2, 2, 102, 4, 79.50),
(3, 3, 103, 8, 65.40),
(4, 4, 104, 6, 72.00),
(5, 5, 105, 4, 81.20);

-- display table
select * from Results;

-- to remove complete data from table
truncate table Results;

-- to delete complete attributes and records 
drop table Results; 

-- -------------------------------------select Queries --------------------------------------------------------
-- 1. Results where percentage Is not null
  SELECT * FROM Results where percentage Is not null;
  
  -- 2. select Results having  student_name student_dob along with its student_dob and its count.
select result_id, percentage,char_length(percentage) as character_count from Results where result_id ='3';

-- 3. select a Results by result_id
Select * FROM Results WHERE result_id ='1';

-- 4. Select Results with a payment_mode percentage longer than 2 characters
select * from Results where char_length(percentage) >2;

-- 5. select specific columns
select course_id, semester from Results;

-- 6. Select Results in a specific course_id
select * from Results where course_id ='104';

-- 7. select Results with student_id='4'
select * from Results where student_id='4';

-- 8. Select Results semester  
select * from Results where (semester) ='8';

-- 9. Select Results ordered by course_id in Descending order
select*from Results order by course_id Desc;

-- 10. select Results with course_id '103'.
select * from Results where course_id='103';

-- 11. select Results with a percentage containing a specific word
select * from Results where percentage like '81%';

-- 12. select Results established after a certain Date
select * from Results where student_id>'2';

-- 13. Count the number of results in Each student_name
select student_id, count(*)  as result_count from Results group by student_id;

-- 14. select Results ordered by student_id in ascending order
select*from Results order by student_id asc;

-- 15. slect Results where display only course_id
select course_id from Results;

-- 16. Select Results ordered by course_id in Descending order
select*from Results order by course_id Desc;

-- 17. select Results with student_id='3'
select * from Results where student_id='3';

-- 18.  Select Results with a  student_id longer than 0characters
select * from Results where char_length(student_id) >0;

-- 19. select Results with a course_id containing a specific word
select * from Results where course_id like '%05';

-- 20.  Select Results percentage = 72.00
select * from Results where (percentage) ='72.00';

-- -------------------------------------- update queries -------------------------------------------

-- 1. Change the percentage of student with result_id = 1
UPDATE Results SET percentage = 90.00 WHERE result_id = 1;

-- 2. Update the semester for student_id = 2
UPDATE Results SET semester = 5 WHERE student_id = 2;

-- 3. Change the course for result_id = 3
UPDATE Results SET course_id = 106 WHERE result_id = 3;

-- 4. Increase percentage by 5 for student_id = 4
UPDATE Results SET percentage = percentage + 5 WHERE student_id = 4;

-- 5. Decrease percentage by 3 for course_id = 105
UPDATE Results SET percentage = percentage - 3 WHERE course_id = 105;

-- 6. Set semester to 7 for result_id = 5
UPDATE Results SET semester = 7 WHERE result_id = 5;

-- 7. Change course_id for student_id = 1
UPDATE Results SET course_id = 110 WHERE student_id = 1;

-- 8. Set percentage to 100 for result_id = 2
UPDATE Results SET percentage = 100.00 WHERE result_id = 2;

-- 9. Set percentage to 70 for student_id = 3
UPDATE Results SET percentage = 70.00 WHERE student_id = 3;

-- 10. Update course_id for result_id = 4
UPDATE Results SET course_id = 108 WHERE result_id = 4;

-- 11. Increase semester by 1 for student_id = 5
UPDATE Results SET semester = semester + 1 WHERE student_id = 5;

-- 12. Increase percentage by 10% for all records with semester = 4
UPDATE Results SET percentage = percentage  WHERE semester = 4;

-- 13. Update percentage to 85.55 for result_id = 1
UPDATE Results SET percentage = 85.55 WHERE result_id = 1;

-- 14. Change student_id for result_id = 5 to 6
UPDATE Results SET student_id = 6 WHERE result_id = 5;

-- 15. Set semester to 8 for course_id = 104
UPDATE Results SET semester = 8 WHERE course_id = 104;

-- 16. Set percentage to 60 for all results with percentage less than 70
UPDATE Results SET percentage = 60.00 WHERE percentage < 70;

-- 17. Add 2 to percentage for result_id = 2
UPDATE Results SET percentage = percentage + 2 WHERE result_id = 2;

-- 18. Set course_id = 120 for all results in semester 6
UPDATE Results SET course_id = 120 WHERE semester = 6;

-- 19. Change student_id to 7 for result_id = 3
UPDATE Results SET student_id = 7 WHERE result_id = 3;

-- 20. Update both semester and percentage for result_id = 4
UPDATE Results SET semester = 9, percentage = 95.00 WHERE result_id = 4;

-- ----------------------------- alter queries ----------------------------------------------------
-- 1. Add a new column for grade
ALTER TABLE Results ADD grade VARCHAR(2);

-- 2. Add a new column for exam year
ALTER TABLE Results ADD exam_year INT;

-- 3. Rename the column 'percentage' to 'score'
ALTER TABLE Results RENAME COLUMN percentage TO score;

-- 4. Change the data type of 'semester' from INT to SMALLINT
ALTER TABLE Results MODIFY semester SMALLINT;

-- 5. Add a new column for remarks
ALTER TABLE Results ADD remarks VARCHAR(255);

-- 6. Drop the column 'remarks'
ALTER TABLE Results DROP COLUMN remarks;

-- 7. Add a column to store pass/fail status
ALTER TABLE Results ADD status VARCHAR(10);

-- 8. Rename the table from Results to StudentResults
ALTER TABLE Results RENAME TO StudentResults;

-- 9. Add a column to store exam center
ALTER TABLE StudentResults ADD exam_center VARCHAR(100);

-- 10. Change data type of 'score' to DECIMAL(6,2) for more precision
ALTER TABLE StudentResults MODIFY score DECIMAL(6,2);

-- 11. Set default value of semester as 1
ALTER TABLE StudentResults MODIFY semester SMALLINT DEFAULT 1;

-- 12. Drop the column 'exam_center'
ALTER TABLE StudentResults DROP COLUMN exam_center;

-- 13. Add a unique constraint on (student_id, course_id)
ALTER TABLE StudentResults ADD CONSTRAINT uq_student_course UNIQUE(student_id, course_id);

-- 14. Drop the unique constraint
ALTER TABLE StudentResults DROP INDEX uq_student_course;


-- 17. Add NOT NULL constraint to course_id
ALTER TABLE StudentResults MODIFY course_id INT NOT NULL;

-- 18. Change column name from ‘course_id’ to ‘subject_id’
ALTER TABLE StudentResults RENAME COLUMN course_id TO subject_id;

-- 19. Add a new column 'attempt' with default value 1
ALTER TABLE StudentResults ADD attempt INT DEFAULT 1;

-- 20. Drop the column 'attempt'
ALTER TABLE StudentResults DROP COLUMN attempt;

-- ------------------------------ Delete queries -------------------------
-- 1. Delete the record where result_id is 1
DELETE FROM Results WHERE result_id = 1;

-- 2. Delete the result of student_id = 2
DELETE FROM Results WHERE student_id = 2;

-- 3. Delete results of all students in semester 4
DELETE FROM Results WHERE semester = 4;

-- 4. Delete all results where percentage is less than 70
DELETE FROM Results WHERE percentage < 70;

-- 5. Delete all results where percentage is more than 90
DELETE FROM Results WHERE percentage > 90;

-- 6. Delete results of course_id = 104
DELETE FROM Results WHERE course_id = 104;

-- 7. Delete the result of student_id = 5 in course_id = 105
DELETE FROM Results WHERE student_id = 5 AND course_id = 105;

-- 8. Delete all results in semester 6
DELETE FROM Results WHERE semester = 6;

-- 9. Delete all records where student_id is between 1 and 3
DELETE FROM Results WHERE student_id BETWEEN 1 AND 3;

-- 10. Delete all results with even result_id
DELETE FROM Results WHERE MOD(result_id, 2) = 0;

-- 11. Delete all results where percentage is exactly 81.20
DELETE FROM Results WHERE percentage = 81.20;

-- 12. Delete all results where course_id is greater than 103
DELETE FROM Results WHERE course_id > 103;

-- 13. Delete all records with result_id less than 3
DELETE FROM Results WHERE result_id < 3;

-- 14. Delete results where semester is not 6
DELETE FROM Results WHERE semester <> 6;

-- 15. Delete all records
DELETE FROM Results;

-- 16. Delete top 1 record (only in SQL Server or with LIMIT in MySQL)
DELETE FROM Results LIMIT 1;

-- 17. Delete all results where percentage is NULL (if any)
DELETE FROM Results WHERE percentage IS NULL;

-- 18. Delete all records where semester is 8
DELETE FROM Results WHERE semester = 8;

-- 19. Delete results where percentage is between 70 and 80
DELETE FROM Results WHERE percentage BETWEEN 70 AND 80;

-- 20. Delete all results where student_id is in a list
DELETE FROM Results WHERE student_id IN (1, 3, 5);

-- table 5: Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    amount_paid INT,
    payment_date DATE,
    payment_mode VARCHAR(20)
);

INSERT INTO Payments VALUES 
(1, 1, 101, 50000, '2024-06-01', 'Online'),
(2, 2, 102, 30000, '2024-06-02', 'Cash'),
(3, 3, 103, 40000, '2024-06-03', 'Cheque'),
(4, 4, 104, 45000, '2024-06-04', 'Online'),
(5, 5, 105, 35000, '2024-06-05', 'UPI');

-- display table
select * from payments;

-- to remove complete data from table
truncate table payments;

-- to delete complete attributes and records 
drop table payments; 

-- -------------------------------------select Queries --------------------------------------------------------
-- 1. payments where payment_mode Is not null
  SELECT * FROM payments where payment_mode Is not null;
  
  -- 2. select payments having  student_name student_dob along with its student_dob and its count.
select payment_mode, payment_date,char_length(payment_date) as character_count from payments where payment_mode ='online';

-- 3. select a payments by payment_mode
Select * FROM payments WHERE payment_mode ='cheque';

-- 4. Select payments with a payment_mode payment_mode longer than 5 characters
select * from payments where char_length(payment_mode) >5;

-- 5. select specific columns
select course_id, amount_paid from payments;

-- 6. Select payments in a specific course_id
select * from payments where course_id ='104';

-- 7. select payments with student_id='4'
select * from payments where student_id='4';

-- 8. Select payments amount_paid  in secific date
select * from payments where (amount_paid) ='2024-06-04';

-- 9. Select payments ordered by course_id in Descending order
select*from payments order by course_id Desc;

-- 10. select payments with payment_date '2024-06-02'.
select * from payments where payment_date='2024-06-02';

-- 11. select payments with a payment_mode containing a specific word
select * from payments where payment_mode like 'ch%';

-- 12. select payments established after a certain Date
select * from payments where student_id>'2';

-- 13. Count the number of payments in Each student_name
select student_id, count(*)  as payment_count from payments group by student_id;

-- 14. select payments ordered by student_id in ascending order
select*from payments order by student_id asc;

-- 15. slect payments where display only amount_paid
select amount_paid from payments;

-- 16. Select payments ordered by course_id in Descending order
select*from payments order by course_id Desc;

-- 17. select payments with student_id='3'
select * from payments where student_id='3';

-- 18.  Select payments with a  payment_mode longer than 4characters
select * from payments where char_length(payment_mode) >4;

-- 19. select payments with a payment_date containing a specific word
select * from payments where payment_date like '%05';

-- 20.  Select payments payment_mode = online
select * from payments where (payment_mode) ='online';

-- -------------------------------------------- update queries ------------------------------
-- 1. Update payment amount for payment_id = 1
UPDATE Payments SET amount_paid = 55000 WHERE payment_id = 1;

-- 2. Change payment mode for payment_id = 2
UPDATE Payments SET payment_mode = 'UPI' WHERE payment_id = 2;

-- 3. Update payment date for payment_id = 3
UPDATE Payments SET payment_date = '2024-06-10' WHERE payment_id = 3;

-- 4. Increase amount_paid by 5000 for payment_id = 4
UPDATE Payments SET amount_paid = amount_paid + 5000 WHERE payment_id = 4;

-- 5. Change student_id for payment_id = 5
UPDATE Payments SET student_id = 10 WHERE payment_id = 5;

-- 6. Set payment_mode to 'Online' for all Cash payments
UPDATE Payments SET payment_mode = 'Online' WHERE payment_mode = 'Cash';

-- 7. Change course_id for payment_id = 1
UPDATE Payments SET course_id = 111 WHERE payment_id = 1;

-- 8. Give 10% discount (reduce amount_paid) for payment_id = 2
UPDATE Payments SET amount_paid = amount_paid * 0.9 WHERE payment_id = 2;

-- 9. Change payment_mode to 'Cheque' for payment_id = 4
UPDATE Payments SET payment_mode = 'Cheque' WHERE payment_id = 4;

-- 10. Add 1000 to all payments made via UPI
UPDATE Payments SET amount_paid = amount_paid + 1000 WHERE payment_mode = 'UPI';

-- 11. Change payment_date for payment_id = 5
UPDATE Payments SET payment_date = '2024-06-15' WHERE payment_id = 5;

-- 12. Update course_id for student_id = 1
UPDATE Payments SET course_id = 120 WHERE student_id = 1;

-- 13. Set amount_paid to 0 for payment_id = 3 
UPDATE Payments SET amount_paid = 0 WHERE payment_id = 3;

-- 14. Change student_id from 3 to 33
UPDATE Payments SET student_id = 33 WHERE student_id = 3;

-- 15. Add 2000 to amount_paid where payment_mode is 'Online'
UPDATE Payments SET amount_paid = amount_paid + 2000 WHERE payment_mode = 'Online';

-- 16. Set all payment_mode to 'Card' for payments over 40000
UPDATE Payments SET payment_mode = 'Card' WHERE amount_paid > 40000;

-- 17. Update course_id to 106 for payment_id = 2
UPDATE Payments SET course_id = 106 WHERE payment_id = 2;

-- 18. Change all payment_date to '2024-06-30' for course_id = 105
UPDATE Payments SET payment_date = '2024-06-30' WHERE course_id = 105;

-- 19. Increase amount_paid by 10% for all payments
UPDATE Payments SET amount_paid = amount_paid * 1.1;

-- 20. Change payment_mode to 'Net Banking' where it is 'Cheque'
UPDATE Payments SET payment_mode = 'Net Banking' WHERE payment_mode = 'Cheque';

-- --------------------------------------- alter queries -----------------------------------
-- 1. Add a new column for payment status
ALTER TABLE Payments ADD payment_status VARCHAR(20);

-- 2. Add a column for transaction ID
ALTER TABLE Payments ADD transaction_id VARCHAR(30);

-- 3. Change data type of amount_paid to DECIMAL
ALTER TABLE Payments MODIFY amount_paid DECIMAL(10,2);

-- 4. Rename column payment_mode to mode_of_payment
ALTER TABLE Payments RENAME COLUMN payment_mode TO mode_of_payment;

-- 5. Drop the column transaction_id
ALTER TABLE Payments DROP COLUMN transaction_id;

-- 6. Add a column for remarks or notes
ALTER TABLE Payments ADD remarks TEXT;

-- 7. Rename column payment_date to date_of_payment
ALTER TABLE Payments RENAME COLUMN payment_date TO date_of_payment;

-- 8. Drop the column remarks
ALTER TABLE Payments DROP COLUMN remarks;

-- 9. Add a new column for branch name
ALTER TABLE Payments ADD branch_name VARCHAR(50);

-- 10. Set default value for payment_status as 'Pending'
ALTER TABLE Payments ALTER COLUMN payment_status SET DEFAULT 'Pending';

-- 11. Add a column for tax amount
ALTER TABLE Payments ADD tax_amount DECIMAL(8,2);

-- 12. Modify mode_of_payment to allow 30 characters
ALTER TABLE Payments MODIFY mode_of_payment VARCHAR(30);

-- 13. Add a column to store payment time
ALTER TABLE Payments ADD payment_time TIME;

-- 14. Drop column branch_name
ALTER TABLE Payments DROP COLUMN branch_name;

-- 15. Change student_id to BIGINT type
ALTER TABLE Payments MODIFY student_id BIGINT;

-- 16. Rename table Payments to StudentPayments
ALTER TABLE Payments RENAME TO StudentPayments;

-- 17. Rename the table back to Payments
ALTER TABLE StudentPayments RENAME TO Payments;

-- 18. Change course_id to VARCHAR instead of INT
ALTER TABLE Payments MODIFY course_id VARCHAR(10);

-- 19. Add a column to store payment method description
ALTER TABLE Payments ADD method_description VARCHAR(100);

-- 20. Drop the column method_description
ALTER TABLE Payments DROP COLUMN method_description;


-- ------------------------------------------- Delete Queries --------------------------------
-- 1. Delete payment with ID 5
DELETE FROM Payments WHERE payment_id = 5;

-- 2. Delete payment with student_id = 4
DELETE FROM Payments WHERE student_id = 4;

-- 3. Delete payments where amount_paid is less than 40000
DELETE FROM Payments WHERE amount_paid < 40000;

-- 4. Delete payment with course_id = 103
DELETE FROM Payments WHERE course_id = 103;

-- 5. Delete payment with payment_mode = 'Cheque'
DELETE FROM Payments WHERE payment_mode = 'Cheque';

-- 6. Delete payment where payment_date is '2024-06-03'
DELETE FROM Payments WHERE payment_date = '2024-06-03';

-- 7. Delete all Online payments
DELETE FROM Payments WHERE payment_mode = 'Online';

-- 8. Delete payments where course_id = 102
DELETE FROM Payments WHERE course_id = 102;

-- 9. Delete payment with payment_id = 2
DELETE FROM Payments WHERE payment_id = 2;

-- 10. Delete payment with student_id = 3
DELETE FROM Payments WHERE student_id = 3;

-- 11. Delete all UPI payments
DELETE FROM Payments WHERE payment_mode = 'UPI';

-- 12. Delete payment where amount_paid = 50000
DELETE FROM Payments WHERE amount_paid = 50000;

-- 13. Delete payment where payment_mode = 'Card'
DELETE FROM Payments WHERE payment_mode = 'Card';

-- 14. Delete payment with payment_id = 1
DELETE FROM Payments WHERE payment_id = 1;

-- 15. Delete all payments where amount_paid > 45000
DELETE FROM Payments WHERE amount_paid > 45000;

-- 16. Delete payment with course_id = 101
DELETE FROM Payments WHERE course_id = 101;

-- 17. Delete payment where student_id = 2
DELETE FROM Payments WHERE student_id = 2;

-- 18. Delete payment with payment_date = '2024-06-01'
DELETE FROM Payments WHERE payment_date = '2024-06-01';

-- 19. Delete payment with payment_mode = 'Credit Card'
DELETE FROM Payments WHERE payment_mode = 'Credit Card';

-- 20. Delete all payments where course_id = 200
DELETE FROM Payments WHERE course_id = 200;
