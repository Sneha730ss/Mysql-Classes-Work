-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database DRDO;

-- to work on it, you need to use it first
use DRDO;

-- Delete a database
Drop database DRDO;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Scientists(scientist_id,name,specialization, designation,email, phone_number, joining_date, department, project_assigned, status)

T2 : Laboratories(lab_id, lab_name, location, established_year, head_name, specialization_area, contact_email, contact_number, total_staff, status)

T3 : Projects( project_id, project_name, start_date, end_date, status, lead_scientist, department, budget_crores, lab_id, description)

T4 : Employees( emp_id, name, designation, department, email, phone_number, joining_date, lab_id, shift, ststus)

T5 : Departements(dept_id, dept_name, head_name, contact_email, contact_number, total_employees, location, established_year, lab_id, status)

T6 : Equipments(equipment_id, name, category, department_id, purchase_date, condition_status, manufacturer, warranty_expiry, lab_id)

T7 : Missions( mission_id, mission_name, launch_date, mission_type, status, duration_days, lead_lab_id, commander_name, budget_crores, remarks)

T8 : Vehicles( vehicle_id, vehicle_type, model_name, registration_number, lab_id, assigned_to, acquisition_date, condition_status, fuel_type, usage_purpose)

T9 : Trainings( training_id, title, trainer_name, department_id, start_date, end_date, duration_days, location, status, remarks)

T10 : Experiments( Experiment_id, title, objective, start_date, end_date, conducted_by, lab_id, department_id, status, result_summary)

T11 : Security_Passes( pass_id, emp_id, issue_date, expiry_date, pass_type, clearance_level, issued_by, status, remarks, location_access)

T12 : patents( patent_id, title, inventor_name, department_id, filing_date, approval_date, status, patent_number, usage_rights, remarks)

T13 : Foreign_collaborations( collaboration_id, country, partner_agency, project_title, start_date, end_date, drdo_lead, funding_amount, project_status, remarks)

T14 : Emergency_protocols(protocol_id, protocol_name, department_id, trigger_event, response_team, activation_time, contact_person, contact_number, last_tested_date, remarks)

T15 : Awards( award_id, emp_id, award_name, awarded_by, award_date, category, department_id, level, cash_prize, remarks)


*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Scientists 
CREATE TABLE Scientists (
    scientist_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    designation VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    joining_date DATE,
    department VARCHAR(100),
    project_assigned VARCHAR(100),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Scientists VALUES
(1, 'Dr. Anil Deshmukh', 'Aerospace', 'Senior Scientist', 'anil.d@drdo.in', '9812345670', '2012-05-10', 'Aeronautics', 'Tejas Fighter Jet', 'Active'),
(2, 'Dr. Kavita Rao', 'Robotics', 'Lead Scientist', 'kavita.rao@drdo.in', '9890012345', '2015-07-20', 'AI & Robotics', 'Combat Drones', 'Active'),
(3, 'Dr. Ramesh Iyer', 'Missile Tech', 'Scientist G', 'r.iyer@drdo.in', '9823456701', '2010-01-15', 'Missile Systems', 'Agni-V', 'Active'),
(4, 'Dr. Neha Sharma', 'Electronics', 'Scientist F', 'neha.s@drdo.in', '9845609823', '2013-04-22', 'Electronic Warfare', 'Radar Systems', 'Active'),
(5, 'Dr. Suresh Kamat', 'Materials', 'Scientist E', 'suresh.k@drdo.in', '9932104321', '2016-09-10', 'Material Science', 'Stealth Coating', 'Active'),
(6, 'Dr. Priya Pillai', 'Bio-Defense', 'Scientist D', 'priya.p@drdo.in', '9856743210', '2018-11-05', 'Life Sciences', 'Bio Suits', 'Active'),
(7, 'Dr. Rajeev Nair', 'Avionics', 'Scientist G', 'rajeev.n@drdo.in', '9961234567', '2009-12-12', 'Aerospace', 'LCA Upgrades', 'Active'),
(8, 'Dr. Swati Joshi', 'Cybersecurity', 'Scientist E', 'swati.j@drdo.in', '9876543012', '2017-08-01', 'Cyber Tech', 'SecureComm', 'Active'),
(9, 'Dr. Amitabh Das', 'Radar Systems', 'Scientist F', 'amitabh.d@drdo.in', '9723456789', '2014-03-20', 'Radar Tech', 'Long Range Radar', 'Active'),
(10, 'Dr. Poonam Verma', 'AI Systems', 'Scientist D', 'poonam.v@drdo.in', '9800012345', '2020-01-05', 'AI & Robotics', 'Autonomous Vehicles', 'Active'),
(11, 'Dr. S.K. Jain', 'Nuclear Research', 'Scientist H', 'sk.jain@drdo.in', '9819988776', '2007-06-18', 'Strategic Systems', 'Nuclear Shield', 'Active'),
(12, 'Dr. Harsha Reddy', 'Nano Tech', 'Scientist C', 'harsha.r@drdo.in', '9765432101', '2021-02-14', 'Nano Materials', 'Smart Armour', 'Active'),
(13, 'Dr. Manish Thakur', 'Marine Tech', 'Scientist E', 'manish.t@drdo.in', '9750034567', '2019-09-09', 'Naval Systems', 'Torpedo Project', 'Active'),
(14, 'Dr. Rashmi Kulkarni', 'Communication', 'Scientist F', 'rashmi.k@drdo.in', '9745567890', '2012-10-25', 'Secure Networks', 'Quantum Link', 'Active'),
(15, 'Dr. Nitin Bhat', 'Surveillance', 'Scientist D', 'nitin.b@drdo.in', '9700456123', '2016-03-30', 'Surveillance Systems', 'Night Vision Tech', 'Active');

-- to display/retrieve table data
SELECT * FROM Scientists;               

-- to remove complete data from table
truncate table Scientists;

-- to delete complete attributes and records 
drop table Scientists;

-- Table 2: Laboratories
CREATE TABLE Laboratories (
    lab_id INT PRIMARY KEY,
    lab_name VARCHAR(100),
    location VARCHAR(100),
    established_year INT,
    head_name VARCHAR(100),
    specialization_area VARCHAR(100),
    contact_email VARCHAR(100),
    contact_number VARCHAR(15),
    total_staff INT,
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Laboratories VALUES
(1, 'Aeronautical Development Establishment', 'Bangalore', 1959, 'Dr. Anil Deshmukh', 'Aeronautics', 'ade@drdo.in', '08023456789', 320, 'Active'),
(2, 'Defence Research and Development Laboratory', 'Hyderabad', 1961, 'Dr. Ramesh Iyer', 'Missile Systems', 'drdl@drdo.in', '04027891234', 450, 'Active'),
(3, 'Electronics & Radar Development Establishment', 'Bangalore', 1975, 'Dr. Neha Sharma', 'Radar Technology', 'lrde@drdo.in', '08027894567', 400, 'Active'),
(4, 'Naval Physical and Oceanographic Laboratory', 'Kochi', 1952, 'Dr. Manish Thakur', 'Marine Systems', 'npol@drdo.in', '04842345678', 300, 'Active'),
(5, 'Research Centre Imarat', 'Hyderabad', 1988, 'Dr. Rajeev Nair', 'Avionics', 'rci@drdo.in', '04023451234', 380, 'Active'),
(6, 'Defence Institute of Physiology & Allied Sciences', 'Delhi', 1962, 'Dr. Priya Pillai', 'Bio-Sciences', 'dipas@drdo.in', '01122334455', 200, 'Active'),
(7, 'Advanced Systems Laboratory', 'Hyderabad', 1980, 'Dr. Kavita Rao', 'Missile Integration', 'asl@drdo.in', '04022446688', 370, 'Active'),
(8, 'Defence Electronics Research Laboratory', 'Hyderabad', 1962, 'Dr. Swati Joshi', 'Electronic Warfare', 'derl@drdo.in', '04024567890', 310, 'Active'),
(9, 'Centre for Artificial Intelligence & Robotics', 'Bangalore', 2000, 'Dr. Poonam Verma', 'AI & Robotics', 'cair@drdo.in', '08025678910', 250, 'Active'),
(10, 'Institute of Nuclear Medicine & Allied Sciences', 'Delhi', 1961, 'Dr. S.K. Jain', 'Radiation & Bio-Defense', 'inmas@drdo.in', '01126541022', 220, 'Active'),
(11, 'Solid State Physics Laboratory', 'Delhi', 1962, 'Dr. Harsha Reddy', 'Nano Tech', 'sspl@drdo.in', '01126891234', 190, 'Active'),
(12, 'Defence Materials & Stores R&D Establishment', 'Kanpur', 1929, 'Dr. Suresh Kamat', 'Material Science', 'dmsrde@drdo.in', '05122334466', 210, 'Active'),
(13, 'Snow & Avalanche Study Establishment', 'Manali', 1969, 'Dr. Rashmi Kulkarni', 'Snow Research', 'sase@drdo.in', '01902234567', 150, 'Active'),
(14, 'Institute of Systems Studies and Analyses', 'Delhi', 1980, 'Dr. Amitabh Das', 'Simulation & Systems', 'issa@drdo.in', '01122554488', 180, 'Active'),
(15, 'Defence Avionics Research Establishment', 'Bangalore', 1986, 'Dr. Nitin Bhat', 'Avionics Systems', 'dare@drdo.in', '08022336644', 275, 'Active');

-- to display/retrieve table data
SELECT * FROM Laboratories;               

-- to remove complete data from table
truncate table Laboratories;

-- to delete complete attributes and records 
drop table Laboratories;

-- Table 3: Projects
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    lead_scientist VARCHAR(100),
    department VARCHAR(100),
    budget_crores DECIMAL(10,2),
    lab_id INT,
    description TEXT,
    FOREIGN KEY (lab_id) REFERENCES Laboratories(lab_id)
);

-- Insert records into the table
INSERT INTO Projects VALUES
(1, 'Tejas Fighter Jet', '2010-01-15', '2023-08-01', 'Completed', 'Dr. Anil Deshmukh', 'Aeronautics', 780.50, 1, 'Indigenous Light Combat Aircraft'),
(2, 'Agni-V Missile', '2011-03-22', '2022-05-12', 'Completed', 'Dr. Ramesh Iyer', 'Missile Systems', 1200.00, 2, 'Long-range nuclear-capable missile'),
(3, 'Radar Vision X', '2014-07-10', NULL, 'Ongoing', 'Dr. Neha Sharma', 'Radar Tech', 450.75, 3, 'Advanced radar for surveillance'),
(4, 'Ocean Tracker', '2016-01-25', NULL, 'Ongoing', 'Dr. Manish Thakur', 'Marine Systems', 360.20, 4, 'Autonomous ocean surveillance'),
(5, 'Combat Drone Swarm', '2018-11-01', NULL, 'Ongoing', 'Dr. Kavita Rao', 'AI & Robotics', 800.00, 9, 'AI-based unmanned aerial vehicles'),
(6, 'Nano Armour', '2020-03-18', NULL, 'Ongoing', 'Dr. Harsha Reddy', 'Nano Tech', 230.50, 11, 'Smart nano-material based body armor'),
(7, 'SecureComm Satellite', '2015-05-30', '2023-10-20', 'Completed', 'Dr. Swati Joshi', 'Cyber Tech', 950.00, 8, 'Encrypted satellite communication'),
(8, 'Bio Defense Suits', '2019-08-15', '2022-11-10', 'Completed', 'Dr. Priya Pillai', 'Life Sciences', 120.00, 6, 'Advanced protection suits for bio-hazards'),
(9, 'Quantum Secure Link', '2021-06-01', NULL, 'Ongoing', 'Dr. Rashmi Kulkarni', 'Secure Networks', 340.75, 13, 'Quantum communication system'),
(10, 'Autonomous Tank', '2017-10-05', NULL, 'Ongoing', 'Dr. Poonam Verma', 'AI & Robotics', 1080.20, 9, 'Self-navigating ground vehicle'),
(11, 'Stealth Coating Tech', '2012-09-01', '2020-06-30', 'Completed', 'Dr. Suresh Kamat', 'Material Science', 670.00, 12, 'Radar absorbing surface coating'),
(12, 'Night Vision Gen-5', '2018-12-10', '2023-01-01', 'Completed', 'Dr. Nitin Bhat', 'Surveillance Systems', 290.00, 15, 'Advanced night vision devices'),
(13, 'Hypersonic Vehicle', '2016-04-22', NULL, 'Ongoing', 'Dr. Rajeev Nair', 'Aerospace', 1500.00, 5, 'Mach-5 speed aircraft program'),
(14, 'Torpedo Tracker', '2020-07-01', NULL, 'Ongoing', 'Dr. Manish Thakur', 'Naval Systems', 410.00, 4, 'Underwater tracking system'),
(15, 'AI Battle Grid', '2023-01-20', NULL, 'Ongoing', 'Dr. Swati Joshi', 'AI & Robotics', 690.00, 8, 'Artificial intelligence in battlefield networks');

-- to display/retrieve table data
SELECT * FROM Projects;               

-- to remove complete data from table
truncate table Projects;

-- to delete complete attributes and records 
drop table Projects;

-- Table 4: Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(50),
    department VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    joining_date DATE,
    lab_id INT,
    shift VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (lab_id) REFERENCES Laboratories(lab_id)
);

-- Insert records into the table
INSERT INTO Employees VALUES
(1, 'Vikram Mehra', 'Admin Officer', 'Administration', 'vikram.m@drdo.in', '9876543210', '2012-06-10', 1, 'Day', 'Active'),
(2, 'Kavita Sinha', 'HR Executive', 'Human Resources', 'kavita.s@drdo.in', '9812345678', '2016-09-12', 2, 'Day', 'Active'),
(3, 'Rohan Nair', 'Technician', 'Maintenance', 'rohan.n@drdo.in', '9898765432', '2015-02-20', 3, 'Night', 'Active'),
(4, 'Meena Sharma', 'Accountant', 'Finance', 'meena.s@drdo.in', '9876501234', '2018-07-01', 4, 'Day', 'Active'),
(5, 'Amitabh Jain', 'IT Support', 'IT Department', 'amitabh.j@drdo.in', '9765432180', '2017-11-11', 5, 'Day', 'Active'),
(6, 'Sonal Desai', 'Security Head', 'Security', 'sonal.d@drdo.in', '9850011223', '2013-08-18', 6, 'Night', 'Active'),
(7, 'Rahul Verma', 'Librarian', 'Library', 'rahul.v@drdo.in', '9845612300', '2020-01-01', 7, 'Day', 'Active'),
(8, 'Priyanka Iyer', 'Receptionist', 'Admin', 'priyanka.i@drdo.in', '9789054321', '2021-04-25', 8, 'Day', 'Active'),
(9, 'Siddharth Joshi', 'Driver', 'Transport', 'siddharth.j@drdo.in', '9988776655', '2014-10-10', 9, 'Night', 'Active'),
(10, 'Neha Kulkarni', 'Clerk', 'Records', 'neha.k@drdo.in', '9798456123', '2016-03-15', 10, 'Day', 'Active'),
(11, 'Aarav Rao', 'Office Assistant', 'General Admin', 'aarav.r@drdo.in', '9612345678', '2015-12-05', 11, 'Day', 'Active'),
(12, 'Divya Singh', 'Technician', 'Electrical', 'divya.s@drdo.in', '9823456701', '2019-06-08', 12, 'Night', 'Active'),
(13, 'Nitin Shah', 'Network Admin', 'IT', 'nitin.sh@drdo.in', '9734567809', '2022-09-30', 13, 'Day', 'Active'),
(14, 'Ananya Das', 'Legal Officer', 'Legal', 'ananya.d@drdo.in', '9900123456', '2018-02-14', 14, 'Day', 'Active'),
(15, 'Prakash Shetty', 'Supervisor', 'Housekeeping', 'prakash.s@drdo.in', '9745612345', '2017-05-05', 15, 'Night', 'Active');

-- to display/retrieve table data
SELECT * FROM Employees;               

-- to remove complete data from table
truncate table Employees;

-- to delete complete attributes and records 
drop table Employees;

-- Table 5: Departments
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    head_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_number VARCHAR(15),
    total_employees INT,
    location VARCHAR(100),
    established_year INT,
    lab_id INT,
    status VARCHAR(20),
    FOREIGN KEY (lab_id) REFERENCES Laboratories(lab_id)
);

-- Insert records into the table
INSERT INTO Departments VALUES
(1, 'Aeronautics', 'Dr. Anil Deshmukh', 'aero@drdo.in', '9876543210', 120, 'Bangalore', 1960, 1, 'Active'),
(2, 'Missile Systems', 'Dr. Ramesh Iyer', 'missile@drdo.in', '9812345678', 140, 'Hyderabad', 1965, 2, 'Active'),
(3, 'Radar Technology', 'Dr. Neha Sharma', 'radar@drdo.in', '9823456701', 110, 'Bangalore', 1978, 3, 'Active'),
(4, 'Marine Systems', 'Dr. Manish Thakur', 'marine@drdo.in', '9845612390', 95, 'Kochi', 1955, 4, 'Active'),
(5, 'Avionics', 'Dr. Rajeev Nair', 'avionics@drdo.in', '9876000001', 80, 'Hyderabad', 1980, 5, 'Active'),
(6, 'Life Sciences', 'Dr. Priya Pillai', 'life@drdo.in', '9765432190', 85, 'Delhi', 1962, 6, 'Active'),
(7, 'Missile Integration', 'Dr. Kavita Rao', 'integration@drdo.in', '9732146589', 100, 'Hyderabad', 1983, 7, 'Active'),
(8, 'Electronic Warfare', 'Dr. Swati Joshi', 'ewarfare@drdo.in', '9871112223', 88, 'Hyderabad', 1975, 8, 'Active'),
(9, 'AI & Robotics', 'Dr. Poonam Verma', 'ai@drdo.in', '9832104567', 130, 'Bangalore', 2001, 9, 'Active'),
(10, 'Radiation Defense', 'Dr. S.K. Jain', 'raddef@drdo.in', '9800112233', 77, 'Delhi', 1965, 10, 'Active'),
(11, 'Nano Materials', 'Dr. Harsha Reddy', 'nano@drdo.in', '9900123412', 70, 'Delhi', 1972, 11, 'Active'),
(12, 'Material Science', 'Dr. Suresh Kamat', 'materials@drdo.in', '9734567809', 90, 'Kanpur', 1970, 12, 'Active'),
(13, 'Snow Research', 'Dr. Rashmi Kulkarni', 'snow@drdo.in', '9819012345', 60, 'Manali', 1975, 13, 'Active'),
(14, 'Systems Simulation', 'Dr. Amitabh Das', 'sim@drdo.in', '9753421087', 65, 'Delhi', 1982, 14, 'Active'),
(15, 'Surveillance', 'Dr. Nitin Bhat', 'surv@drdo.in', '9789012345', 78, 'Bangalore', 1986, 15, 'Active');

-- to display/retrieve table data
SELECT * FROM Departments;               

-- to remove complete data from table
truncate table Departments;

-- to delete complete attributes and records 
drop table Departments;

-- Table 6: Equipments
CREATE TABLE Equipments (
    equipment_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    department_id INT,
    purchase_date DATE,
    condition_status VARCHAR(20),
    serial_number VARCHAR(50),
    manufacturer VARCHAR(100),
    warranty_expiry DATE,
    lab_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (lab_id) REFERENCES Laboratories(lab_id)
);

-- Insert records into the table
INSERT INTO Equipments VALUES
(1, 'Radar Signal Analyzer', 'Radar', 3, '2019-01-10', 'Operational', 'RSAN9876', 'Bharat Electronics Ltd', '2024-01-10', 3),
(2, 'Missile Launch System', 'Missile', 2, '2018-05-20', 'Operational', 'MLS5623', 'Larsen & Toubro', '2025-05-20', 2),
(3, 'Autonomous Drone', 'AI Robotics', 9, '2020-08-05', 'Operational', 'DRN7812', 'Tata Advanced Systems', '2025-08-05', 9),
(4, 'Underwater Sonar', 'Marine', 4, '2017-12-15', 'Under Maintenance', 'SONR4421', 'Hindustan Shipyard', '2023-12-15', 4),
(5, 'Advanced Microscope', 'Nano Tech', 11, '2021-03-22', 'Operational', 'MICR9934', 'Olympus India', '2026-03-22', 11),
(6, 'Stealth Testing Panel', 'Material Science', 12, '2019-09-01', 'Operational', 'STTP8345', 'DRDO In-House', '2024-09-01', 12),
(7, 'AI Navigation Module', 'Avionics', 5, '2022-06-18', 'Operational', 'AINM1256', 'Infosys Defense', '2027-06-18', 5),
(8, 'High-Speed Camera', 'Surveillance', 15, '2018-11-11', 'Operational', 'HSC9821', 'Canon India', '2023-11-11', 15),
(9, 'Bio-Chemical Analyzer', 'Life Sciences', 6, '2020-01-30', 'Operational', 'BCA0987', 'Dr. Reddy Labs', '2025-01-30', 6),
(10, 'RF Jammer System', 'Electronic Warfare', 8, '2017-05-05', 'Outdated', 'RFJ6742', 'BHEL', '2022-05-05', 8),
(11, 'Smart Body Suit Tester', 'Life Sciences', 6, '2021-12-20', 'Operational', 'SBST8390', 'DRDO LifeTech', '2026-12-20', 6),
(12, 'Quantum Key Device', 'Secure Networks', 13, '2023-02-01', 'Operational', 'QKD4561', 'ISRO Tech Pvt. Ltd', '2028-02-01', 13),
(13, 'Autopilot Test Rig', 'Aeronautics', 1, '2022-04-14', 'Operational', 'ATR1902', 'HAL India', '2027-04-14', 1),
(14, 'Chemical Neutralizer', 'Radiation Defense', 10, '2016-09-19', 'Decommissioned', 'CNZ5543', 'Sun Pharma', '2021-09-19', 10),
(15, 'Simulated Combat Kit', 'Systems Simulation', 14, '2021-10-30', 'Operational', 'SCK9081', 'Wipro Defense Tech', '2026-10-30', 14);

-- to display/retrieve table data
SELECT * FROM Equipments;               

-- to remove complete data from table
truncate table Equipments;

-- to delete complete attributes and records 
drop table Equipments;

-- Table 7: Missions
CREATE TABLE Missions (
    mission_id INT PRIMARY KEY,
    mission_name VARCHAR(100),
    launch_date DATE,
    mission_type VARCHAR(50),
    status VARCHAR(20),
    duration_days INT,
    lead_lab_id INT,
    commander_name VARCHAR(100),
    budget_crores DECIMAL(10,2),
    remarks TEXT,
    FOREIGN KEY (lead_lab_id) REFERENCES Laboratories(lab_id)
);

-- Insert records into the table
INSERT INTO Missions VALUES
(1, 'Agni-V Launch', '2021-05-10', 'Missile', 'Successful', 2, 2, 'Dr. Ramesh Iyer', 550.00, 'Long-range strategic missile test'),
(2, 'Nirbhay Cruise Test', '2022-08-21', 'Missile', 'Successful', 1, 2, 'Dr. Rajeev Nair', 300.00, 'Subsonic cruise missile trial'),
(3, 'Rustom UAV Trial', '2023-02-17', 'UAV', 'Ongoing', 3, 9, 'Dr. Poonam Verma', 220.00, 'Autonomous surveillance drone'),
(4, 'Kavach Deployment', '2020-11-10', 'Defense System', 'Successful', 5, 4, 'Dr. Manish Thakur', 180.00, 'Naval decoy system'),
(5, 'Hypersonic Test Vehicle', '2023-07-01', 'Aerospace', 'Ongoing', 6, 5, 'Dr. Kavita Rao', 600.00, 'Scramjet-based flight experiment'),
(6, 'Cyber Shield', '2019-12-15', 'Cyber Defense', 'Completed', 10, 8, 'Dr. Swati Joshi', 110.00, 'Cyber attack detection project'),
(7, 'BioShield Suit Trial', '2022-03-09', 'Life Science', 'Successful', 4, 6, 'Dr. Priya Pillai', 95.00, 'NBC protective suit testing'),
(8, 'Smart Radar Deployment', '2021-06-23', 'Radar', 'Successful', 2, 3, 'Dr. Neha Sharma', 150.00, 'Mobile radar installation mission'),
(9, 'Deep Sea Surveillance', '2022-09-12', 'Marine', 'Ongoing', 8, 4, 'Dr. Manish Thakur', 210.00, 'Autonomous submarine sensors'),
(10, 'Night Ops UAV', '2023-01-10', 'AI Robotics', 'Ongoing', 7, 9, 'Dr. Poonam Verma', 175.00, 'Thermal vision AI drone'),
(11, 'Stealth Tech Demo', '2020-04-05', 'Material Science', 'Completed', 6, 12, 'Dr. Suresh Kamat', 80.00, 'Radar absorbing material testing'),
(12, 'Cold Zone Armor', '2021-12-20', 'Combat Gear', 'Successful', 3, 13, 'Dr. Rashmi Kulkarni', 60.00, 'Snow-resistant military armor'),
(13, 'Nuclear Disaster Drill', '2018-06-14', 'Safety', 'Completed', 2, 10, 'Dr. S.K. Jain', 130.00, 'Disaster management exercise'),
(14, 'Combat Simulation Grid', '2022-11-15', 'Simulation', 'Ongoing', 4, 14, 'Dr. Amitabh Das', 105.00, 'Live war game testbed'),
(15, 'Auto Missile Targeting', '2023-08-11', 'AI Defense', 'Ongoing', 1, 8, 'Dr. Swati Joshi', 325.00, 'AI-based missile target locking system');

-- to display/retrieve table data
SELECT * FROM Missions;               

-- to remove complete data from table
truncate table Missions;

-- to delete complete attributes and records 
drop table Missions;

-- Table 8: Vehicles
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_type VARCHAR(50),
    model_name VARCHAR(100),
    registration_number VARCHAR(20),
    lab_id INT,
    assigned_to VARCHAR(100),
    acquisition_date DATE,
    condition_status VARCHAR(20),
    fuel_type VARCHAR(20),
    usage_purpose VARCHAR(100),
    FOREIGN KEY (lab_id) REFERENCES Laboratories(lab_id)
);

-- Insert records into the table
INSERT INTO Vehicles VALUES
(1, 'Transport', 'Tata 407', 'KA01DR1234', 1, 'Logistics Division', '2019-01-15', 'Operational', 'Diesel', 'Equipment transport'),
(2, 'Command', 'Mahindra Scorpio', 'TS09HQ6789', 2, 'Dr. Ramesh Iyer', '2020-07-20', 'Operational', 'Diesel', 'Officer movement'),
(3, 'Research Van', 'Force Traveller', 'KA03TR2345', 3, 'Radar Testing Team', '2018-11-10', 'Operational', 'Diesel', 'Field experiments'),
(4, 'Naval Jeep', 'Maruti Gypsy', 'KL07NP3456', 4, 'Marine Project Unit', '2021-04-05', 'Operational', 'Petrol', 'Port-side inspections'),
(5, 'Heavy Truck', 'Ashok Leyland', 'AP10LY5678', 5, 'Avionics Division', '2017-02-17', 'Under Maintenance', 'Diesel', 'Missile transport'),
(6, 'Ambulance', 'Eicher Medical Van', 'DL01MD4567', 6, 'Health Center', '2019-09-01', 'Operational', 'Diesel', 'Medical emergencies'),
(7, 'Patrol Vehicle', 'Toyota Fortuner', 'TS11PT9876', 7, 'Security Wing', '2022-01-10', 'Operational', 'Diesel', 'Campus security'),
(8, 'Command', 'MG Hector', 'TS13MG1122', 8, 'Dr. Swati Joshi', '2020-05-25', 'Operational', 'Petrol', 'Project leadership use'),
(9, 'Utility Van', 'Tata Ace', 'KA09UC6789', 9, 'Robotics Lab', '2016-06-30', 'Operational', 'Diesel', 'Component pickup'),
(10, 'Research SUV', 'Isuzu V-Cross', 'DL12VC0987', 10, 'Radiation Study Team', '2018-03-03', 'Operational', 'Diesel', 'Field research mobility'),
(11, 'Nano Van', 'Tata Winger', 'DL05NW5544', 11, 'Nano-Tech Field Team', '2017-10-01', 'Under Maintenance', 'Diesel', 'Equipment delivery'),
(12, 'Fire Response', 'BharatBenz Fire Truck', 'UP32FR3210', 12, 'Safety Division', '2020-02-12', 'Operational', 'Diesel', 'Emergency response'),
(13, 'Snow Van', 'Force Gurkha 4x4', 'HP01SN8821', 13, 'Avalanche Study Team', '2021-12-22', 'Operational', 'Diesel', 'Mountain mobility'),
(14, 'Simulation Van', 'Ashok Leyland MOD', 'DL11SM3400', 14, 'Sim Test Division', '2019-08-08', 'Operational', 'Diesel', 'Equipment simulation'),
(15, 'Aviation Fuel Truck', 'Tata Fueler', 'KA04AV9087', 15, 'Flight Testing Unit', '2018-04-19', 'Operational', 'Diesel', 'Aircraft refueling');

-- to display/retrieve table data
SELECT * FROM Vehicles;               

-- to remove complete data from table
truncate table Vehicles;

-- to delete complete attributes and records 
drop table Vehicles;

-- Table 9: Trainings
CREATE TABLE Trainings (
    training_id INT PRIMARY KEY,
    title VARCHAR(100),
    trainer_name VARCHAR(100),
    department_id INT,
    start_date DATE,
    end_date DATE,
    duration_days INT,
    location VARCHAR(100),
    status VARCHAR(20),
    remarks TEXT,
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Trainings VALUES
(1, 'Advanced Missile Tech', 'Dr. Ramesh Iyer', 2, '2023-01-10', '2023-01-20', 10, 'Hyderabad', 'Completed', 'Focused on propulsion systems'),
(2, 'AI in Robotics', 'Dr. Kavita Rao', 9, '2023-03-05', '2023-03-12', 7, 'Bangalore', 'Completed', 'Hands-on training with AI algorithms'),
(3, 'Cyber Security Essentials', 'Dr. Swati Joshi', 8, '2023-02-15', '2023-02-19', 4, 'Delhi', 'Completed', 'Encryption and data defense'),
(4, 'Underwater Navigation', 'Dr. Manish Thakur', 4, '2023-04-01', '2023-04-08', 7, 'Kochi', 'Completed', 'Sonar and depth sensors'),
(5, 'Life Sciences Workshop', 'Dr. Priya Pillai', 6, '2023-05-10', '2023-05-15', 5, 'Delhi', 'Completed', 'NBC suit deployment'),
(6, 'Radar Signal Processing', 'Dr. Neha Sharma', 3, '2023-06-01', '2023-06-07', 6, 'Bangalore', 'Completed', 'Signal recognition and jamming'),
(7, 'Simulation Techniques', 'Dr. Amitabh Das', 14, '2023-03-20', '2023-03-25', 5, 'Delhi', 'Completed', 'Virtual battlefield simulation'),
(8, 'Quantum Communication', 'Dr. Rashmi Kulkarni', 13, '2023-07-01', '2023-07-07', 6, 'Manali', 'Completed', 'Quantum encryption training'),
(9, 'Stealth Materials', 'Dr. Suresh Kamat', 12, '2023-08-15', '2023-08-20', 5, 'Kanpur', 'Completed', 'Radar absorbing coatings'),
(10, 'Drone Control Systems', 'Dr. Poonam Verma', 9, '2023-09-05', '2023-09-10', 5, 'Bangalore', 'Completed', 'Manual vs AI drone control'),
(11, 'High Altitude Combat Prep', 'Dr. Rajeev Nair', 5, '2023-10-01', '2023-10-06', 5, 'Ladakh', 'Completed', 'Operations in cold terrain'),
(12, 'Nano Fabrication', 'Dr. Harsha Reddy', 11, '2023-11-10', '2023-11-15', 5, 'Delhi', 'Completed', 'Nano-based gear manufacturing'),
(13, 'Combat Comm Systems', 'Dr. Swati Joshi', 8, '2023-12-01', '2023-12-05', 4, 'Hyderabad', 'Completed', 'Encrypted comms training'),
(14, 'Chemical Risk Handling', 'Dr. S.K. Jain', 10, '2023-11-20', '2023-11-25', 5, 'Delhi', 'Completed', 'Chemical and radiological risk mitigation'),
(15, 'Project Management Tools', 'Dr. Anil Deshmukh', 1, '2023-12-15', '2023-12-20', 5, 'Bangalore', 'Completed', 'Project and budget planning basics');

-- to display/retrieve table data
SELECT * FROM Trainings;               

-- to remove complete data from table
truncate table Trainings;

-- to delete complete attributes and records 
drop table Trainings;

-- Table 10: Experiments
CREATE TABLE Experiments (
    experiment_id INT PRIMARY KEY,
    title VARCHAR(100),
    objective TEXT,
    start_date DATE,
    end_date DATE,
    conducted_by VARCHAR(100),
    lab_id INT,
    department_id INT,
    status VARCHAR(20),
    result_summary TEXT,
    FOREIGN KEY (lab_id) REFERENCES Laboratories(lab_id),
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Experiments VALUES
(1, 'Hypersonic Flow Study', 'Study thermal effects at hypersonic speeds', '2023-01-05', '2023-01-15', 'Dr. Ramesh Iyer', 2, 2, 'Completed', 'Test successful, heat shield sustained.'),
(2, 'Radar Cloaking Trial', 'Test stealth coating against radar waves', '2023-02-10', '2023-02-20', 'Dr. Suresh Kamat', 3, 12, 'Completed', 'Material showed 85% absorption.'),
(3, 'Underwater Signal Delay', 'Measure latency in acoustic signals', '2023-03-01', '2023-03-07', 'Dr. Manish Thakur', 4, 4, 'Completed', 'Delay within expected range.'),
(4, 'Nano Armor Durability', 'Check strength of nano-composite armor', '2023-04-10', '2023-04-17', 'Dr. Harsha Reddy', 11, 11, 'Completed', 'Survived 3x impact stress.'),
(5, 'Drone Flight Optimization', 'Improve endurance via AI pathing', '2023-05-05', '2023-05-12', 'Dr. Poonam Verma', 9, 9, 'Completed', 'Battery life improved 20%.'),
(6, 'Chemical Gas Filter Test', 'Evaluate chemical neutralizer materials', '2023-06-01', '2023-06-08', 'Dr. S.K. Jain', 10, 10, 'Completed', 'Filtered 96% toxic gas.'),
(7, 'Thermal Regulation Suit', 'Test fabric in extreme weather', '2023-07-15', '2023-07-22', 'Dr. Priya Pillai', 6, 6, 'Completed', 'Stable up to -25°C.'),
(8, 'Missile Tracking Simulation', 'Simulate trajectory with new algorithm', '2023-08-01', '2023-08-10', 'Dr. Amitabh Das', 14, 14, 'Completed', 'Increased accuracy 12%.'),
(9, 'AI Threat Response', 'Test AI defense against cyber attacks', '2023-09-03', '2023-09-10', 'Dr. Swati Joshi', 8, 8, 'Completed', 'Detected & blocked 95% threats.'),
(10, 'Space Radiation Analysis', 'Study shielding for satellite parts', '2023-10-01', '2023-10-10', 'Dr. Neha Sharma', 3, 3, 'Completed', 'Radiation levels under threshold.'),
(11, 'Auto-Control Missile Dock', 'Design auto-docking logic for missile', '2023-10-25', '2023-11-01', 'Dr. Rajeev Nair', 5, 5, 'Completed', 'Docking time reduced by 40%.'),
(12, 'Biometric Access Prototype', 'Test multi-level secure access', '2023-11-10', '2023-11-17', 'Dr. Vikram Mehra', 1, 1, 'Completed', 'Recognition success: 98.5%.'),
(13, 'Snow Mobility Trial', 'Test gear in extreme snow conditions', '2023-12-01', '2023-12-08', 'Dr. Rashmi Kulkarni', 13, 13, 'Completed', 'Equipment passed deep snow test.'),
(14, 'Laser Guided Device Test', 'Precision check of laser tag systems', '2023-12-15', '2023-12-22', 'Dr. Ramesh Iyer', 2, 2, 'Completed', 'Error margin <1 cm.'),
(15, 'Smart Helmet Experiment', 'Integrate HUD & sensors into helmet', '2024-01-05', '2024-01-12', 'Dr. Anil Deshmukh', 1, 1, 'Completed', 'HUD & comms stable.');

-- to display/retrieve table data
SELECT * FROM Experiments;               

-- to remove complete data from table
truncate table Experiments;

-- to delete complete attributes and records 
drop table Experiments;

-- Table 11: Security_Passes
CREATE TABLE Security_Passes (
    pass_id INT PRIMARY KEY,
    emp_id INT,
    issue_date DATE,
    expiry_date DATE,
    pass_type VARCHAR(50),
    clearance_level VARCHAR(20),
    issued_by VARCHAR(100),
    status VARCHAR(20),
    remarks TEXT,
    location_access VARCHAR(100),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert records into the table
INSERT INTO Security_Passes VALUES
(1, 101, '2023-01-10', '2024-01-10', 'Permanent', 'Level 4', 'Brig. Raghav Rao', 'Active', 'Top-level R&D access', 'Missile Lab'),
(2, 102, '2023-02-01', '2024-02-01', 'Contractual', 'Level 2', 'Col. Neha Saxena', 'Active', 'Lab access limited to AI section', 'AI Robotics Lab'),
(3, 103, '2022-12-15', '2023-12-15', 'Temporary', 'Level 1', 'Dr. Sanjay Pillai', 'Active', 'Intern pass for summer project', 'Nano Lab'),
(4, 104, '2023-03-05', '2024-03-05', 'Permanent', 'Level 5', 'Brig. Raghav Rao', 'Active', 'Full access granted', 'All Labs'),
(5, 105, '2022-11-01', '2023-11-01', 'Contractual', 'Level 3', 'Col. Neha Saxena', 'Expired', 'Project-based access only', 'Life Sciences Unit'),
(6, 106, '2023-04-15', '2024-04-15', 'Temporary', 'Level 2', 'Dr. Rajeev Nair', 'Active', 'Trainee researcher', 'Radar Lab'),
(7, 107, '2023-01-20', '2024-01-20', 'Permanent', 'Level 4', 'Brig. Raghav Rao', 'Active', 'Team lead - avionics', 'Flight Testing Area'),
(8, 108, '2023-02-28', '2024-02-28', 'Contractual', 'Level 3', 'Col. Meenal Joshi', 'Active', 'Testing zone access only', 'Simulation Wing'),
(9, 109, '2022-10-10', '2023-10-10', 'Temporary', 'Level 1', 'Dr. S.K. Jain', 'Expired', 'Biohazard area intern', 'Radiation Zone'),
(10, 110, '2023-05-05', '2024-05-05', 'Permanent', 'Level 5', 'Brig. Raghav Rao', 'Active', 'Security clearance full', 'HQ, Labs, Launch Pad'),
(11, 111, '2023-06-01', '2024-06-01', 'Contractual', 'Level 2', 'Col. Neha Saxena', 'Active', 'Simulation module access', 'Combat Grid'),
(12, 112, '2023-07-10', '2024-07-10', 'Temporary', 'Level 1', 'Dr. Swati Joshi', 'Active', 'Short-term intern', 'Cyber Lab'),
(13, 113, '2023-03-01', '2024-03-01', 'Permanent', 'Level 4', 'Brig. Raghav Rao', 'Active', 'Team leader clearance', 'Radar + AI labs'),
(14, 114, '2022-12-12', '2023-12-12', 'Contractual', 'Level 3', 'Dr. Poonam Verma', 'Expired', 'Drone research section only', 'UAV Field Zone'),
(15, 115, '2023-09-01', '2024-09-01', 'Permanent', 'Level 5', 'Brig. Raghav Rao', 'Active', 'Director level clearance', 'All Divisions & Labs');

-- to display/retrieve table data
SELECT * FROM Security_Passes;               

-- to remove complete data from table
truncate table Security_Passes;

-- to delete complete attributes and records 
drop table Security_Passes;

-- Table 12: Patents
CREATE TABLE Patents (
    patent_id INT PRIMARY KEY,
    title VARCHAR(150),
    inventor_name VARCHAR(100),
    department_id INT,
    filing_date DATE,
    approval_date DATE,
    status VARCHAR(20),
    patent_number VARCHAR(50),
    usage_rights VARCHAR(100),
    remarks TEXT,
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Patents VALUES
(1, 'Smart Camouflage Material', 'Dr. Neha Sharma', 3, '2022-03-10', '2023-02-05', 'Approved', 'DRDO123456', 'DRDO Exclusive', 'Adaptive surface tech for uniforms'),
(2, 'AI Target Lock System', 'Dr. Poonam Verma', 9, '2022-05-20', '2023-01-12', 'Approved', 'DRDO123457', 'Govt Use Only', 'Autonomous aiming system'),
(3, 'Nano Armor Shielding', 'Dr. Harsha Reddy', 11, '2022-04-15', '2023-03-18', 'Approved', 'DRDO123458', 'Defense Sector Only', 'Lightweight body armor'),
(4, 'Quantum Comm Protocol', 'Dr. Swati Joshi', 8, '2021-12-01', '2022-11-15', 'Approved', 'DRDO123459', 'Govt Use Only', 'Tamper-proof communication layer'),
(5, 'Biohazard Detector', 'Dr. S.K. Jain', 10, '2022-06-18', '2023-05-07', 'Approved', 'DRDO123460', 'Defense Exclusive', 'Early detection of hazardous gases'),
(6, 'Thermal Cloak Device', 'Dr. Ramesh Iyer', 2, '2021-09-25', '2022-08-22', 'Approved', 'DRDO123461', 'DRDO Exclusive', 'Heat signature masking tech'),
(7, 'Missile Docking Algorithm', 'Dr. Rajeev Nair', 5, '2022-10-10', '2023-09-12', 'Approved', 'DRDO123462', 'Defense Sector', 'AI-controlled missile targeting'),
(8, 'AI Drone Swarm Logic', 'Dr. Kavita Rao', 9, '2023-01-11', NULL, 'Pending', 'DRDO123463', 'Govt Use Only', 'Coordinated drone attack system'),
(9, 'Stealth Paint Formula', 'Dr. Suresh Kamat', 12, '2021-11-17', '2022-10-19', 'Approved', 'DRDO123464', 'DRDO Exclusive', 'Radar-absorbent paint'),
(10, 'Smart Helmet HUD', 'Dr. Anil Deshmukh', 1, '2022-08-08', '2023-06-09', 'Approved', 'DRDO123465', 'Govt Use Only', 'Real-time soldier guidance display'),
(11, 'Radiation Protective Suit', 'Dr. Priya Pillai', 6, '2023-02-12', NULL, 'Pending', 'DRDO123466', 'Defense Sector', 'Multi-layer hazard suit'),
(12, 'Satellite Heat Sink', 'Dr. Manish Thakur', 4, '2022-05-01', '2023-03-25', 'Approved', 'DRDO123467', 'DRDO Use Only', 'Temperature control in orbit'),
(13, 'Underwater Sonar Map AI', 'Dr. Raghav Rao', 4, '2023-03-01', NULL, 'Pending', 'DRDO123468', 'Govt Use Only', 'Marine terrain AI analysis'),
(14, 'Chemical Blast Buffer Gel', 'Dr. Rashmi Kulkarni', 13, '2022-07-15', '2023-06-18', 'Approved', 'DRDO123469', 'Defense Exclusive', 'Impact-dispersing substance'),
(15, 'Satellite Laser Relay', 'Dr. Vikram Mehra', 3, '2023-01-20', NULL, 'Pending', 'DRDO123470', 'Govt Use Only', 'Low-latency laser communication');

-- to display/retrieve table data
SELECT * FROM Patents;               

-- to remove complete data from table
truncate table Patents;

-- to delete complete attributes and records 
drop table Patents;

-- Table 13: Foreign_Collaborations
CREATE TABLE Foreign_Collaborations (
    collaboration_id INT PRIMARY KEY,
    country VARCHAR(50),
    partner_agency VARCHAR(100),
    project_title VARCHAR(150),
    start_date DATE,
    end_date DATE,
    drdo_lead VARCHAR(100),
    funding_amount DECIMAL(12,2),
    project_status VARCHAR(20),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Foreign_Collaborations VALUES
(1, 'Russia', 'Rosoboronexport', 'Hypersonic Missile Development', '2022-01-15', '2024-06-30', 'Dr. Ramesh Iyer', 50000000.00, 'Ongoing', 'Joint propulsion research'),
(2, 'USA', 'NASA', 'Space Material Durability Tests', '2021-11-10', '2023-10-15', 'Dr. Swati Joshi', 30000000.00, 'Completed', 'Thermal shielding materials tested'),
(3, 'France', 'Thales Group', 'Advanced Radar Systems', '2022-03-20', '2024-03-20', 'Dr. Neha Sharma', 45000000.00, 'Ongoing', 'Radar enhancement project'),
(4, 'Israel', 'IAI', 'Autonomous Drone Swarms', '2023-02-01', NULL, 'Dr. Kavita Rao', 40000000.00, 'Ongoing', 'AI-based control systems'),
(5, 'Germany', 'DLR', 'Electromagnetic Defense', '2022-07-01', '2023-12-31', 'Dr. Suresh Kamat', 25000000.00, 'Completed', 'Countermeasure systems developed'),
(6, 'UK', 'BAE Systems', 'Next-Gen Armored Vehicles', '2023-01-10', NULL, 'Dr. Harsha Reddy', 35000000.00, 'Ongoing', 'Joint mobility and armor research'),
(7, 'Japan', 'JAXA', 'Satellite Communication Relays', '2021-06-01', '2023-08-01', 'Dr. Vikram Mehra', 28000000.00, 'Completed', 'Improved relay protocols tested'),
(8, 'South Korea', 'ADD', 'Robotics Integration Project', '2023-03-15', NULL, 'Dr. Poonam Verma', 32000000.00, 'Ongoing', 'Heavy terrain robot mobility'),
(9, 'Australia', 'DST Group', 'Underwater Surveillance Tech', '2022-10-05', '2024-01-05', 'Dr. Manish Thakur', 22000000.00, 'Ongoing', 'Marine sensor grid'),
(10, 'Canada', 'DRDC', 'Cold Climate Gear Development', '2022-05-01', '2023-12-15', 'Dr. Rajeev Nair', 20000000.00, 'Completed', 'Survival suit tests successful'),
(11, 'Brazil', 'CTA', 'Missile Range Expansion', '2023-06-01', NULL, 'Dr. Raghav Rao', 18000000.00, 'Ongoing', 'Extended-range ballistic tests'),
(12, 'Italy', 'Leonardo S.p.A', 'Counter-UAV Systems', '2022-12-01', '2024-05-01', 'Dr. S.K. Jain', 27000000.00, 'Ongoing', 'Infrared UAV detection'),
(13, 'Sweden', 'SAAB', 'Smart Helmet Enhancement', '2023-01-25', NULL, 'Dr. Anil Deshmukh', 19000000.00, 'Ongoing', 'Sensor integration phase'),
(14, 'Norway', 'FFI', 'Arctic Research Vehicles', '2023-04-10', NULL, 'Dr. Priya Pillai', 21000000.00, 'Ongoing', 'Winter terrain vehicle design'),
(15, 'Singapore', 'DSO Labs', 'Cyber Warfare Defense Sim', '2022-09-01', '2023-11-01', 'Dr. Rashmi Kulkarni', 23000000.00, 'Completed', 'Cyber defense strategy modeling');

-- to display/retrieve table data
SELECT * FROM Foreign_Collaborations;               

-- to remove complete data from table
truncate table Foreign_Collaborations;

-- to delete complete attributes and records 
drop table Foreign_Collaborations;

-- Table 14: Emergency_Protocols
CREATE TABLE Emergency_Protocols (
    protocol_id INT PRIMARY KEY,
    protocol_name VARCHAR(100),
    department_id INT,
    trigger_event VARCHAR(100),
    response_team VARCHAR(100),
    activation_time TIME,
    contact_person VARCHAR(100),
    contact_number VARCHAR(15),
    last_tested_date DATE,
    remarks TEXT,
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Emergency_Protocols VALUES
(1, 'Fire Evacuation Alpha', 1, 'Fire Alarm', 'Security Team A', '10:30:00', 'Capt. Manoj Sharma', '9876543210', '2023-06-15', 'Evacuation drill completed'),
(2, 'Cyber Breach Alert', 8, 'Data Breach', 'Cyber Unit Bravo', '03:45:00', 'Dr. Swati Joshi', '9123456780', '2023-07-01', 'Simulated breach response successful'),
(3, 'Radiation Exposure Drill', 10, 'Radiation Detected', 'Medical Team Delta', '14:00:00', 'Dr. S.K. Jain', '9988776655', '2023-05-20', 'NBC suit protocol tested'),
(4, 'Explosive Threat Zeta', 12, 'Bomb Threat', 'EOD Unit X', '09:00:00', 'Col. Raghav Rao', '8765432190', '2023-08-10', 'Dummy device disposal exercise done'),
(5, 'Chemical Leak Beta', 6, 'Toxic Leak', 'Chem Response Team', '11:20:00', 'Dr. Priya Pillai', '9321654789', '2023-03-18', 'Lab sealed in under 2 mins'),
(6, 'Intruder Protocol Gamma', 3, 'Unauthorized Entry', 'Guard Patrol Team 2', '22:15:00', 'Maj. Anil Deshmukh', '8899776655', '2023-09-05', 'RFID scanner override tested'),
(7, 'Power Outage Drill', 1, 'Electric Failure', 'Maintenance Squad', '13:30:00', 'Er. Rajeev Nair', '9012345678', '2023-04-25', 'Backup generators engaged'),
(8, 'Missile Control Breach', 2, 'Unauthorized Console Access', 'Launch Pad Security', '00:15:00', 'Lt. Ramesh Iyer', '9823001122', '2023-02-10', 'Console lockdown successful'),
(9, 'Drone Hijack Emergency', 9, 'UAV Signal Loss', 'Drone Command Team', '07:50:00', 'Dr. Kavita Rao', '9765432101', '2023-05-05', 'Drone forced to land remotely'),
(10, 'Lab Contamination Drill', 4, 'Hazmat Exposure', 'Bio-Containment Unit', '15:45:00', 'Dr. Manish Thakur', '9867543210', '2023-06-30', 'Decon room response tested'),
(11, 'Spyware Detection Protocol', 8, 'Suspicious Network Activity', 'Cyber Team Beta', '12:00:00', 'Dr. Rashmi Kulkarni', '9777000123', '2023-03-03', 'Firewall reinforcement complete'),
(12, 'Satellite Failure Response', 3, 'Signal Disruption', 'Satellite Ops Unit', '05:30:00', 'Dr. Neha Sharma', '9700000001', '2023-07-20', 'Signal recovery training held'),
(13, 'Weapon System Lockdown', 5, 'Unauthorized Launch Attempt', 'System Admins & Ops', '16:20:00', 'Lt. Col. Poonam Verma', '9998887766', '2023-08-12', 'Fail-safe override initiated'),
(14, 'Building Lockdown Alert', 14, 'Security Breach', 'Facility Security Lead', '21:10:00', 'Col. Suresh Kamat', '9332211445', '2023-04-12', 'All exits sealed in 3 mins'),
(15, 'Flood Evacuation Protocol', 13, 'Heavy Rainfall Warning', 'Disaster Team Bravo', '06:45:00', 'Dr. Harsha Reddy', '9011554477', '2023-07-10', 'Basement water pumps tested');

-- to display/retrieve table data
SELECT * FROM Emergency_Protocols;               

-- to remove complete data from table
truncate table Emergency_Protocols;

-- to delete complete attributes and records 
drop table Emergency_Protocols;

-- Table 15: Awards
CREATE TABLE Awards (
    award_id INT PRIMARY KEY,
    emp_id INT,
    award_name VARCHAR(100),
    awarded_by VARCHAR(100),
    award_date DATE,
    category VARCHAR(50),
    department_id INT,
    level VARCHAR(20),
    cash_prize DECIMAL(10,2),
    remarks TEXT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id)
);

-- Insert records into the table
INSERT INTO Awards VALUES
(1, 101, 'Excellence in Research', 'Defence Minister', '2022-01-26', 'Research', 3, 'National', 100000.00, 'AI project success'),
(2, 102, 'Innovation Award', 'DRDO HQ', '2022-03-15', 'Innovation', 9, 'Departmental', 75000.00, 'Drone tech breakthrough'),
(3, 103, 'Best Scientist', 'President of India', '2021-12-01', 'Overall', 2, 'National', 150000.00, 'Missile guidance innovation'),
(4, 104, 'Women in Defence Tech', 'DRDO HQ', '2023-03-08', 'Special Recognition', 8, 'Departmental', 50000.00, 'Cybersecurity contribution'),
(5, 105, 'Young Achiever Award', 'Scientific Council', '2022-05-05', 'Early Career', 5, 'Institutional', 40000.00, 'AI system prototype'),
(6, 106, 'Team Excellence Award', 'Lab Director', '2022-11-10', 'Team Work', 6, 'Lab Level', 25000.00, 'Chemical neutralizer success'),
(7, 107, 'Satellite Innovation Prize', 'ISRO + DRDO', '2023-01-01', 'Space Tech', 4, 'National', 90000.00, 'Orbit control system'),
(8, 108, 'Bravery Recognition', 'Defence Secretary', '2021-08-15', 'Field Operations', 1, 'National', 60000.00, 'On-ground tech fix during launch'),
(9, 109, 'Technical Excellence', 'DRDO Director General', '2022-10-10', 'Engineering', 11, 'Departmental', 55000.00, 'Armor tech durability solution'),
(10, 110, 'R&D Champion', 'Defence R&D Board', '2022-12-12', 'Research', 12, 'Institutional', 70000.00, 'Radar stealth materials'),
(11, 111, 'Top Innovator', 'DRDO Chairman', '2023-04-01', 'Innovation', 14, 'Departmental', 80000.00, 'Facility automation AI'),
(12, 112, 'Project Leadership Award', 'DRDO South Zone', '2023-05-09', 'Leadership', 3, 'Zonal', 65000.00, 'Quantum project lead'),
(13, 113, 'Environment Tech Honor', 'MoD', '2022-06-05', 'Eco-Innovation', 13, 'Institutional', 30000.00, 'Low-impact lab systems'),
(14, 114, 'Best Paper Award', 'Science & Defence Conf.', '2023-02-14', 'Publication', 10, 'External', 20000.00, 'Thermal bio suit paper'),
(15, 115, 'Mentorship Medal', 'DRDO Talent Wing', '2023-03-20', 'Mentorship', 9, 'Departmental', 25000.00, 'Guided 10 new researchers');

-- to display/retrieve table data
SELECT * FROM Awards;               

-- to remove complete data from table
truncate table Awards;

-- to delete complete attributes and records 
drop table Awards;