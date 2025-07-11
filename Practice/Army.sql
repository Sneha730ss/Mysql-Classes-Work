-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database Army;

-- to work on it, you need to use it first
use Army;

-- Delete a database
Drop database Army;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Soldiers (soldier_id, name, unit, date_of_birth, enlistment_date,contact_number, blood_group, address, status) 

T2 : Officers (officer_id, name, branch, commission_date, contact_number,email, unit, service_status, address)

T3 : Weapons (weapon_id, name, type, model_number, issued_to_unit,manufacture_date, range_meters, weight_kg, status, remarks)

T4 : Missions (mission_id, name, type, assigned_unit, location,start_date, end_date, status, commanding_officer, remarks) 

T5 : Vehicles (vehicle_id, vehicle_type, model_name, registration_number, unit_assigned,purchase_date, condition_status, capacity, assigned_driver, remarks) 

T6 : Training_Camps (camp_id, camp_name, location, start_date, end_date,supervising_officer, total_trainees, specialty, status, remarks)

T7 : Ranks (rank_id, rank_name, abbreviation, level, category,pay_grade, insignia, promoted_from, min_service_years, description) 

T8 : Battalions (battalion_id, name, unit_type, location, formation_date,commanding_officer, strength, status, specialisation, motto) 

T9 : Medical_Records (record_id, soldier_id, checkup_date, doctor_name, diagnosis,treatment, follow_up_date, fitness_status, remarks, hospital_name)

T10 : Leave_Records (leave_id, soldier_id, leave_type, start_date, end_date,reason, approval_status, approving_officer, leave_location, remarks) 

T11 : Operations (operation_id, name, type, location, start_date, end_date,commanding_officer, objective, status, remarks)

T12 : Medals (medal_id, soldier_id, medal_name, category, date_awarded,awarded_by, operation_name, reason, status, remarks) 

T13 : Postings (posting_id, soldier_id, location, unit_name, post_date,end_date, role, commanding_officer, posting_status, remarks)

T14 : Military_Assets (asset_id, asset_name, asset_type, serial_number, assigned_unit,acquisition_date, condition_status, location, responsible_officer, remarks) 

T15 :  Ammunition_Inventory (ammo_id, ammo_type, caliber, quantity, storage_location,batch_number, manufacture_date, expiry_date, assigned_unit, issued_by) 

*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Soldiers
CREATE TABLE Soldiers (
    soldier_id INT PRIMARY KEY,
    name VARCHAR(100),
    unit VARCHAR(50),
    date_of_birth DATE,
    enlistment_date DATE,
    contact_number VARCHAR(15),
    blood_group VARCHAR(5),
    address TEXT,
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Soldiers (soldier_id, name, unit, date_of_birth, enlistment_date,contact_number, blood_group, address, status) 
VALUES
(1, 'Amit Singh', 'Alpha', '1990-05-12', '2012-03-01', '9876543210', 'B+', 'Delhi Cantt', 'Active'),
(2, 'Rahul Verma', 'Bravo', '1988-08-21', '2010-06-15', '9812345678', 'O+', 'Mumbai Base', 'Active'),
(3, 'Suresh Meena', 'Charlie', '1992-09-14', '2015-02-10', '9887766554', 'A+', 'Jaipur Camp', 'Active'),
(4, 'Vikas Yadav', 'Delta', '1991-11-30', '2013-01-05', '9786543210', 'AB+', 'Lucknow HQ', 'On Leave'),
(5, 'Ravi Joshi', 'Echo', '1993-06-17', '2014-07-18', '9876540001', 'B-', 'Chennai Base', 'Active'),
(6, 'Manoj Tiwari', 'Alpha', '1987-02-08', '2009-04-11', '9823456789', 'O-', 'Delhi Cantt', 'Active'),
(7, 'Nitin Chauhan', 'Foxtrot', '1994-12-03', '2016-03-22', '9812312312', 'A-', 'Bhopal HQ', 'Active'),
(8, 'Kunal Roy', 'Bravo', '1990-10-10', '2011-08-09', '9898989898', 'AB-', 'Kolkata Barracks', 'On Duty'),
(9, 'Aakash Jain', 'Echo', '1995-04-25', '2017-11-20', '9871234567', 'B+', 'Pune Base', 'Active'),
(10, 'Sanjay Pandey', 'Delta', '1989-07-19', '2011-05-05', '9797979797', 'O+', 'Lucknow HQ', 'Active'),
(11, 'Rohit Kumar', 'Charlie', '1991-03-14', '2013-09-30', '9123456789', 'B+', 'Indore Post', 'On Duty'),
(12, 'Akhil Sharma', 'Foxtrot', '1985-12-09', '2008-01-15', '9000001111', 'A+', 'Bangalore Base', 'Active'),
(13, 'Suraj Thakur', 'Alpha', '1993-02-26', '2014-04-19', '9223344556', 'AB+', 'Jammu HQ', 'Active'),
(14, 'Pradeep Naik', 'Bravo', '1994-05-10', '2016-06-06', '9332211000', 'B-', 'Guwahati Post', 'Active'),
(15, 'Abhishek Nair', 'Charlie', '1992-11-11', '2014-12-01', '9111122233', 'O-', 'Kochi Base', 'Active');

-- to display/retrieve table data
SELECT * FROM Soldiers;               

-- to remove complete data from table
truncate table Soldiers;

-- to delete complete attributes and records 
drop table Soldiers;

-- Table 2: Officers
CREATE TABLE Officers (
    officer_id INT PRIMARY KEY,
    name VARCHAR(100),
    branch VARCHAR(50),
    commission_date DATE,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    unit VARCHAR(50),
    service_status VARCHAR(20),
    address TEXT
);

-- Insert records into the table
INSERT INTO Officers (officer_id, name, branch, commission_date, contact_number,email, unit, service_status, address)
 VALUES
(1, 'Col. Arjun Rawat', 'Infantry', '2005-06-01', '9876543211', 'arjun.rawat@army.in', 'Alpha', 'Active', 'Delhi Cantt'),
(2, 'Maj. Rakesh Rathi', 'Engineers', '2010-03-15', '9812345671', 'rakesh.rathi@army.in', 'Bravo', 'Active', 'Mumbai HQ'),
(3, 'Lt. Gen. Devendra Iyer', 'Signals', '1998-07-10', '9823456789', 'dev.iyer@army.in', 'Foxtrot', 'Active', 'Chennai Base'),
(4, 'Brig. Mahesh Kumar', 'Artillery', '2003-12-01', '9786543219', 'mahesh.kumar@army.in', 'Charlie', 'Active', 'Pune HQ'),
(5, 'Maj. Gen. Vinay Sood', 'Infantry', '2000-05-08', '9876540099', 'vinay.sood@army.in', 'Echo', 'Active', 'Lucknow HQ'),
(6, 'Lt. Col. Prakash Joshi', 'Signals', '2008-01-20', '9812323232', 'prakash.joshi@army.in', 'Delta', 'On Leave', 'Nagpur Camp'),
(7, 'Capt. Aditi Sharma', 'Medical', '2015-08-12', '9765432101', 'aditi.sharma@army.in', 'Alpha', 'Active', 'Delhi Base'),
(8, 'Col. Rajeev Naik', 'Engineers', '2004-11-25', '9900990099', 'rajeev.naik@army.in', 'Bravo', 'Retired', 'Bangalore HQ'),
(9, 'Maj. Rohit Shekhar', 'Artillery', '2011-06-30', '9955441122', 'rohit.shekhar@army.in', 'Charlie', 'Active', 'Kolkata Post'),
(10, 'Capt. Priya Menon', 'Logistics', '2016-04-14', '9888007766', 'priya.menon@army.in', 'Echo', 'Active', 'Guwahati Base'),
(11, 'Lt. Arvind Mishra', 'Signals', '2018-10-05', '9123456780', 'arvind.mishra@army.in', 'Delta', 'Active', 'Hyderabad Camp'),
(12, 'Col. Mehul Sinha', 'Medical', '2006-09-19', '9090909090', 'mehul.sinha@army.in', 'Foxtrot', 'Active', 'Chandigarh HQ'),
(13, 'Maj. Kavita Patil', 'Intelligence', '2012-07-07', '9777777777', 'kavita.patil@army.in', 'Charlie', 'Active', 'Indore Unit'),
(14, 'Capt. Aman Saxena', 'Infantry', '2017-03-21', '9666666666', 'aman.saxena@army.in', 'Bravo', 'On Duty', 'Bhopal Camp'),
(15, 'Lt. Karan Thakur', 'Engineers', '2019-01-11', '9555555555', 'karan.thakur@army.in', 'Alpha', 'Active', 'Jammu Base');

-- to display/retrieve table data
SELECT * FROM Officers;               

-- to remove complete data from table
truncate table Officers;

-- to delete complete attributes and records 
drop table Officers;

-- Table 3: Weapons
CREATE TABLE Weapons (
    weapon_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    model_number VARCHAR(50),
    issued_to_unit VARCHAR(50),
    manufacture_date DATE,
    range_meters INT,
    weight_kg DECIMAL(5,2),
    status VARCHAR(30),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Weapons (weapon_id, name, type, model_number, issued_to_unit,manufacture_date, range_meters, weight_kg, status, remarks)
 VALUES
(1, 'INSAS Rifle', 'Assault Rifle', 'INSAS-MK1', 'Alpha', '2022-01-10', 400, 4.15, 'Active', 'Standard issue rifle'),
(2, 'AK-47', 'Assault Rifle', 'AK47-IND', 'Bravo', '2021-12-05', 350, 3.47, 'Active', 'Used in border ops'),
(3, 'Dragunov', 'Sniper Rifle', 'DRG-IND', 'Charlie', '2020-06-15', 800, 4.30, 'Active', 'Long range support'),
(4, 'Glock 17', 'Pistol', 'GL17-MOD', 'Delta', '2022-03-11', 50, 0.90, 'Active', 'Sidearm for officers'),
(5, 'Tavor X95', 'Assault Rifle', 'TAV-X95', 'Echo', '2021-10-08', 500, 3.40, 'Active', 'Modern compact rifle'),
(6, 'MP5', 'SMG', 'MP5-IND', 'Foxtrot', '2019-11-25', 200, 2.70, 'Reserve', 'Used for close quarters'),
(7, 'Beretta M9', 'Pistol', 'BM9-STD', 'Alpha', '2023-01-20', 45, 0.95, 'Active', 'Officer issue'),
(8, 'FN MAG', 'Machine Gun', 'MAG-FN', 'Bravo', '2020-09-30', 1000, 11.00, 'Active', 'Medium machine gun'),
(9, 'Carl Gustaf', 'Recoilless Rifle', 'CG84-IND', 'Charlie', '2018-04-15', 500, 8.40, 'Active', 'Anti-vehicle'),
(10, 'Bofors Howitzer', 'Artillery', 'BOF-155', 'Delta', '2017-06-20', 30000, 12.00, 'Active', 'Heavy artillery'),
(11, 'SIG716', 'Assault Rifle', 'SIG716I', 'Echo', '2023-04-01', 600, 3.80, 'Active', 'Modern rifle system'),
(12, 'Pindad SS2', 'Assault Rifle', 'SS2-V4', 'Foxtrot', '2021-07-07', 400, 3.25, 'Under Maintenance', 'Trial weapon'),
(13, 'Heckler & Koch G3', 'Battle Rifle', 'HK-G3', 'Alpha', '2019-03-19', 600, 4.40, 'Reserve', 'Older model'),
(14, 'SVD NDM-86', 'Sniper Rifle', 'SVD-NDM', 'Bravo', '2022-05-09', 900, 4.50, 'Active', 'High precision'),
(15, 'M4 Carbine', 'Carbine', 'M4A1-IND', 'Charlie', '2023-06-11', 500, 3.10, 'Active', 'Compact and light');

-- to display/retrieve table data
SELECT * FROM Weapons;               

-- to remove complete data from table
truncate table Weapons;

-- to delete complete attributes and records 
drop table Weapons;

-- Table 4: Missions
CREATE TABLE Missions (
    mission_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    assigned_unit VARCHAR(50),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(30),
    commanding_officer VARCHAR(100),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Missions (mission_id, name, type, assigned_unit, location,start_date, end_date, status, commanding_officer, remarks) 
VALUES
(1, 'Operation Trinetra', 'Surveillance', 'Alpha', 'Kashmir Valley', '2023-03-01', '2023-04-15', 'Completed', 'Col. Arjun Rawat', 'Monitored cross-border activity'),
(2, 'Iron Shield', 'Defense', 'Bravo', 'Punjab Border', '2022-11-10', '2022-12-05', 'Completed', 'Maj. Rakesh Rathi', 'Defensive stance during tensions'),
(3, 'Silent Strike', 'Covert', 'Charlie', 'Manipur Hills', '2023-06-01', '2023-06-20', 'Ongoing', 'Lt. Karan Thakur', 'Eliminate insurgent cells'),
(4, 'Vigil Dawn', 'Patrol', 'Delta', 'Arunachal Sector', '2023-05-05', NULL, 'Ongoing', 'Capt. Priya Menon', 'High-altitude surveillance'),
(5, 'Operation Safeguard', 'Rescue', 'Echo', 'Uttarakhand Flood Area', '2023-07-01', '2023-07-10', 'Completed', 'Maj. Kavita Patil', 'Evacuation during disaster'),
(6, 'Mountain Shield', 'Defense', 'Foxtrot', 'Sikkim', '2022-09-15', '2022-10-01', 'Completed', 'Lt. Gen. Devendra Iyer', 'Mountain combat training'),
(7, 'Desert Sentinel', 'Training', 'Alpha', 'Rajasthan', '2023-02-01', '2023-02-28', 'Completed', 'Col. Rajeev Naik', 'Desert combat readiness'),
(8, 'Steel Resolve', 'Combat Drill', 'Bravo', 'Maharashtra', '2023-08-01', NULL, 'Planned', 'Capt. Aman Saxena', 'Joint battalion simulation'),
(9, 'Valiant Guard', 'Security', 'Charlie', 'Kolkata Airport', '2023-06-10', '2023-06-25', 'Completed', 'Maj. Rohit Shekhar', 'Event protection mission'),
(10, 'Swift Wind', 'Search & Rescue', 'Delta', 'Ladakh', '2023-05-01', '2023-05-12', 'Completed', 'Lt. Arvind Mishra', 'Lost patrol recovery'),
(11, 'Night Shadow', 'Intelligence', 'Echo', 'Nagaland', '2023-04-20', '2023-05-05', 'Completed', 'Brig. Mahesh Kumar', 'Intelligence gathering'),
(12, 'Crimson Viper', 'Covert', 'Foxtrot', 'Chhattisgarh', '2023-03-01', NULL, 'Ongoing', 'Lt. Col. Prakash Joshi', 'Anti-insurgency'),
(13, 'Operation Rakshak', 'Peacekeeping', 'Alpha', 'Jammu', '2023-01-15', '2023-02-15', 'Completed', 'Maj. Gen. Vinay Sood', 'Local conflict mediation'),
(14, 'Jagriti', 'Awareness Drive', 'Bravo', 'Uttar Pradesh', '2022-12-01', '2022-12-10', 'Completed', 'Capt. Aditi Sharma', 'Civic interaction and awareness'),
(15, 'Operation Seema', 'Border Control', 'Charlie', 'Bangladesh Border', '2023-05-20', NULL, 'Ongoing', 'Col. Mehul Sinha', 'Border patrol support');

-- to display/retrieve table data
SELECT * FROM Missions;               

-- to remove complete data from table
truncate table Missions;

-- to delete complete attributes and records 
drop table Missions;

-- Table 5: Vehicles
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_type VARCHAR(50),
    model_name VARCHAR(100),
    registration_number VARCHAR(20),
    unit_assigned VARCHAR(50),
    purchase_date DATE,
    condition_status VARCHAR(30),
    capacity INT,
    assigned_driver VARCHAR(100),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Vehicles (vehicle_id, vehicle_type, model_name, registration_number, unit_assigned,purchase_date, condition_status, capacity, assigned_driver, remarks) 
VALUES
(1, 'Truck', 'Tata LPTA 713', 'ARMY001', 'Alpha', '2019-05-01', 'Operational', 24, 'Hav. Suraj Yadav', 'Logistics transport'),
(2, 'Jeep', 'Mahindra MM550', 'ARMY002', 'Bravo', '2018-03-15', 'Operational', 5, 'Nk. Amit Rathore', 'Unit mobility'),
(3, 'Tank', 'Arjun MBT Mk1A', 'ARMY003', 'Charlie', '2021-08-20', 'Operational', 4, 'Hav. Manoj Verma', 'Battlefield deployment'),
(4, 'APC', 'BMP-2 Sarath', 'ARMY004', 'Delta', '2020-07-10', 'Operational', 10, 'Nk. Ravi Meena', 'Troop movement'),
(5, 'Truck', 'Ashok Leyland Stallion', 'ARMY005', 'Echo', '2017-11-25', 'Repairing', 30, 'L/Nk. Vinay Patel', 'Ammo transport'),
(6, 'Jeep', 'Maruti Gypsy', 'ARMY006', 'Foxtrot', '2016-01-05', 'Operational', 4, 'Hav. Deepak Sharma', 'Reconnaissance'),
(7, 'Tank', 'T-90 Bhishma', 'ARMY007', 'Alpha', '2019-12-10', 'Operational', 3, 'Nk. Rakesh Iyer', 'Main battle tank'),
(8, 'Helicopter', 'HAL Dhruv', 'ARMY008', 'Bravo', '2022-04-15', 'Operational', 8, 'Capt. Asha Nair', 'Medical evacuation'),
(9, 'Truck', 'Tata LPTA 1623', 'ARMY009', 'Charlie', '2018-09-12', 'Operational', 26, 'Hav. Sandeep Kumar', 'Food supplies'),
(10, 'Jeep', 'Force Gurkha', 'ARMY010', 'Delta', '2017-06-21', 'Retired', 5, 'L/Nk. Kiran Jadhav', 'Training purpose'),
(11, 'Tank', 'Arjun Mk2', 'ARMY011', 'Echo', '2020-02-11', 'Operational', 4, 'Hav. Alok Joshi', 'High terrain deployment'),
(12, 'APC', 'WhAP', 'ARMY012', 'Foxtrot', '2021-01-30', 'Operational', 10, 'Nk. Nitin Thakur', 'Armoured patrol'),
(13, 'Truck', 'Ashok Leyland 4x4', 'ARMY013', 'Alpha', '2019-03-25', 'Repairing', 22, 'Hav. Pradeep Singh', 'Troop deployment'),
(14, 'Jeep', 'Mahindra Scorpio', 'ARMY014', 'Bravo', '2023-05-20', 'Operational', 6, 'L/Nk. Iqbal Hussain', 'Staff transport'),
(15, 'Helicopter', 'Chetak', 'ARMY015', 'Charlie', '2015-10-01', 'Retired', 5, 'Maj. Rohit Shekhar', 'Retired airlift service');

-- to display/retrieve table data
SELECT * FROM Vehicles;               

-- to remove complete data from table
truncate table Vehicles;

-- to delete complete attributes and records 
drop table Vehicles;

-- Table 6: Training_Camps
CREATE TABLE Training_Camps (
    camp_id INT PRIMARY KEY,
    camp_name VARCHAR(100),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    supervising_officer VARCHAR(100),
    total_trainees INT,
    specialty VARCHAR(50),
    status VARCHAR(30),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Training_Camps (camp_id, camp_name, location, start_date, end_date,supervising_officer, total_trainees, specialty, status, remarks)
 VALUES
(1, 'Camp Shakti', 'Dehradun', '2023-01-10', '2023-02-20', 'Col. Arjun Rawat', 120, 'Infantry', 'Completed', 'Excellent turnout'),
(2, 'Camp Vijay', 'Pune', '2023-03-01', '2023-04-15', 'Maj. Kavita Patil', 90, 'Medical Aid', 'Completed', 'First aid & trauma'),
(3, 'Camp Bhagat', 'Jaipur', '2023-05-05', '2023-06-10', 'Capt. Aman Saxena', 100, 'Weapons', 'Ongoing', 'Advanced rifles'),
(4, 'Camp Kargil', 'Srinagar', '2022-11-20', '2022-12-30', 'Lt. Gen. Devendra Iyer', 130, 'Mountain Warfare', 'Completed', 'High altitude conditions'),
(5, 'Camp Surya', 'Chennai', '2023-06-01', NULL, 'Brig. Mahesh Kumar', 85, 'Communication', 'Ongoing', 'Signals training'),
(6, 'Camp Agni', 'Jaisalmer', '2023-02-01', '2023-03-05', 'Lt. Col. Prakash Joshi', 110, 'Artillery', 'Completed', 'Desert drills'),
(7, 'Camp Gagan', 'Shillong', '2023-07-10', NULL, 'Col. Mehul Sinha', 95, 'Air Mobility', 'Ongoing', 'Helicopter operations'),
(8, 'Camp Raksha', 'Lucknow', '2022-10-10', '2022-11-15', 'Maj. Rohit Shekhar', 100, 'Rescue', 'Completed', 'Disaster response'),
(9, 'Camp Nirbhaya', 'Delhi', '2023-03-20', '2023-04-25', 'Capt. Aditi Sharma', 80, 'Self-Defense', 'Completed', 'Women soldiers'),
(10, 'Camp Tejas', 'Bangalore', '2023-05-15', NULL, 'Maj. Gen. Vinay Sood', 105, 'Tactical Combat', 'Ongoing', 'Urban scenarios'),
(11, 'Camp Shikhar', 'Manali', '2022-09-01', '2022-10-10', 'Col. Rajeev Naik', 115, 'Survival', 'Completed', 'Cold weather skills'),
(12, 'Camp Rudra', 'Bhopal', '2023-04-01', '2023-05-01', 'Lt. Karan Thakur', 90, 'Combat Fitness', 'Completed', 'Intensive drills'),
(13, 'Camp Jal', 'Guwahati', '2023-07-01', NULL, 'Capt. Priya Menon', 70, 'Water Rescue', 'Ongoing', 'Flood & river ops'),
(14, 'Camp Sentinel', 'Nagpur', '2022-12-05', '2023-01-15', 'Lt. Arvind Mishra', 88, 'Intelligence', 'Completed', 'Recon training'),
(15, 'Camp Shaurya', 'Hyderabad', '2023-02-10', '2023-03-20', 'Col. Mehul Sinha', 100, 'Cyber Defense', 'Completed', 'Network protection');

-- to display/retrieve table data
SELECT * FROM Training_Camps;               

-- to remove complete data from table
truncate table Training_Camps;

-- to delete complete attributes and records 
drop table Training_Camps;

-- Table 7: Ranks
CREATE TABLE Ranks (
    rank_id INT PRIMARY KEY,
    rank_name VARCHAR(50),
    abbreviation VARCHAR(10),
    level INT,
    category VARCHAR(50),
    pay_grade VARCHAR(20),
    insignia TEXT,
    promoted_from VARCHAR(50),
    min_service_years INT,
    description TEXT
);

-- Insert records into the table
INSERT INTO Ranks (rank_id, rank_name, abbreviation, level, category,pay_grade, insignia, promoted_from, min_service_years, description) 
VALUES
(1, 'Lieutenant', 'Lt.', 1, 'Commissioned Officer', 'Level 10', '1 Star', 'N/A', 0, 'Entry level rank for officers'),
(2, 'Captain', 'Capt.', 2, 'Commissioned Officer', 'Level 10B', '3 Star', 'Lieutenant', 2, 'Commands a troop or company'),
(3, 'Major', 'Maj.', 3, 'Commissioned Officer', 'Level 11', '4 Star', 'Captain', 6, 'Mid-level command'),
(4, 'Lieutenant Colonel', 'Lt. Col.', 4, 'Commissioned Officer', 'Level 12A', '5 Star', 'Major', 13, 'Commands battalions'),
(5, 'Colonel', 'Col.', 5, 'Commissioned Officer', 'Level 13', '6 Star', 'Lt. Col.', 15, 'Senior field officer'),
(6, 'Brigadier', 'Brig.', 6, 'Commissioned Officer', 'Level 13A', '1 Star', 'Colonel', 18, 'Commands brigades'),
(7, 'Major General', 'Maj. Gen.', 7, 'Commissioned Officer', 'Level 14', '2 Star', 'Brigadier', 20, 'Division-level command'),
(8, 'Lieutenant General', 'Lt. Gen.', 8, 'Commissioned Officer', 'Level 15', '3 Star', 'Major General', 25, 'Corps-level command'),
(9, 'General', 'Gen.', 9, 'Commissioned Officer', 'Level Apex', '4 Star', 'Lieutenant General', 30, 'Army Chief'),
(10, 'Havildar', 'Hav.', 10, 'Junior Commissioned', 'Level 5', '3 chevrons', 'Naik', 8, 'Section commander'),
(11, 'Naik', 'Nk.', 11, 'Junior Commissioned', 'Level 4', '2 chevrons', 'Lance Naik', 5, 'Team commander'),
(12, 'Lance Naik', 'L/Nk.', 12, 'Junior Commissioned', 'Level 3', '1 chevron', 'Sepoy', 3, 'Junior non-commissioned'),
(13, 'Sepoy', 'Spr.', 13, 'Non-Commissioned', 'Level 2', 'Plain shoulder', 'N/A', 0, 'Base level soldier'),
(14, 'Subedar', 'Sub.', 14, 'Junior Commissioned Officer', 'Level 6', '1 star and stripe', 'Havildar', 12, 'Company 2IC'),
(15, 'Subedar Major', 'SM.', 15, 'Junior Commissioned Officer', 'Level 7', '2 stars and stripe', 'Subedar', 15, 'Regiment senior JCO');

-- to display/retrieve table data
SELECT * FROM Ranks;               

-- to remove complete data from table
truncate table Ranks;

-- to delete complete attributes and records 
drop table Ranks;

-- Table 8: Battalions
CREATE TABLE Battalions (
    battalion_id INT PRIMARY KEY,
    name VARCHAR(100),
    unit_type VARCHAR(50),
    location VARCHAR(100),
    formation_date DATE,
    commanding_officer VARCHAR(100),
    strength INT,
    status VARCHAR(30),
    specialisation VARCHAR(50),
    motto TEXT
);

-- Insert records into the table
INSERT INTO Battalions (battalion_id, name, unit_type, location, formation_date,commanding_officer, strength, status, specialisation, motto) 
VALUES
(1, '1st Mechanised Infantry', 'Infantry', 'Ambala', '1990-01-01', 'Col. Arjun Rawat', 850, 'Active', 'Mechanised Warfare', 'Swift and Strong'),
(2, '4th Armoured Regiment', 'Armoured', 'Hisar', '1985-05-10', 'Lt. Gen. Devendra Iyer', 650, 'Active', 'Tank Operations', 'Iron Clad Resolve'),
(3, '21 Para SF', 'Special Forces', 'Agra', '1987-10-15', 'Maj. Kavita Patil', 300, 'Active', 'Covert Operations', 'Balidaan'),
(4, '9 Gorkha Rifles', 'Infantry', 'Darjeeling', '1950-03-18', 'Col. Mehul Sinha', 900, 'Active', 'Mountain Warfare', 'Kayar Hunu Bhanda Marno Ramro'),
(5, '5 Sikh LI', 'Infantry', 'Amritsar', '1962-12-10', 'Maj. Gen. Vinay Sood', 800, 'Active', 'High-Altitude Combat', 'Deg Teg Fateh'),
(6, '6th Engineers Regiment', 'Engineers', 'Pune', '1978-07-01', 'Lt. Col. Prakash Joshi', 700, 'Active', 'Field Engineering', 'Always Ahead'),
(7, '7 Signals Battalion', 'Signals', 'Chennai', '1995-02-21', 'Brig. Mahesh Kumar', 550, 'Active', 'Communication Systems', 'Connect and Win'),
(8, '11 Artillery Regiment', 'Artillery', 'Nashik', '1989-11-25', 'Maj. Rohit Shekhar', 600, 'Active', 'Field Artillery', 'Fire for Effect'),
(9, '2 Naga Regiment', 'Infantry', 'Kohima', '1990-04-09', 'Col. Rajeev Naik', 820, 'Active', 'Jungle Warfare', 'Faithful and Strong'),
(10, '14 Corps HQ', 'Command HQ', 'Leh', '2001-06-30', 'Capt. Priya Menon', 1200, 'Active', 'Northern Command', 'Steadfast Resolve'),
(11, '8 Grenadiers', 'Infantry', 'Indore', '1972-08-08', 'Capt. Aman Saxena', 860, 'Active', 'Field Combat', 'Sarvada Shaktishali'),
(12, '3rd EME Battalion', 'Technical', 'Secunderabad', '1993-09-19', 'Lt. Arvind Mishra', 500, 'Active', 'Weapon Maintenance', 'Power Through Knowledge'),
(13, '17 JAT Regiment', 'Infantry', 'Bhopal', '1969-01-26', 'Col. Rakesh Rathi', 870, 'Active', 'Field Infantry', 'Sangathan Va Veerta'),
(14, '12 Signals Training Unit', 'Signals', 'Bangalore', '1997-12-01', 'Capt. Aditi Sharma', 450, 'Training', 'Comm and Control', 'Alert and Ready'),
(15, 'HQ Southern Command', 'Command HQ', 'Pune', '1955-04-01', 'Lt. Karan Thakur', 1500, 'Active', 'Strategic HQ', 'Strike with Precision');

-- to display/retrieve table data
SELECT * FROM Battalions;               

-- to remove complete data from table
truncate table Battalions;

-- to delete complete attributes and records 
drop table Battalions;

-- Table 9: Medical_Records
CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY,
    soldier_id INT,
    checkup_date DATE,
    doctor_name VARCHAR(100),
    diagnosis TEXT,
    treatment TEXT,
    follow_up_date DATE,
    fitness_status VARCHAR(30),
    remarks TEXT,
    hospital_name VARCHAR(100),
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id)
);

-- Insert records into the table
INSERT INTO Medical_Records (record_id, soldier_id, checkup_date, doctor_name, diagnosis,treatment, follow_up_date, fitness_status, remarks, hospital_name)
 VALUES
(1, 1, '2023-01-15', 'Dr. Neha Kulkarni', 'Sprained Ankle', 'Rest & physiotherapy', '2023-01-25', 'Fit', 'Minor sprain during drill', 'Army Hospital Delhi'),
(2, 2, '2023-02-10', 'Dr. Ramesh Pillai', 'Viral Fever', 'Medication', '2023-02-15', 'Fit', 'Recovered quickly', 'Military Base Clinic Mumbai'),
(3, 3, '2023-03-05', 'Dr. Asha Nair', 'High BP', 'Monitoring & lifestyle changes', '2023-03-20', 'Under Observation', 'Needs regular checkup', 'Army Medical Center Pune'),
(4, 4, '2023-04-12', 'Dr. Karan Patel', 'Back Pain', 'Painkillers & rest', '2023-04-20', 'Fit', 'Injury due to load lifting', 'Jammu Army Hospital'),
(5, 5, '2023-05-18', 'Dr. Shalini Das', 'Fractured Arm', 'Cast & rehab', '2023-06-30', 'Recovering', 'Training injury', 'Lucknow Military Hospital'),
(6, 6, '2023-01-20', 'Dr. Vikram Yadav', 'Allergy', 'Antihistamines', '2023-01-22', 'Fit', 'Dust allergy', 'Nagpur Camp Clinic'),
(7, 7, '2023-06-01', 'Dr. Meena Sharma', 'Migraine', 'Pain relief & rest', '2023-06-07', 'Fit', 'Routine case', 'Army Base Hospital Chennai'),
(8, 8, '2023-03-15', 'Dr. Rahul Gupta', 'Fractured Toe', 'Rest', '2023-04-01', 'Recovering', 'Sports injury', 'Bangalore Military Hospital'),
(9, 9, '2023-07-03', 'Dr. Seema Bhagat', 'Dehydration', 'IV fluids', '2023-07-05', 'Fit', 'Summer field training', 'Guwahati Army Hospital'),
(10, 10, '2023-02-25', 'Dr. Dinesh Jain', 'Stomach Infection', 'Antibiotics', '2023-03-01', 'Fit', 'Food-related issue', 'Indore Base Clinic'),
(11, 11, '2023-04-18', 'Dr. Archana Singh', 'Sprain', 'Cold compress', '2023-04-25', 'Fit', 'Mild case', 'Hyderabad Army Clinic'),
(12, 12, '2023-05-08', 'Dr. Ajay Raut', 'Sinusitis', 'Medication', '2023-05-15', 'Fit', 'Recurring issue', 'Manali Field Hospital'),
(13, 13, '2023-06-12', 'Dr. Priya Joshi', 'Ear Infection', 'Drops & tablets', '2023-06-17', 'Fit', 'Treated successfully', 'Delhi Cantt Hospital'),
(14, 14, '2023-07-01', 'Dr. Nishant Rao', 'Flu', 'Rest & flu meds', '2023-07-06', 'Fit', 'Contagion alert issued', 'Army Camp Clinic Amritsar'),
(15, 15, '2023-06-20', 'Dr. Sunita Iyer', 'Minor Burns', 'Topical ointment', '2023-06-27', 'Recovering', 'Field kitchen incident', 'Field Hospital Leh');

-- to display/retrieve table data
SELECT * FROM Medical_Records;               

-- to remove complete data from table
truncate table Medical_Records;

-- to delete complete attributes and records 
drop table Medical_Records;

-- Table 10: Leave_Records
CREATE TABLE Leave_Records (
    leave_id INT PRIMARY KEY,
    soldier_id INT,
    leave_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reason TEXT,
    approval_status VARCHAR(30),
    approving_officer VARCHAR(100),
    leave_location VARCHAR(100),
    remarks TEXT,
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id)
);

-- Insert records into the table
INSERT INTO Leave_Records (leave_id, soldier_id, leave_type, start_date, end_date,reason, approval_status, approving_officer, leave_location, remarks) 
VALUES
(1, 1, 'Annual Leave', '2023-01-10', '2023-01-25', 'Family visit', 'Approved', 'Col. Arjun Rawat', 'Bhopal', 'Leave granted on compassionate grounds'),
(2, 2, 'Medical Leave', '2023-02-01', '2023-02-10', 'Flu recovery', 'Approved', 'Maj. Kavita Patil', 'Mumbai', 'Medical certificate submitted'),
(3, 3, 'Emergency Leave', '2023-03-15', '2023-03-20', 'Father illness', 'Approved', 'Lt. Gen. Devendra Iyer', 'Nagpur', 'Urgent family issue'),
(4, 4, 'Annual Leave', '2023-04-05', '2023-04-15', 'Vacation', 'Approved', 'Col. Mehul Sinha', 'Kolkata', 'Routine annual leave'),
(5, 5, 'Special Leave', '2023-05-01', '2023-05-12', 'Marriage', 'Approved', 'Brig. Mahesh Kumar', 'Jaipur', 'On occasion of marriage'),
(6, 6, 'Medical Leave', '2023-06-10', '2023-06-18', 'Back pain', 'Approved', 'Maj. Gen. Vinay Sood', 'Chennai', 'Treatment at base hospital'),
(7, 7, 'Emergency Leave', '2023-07-05', '2023-07-10', 'Child birth', 'Approved', 'Capt. Priya Menon', 'Hyderabad', 'Immediate leave granted'),
(8, 8, 'Annual Leave', '2023-01-20', '2023-02-02', 'Home visit', 'Approved', 'Lt. Arvind Mishra', 'Indore', 'Approved as per schedule'),
(9, 9, 'Medical Leave', '2023-03-01', '2023-03-07', 'Minor surgery', 'Approved', 'Col. Rajeev Naik', 'Delhi', 'Doctor report submitted'),
(10, 10, 'Annual Leave', '2023-04-25', '2023-05-05', 'Religious ceremony', 'Approved', 'Capt. Aman Saxena', 'Varanasi', 'Cultural leave'),
(11, 11, 'Special Leave', '2023-06-15', '2023-06-30', 'Exam preparation', 'Approved', 'Lt. Karan Thakur', 'Pune', 'Defense competitive exams'),
(12, 12, 'Emergency Leave', '2023-07-12', '2023-07-16', 'Funeral', 'Approved', 'Capt. Aditi Sharma', 'Guwahati', 'Family bereavement'),
(13, 13, 'Annual Leave', '2023-02-05', '2023-02-20', 'Vacation', 'Approved', 'Maj. Rohit Shekhar', 'Ranchi', 'Leave balance sufficient'),
(14, 14, 'Medical Leave', '2023-03-25', '2023-04-05', 'Migraine treatment', 'Approved', 'Lt. Col. Prakash Joshi', 'Bangalore', 'Requested by MO'),
(15, 15, 'Annual Leave', '2023-05-20', '2023-06-04', 'Home function', 'Approved', 'Brig. Nishant Rao', 'Thiruvananthapuram', 'Personal occasion');

-- to display/retrieve table data
SELECT * FROM Leave_Records;               

-- to remove complete data from table
truncate table Leave_Records;

-- to delete complete attributes and records 
drop table Leave_Records;

-- Table 11: Operations
CREATE TABLE Operations (
    operation_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    commanding_officer VARCHAR(100),
    objective TEXT,
    status VARCHAR(30),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Operations (operation_id, name, type, location, start_date, end_date,commanding_officer, objective, status, remarks) 
VALUES
(1, 'Operation Vijay', 'Combat', 'Kargil', '1999-05-08', '1999-07-26', 'Gen. Ved Prakash Malik', 'Evict enemy infiltration', 'Completed', 'Victory in Kargil War'),
(2, 'Operation Parakram', 'Mobilization', 'India-Pak border', '2001-12-20', '2002-10-16', 'Gen. S. Padmanabhan', 'Strategic deterrence', 'Completed', 'Large-scale deployment'),
(3, 'Operation Meghdoot', 'High-Altitude', 'Siachen', '1984-04-13', NULL, 'Gen. Arun Mahadevan', 'Control Siachen Glacier', 'Ongoing', 'World’s highest battlefield'),
(4, 'Operation Cactus', 'Rescue', 'Maldives', '1988-11-03', '1988-11-06', 'Maj. Gen. A. S. Kalkat', 'Thwart coup in Maldives', 'Completed', 'Swift mission success'),
(5, 'Operation Rakshak', 'Counter-Terror', 'J&K', '1990-06-01', NULL, 'Lt. Gen. Ranbir Hooda', 'Counter-insurgency ops', 'Ongoing', 'Anti-terror activities'),
(6, 'Operation Rhino', 'Counter-Insurgency', 'Assam', '1991-01-01', NULL, 'Maj. Gen. D. S. Hooda', 'Suppress insurgency', 'Ongoing', 'In northeast region'),
(7, 'Operation All Out', 'Security Sweep', 'J&K', '2017-05-01', '2018-12-31', 'Lt. Gen. B. S. Raju', 'Neutralize militants', 'Completed', 'Intensive operation'),
(8, 'Operation Maitri', 'Humanitarian', 'Nepal', '2015-04-26', '2015-05-20', 'Lt. Gen. J. S. Sandhu', 'Earthquake relief', 'Completed', 'Disaster assistance'),
(9, 'Operation Sadbhavana', 'Civic Aid', 'J&K', '1998-06-01', NULL, 'Col. Pawan Soni', 'Win hearts of locals', 'Ongoing', 'Welfare programmes'),
(10, 'Operation Blue Star', 'Internal Security', 'Amritsar', '1984-06-01', '1984-06-10', 'Gen. K. Sundarji', 'Flush militants from Golden Temple', 'Completed', 'Highly sensitive operation'),
(11, 'Operation Surya Hope', 'Rescue', 'Uttarakhand', '2013-06-17', '2013-07-03', 'Lt. Gen. Anil Chait', 'Flood rescue mission', 'Completed', 'Massive airlift and rescue'),
(12, 'Operation Trident', 'Naval Strike', 'Karachi', '1971-12-04', '1971-12-04', 'Commodore Babru Bhan Yadav', 'Destroy enemy navy base', 'Completed', 'Success in 1971 War'),
(13, 'Operation Polo', 'Annexation', 'Hyderabad', '1948-09-13', '1948-09-17', 'Maj. Gen. J. N. Chaudhuri', 'Integrate Hyderabad state', 'Completed', 'Accession to India'),
(14, 'Operation Shakti', 'Nuclear Tests', 'Pokhran', '1998-05-11', '1998-05-13', 'Dr. A. P. J. Abdul Kalam', 'Nuclear capability demonstration', 'Completed', '5 underground tests'),
(15, 'Operation Pawan', 'Peacekeeping', 'Sri Lanka', '1987-07-29', '1990-03-24', 'Lt. Gen. Depinder Singh', 'Support Indo-Lanka accord', 'Completed', 'IPKF deployment');

-- to display/retrieve table data
SELECT * FROM Operations;               

-- to remove complete data from table
truncate table Operations;

-- to delete complete attributes and records 
drop table Operations;

-- Table 12: Medals
CREATE TABLE Medals (
    medal_id INT PRIMARY KEY,
    soldier_id INT,
    medal_name VARCHAR(100),
    category VARCHAR(50),
    date_awarded DATE,
    awarded_by VARCHAR(100),
    operation_name VARCHAR(100),
    reason TEXT,
    status VARCHAR(30),
    remarks TEXT,
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id)
);

-- Insert records into the table
INSERT INTO Medals (medal_id, soldier_id, medal_name, category, date_awarded,awarded_by, operation_name, reason, status, remarks) 
VALUES
(1, 1, 'Shaurya Chakra', 'Gallantry', '2022-08-15', 'President Droupadi Murmu', 'Operation Vijay', 'Exceptional bravery in combat', 'Awarded', 'National level award'),
(2, 2, 'Sena Medal', 'Bravery', '2021-01-26', 'Gen. Manoj Pande', 'Operation Rakshak', 'Courage during counter-insurgency', 'Awarded', 'For valour in J&K'),
(3, 3, 'Vishisht Seva Medal', 'Service', '2020-08-15', 'President Ram Nath Kovind', 'Routine Service', 'Distinguished service to nation', 'Awarded', 'Long service medal'),
(4, 4, 'Param Vishisht Seva Medal', 'Service', '2019-01-26', 'President Ram Nath Kovind', 'Training Command', 'Exemplary leadership', 'Awarded', 'Top peacetime service'),
(5, 5, 'Ati Vishisht Seva Medal', 'Service', '2022-01-26', 'Gen. Bipin Rawat', 'Operation Rhino', 'Outstanding service in northeast', 'Awarded', 'For dedicated duty'),
(6, 6, 'Sena Medal', 'Bravery', '2023-01-26', 'President Droupadi Murmu', 'Operation All Out', 'Neutralized militant leader', 'Awarded', 'Recognized gallantry'),
(7, 7, 'Yudh Seva Medal', 'War Time', '2021-08-15', 'Gen. Naravane', 'Border Skirmish', 'Operational planning excellence', 'Awarded', 'During LOC tensions'),
(8, 8, 'COAS Commendation Card', 'Recognition', '2020-01-15', 'Gen. M. M. Naravane', 'Annual Review', 'Best-performing soldier', 'Awarded', 'Honor by Chief'),
(9, 9, 'Shaurya Chakra', 'Gallantry', '2018-08-15', 'President Ram Nath Kovind', 'Operation Sadbhavana', 'Humanitarian act under fire', 'Awarded', 'Saved civilians'),
(10, 10, 'Sena Medal', 'Bravery', '2019-01-26', 'Gen. Bipin Rawat', 'Camp Raid', 'Counter-attack bravery', 'Awarded', 'Field operation'),
(11, 11, 'Long Service Medal', 'Service', '2023-01-01', 'Brig. Nishant Rao', 'General Duty', '15+ years of service', 'Awarded', 'Discipline & loyalty'),
(12, 12, 'Operation Medal', 'Specific Ops', '2022-09-05', 'Col. Arjun Rawat', 'Operation Maitri', 'Relief operations in Nepal', 'Awarded', 'Humanitarian help'),
(13, 13, 'Sena Medal', 'Bravery', '2020-01-26', 'Gen. Rawat', 'Border Duty', 'Face-off with infiltrators', 'Awarded', 'Direct engagement'),
(14, 14, 'COAS Commendation Card', 'Recognition', '2021-07-10', 'Gen. Naravane', 'Base Operations', 'Technical contribution', 'Awarded', 'Logistics innovation'),
(15, 15, 'Sena Medal', 'Bravery', '2023-01-26', 'Gen. Manoj Pande', 'Counter-terror Action', 'Rescue under fire', 'Awarded', 'Saved fellow soldiers');

-- to display/retrieve table data
SELECT * FROM Medals;               

-- to remove complete data from table
truncate table Medals;

-- to delete complete attributes and records 
drop table Medals;

-- Table 13: Postings
CREATE TABLE Postings (
    posting_id INT PRIMARY KEY,
    soldier_id INT,
    location VARCHAR(100),
    unit_name VARCHAR(100),
    post_date DATE,
    end_date DATE,
    role VARCHAR(100),
    commanding_officer VARCHAR(100),
    posting_status VARCHAR(30),
    remarks TEXT,
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id)
);

-- Insert records into the table
INSERT INTO Postings (posting_id, soldier_id, location, unit_name, post_date,end_date, role, commanding_officer, posting_status, remarks)
 VALUES
(1, 1, 'Srinagar', '21 Para SF', '2022-01-10', '2023-03-15', 'Commando', 'Col. Arjun Rawat', 'Completed', 'Served in high-alert zone'),
(2, 2, 'Leh', '14 Corps HQ', '2021-08-01', '2022-12-01', 'Logistics Coordinator', 'Capt. Priya Menon', 'Completed', 'High-altitude duty'),
(3, 3, 'Jammu', '9 Gorkha Rifles', '2020-04-12', '2021-10-05', 'Section Leader', 'Col. Mehul Sinha', 'Completed', 'Counter-insurgency area'),
(4, 4, 'Pune', '6th Engineers Regiment', '2023-03-01', NULL, 'Combat Engineer', 'Lt. Col. Prakash Joshi', 'Ongoing', 'Engaged in technical duties'),
(5, 5, 'Amritsar', '5 Sikh LI', '2021-02-20', '2022-07-20', 'Rifleman', 'Maj. Gen. Vinay Sood', 'Completed', 'Peace station duty'),
(6, 6, 'Nagaland', '2 Naga Regiment', '2022-06-10', '2023-09-10', 'Infantryman', 'Col. Rajeev Naik', 'Completed', 'Jungle warfare zone'),
(7, 7, 'Hyderabad', '3rd EME Battalion', '2023-01-05', NULL, 'Technician', 'Lt. Arvind Mishra', 'Ongoing', 'Vehicle repair duties'),
(8, 8, 'Bangalore', '7 Signals Battalion', '2022-05-15', '2023-11-15', 'Signal Operator', 'Brig. Mahesh Kumar', 'Completed', 'Communication hub'),
(9, 9, 'Delhi', 'Military Police', '2021-07-01', '2022-12-31', 'Patrol Officer', 'Capt. Aman Saxena', 'Completed', 'Internal security duty'),
(10, 10, 'Manali', 'Mountain Warfare Unit', '2023-02-01', NULL, 'Sniper', 'Capt. Aditi Sharma', 'Ongoing', 'Specialized mountain ops'),
(11, 11, 'Secunderabad', 'Artillery School', '2020-01-15', '2022-01-15', 'Trainer', 'Maj. Rohit Shekhar', 'Completed', 'Artillery tactics training'),
(12, 12, 'Jaisalmer', 'Border Regiment', '2022-03-20', '2023-08-10', 'Scout', 'Col. Rakesh Rathi', 'Completed', 'Desert patrols'),
(13, 13, 'Chennai', 'Signals Training Center', '2023-04-01', NULL, 'Instructor', 'Lt. Karan Thakur', 'Ongoing', 'Radio and tech training'),
(14, 14, 'Lucknow', 'Central Ordnance Depot', '2022-01-05', '2023-05-30', 'Supply Coordinator', 'Brig. Nishant Rao', 'Completed', 'Supplies and stores'),
(15, 15, 'Kargil', 'Northern Command', '2023-06-01', NULL, 'Infantry Scout', 'Maj. Kavita Patil', 'Ongoing', 'High-risk patrols');

-- to display/retrieve table data
SELECT * FROM Postings;               

-- to remove complete data from table
truncate table Postings;

-- to delete complete attributes and records 
drop table Postings;

-- Table 14: Military_Assets
CREATE TABLE Military_Assets (
    asset_id INT PRIMARY KEY,
    asset_name VARCHAR(100),
    asset_type VARCHAR(50),
    serial_number VARCHAR(50),
    assigned_unit VARCHAR(100),
    acquisition_date DATE,
    condition_status VARCHAR(30),
    location VARCHAR(100),
    responsible_officer VARCHAR(100),
    remarks TEXT
);

-- Insert records into the table
INSERT INTO Military_Assets (asset_id, asset_name, asset_type, serial_number, assigned_unit,acquisition_date, condition_status, location, responsible_officer, remarks) 
VALUES
(1, 'T-90 Bhishma', 'Tank', 'TNK00123', '4th Armoured Regiment', '2019-06-10', 'Operational', 'Hisar', 'Col. Arjun Rawat', 'Deployed on western front'),
(2, 'INSAS Rifle', 'Weapon', 'WPN89021', '21 Para SF', '2020-01-15', 'Operational', 'Agra', 'Maj. Kavita Patil', 'Routine use'),
(3, 'Dhanush Howitzer', 'Artillery', 'ART55678', '11 Artillery Regiment', '2021-03-25', 'Operational', 'Nashik', 'Maj. Rohit Shekhar', 'Tested in field'),
(4, 'BMP-2 Sarath', 'IFV', 'IFV00334', '1st Mechanised Infantry', '2018-12-10', 'Operational', 'Ambala', 'Col. Mehul Sinha', 'Upgraded variant'),
(5, 'Tata Light Specialist Vehicle', 'Transport', 'TRN76451', '14 Corps HQ', '2022-04-01', 'Operational', 'Leh', 'Capt. Priya Menon', 'Used in high altitudes'),
(6, 'Radar System INDRA-II', 'Surveillance', 'SRV00981', 'Signals Unit', '2020-09-15', 'Service Due', 'Bangalore', 'Brig. Mahesh Kumar', 'Needs maintenance'),
(7, 'AK-203 Rifle', 'Weapon', 'WPN90983', '2 Naga Regiment', '2022-07-01', 'Operational', 'Kohima', 'Col. Rajeev Naik', 'New batch issued'),
(8, 'Portable Communication Set', 'Electronics', 'COM00712', '7 Signals Battalion', '2021-11-05', 'Operational', 'Chennai', 'Lt. Arvind Mishra', 'Standard equipment'),
(9, 'Bofors FH77', 'Artillery', 'ART11234', '11 Artillery Regiment', '2017-05-20', 'Operational', 'Nashik', 'Maj. Rohit Shekhar', 'Heavy artillery'),
(10, 'ALH Dhruv Helicopter', 'Aircraft', 'AIR00101', 'HQ Southern Command', '2019-10-18', 'Under Repair', 'Pune', 'Lt. Karan Thakur', 'Grounded for service'),
(11, 'Night Vision Binoculars', 'Surveillance', 'NVG55321', 'Mountain Warfare Unit', '2023-01-01', 'Operational', 'Manali', 'Capt. Aditi Sharma', 'Issued for night ops'),
(12, 'Bulletproof Jacket MK-IV', 'Gear', 'GR123899', 'Military Police', '2020-06-06', 'Operational', 'Delhi', 'Capt. Aman Saxena', 'Issued to patrol teams'),
(13, 'Combat Drone Netra V2', 'Drone', 'DRN33211', 'Signals Unit', '2022-11-30', 'Operational', 'Nagpur', 'Col. Pawan Soni', 'Used in recon'),
(14, 'Mine Protected Vehicle', 'Vehicle', 'MPV78233', 'Infantry Division', '2021-02-22', 'Service Due', 'Srinagar', 'Col. Rakesh Rathi', 'Scheduled inspection'),
(15, 'Sig Sauer P320', 'Handgun', 'HNDG77812', 'Special Forces', '2023-03-18', 'Operational', 'Agra', 'Maj. Kavita Patil', 'Standard issue sidearm');

-- to display/retrieve table data
SELECT * FROM Military_Assets;               

-- to remove complete data from table
truncate table Military_Assets;

-- to delete complete attributes and records 
drop table Military_Assets;

-- Table 15: Ammunition_Inventory
CREATE TABLE Ammunition_Inventory (
    ammo_id INT PRIMARY KEY,
    ammo_type VARCHAR(50),
    caliber VARCHAR(20),
    quantity INT,
    storage_location VARCHAR(100),
    batch_number VARCHAR(50),
    manufacture_date DATE,
    expiry_date DATE,
    assigned_unit VARCHAR(100),
    issued_by VARCHAR(100)
);

-- Insert records into the table
INSERT INTO Ammunition_Inventory (ammo_id, ammo_type, caliber, quantity, storage_location,batch_number, manufacture_date, expiry_date, assigned_unit, issued_by) 
VALUES
(1, 'Rifle Ammo', '5.56mm', 15000, 'Depot A1, Delhi', 'B556-2021-A', '2021-03-10', '2026-03-10', '21 Para SF', 'Col. Arjun Rawat'),
(2, 'Machine Gun Ammo', '7.62mm', 20000, 'Depot B2, Pune', 'MG762-2022-B', '2022-05-12', '2027-05-12', '4 Sikh LI', 'Maj. Kavita Patil'),
(3, 'Sniper Ammo', '7.62mm', 3000, 'Depot C3, Amritsar', 'SN762-2020-C', '2020-07-22', '2025-07-22', 'Mountain Warfare Unit', 'Capt. Aditi Sharma'),
(4, 'Pistol Ammo', '9mm', 5000, 'Depot D4, Chennai', 'P9MM-2021-D', '2021-09-15', '2026-09-15', 'Military Police', 'Lt. Arvind Mishra'),
(5, 'Grenades', '40mm', 1200, 'Depot E5, Nagaland', 'GR40-2022-E', '2022-01-30', '2027-01-30', '2 Naga Regiment', 'Col. Rajeev Naik'),
(6, 'Mortar Shells', '81mm', 800, 'Depot F6, Jaipur', 'MT81-2019-F', '2019-12-10', '2024-12-10', '11 Artillery Regiment', 'Maj. Rohit Shekhar'),
(7, 'Tank Shells', '125mm', 400, 'Depot G7, Hisar', 'TK125-2023-G', '2023-02-01', '2028-02-01', '4th Armoured Regiment', 'Col. Mehul Sinha'),
(8, 'Artillery Shells', '155mm', 500, 'Depot H8, Nashik', 'ART155-2021-H', '2021-10-25', '2026-10-25', 'Dhanush Unit', 'Brig. Mahesh Kumar'),
(9, 'Smoke Grenades', 'NA', 900, 'Depot I9, Guwahati', 'SMK-2022-I', '2022-03-05', '2027-03-05', 'Border Regiment', 'Col. Rakesh Rathi'),
(10, 'Flashbangs', 'NA', 700, 'Depot J10, Hyderabad', 'FLB-2023-J', '2023-01-01', '2028-01-01', 'Signals Battalion', 'Capt. Priya Menon'),
(11, 'Anti-Tank Mines', 'NA', 350, 'Depot K11, Jaisalmer', 'ATM-2021-K', '2021-06-18', '2026-06-18', 'Infantry Division', 'Lt. Karan Thakur'),
(12, 'RPG Rounds', 'NA', 280, 'Depot L12, Leh', 'RPG-2022-L', '2022-08-20', '2027-08-20', 'Special Forces', 'Maj. Kavita Patil'),
(13, 'Signal Flares', 'NA', 600, 'Depot M13, Secunderabad', 'SFL-2023-M', '2023-03-10', '2028-03-10', 'Artillery School', 'Maj. Rohit Shekhar'),
(14, 'Training Ammo', '5.56mm', 10000, 'Depot N14, Lucknow', 'TNG556-2022-N', '2022-11-11', '2027-11-11', 'Training Command', 'Brig. Nishant Rao'),
(15, 'Rubber Bullets', 'NA', 1500, 'Depot O15, Delhi', 'RBB-2020-O', '2020-02-15', '2025-02-15', 'Crowd Control Unit', 'Capt. Aman Saxena');

-- to display/retrieve table data
SELECT * FROM Ammunition_Inventory;               

-- to remove complete data from table
truncate table Ammunition_Inventory;

-- to delete complete attributes and records 
drop table Ammunition_Inventory;