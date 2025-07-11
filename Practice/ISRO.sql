-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database ISRO;

-- to work on it, you need to use it first
use ISRO;

-- Delete a database
Drop database ISRO;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Scientists (scientist_id, name, gender, dob, designation, department,contact_number, email, joining_date, current_project)	

T2 : Launch_Vehicles (vehicle_id, name, type, stages, fuel_type, height_meters,payload_capacity_kg, first_launch, last_mission, status) 

T3 : Missions (mission_id, mission_name, mission_type, launch_date, vehicle_used,objective, outcome, status, mission_director, budget_crores)

T4 : Satellites (satellite_id, name, type, launch_date, orbit_type, weight_kg,purpose, status, mission_id, operated_by) 

T5 : Space_Centres (centre_id, name, location, state, established_year, director,specialization, staff_count, status, contact_email)

T6 : Launch_Pads (pad_id, name, location, state, established_year, associated_centre,status, supported_vehicles, launches_conducted, pad_director)

T7 : Astronauts (astronaut_id, name, gender, dob, state, training_center,selection_year, missions_assigned, flight_status, contact_email) 

T8 : Ground_Stations (station_id, name, location, state, operational_since,frequency_band, tracking_range_km, staff_count, status, station_head) 

T9 : ISRO_Projects (project_id, project_name, objective, start_date, end_date, lead_scientist,budget_crores, status, associated_centre, outcome) 

T10 : Launch_Schedules (schedule_id, mission_name, vehicle, launch_date, launch_time,launch_pad, payload, status, director, centre) 

T11 : Experiments (experiment_id, experiment_name, mission_name, objective,scientist_incharge, equipment_used, start_date, end_date,result_summary, status)

T12 :  Research_Labs (lab_id, name, location, state, established_year, specialization,head_scientist, staff_count, status, affiliated_centre) 	

T13 : Space_Missions (mission_id, mission_name, mission_type, objective, launch_vehicle,launch_date, duration_days, outcome, mission_director, status) 

T14 : Training_Programs (program_id, title, category, start_date, end_date,trainer_name, location, participants_count, mode, status)

T15 :  Research_Publications (publication_id, title, author_name, journal_name, publication_date,category, centre, citation_count, doi, status) 

*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Scientists
CREATE TABLE Scientists (
    scientist_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    designation VARCHAR(100),
    department VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    joining_date DATE,
    current_project VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Scientists (scientist_id, name, gender, dob, designation, department,contact_number, email, joining_date, current_project)
 VALUES
(1, 'Dr. A.P. Joshi', 'Male', '1975-08-15', 'Senior Scientist', 'Rocket Propulsion', '9876543210', 'ap.joshi@isro.in', '2005-06-01', 'Gaganyaan'),
(2, 'Dr. Kavita Iyer', 'Female', '1982-03-10', 'Research Scientist', 'Satellites', '9876501234', 'kavita.iyer@isro.in', '2010-08-12', 'Chandrayaan-3'),
(3, 'Dr. Rajesh Kumar', 'Male', '1978-12-20', 'Lead Engineer', 'Payload Design', '9876549876', 'rajesh.kumar@isro.in', '2008-04-18', 'Mars Orbiter'),
(4, 'Dr. Sneha Reddy', 'Female', '1985-07-30', 'Astrophysicist', 'Space Research', '9876123456', 'sneha.reddy@isro.in', '2012-09-05', 'Aditya-L1'),
(5, 'Dr. Nikhil Shah', 'Male', '1976-10-25', 'System Analyst', 'Mission Control', '9876234567', 'nikhil.shah@isro.in', '2006-11-01', 'INSAT-3D'),
(6, 'Dr. Priya Mehta', 'Female', '1981-06-19', 'Scientist-B', 'Remote Sensing', '9876345678', 'priya.mehta@isro.in', '2011-01-25', 'RISAT-2B'),
(7, 'Dr. Rohan Deshmukh', 'Male', '1980-04-14', 'Scientist-C', 'Navigation', '9876456789', 'rohan.d@isro.in', '2009-07-12', 'NAVIC'),
(8, 'Dr. Swati Verma', 'Female', '1983-09-12', 'Scientist-D', 'Telemetry', '9876567890', 'swati.verma@isro.in', '2013-02-28', 'IRNSS'),
(9, 'Dr. Amitabh Rao', 'Male', '1979-11-05', 'Project Director', 'Launch Vehicles', '9876678901', 'amitabh.rao@isro.in', '2007-03-10', 'PSLV-C58'),
(10, 'Dr. Meenakshi Nair', 'Female', '1984-02-22', 'Scientist-E', 'Geospatial', '9876789012', 'meenakshi.nair@isro.in', '2014-05-17', 'CartoSat-3'),
(11, 'Dr. Arjun Vyas', 'Male', '1977-06-01', 'Chief Engineer', 'Thermal Systems', '9876890123', 'arjun.vyas@isro.in', '2005-08-10', 'SSLV'),
(12, 'Dr. Lata Joshi', 'Female', '1980-08-08', 'Scientist-F', 'Communication', '9876901234', 'lata.joshi@isro.in', '2010-09-15', 'GSAT-6A'),
(13, 'Dr. Varun Bhat', 'Male', '1986-05-25', 'Junior Scientist', 'Cryogenics', '9876012345', 'varun.bhat@isro.in', '2015-06-22', 'GSLV-Mk3'),
(14, 'Dr. Anjali Patil', 'Female', '1982-11-11', 'Engineer', 'Avionics', '9876123457', 'anjali.patil@isro.in', '2008-10-01', 'REXIS'),
(15, 'Dr. Deepak Chauhan', 'Male', '1974-01-05', 'Director', 'ISRO HQ', '9876234568', 'deepak.chauhan@isro.in', '2003-01-01', 'Strategic Planning');

-- to display/retrieve table data
SELECT * FROM Scientists;               

-- to remove complete data from table
truncate table Scientists;

-- to delete complete attributes and records 
drop table Scientists;

-- Table 2: Launch_Vehicles
CREATE TABLE Launch_Vehicles (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    stages INT,
    fuel_type VARCHAR(50),
    height_meters DECIMAL(5,2),
    payload_capacity_kg INT,
    first_launch DATE,
    last_mission VARCHAR(100),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Launch_Vehicles (vehicle_id, name, type, stages, fuel_type, height_meters,payload_capacity_kg, first_launch, last_mission, status) 
VALUES
(1, 'PSLV-C51', 'PSLV', 4, 'Solid + Liquid', 44.00, 1750, '2021-02-28', 'Amazonia-1', 'Retired'),
(2, 'GSLV Mk II', 'GSLV', 3, 'Cryogenic', 49.13, 2500, '2010-04-15', 'GSAT-14', 'Active'),
(3, 'GSLV Mk III', 'GSLV', 3, 'Cryogenic', 43.43, 4000, '2014-12-18', 'Gaganyaan Unmanned', 'Active'),
(4, 'SSLV-D1', 'SSLV', 3, 'Solid', 34.00, 500, '2022-08-07', 'EOS-02', 'Tested'),
(5, 'PSLV-C55', 'PSLV', 4, 'Solid + Liquid', 44.00, 1750, '2023-04-22', 'TeLEOS-2', 'Active'),
(6, 'ASLV', 'ASLV', 4, 'Solid', 23.50, 150, '1987-03-24', 'SROSS', 'Retired'),
(7, 'Rohini', 'SLV', 2, 'Solid', 22.00, 40, '1980-07-18', 'RS-1', 'Retired'),
(8, 'GSLV Mk I', 'GSLV', 3, 'Cryogenic', 49.00, 1500, '2001-04-18', 'GSAT-1', 'Inactive'),
(9, 'PSLV-C52', 'PSLV', 4, 'Solid + Liquid', 44.00, 1750, '2022-02-14', 'EOS-04', 'Active'),
(10, 'PSLV-XL', 'PSLV', 4, 'Solid + Liquid', 44.00, 3200, '2008-10-22', 'Chandrayaan-1', 'Active'),
(11, 'SLV-3', 'SLV', 2, 'Solid', 22.00, 40, '1979-08-10', 'SLV-3 E-01', 'Retired'),
(12, 'GSLV Mk III-M1', 'GSLV', 3, 'Cryogenic', 43.43, 3850, '2019-07-22', 'Chandrayaan-2', 'Active'),
(13, 'PSLV-C50', 'PSLV', 4, 'Solid + Liquid', 44.00, 1750, '2020-12-17', 'CMS-01', 'Active'),
(14, 'GSLV F12', 'GSLV', 3, 'Cryogenic', 49.13, 2500, '2023-05-29', 'NVS-01', 'Active'),
(15, 'SSLV-D2', 'SSLV', 3, 'Solid', 34.00, 500, '2023-02-10', 'EOS-07', 'Tested');

-- to display/retrieve table data
SELECT * FROM Launch_Vehicles;               

-- to remove complete data from table
truncate table Launch_Vehicles;

-- to delete complete attributes and records 
drop table Launch_Vehicles;

-- Table 3: Missions
CREATE TABLE Missions (
    mission_id INT PRIMARY KEY,
    mission_name VARCHAR(100),
    mission_type VARCHAR(50),
    launch_date DATE,
    vehicle_used VARCHAR(50),
    objective TEXT,
    outcome VARCHAR(50),
    status VARCHAR(20),
    mission_director VARCHAR(100),
    budget_crores DECIMAL(10,2)
);

-- Insert records into the table
INSERT INTO Missions (mission_id, mission_name, mission_type, launch_date, vehicle_used,objective, outcome, status, mission_director, budget_crores)
 VALUES
(1, 'Chandrayaan-1', 'Lunar', '2008-10-22', 'PSLV-XL', 'Moon surface mapping', 'Success', 'Completed', 'Dr. Mylswamy Annadurai', 386.00),
(2, 'Chandrayaan-2', 'Lunar', '2019-07-22', 'GSLV Mk III-M1', 'Lunar surface landing', 'Partial Success', 'Completed', 'Dr. K. Sivan', 978.00),
(3, 'Chandrayaan-3', 'Lunar', '2023-07-14', 'LVM3-M4', 'Lunar south pole landing', 'Success', 'Completed', 'Dr. Veeramuthuvel', 615.00),
(4, 'Mangalyaan', 'Mars', '2013-11-05', 'PSLV-C25', 'Mars orbit insertion', 'Success', 'Completed', 'Dr. Radhakrishnan', 450.00),
(5, 'Gaganyaan (Test)', 'Human Spaceflight', '2023-10-21', 'TV-D1', 'Abort mission test', 'Success', 'Testing', 'Dr. Unnikrishnan Nair', 9023.00),
(6, 'Aditya-L1', 'Solar', '2023-09-02', 'PSLV-C57', 'Sun observation at L1', 'Ongoing', 'Active', 'Dr. Sankarasubramanian', 378.53),
(7, 'RISAT-2BR1', 'Remote Sensing', '2019-12-11', 'PSLV-C48', 'Radar imaging', 'Success', 'Completed', 'Dr. Ritu Karidhal', 356.00),
(8, 'INSAT-3DR', 'Meteorology', '2016-09-08', 'GSLV-F05', 'Weather monitoring', 'Success', 'Operational', 'Dr. V. Narayanan', 150.00),
(9, 'GSAT-6A', 'Communication', '2018-03-29', 'GSLV-F08', 'Mobile communication', 'Failure', 'Lost', 'Dr. Suresh Kumar', 270.00),
(10, 'EOS-06', 'Earth Observation', '2022-11-26', 'PSLV-C54', 'Ocean & land data', 'Success', 'Active', 'Dr. Megha Ramesh', 500.00),
(11, 'Astra', 'Defense', '2022-07-12', 'NA', 'Missile test from aircraft', 'Success', 'Completed', 'Dr. Ramakrishna Nair', 100.00),
(12, 'SSLV-D1', 'Test', '2022-08-07', 'SSLV', 'Small payload deployment', 'Partial Success', 'Tested', 'Dr. Sudhakar', 165.00),
(13, 'EOS-02', 'Earth Observation', '2022-08-07', 'SSLV-D1', 'Technology demonstrator', 'Partial Failure', 'Completed', 'Dr. Nithin Babu', 170.00),
(14, 'NAVIC', 'Navigation', '2013-07-01', 'PSLV', 'Indian GPS alternative', 'Success', 'Operational', 'Dr. Raghavan', 1420.00),
(15, 'GSAT-7A', 'Communication', '2018-12-19', 'GSLV-F11', 'Military satellite', 'Success', 'Active', 'Dr. Ajay Kumar', 350.00);

-- to display/retrieve table data
SELECT * FROM Missions;               

-- to remove complete data from table
truncate table Missions;

-- to delete complete attributes and records 
drop table Missions;

-- Table 4: Satellites
CREATE TABLE Satellites (
    satellite_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    launch_date DATE,
    orbit_type VARCHAR(50),
    weight_kg INT,
    purpose TEXT,
    status VARCHAR(20),
    mission_id INT,
    operated_by VARCHAR(100),
    FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);

-- Insert records into the table
INSERT INTO Satellites (satellite_id, name, type, launch_date, orbit_type, weight_kg,purpose, status, mission_id, operated_by) 
VALUES
(1, 'INSAT-3D', 'Meteorological', '2013-07-26', 'GSO', 2060, 'Weather monitoring', 'Active', 8, 'Dr. Harish Patel'),
(2, 'IRNSS-1A', 'Navigation', '2013-07-01', 'GEO', 1425, 'Regional navigation', 'Inactive', 14, 'Dr. Seema Sharma'),
(3, 'CartoSat-2', 'Remote Sensing', '2007-01-10', 'SSO', 680, 'High-res imaging', 'Retired', 7, 'Dr. Arvind Rao'),
(4, 'GSAT-6A', 'Communication', '2018-03-29', 'GSO', 2140, 'Mobile communication', 'Lost', 9, 'Dr. Neeta Mehta'),
(5, 'RISAT-2BR1', 'Surveillance', '2019-12-11', 'LEO', 628, 'Radar imaging', 'Active', 7, 'Dr. Vivek Anand'),
(6, 'Chandrayaan-2 Orbiter', 'Lunar Orbiter', '2019-07-22', 'Lunar', 2379, 'Lunar study', 'Active', 2, 'Dr. Ishita Reddy'),
(7, 'Mars Orbiter (MOM)', 'Planetary', '2013-11-05', 'Mars Orbit', 1337, 'Mars exploration', 'Active', 4, 'Dr. Deepak Kulkarni'),
(8, 'Aditya-L1', 'Solar Observatory', '2023-09-02', 'L1 Point', 1500, 'Sun observation', 'Active', 6, 'Dr. Vandana Iyer'),
(9, 'EOS-01', 'Earth Observation', '2020-11-07', 'SSO', 637, 'Agriculture & forestry', 'Active', 10, 'Dr. Pratik Jain'),
(10, 'GSAT-7A', 'Military Comm.', '2018-12-19', 'GSO', 2250, 'IAF communication', 'Active', 15, 'Dr. Aarti Sinha'),
(11, 'Chandrayaan-1', 'Lunar Orbiter', '2008-10-22', 'Lunar', 1380, 'Moon imaging', 'Completed', 1, 'Dr. Ravi Varma'),
(12, 'EOS-02', 'Experimental', '2022-08-07', 'LEO', 135, 'Tech demonstrator', 'Failed', 13, 'Dr. Pooja Kapoor'),
(13, 'INS-2TD', 'Demo', '2022-02-14', 'SSO', 17.5, 'Thermal imaging', 'Active', 9, 'Dr. Rakesh Menon'),
(14, 'GSAT-29', 'Communication', '2018-11-14', 'GEO', 3423, 'High-throughput data', 'Active', 9, 'Dr. Shalini Joshi'),
(15, 'Chandrayaan-3 Vikram', 'Lander', '2023-08-23', 'Lunar', 1749, 'Lunar surface soft landing', 'Active', 3, 'Dr. Anurag Mishra');

-- to display/retrieve table data
SELECT * FROM Satellites;               

-- to remove complete data from table
truncate table Satellites;

-- to delete complete attributes and records 
drop table Satellites;

-- Table 5: Space_Centres
CREATE TABLE Space_Centres (
    centre_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    state VARCHAR(50),
    established_year INT,
    director VARCHAR(100),
    specialization VARCHAR(100),
    staff_count INT,
    status VARCHAR(20),
    contact_email VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Space_Centres (centre_id, name, location, state, established_year, director,specialization, staff_count, status, contact_email)
 VALUES
(1, 'Vikram Sarabhai Space Centre', 'Thiruvananthapuram', 'Kerala', 1963, 'Dr. Anil Nair', 'Launch Vehicles', 5000, 'Active', 'vssc@isro.gov.in'),
(2, 'ISRO Satellite Centre', 'Bengaluru', 'Karnataka', 1972, 'Dr. Nisha Rao', 'Satellite Assembly', 3000, 'Active', 'isac@isro.gov.in'),
(3, 'Liquid Propulsion Systems Centre', 'Valiamala', 'Kerala', 1985, 'Dr. Ramesh Pillai', 'Propulsion', 2200, 'Active', 'lpsc@isro.gov.in'),
(4, 'Space Applications Centre', 'Ahmedabad', 'Gujarat', 1972, 'Dr. Bhavana Mehta', 'Payload & Applications', 2500, 'Active', 'sac@isro.gov.in'),
(5, 'Satish Dhawan Space Centre', 'Sriharikota', 'Andhra Pradesh', 1971, 'Dr. Ajay Kumar', 'Launch Operations', 2800, 'Active', 'sdsc@isro.gov.in'),
(6, 'National Remote Sensing Centre', 'Hyderabad', 'Telangana', 1974, 'Dr. Meera Yadav', 'Remote Sensing', 1800, 'Active', 'nrsc@isro.gov.in'),
(7, 'Development and Educational Communication Unit', 'Ahmedabad', 'Gujarat', 1984, 'Dr. Yashwant Desai', 'Satellite Communication', 1600, 'Active', 'decu@isro.gov.in'),
(8, 'ISRO Propulsion Complex', 'Mahendragiri', 'Tamil Nadu', 2014, 'Dr. Kavita Menon', 'Propellant Testing', 1500, 'Active', 'iprc@isro.gov.in'),
(9, 'Human Space Flight Centre', 'Bengaluru', 'Karnataka', 2019, 'Dr. Suresh Patil', 'Crewed Missions', 1000, 'Active', 'hsfc@isro.gov.in'),
(10, 'Semi-Conductor Laboratory', 'Mohali', 'Punjab', 1983, 'Dr. Vandana Kapoor', 'Microelectronics', 900, 'Active', 'scl@isro.gov.in'),
(11, 'North Eastern Space Applications Centre', 'Shillong', 'Meghalaya', 2000, 'Dr. Dhiraj Nath', 'NE Region Services', 500, 'Active', 'nesac@isro.gov.in'),
(12, 'Master Control Facility', 'Hassan', 'Karnataka', 1982, 'Dr. Rekha Varma', 'Satellite Control', 700, 'Active', 'mcf@isro.gov.in'),
(13, 'Antrix Corporation', 'Bengaluru', 'Karnataka', 1992, 'Dr. Arvind Rao', 'Commercial Launch', 300, 'Active', 'antrix@isro.gov.in'),
(14, 'ISRO Telemetry Tracking and Command Network', 'Bengaluru', 'Karnataka', 1983, 'Dr. Vishal Reddy', 'Ground Support', 1200, 'Active', 'istrac@isro.gov.in'),
(15, 'Indian National Space Promotion and Authorization Center', 'Ahmedabad', 'Gujarat', 2020, 'Dr. Prerna Joshi', 'Private Space Sector', 200, 'Active', 'inspace@isro.gov.in');

-- to display/retrieve table data
SELECT * FROM Space_Centres;               

-- to remove complete data from table
truncate table Space_Centres;

-- to delete complete attributes and records 
drop table Space_Centres;

-- Table 6: Launch_Pads
CREATE TABLE Launch_Pads (
    pad_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    state VARCHAR(50),
    established_year INT,
    associated_centre VARCHAR(100),
    status VARCHAR(20),
    supported_vehicles VARCHAR(100),
    launches_conducted INT,
    pad_director VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Launch_Pads (pad_id, name, location, state, established_year, associated_centre,status, supported_vehicles, launches_conducted, pad_director)
 VALUES
(1, 'First Launch Pad', 'Sriharikota', 'Andhra Pradesh', 1993, 'Satish Dhawan Space Centre', 'Active', 'PSLV, GSLV', 50, 'Dr. Mahesh Babu'),
(2, 'Second Launch Pad', 'Sriharikota', 'Andhra Pradesh', 2005, 'Satish Dhawan Space Centre', 'Active', 'PSLV, GSLV Mk III', 60, 'Dr. Alka Singh'),
(3, 'Third Launch Pad (Planned)', 'Sriharikota', 'Andhra Pradesh', 2025, 'Satish Dhawan Space Centre', 'Under Construction', 'SSLV, GSLV', 0, 'Dr. Surya Prakash'),
(4, 'Mobile Launch Platform 1', 'Sriharikota', 'Andhra Pradesh', 2003, 'SDSC', 'Active', 'PSLV', 45, 'Dr. Tejas Desai'),
(5, 'Mobile Launch Platform 2', 'Sriharikota', 'Andhra Pradesh', 2007, 'SDSC', 'Active', 'GSLV', 35, 'Dr. Rashmi Verma'),
(6, 'PSLV Integration Complex', 'Sriharikota', 'Andhra Pradesh', 1995, 'SDSC', 'Active', 'PSLV', 30, 'Dr. Pradeep Joshi'),
(7, 'Vehicle Assembly Building', 'Sriharikota', 'Andhra Pradesh', 2010, 'SDSC', 'Active', 'GSLV Mk III', 20, 'Dr. Shalini Rawat'),
(8, 'SSLV Launch Pad', 'Sriharikota', 'Andhra Pradesh', 2022, 'SDSC', 'Active', 'SSLV', 2, 'Dr. Anurag Kulkarni'),
(9, 'Sounding Rocket Complex', 'Thumba', 'Kerala', 1963, 'Vikram Sarabhai Space Centre', 'Active', 'Rohini, RH series', 100, 'Dr. Renu Radhakrishnan'),
(10, 'TIFR Balloon Facility', 'Hyderabad', 'Telangana', 1961, 'TIFR', 'Active', 'Stratospheric Balloons', 300, 'Dr. Harinder Mehra'),
(11, 'ISRO Propulsion Launch Facility', 'Mahendragiri', 'Tamil Nadu', 2015, 'ISRO Propulsion Complex', 'Active', 'Engine Tests', 10, 'Dr. Arvind Raut'),
(12, 'Control Centre B', 'Sriharikota', 'Andhra Pradesh', 1990, 'SDSC', 'Inactive', 'PSLV', 15, 'Dr. Bharat Vyas'),
(13, 'Auxiliary Pad A', 'Sriharikota', 'Andhra Pradesh', 2008, 'SDSC', 'Active', 'GSLV Mk II', 12, 'Dr. Snehal Patil'),
(14, 'Auxiliary Pad B', 'Sriharikota', 'Andhra Pradesh', 2011, 'SDSC', 'Active', 'PSLV', 8, 'Dr. Ajay Tiwari'),
(15, 'Emergency Launch Facility', 'Sriharikota', 'Andhra Pradesh', 2023, 'SDSC', 'Reserved', 'All ISRO Vehicles', 0, 'Dr. Leena Dube');

-- to display/retrieve table data
SELECT * FROM Launch_Pads;               

-- to remove complete data from table
truncate table Launch_Pads;

-- to delete complete attributes and records 
drop table Launch_Pads;

-- Table 7: Astronauts
CREATE TABLE Astronauts (
    astronaut_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    state VARCHAR(50),
    training_center VARCHAR(100),
    selection_year INT,
    missions_assigned VARCHAR(100),
    flight_status VARCHAR(50),
    contact_email VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Astronauts (astronaut_id, name, gender, dob, state, training_center,selection_year, missions_assigned, flight_status, contact_email) 
VALUES
(1, 'Rakesh Sharma', 'Male', '1949-01-13', 'Punjab', 'Yuri Gagarin Centre, Russia', 1982, 'Soyuz T-11', 'Retired', 'rakesh.sharma@isro.in'),
(2, 'Gagan Singh', 'Male', '1985-04-10', 'Haryana', 'HSFC, Bengaluru', 2021, 'Gaganyaan-1', 'Selected', 'gagan.singh@isro.in'),
(3, 'Aditya Pillai', 'Male', '1988-07-19', 'Kerala', 'HSFC, Bengaluru', 2021, 'Gaganyaan-1', 'Selected', 'aditya.pillai@isro.in'),
(4, 'Ritu Sharma', 'Female', '1990-03-28', 'Uttar Pradesh', 'HSFC, Bengaluru', 2022, 'Gaganyaan-2', 'Training', 'ritu.sharma@isro.in'),
(5, 'Karthik Reddy', 'Male', '1987-11-02', 'Telangana', 'HSFC, Bengaluru', 2021, 'Gaganyaan-1', 'Selected', 'karthik.reddy@isro.in'),
(6, 'Meera Nair', 'Female', '1991-08-16', 'Kerala', 'HSFC, Bengaluru', 2022, 'Gaganyaan-2', 'Training', 'meera.nair@isro.in'),
(7, 'Anil Chauhan', 'Male', '1986-05-09', 'Madhya Pradesh', 'HSFC, Bengaluru', 2021, 'Gaganyaan-1', 'Training', 'anil.chauhan@isro.in'),
(8, 'Pooja Desai', 'Female', '1993-10-11', 'Gujarat', 'HSFC, Bengaluru', 2023, 'TBD', 'In Training', 'pooja.desai@isro.in'),
(9, 'Rahul Joshi', 'Male', '1989-01-25', 'Maharashtra', 'HSFC, Bengaluru', 2021, 'Gaganyaan-2', 'Training', 'rahul.joshi@isro.in'),
(10, 'Swati Verma', 'Female', '1992-06-17', 'Delhi', 'HSFC, Bengaluru', 2022, 'TBD', 'In Training', 'swati.verma@isro.in'),
(11, 'Vikas Yadav', 'Male', '1984-09-30', 'Rajasthan', 'HSFC, Bengaluru', 2021, 'Gaganyaan-1', 'Selected', 'vikas.yadav@isro.in'),
(12, 'Divya Menon', 'Female', '1990-02-14', 'Kerala', 'HSFC, Bengaluru', 2022, 'Gaganyaan-2', 'Training', 'divya.menon@isro.in'),
(13, 'Rohan Shetty', 'Male', '1985-12-22', 'Karnataka', 'HSFC, Bengaluru', 2021, 'Gaganyaan-1', 'Backup', 'rohan.shetty@isro.in'),
(14, 'Nidhi Sharma', 'Female', '1994-04-04', 'Himachal Pradesh', 'HSFC, Bengaluru', 2023, 'TBD', 'In Training', 'nidhi.sharma@isro.in'),
(15, 'Suresh Iyer', 'Male', '1987-03-15', 'Tamil Nadu', 'HSFC, Bengaluru', 2021, 'Gaganyaan-2', 'Training', 'suresh.iyer@isro.in');

-- to display/retrieve table data
SELECT * FROM Astronauts;               

-- to remove complete data from table
truncate table Astronauts;

-- to delete complete attributes and records 
drop table Astronauts;

-- Table 8: Ground_Stations
CREATE TABLE Ground_Stations (
    station_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    state VARCHAR(50),
    operational_since DATE,
    frequency_band VARCHAR(50),
    tracking_range_km INT,
    staff_count INT,
    status VARCHAR(20),
    station_head VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Ground_Stations (station_id, name, location, state, operational_since,frequency_band, tracking_range_km, staff_count, status, station_head) 
VALUES
(1, 'ISTRAC Bengaluru', 'Peenya', 'Karnataka', '1983-06-15', 'S/X', 36000, 200, 'Active', 'Dr. Kiran Ramesh'),
(2, 'NRSC Shadnagar', 'Shadnagar', 'Telangana', '1992-11-20', 'C/X', 30000, 180, 'Active', 'Dr. Latha Nair'),
(3, 'Lucknow Ground Station', 'Lucknow', 'Uttar Pradesh', '1995-05-12', 'S/X', 15000, 120, 'Active', 'Dr. Punit Tiwari'),
(4, 'Port Blair Station', 'Port Blair', 'Andaman & Nicobar', '2000-04-01', 'S', 10000, 80, 'Active', 'Dr. Megha Iyer'),
(5, 'Shillong Station', 'Shillong', 'Meghalaya', '2005-08-23', 'X', 12000, 90, 'Active', 'Dr. Ankur Deka'),
(6, 'Bhopal Station', 'Bhopal', 'Madhya Pradesh', '2007-01-18', 'S', 11000, 100, 'Active', 'Dr. Sheetal Jain'),
(7, 'Delhi Earth Station', 'New Delhi', 'Delhi', '1998-06-10', 'C', 20000, 130, 'Active', 'Dr. Rajiv Malhotra'),
(8, 'Jaipur Ground Station', 'Jaipur', 'Rajasthan', '2010-03-15', 'X', 17000, 110, 'Active', 'Dr. Sweta Gupta'),
(9, 'Thiruvananthapuram Station', 'Veli', 'Kerala', '1986-10-05', 'S/X', 28000, 150, 'Active', 'Dr. Sudeep Menon'),
(10, 'Hassan MCF', 'Hassan', 'Karnataka', '1982-02-11', 'S', 35000, 200, 'Active', 'Dr. Madhuri Reddy'),
(11, 'Bengaluru Byalalu Centre', 'Byalalu', 'Karnataka', '2009-11-12', 'C/X', 40000, 170, 'Active', 'Dr. Harsha Rao'),
(12, 'Dehradun Ground Station', 'Dehradun', 'Uttarakhand', '2012-07-07', 'S', 9000, 95, 'Active', 'Dr. Pooja Rawat'),
(13, 'Nagpur Ground Station', 'Nagpur', 'Maharashtra', '2015-05-19', 'S/X', 13000, 105, 'Active', 'Dr. Rohit Sharma'),
(14, 'Indore Tracking Station', 'Indore', 'Madhya Pradesh', '2018-09-01', 'C/X', 14000, 115, 'Active', 'Dr. Jaya Trivedi'),
(15, 'Sriharikota Ground Station', 'Sriharikota', 'Andhra Pradesh', '1993-12-05', 'S/X', 32000, 160, 'Active', 'Dr. Sreenivas Rao');

-- to display/retrieve table data
SELECT * FROM Ground_Stations;               

-- to remove complete data from table
truncate table Ground_Stations;

-- to delete complete attributes and records 
drop table Ground_Stations;

-- Table 9: ISRO_Projects
CREATE TABLE ISRO_Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    objective TEXT,
    start_date DATE,
    end_date DATE,
    lead_scientist VARCHAR(100),
    budget_crores DECIMAL(10,2),
    status VARCHAR(20),
    associated_centre VARCHAR(100),
    outcome TEXT
);

-- Insert records into the table
INSERT INTO ISRO_Projects (project_id, project_name, objective, start_date, end_date, lead_scientist,budget_crores, status, associated_centre, outcome) 
VALUES
(1, 'Chandrayaan-1', 'Lunar mapping and water detection', '2003-08-01', '2009-08-30', 'Dr. Mylswamy Annadurai', 386.00, 'Completed', 'ISRO Satellite Centre', 'Confirmed presence of water on Moon'),
(2, 'Mangalyaan', 'Mars orbit insertion', '2010-11-15', '2015-10-20', 'Dr. Radhakrishnan', 450.00, 'Completed', 'ISRO Satellite Centre', 'India became first Asian nation to reach Mars'),
(3, 'Chandrayaan-2', 'Soft landing on lunar south pole', '2014-01-15', '2020-09-10', 'Dr. K. Sivan', 978.00, 'Completed', 'ISRO Satellite Centre', 'Orbiter successful, lander crash-landed'),
(4, 'NavIC', 'Regional GPS system for India', '2006-06-01', '2018-04-12', 'Dr. Raghavan', 1420.00, 'Operational', 'Space Applications Centre', 'Accurate regional navigation system launched'),
(5, 'Gaganyaan', 'India’s first human spaceflight mission', '2018-08-15', NULL, 'Dr. Unnikrishnan Nair', 9023.00, 'Ongoing', 'Human Space Flight Centre', 'Testing phase with unmanned flights'),
(6, 'RISAT-1', 'All-weather radar imaging', '2007-04-01', '2012-04-26', 'Dr. Megha Ramesh', 350.00, 'Completed', 'SAC Ahmedabad', 'Radar satellite launched successfully'),
(7, 'INSAT-3DR', 'Meteorological satellite', '2012-01-01', '2016-09-08', 'Dr. Bhavani Menon', 180.00, 'Operational', 'VSSC Kerala', 'Weather data for India improved'),
(8, 'Aditya-L1', 'Solar corona observation', '2016-01-01', NULL, 'Dr. Sankarasubramanian', 378.53, 'Active', 'ISRO Satellite Centre', 'Launched in 2023 and collecting solar data'),
(9, 'SSLV', 'Affordable small satellite launch vehicle', '2019-03-01', NULL, 'Dr. Sudhakar Kumar', 165.00, 'Testing', 'VSSC Kerala', 'First test flight launched in 2022'),
(10, 'EOS-04', 'Earth Observation mission', '2021-01-15', '2022-02-14', 'Dr. Pratik Shah', 500.00, 'Completed', 'ISRO Satellite Centre', 'Successful launch with PSLV-C52'),
(11, 'GSAT-29', 'High-speed communication to remote areas', '2016-08-01', '2018-11-14', 'Dr. Vandana Reddy', 350.00, 'Operational', 'ISRO Satellite Centre', 'Increased connectivity in J&K and NE India'),
(12, 'GSAT-6A', 'Mobile communication services', '2015-01-10', '2018-03-29', 'Dr. Neelam Tiwari', 270.00, 'Lost', 'ISRO Satellite Centre', 'Contact lost post-launch'),
(13, 'Chandrayaan-3', 'Second lunar soft landing attempt', '2020-01-01', '2023-08-23', 'Dr. Veeramuthuvel', 615.00, 'Completed', 'ISRO Satellite Centre', 'Successful landing near lunar south pole'),
(14, 'Astra Missile Test', 'Indigenous air-to-air missile test', '2020-03-01', '2022-07-12', 'Dr. Raghunandan Rao', 100.00, 'Completed', 'DRDO & ISRO', 'Test fired successfully from Su-30 MKI'),
(15, 'SROSS-C2', 'Scientific research satellite', '1994-03-04', '2002-12-31', 'Dr. Ravi Prasad', 45.00, 'Completed', 'VSSC Kerala', 'Helped study gamma-ray bursts and weather');

-- to display/retrieve table data
SELECT * FROM ISRO_Projects;               

-- to remove complete data from table
truncate table ISRO_Projects;

-- to delete complete attributes and records 
drop table ISRO_Projects;

-- Table 10: Launch_Schedules
CREATE TABLE Launch_Schedules (
    schedule_id INT PRIMARY KEY,
    mission_name VARCHAR(100),
    vehicle VARCHAR(50),
    launch_date DATE,
    launch_time TIME,
    launch_pad VARCHAR(100),
    payload VARCHAR(100),
    status VARCHAR(20),
    director VARCHAR(100),
    centre VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Launch_Schedules (schedule_id, mission_name, vehicle, launch_date, launch_time,launch_pad, payload, status, director, centre) 
VALUES
(1, 'Chandrayaan-3', 'LVM3-M4', '2023-07-14', '14:35:00', 'Second Launch Pad', 'Lunar Lander', 'Completed', 'Dr. Radhika Iyer', 'SDSC SHAR'),
(2, 'Aditya-L1', 'PSLV-C57', '2023-09-02', '11:50:00', 'First Launch Pad', 'Solar Observatory', 'Completed', 'Dr. Gaurav Shekhar', 'SDSC SHAR'),
(3, 'SSLV-D2', 'SSLV', '2023-02-10', '09:18:00', 'Second Launch Pad', 'EOS-07', 'Completed', 'Dr. Pratik Kulkarni', 'SDSC SHAR'),
(4, 'Gaganyaan-1', 'GSLV Mk III', '2025-01-20', '10:00:00', 'Second Launch Pad', 'Crew Module (Unmanned)', 'Scheduled', 'Dr. Nidhi Rao', 'SDSC SHAR'),
(5, 'RISAT-2BR2', 'PSLV-C48', '2019-12-11', '15:25:00', 'First Launch Pad', 'Radar Imaging Satellite', 'Completed', 'Dr. Veer Pratap', 'SDSC SHAR'),
(6, 'EOS-01', 'PSLV-C49', '2020-11-07', '15:12:00', 'First Launch Pad', 'Earth Observation', 'Completed', 'Dr. Rekha Menon', 'SDSC SHAR'),
(7, 'GSAT-30', 'Ariane 5', '2020-01-17', '02:35:00', 'Kourou Spaceport', 'Telecom Satellite', 'Completed', 'Dr. Arun Patil', 'ISRO HQ'),
(8, 'Amazonia-1', 'PSLV-C51', '2021-02-28', '10:24:00', 'First Launch Pad', 'Brazilian Satellite + 18 Co-passengers', 'Completed', 'Dr. Jaya Kaul', 'SDSC SHAR'),
(9, 'GSAT-24', 'Ariane 5', '2022-06-22', '22:00:00', 'Kourou Spaceport', 'Communication Satellite', 'Completed', 'Dr. Hiren Joshi', 'ISRO HQ'),
(10, 'Chandrayaan-4', 'LVM3', '2026-10-10', '13:15:00', 'Second Launch Pad', 'Rover + Lander', 'Planned', 'Dr. Suvarna Sharma', 'SDSC SHAR'),
(11, 'INS-2B', 'PSLV-C54', '2022-11-26', '11:56:00', 'First Launch Pad', 'India-Bhutan Satellite', 'Completed', 'Dr. Yash Rathore', 'SDSC SHAR'),
(12, 'GSLV-F10', 'GSLV Mk II', '2021-08-12', '05:43:00', 'Second Launch Pad', 'EOS-03', 'Failed', 'Dr. Anupama Joshi', 'SDSC SHAR'),
(13, 'Gaganyaan-2', 'GSLV Mk III', '2025-12-15', '09:30:00', 'Second Launch Pad', 'Crewed Mission', 'Scheduled', 'Dr. Tejashree Naik', 'HSFC Bengaluru'),
(14, 'Astrosat-2', 'PSLV', '2024-11-11', '16:00:00', 'First Launch Pad', 'Space Telescope', 'Planned', 'Dr. Vikrant Shah', 'ISRO Satellite Centre'),
(15, 'XPoSat', 'PSLV-C56', '2024-07-15', '10:45:00', 'Second Launch Pad', 'X-ray Polarimeter', 'Planned', 'Dr. Sonal Verma', 'SDSC SHAR');

-- to display/retrieve table data
SELECT * FROM Launch_Schedules;               

-- to remove complete data from table
truncate table Launch_Schedules;

-- to delete complete attributes and records 
drop table Launch_Schedules;

-- Table 11: Experiments
CREATE TABLE Experiments (
    experiment_id INT PRIMARY KEY,
    experiment_name VARCHAR(100),
    mission_name VARCHAR(100),
    objective TEXT,
    scientist_incharge VARCHAR(100),
    equipment_used VARCHAR(100),
    start_date DATE,
    end_date DATE,
    result_summary TEXT,
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Experiments (experiment_id, experiment_name, mission_name, objective,scientist_incharge, equipment_used, start_date, end_date,result_summary, status)
 VALUES
(1, 'Lunar Surface Analysis', 'Chandrayaan-2', 'Study Moon’s minerals', 'Dr. Pallavi Singh', 'LIBS Spectrometer', '2019-07-22', '2020-01-20', 'Found magnesium traces', 'Completed'),
(2, 'Solar Wind Observation', 'Aditya-L1', 'Monitor solar winds', 'Dr. Vikas Jadhav', 'SWIS Sensor', '2023-09-02', '2024-02-15', 'Stable wind fluctuations recorded', 'Active'),
(3, 'Mars Atmosphere Study', 'Mangalyaan', 'Analyze methane presence', 'Dr. Rachana Rao', 'Methane Sensor for Mars', '2013-11-05', '2015-06-12', 'No major traces found', 'Completed'),
(4, 'Microgravity Plant Growth', 'Gaganyaan-1', 'Plant behavior in zero gravity', 'Dr. Aditya Das', 'Plant Module Chamber', '2025-01-20', '2025-01-27', 'Sprouting was successful', 'Planned'),
(5, 'X-ray Radiation Study', 'XPoSat', 'Study celestial X-rays', 'Dr. Jinal Sharma', 'Polarimeter', '2024-07-15', '2025-01-10', 'Results pending', 'Planned'),
(6, 'Cryo Fuel Efficiency', 'ISRO Test Flight', 'Compare fuel burn rates', 'Dr. Mehul Nair', 'Cryo Fuel Tank', '2021-03-12', '2021-04-02', 'Improved 5% efficiency', 'Completed'),
(7, 'Earth Heat Mapping', 'EOS-01', 'Infrared scanning of surface', 'Dr. Nandini Kulkarni', 'Thermal Camera', '2020-11-07', '2021-01-10', 'High accuracy maps generated', 'Completed'),
(8, 'Communication Latency Test', 'GSAT-6A', 'Delay in uplink/downlink', 'Dr. Dhruv Mehta', 'Transponder System', '2018-03-29', '2018-03-30', 'Signal loss observed', 'Failed'),
(9, 'Soil Moisture Mapping', 'RISAT-1', 'Radar imaging for agriculture', 'Dr. Renu Kaushik', 'Synthetic Aperture Radar', '2012-04-26', '2013-01-01', 'Useful for crop modeling', 'Completed'),
(10, 'Cosmic Particle Monitoring', 'Astrosat', 'Detect cosmic rays', 'Dr. Vivek Bansal', 'UV Telescope', '2015-09-28', '2017-05-10', 'Found spike in 2016', 'Completed'),
(11, 'GPS Drift Study', 'NavIC', 'Assess drift in satellite signals', 'Dr. Kavita Rawal', 'Clock Sync Module', '2019-08-10', '2020-04-05', 'Minimal deviation noted', 'Completed'),
(12, 'Radiation Resistance Testing', 'INSAT-3DR', 'Effect on electronics', 'Dr. Alok Rathi', 'Radiation Chamber', '2016-09-08', '2017-03-20', 'Shielding found effective', 'Completed'),
(13, 'Atmospheric Entry Simulation', 'Gaganyaan-2', 'Heat shield validation', 'Dr. Rishi Menon', 'Thermal Tiles', '2025-12-01', '2025-12-15', 'Awaiting test results', 'Scheduled'),
(14, 'Image Resolution Comparison', 'Cartosat-3', 'Compare sensor types', 'Dr. Jyoti Suresh', 'High-Res Camera', '2019-11-27', '2020-02-20', 'Achieved 25cm resolution', 'Completed'),
(15, 'Magnetosphere Interaction', 'Chandrayaan-3', 'Study Moon’s magnetic field', 'Dr. Manoj Shelar', 'Magnetometer', '2023-07-14', '2023-12-01', 'Weak field confirmed', 'Completed');

-- to display/retrieve table data
SELECT * FROM Experiments;               

-- to remove complete data from table
truncate table Experiments;

-- to delete complete attributes and records 
drop table Experiments;

-- Table 12: Research_Labs
CREATE TABLE Research_Labs (
    lab_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    state VARCHAR(50),
    established_year INT,
    specialization VARCHAR(100),
    head_scientist VARCHAR(100),
    staff_count INT,
    status VARCHAR(20),
    affiliated_centre VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Research_Labs (lab_id, name, location, state, established_year, specialization,head_scientist, staff_count, status, affiliated_centre) 
VALUES
(1, 'Advanced Materials Lab', 'Thiruvananthapuram', 'Kerala', 1996, 'Aerospace Materials', 'Dr. Nisha Nair', 85, 'Active', 'VSSC'),
(2, 'Propulsion Research Lab', 'Mahendragiri', 'Tamil Nadu', 2002, 'Rocket Propulsion', 'Dr. Ravi Kumar', 95, 'Active', 'IPRC'),
(3, 'Telemetry & Control Lab', 'Bengaluru', 'Karnataka', 1999, 'Telemetry Systems', 'Dr. Renu Sharma', 70, 'Active', 'ISTRAC'),
(4, 'Cryogenic Lab', 'Thiruvananthapuram', 'Kerala', 2005, 'Cryogenics', 'Dr. Manoj Pillai', 60, 'Active', 'LPSC'),
(5, 'Microsatellite Lab', 'Bengaluru', 'Karnataka', 2010, 'Small Satellites', 'Dr. Smita Shetty', 50, 'Active', 'ISRO Satellite Centre'),
(6, 'Payload Integration Lab', 'Sriharikota', 'Andhra Pradesh', 2007, 'Payload Testing', 'Dr. Deepak Joshi', 65, 'Active', 'SDSC SHAR'),
(7, 'Remote Sensing Lab', 'Hyderabad', 'Telangana', 1994, 'Earth Observation', 'Dr. Poonam Bhatia', 80, 'Active', 'NRSC'),
(8, 'Navigation Technology Lab', 'Ahmedabad', 'Gujarat', 2008, 'GPS & NavIC', 'Dr. Raghav Patel', 55, 'Active', 'SAC'),
(9, 'Solar Studies Lab', 'Bengaluru', 'Karnataka', 2015, 'Solar Observations', 'Dr. Meena Kaul', 40, 'Active', 'ISRO Satellite Centre'),
(10, 'Satellite Communication Lab', 'Ahmedabad', 'Gujarat', 2001, 'Communication Systems', 'Dr. Suresh Modi', 90, 'Active', 'SAC'),
(11, 'Data Analytics Lab', 'Dehradun', 'Uttarakhand', 2018, 'Satellite Image Processing', 'Dr. Garima Verma', 45, 'Active', 'NRSC'),
(12, 'Space Robotics Lab', 'Bengaluru', 'Karnataka', 2020, 'Robotics and AI', 'Dr. Abhinav Iyer', 35, 'Active', 'UR Rao Satellite Centre'),
(13, 'High Altitude Testing Lab', 'Leh', 'Ladakh', 2017, 'Thermal Vacuum Testing', 'Dr. Varsha Tandon', 30, 'Active', 'VSSC'),
(14, 'Electronics Research Lab', 'Mohali', 'Punjab', 2004, 'Microelectronics', 'Dr. Mohan Chauhan', 75, 'Active', 'SCL'),
(15, 'Antenna Testing Lab', 'Hyderabad', 'Telangana', 2003, 'Antenna Systems', 'Dr. Akash Mishra', 55, 'Active', 'NRSC');

-- to display/retrieve table data
SELECT * FROM Research_Labs;               

-- to remove complete data from table
truncate table Research_Labs;

-- to delete complete attributes and records 
drop table Research_Labs;

-- Table 13: Space_Missions
CREATE TABLE Space_Missions (
    mission_id INT PRIMARY KEY,
    mission_name VARCHAR(100),
    mission_type VARCHAR(50),
    objective TEXT,
    launch_vehicle VARCHAR(50),
    launch_date DATE,
    duration_days INT,
    outcome VARCHAR(100),
    mission_director VARCHAR(100),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Space_Missions (mission_id, mission_name, mission_type, objective, launch_vehicle,launch_date, duration_days, outcome, mission_director, status) 
VALUES
(1, 'Chandrayaan-1', 'Lunar', 'Moon surface mapping', 'PSLV-C11', '2008-10-22', 312, 'Water molecules discovered', 'Dr. Mylswamy Annadurai', 'Completed'),
(2, 'Mangalyaan', 'Mars', 'Orbiting Mars', 'PSLV-C25', '2013-11-05', 780, 'Mars orbit insertion successful', 'Dr. Radhakrishnan', 'Completed'),
(3, 'Chandrayaan-2', 'Lunar', 'Soft landing on Moon', 'GSLV Mk III-M1', '2019-07-22', 900, 'Orbiter functional, lander lost', 'Dr. K. Sivan', 'Completed'),
(4, 'Aditya-L1', 'Solar', 'Study Sun’s corona', 'PSLV-C57', '2023-09-02', 1460, 'Currently in Lagrange orbit', 'Dr. Sankarasubramanian', 'Active'),
(5, 'Gaganyaan-1', 'Manned', 'Unmanned test flight', 'GSLV Mk III', '2025-01-15', 7, 'Scheduled test flight', 'Dr. Unnikrishnan Nair', 'Scheduled'),
(6, 'RISAT-1', 'Earth Observation', 'All-weather radar imaging', 'PSLV-C19', '2012-04-26', 1825, 'Radar satellite launched', 'Dr. Megha Ramesh', 'Completed'),
(7, 'INSAT-3DR', 'Weather', 'Meteorological observation', 'GSLV-F05', '2016-09-08', 2000, 'In operation', 'Dr. Latha Iyer', 'Operational'),
(8, 'Astrosat', 'Astronomy', 'Multi-wavelength space telescope', 'PSLV-C30', '2015-09-28', 1825, 'India’s first space observatory', 'Dr. Uma Ramakrishnan', 'Operational'),
(9, 'EOS-01', 'Earth Observation', 'Agriculture and forestry monitoring', 'PSLV-C49', '2020-11-07', 1095, 'Deployed successfully', 'Dr. Pratik Shah', 'Operational'),
(10, 'GSAT-30', 'Communication', 'Replace INSAT-4A', 'Ariane 5 VA251', '2020-01-17', 3650, 'High-bandwidth transmission', 'Dr. Ravi Menon', 'Active'),
(11, 'GSAT-6A', 'Communication', 'Mobile communication services', 'GSLV-F08', '2018-03-29', 0, 'Contact lost after launch', 'Dr. Deepika Kaul', 'Failed'),
(12, 'Amazonia-1', 'Joint', 'Brazil’s satellite with Indian co-passengers', 'PSLV-C51', '2021-02-28', 1095, 'All payloads deployed', 'Dr. Akhilesh Rathi', 'Completed'),
(13, 'Chandrayaan-3', 'Lunar', 'Second soft landing attempt', 'LVM3-M4', '2023-07-14', 365, 'Successful lunar landing', 'Dr. Veeramuthuvel', 'Completed'),
(14, 'INS-2B', 'Joint', 'India-Bhutan nanosatellite', 'PSLV-C54', '2022-11-26', 1460, 'Successfully launched', 'Dr. Yashwant Chauhan', 'Active'),
(15, 'XPoSat', 'Astronomy', 'X-ray polarimeter for celestial studies', 'PSLV-C56', '2024-07-15', 730, 'Launch planned', 'Dr. Sonal Verma', 'Planned');

-- to display/retrieve table data
SELECT * FROM Space_Missions;               

-- to remove complete data from table
truncate table Space_Missions;

-- to delete complete attributes and records 
drop table Space_Missions;

-- Table 14: Training_Programs
CREATE TABLE Training_Programs (
    program_id INT PRIMARY KEY,
    title VARCHAR(100),
    category VARCHAR(50),
    start_date DATE,
    end_date DATE,
    trainer_name VARCHAR(100),
    location VARCHAR(100),
    participants_count INT,
    mode VARCHAR(20),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Training_Programs (program_id, title, category, start_date, end_date,trainer_name, location, participants_count, mode, status)
 VALUES
(1, 'Satellite Design Basics', 'Engineering', '2023-01-10', '2023-01-20', 'Dr. Nilesh Patil', 'ISRO HQ Bengaluru', 30, 'Offline', 'Completed'),
(2, 'Cryogenics Introduction', 'Propulsion', '2023-02-05', '2023-02-15', 'Dr. Aruna Reddy', 'VSSC Kerala', 25, 'Offline', 'Completed'),
(3, 'Remote Sensing Applications', 'Data Analysis', '2023-03-01', '2023-03-10', 'Dr. Harish Nair', 'NRSC Hyderabad', 40, 'Online', 'Completed'),
(4, 'Satellite Communication', 'Telecom', '2023-04-15', '2023-04-25', 'Dr. Ritu Sharma', 'SAC Ahmedabad', 35, 'Offline', 'Completed'),
(5, 'AI in Space Tech', 'Technology', '2023-05-10', '2023-05-20', 'Dr. Mohit Sinha', 'ISRO HQ Bengaluru', 50, 'Online', 'Completed'),
(6, 'Launch Vehicle Dynamics', 'Aerospace', '2023-06-01', '2023-06-10', 'Dr. Sushmita Iyer', 'SDSC SHAR', 20, 'Offline', 'Completed'),
(7, 'Telemetry & Control', 'Communication', '2023-07-05', '2023-07-15', 'Dr. Ravindra Joshi', 'ISTRAC Bengaluru', 28, 'Offline', 'Completed'),
(8, 'Astrophysics Fundamentals', 'Space Science', '2023-08-01', '2023-08-10', 'Dr. Deepti Rawal', 'ISRO Satellite Centre', 32, 'Online', 'Completed'),
(9, 'Orbit Mechanics', 'Physics', '2023-09-12', '2023-09-20', 'Dr. Karan Bhatia', 'ISRO HQ Bengaluru', 30, 'Offline', 'Completed'),
(10, 'Gaganyaan Crew Support', 'Human Spaceflight', '2023-10-05', '2023-10-15', 'Dr. Preeti Singh', 'HSFC Bengaluru', 15, 'Offline', 'Completed'),
(11, 'GIS with Satellites', 'Data Science', '2023-11-10', '2023-11-20', 'Dr. Iqbal Khan', 'NRSC Hyderabad', 40, 'Online', 'Completed'),
(12, 'Thermal Testing Procedures', 'Testing', '2023-12-01', '2023-12-10', 'Dr. Vandana Rao', 'VSSC Kerala', 18, 'Offline', 'Completed'),
(13, 'Space Robotics Workshop', 'Robotics', '2024-01-15', '2024-01-25', 'Dr. Shivani Mehta', 'URSC Bengaluru', 22, 'Offline', 'Completed'),
(14, 'Small Satellite Launches', 'Operations', '2024-02-10', '2024-02-18', 'Dr. Yuvraj Das', 'SDSC SHAR', 25, 'Offline', 'Completed'),
(15, 'Scientific Research Paper Writing', 'Academics', '2024-03-05', '2024-03-10', 'Dr. Prashant Kaul', 'ISRO HQ Bengaluru', 60, 'Online', 'Completed');

-- to display/retrieve table data
SELECT * FROM Training_Programs;               

-- to remove complete data from table
truncate table Training_Programs;

-- to delete complete attributes and records 
drop table Training_Programs;

-- Table 15: Research_Publications
CREATE TABLE Research_Publications (
    publication_id INT PRIMARY KEY,
    title VARCHAR(200),
    author_name VARCHAR(100),
    journal_name VARCHAR(100),
    publication_date DATE,
    category VARCHAR(50),
    centre VARCHAR(100),
    citation_count INT,
    doi VARCHAR(100),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Research_Publications (publication_id, title, author_name, journal_name, publication_date,category, centre, citation_count, doi, status) 
VALUES
(1, 'Advances in Cryogenic Propulsion', 'Dr. Arvind Kumar', 'Indian Journal of Space Research', '2020-05-10', 'Propulsion', 'LPSC Kerala', 124, '10.1234/ijsp.2020.1001', 'Published'),
(2, 'Navigation with NavIC', 'Dr. Sneha Menon', 'Satellite Navigation Review', '2021-02-15', 'Navigation', 'SAC Ahmedabad', 89, '10.1234/nav.2021.1056', 'Published'),
(3, 'Orbital Data Processing Techniques', 'Dr. Ritu Sharma', 'International Journal of Space Data', '2019-11-25', 'Data Science', 'NRSC Hyderabad', 156, '10.1234/ijsd.2019.978', 'Published'),
(4, 'Solar Radiation Impact on Satellites', 'Dr. Prashant Iyer', 'Space Science Today', '2020-07-12', 'Solar Studies', 'ISRO Satellite Centre', 134, '10.1234/sst.2020.0045', 'Published'),
(5, 'Designing Small Satellite Systems', 'Dr. Meenal Rao', 'Journal of MicroSat Innovation', '2021-04-18', 'Engineering', 'URSC Bengaluru', 73, '10.1234/jmsi.2021.0023', 'Published'),
(6, 'Thermal Stress Analysis for Launch Systems', 'Dr. Yash Joshi', 'Aerospace Mechanics Journal', '2022-06-20', 'Aerospace', 'VSSC Kerala', 98, '10.1234/amj.2022.0601', 'Published'),
(7, 'Ground Control for Human Spaceflight', 'Dr. Isha Rane', 'Journal of Human Space Studies', '2022-09-10', 'Human Spaceflight', 'HSFC Bengaluru', 42, '10.1234/jhss.2022.0098', 'Published'),
(8, 'AI-Assisted Satellite Image Classification', 'Dr. Gaurav Shah', 'Machine Vision & Space Applications', '2023-01-05', 'Artificial Intelligence', 'NRSC Hyderabad', 111, '10.1234/mvsa.2023.0100', 'Published'),
(9, 'Cryo Fuel Pump Advances', 'Dr. Rajesh Pillai', 'ISRO Propulsion Journal', '2021-12-30', 'Cryogenics', 'LPSC Kerala', 86, '10.1234/ispj.2021.0754', 'Published'),
(10, 'Polar Satellite Observations', 'Dr. Rekha Shetty', 'Earth and Space Monitoring', '2019-08-20', 'Earth Observation', 'NRSC Hyderabad', 127, '10.1234/esm.2019.1202', 'Published'),
(11, 'Space Radiation on Human Health', 'Dr. Anuj Kapoor', 'Space Health Journal', '2020-03-15', 'Health Science', 'ISRO HQ Bengaluru', 65, '10.1234/shj.2020.0483', 'Published'),
(12, 'Trajectory Analysis of PSLV', 'Dr. Divya Naik', 'Rocket Dynamics Reports', '2018-12-01', 'Launch Vehicles', 'SDSC SHAR', 144, '10.1234/rdr.2018.0111', 'Published'),
(13, 'Solar Panel Efficiency in Orbit', 'Dr. Vishal Dubey', 'Orbital Energy Systems', '2022-04-10', 'Space Tech', 'ISRO Satellite Centre', 59, '10.1234/oes.2022.0099', 'Published'),
(14, 'Communication Delay Handling', 'Dr. Neelam Tiwari', 'Satellite Signal Systems', '2023-06-14', 'Telecom', 'SAC Ahmedabad', 92, '10.1234/sss.2023.0666', 'Published'),
(15, 'Space Waste Tracking Algorithms', 'Dr. Kavita Bhosale', 'International Journal of Space Safety', '2023-08-01', 'Safety', 'ISRO HQ Bengaluru', 78, '10.1234/ijss.2023.0123', 'Published');

-- to display/retrieve table data
SELECT * FROM Research_Publications;               

-- to remove complete data from table
truncate table Research_Publications;

-- to delete complete attributes and records 
drop table Research_Publications;

