-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database Stock_Market;

-- to work on it, you need to use it first
use Stock_Market;

-- Delete a database
Drop database Stock_Market;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Investors (investor_id, name, email, phone_number, date_of_birth,gender, pan_number, address, city, state)

T2 : Brokers (broker_id, broker_name, email, phone_number, registered_date,license_number, firm_name, city, state, status) 

T3 : Companies (company_id, company_name, ceo_name, sector, founded_year,headquarters_city, headquarters_state, pan_number, cin_number, status) 

T4 : Stocks (stock_id, company_id, symbol, exchange, face_value,total_shares, market_cap, pe_ratio, dividend_yield, status)

T5 : Stock_Prices (price_id, stock_id, date, open_price, close_price,high_price, low_price, volume_traded, adjusted_close, change_percent)

T6 :  Transactions (transaction_id, investor_id, stock_id, broker_id, transaction_type,transaction_date, quantity, price, total_amount, status)

T7 : Portfolios (portfolio_id, investor_id, stock_id, quantity, average_price,current_price, total_value, profit_loss, last_updated, status) 

T8 : IPO_Applications (application_id, investor_id, company_id, apply_date, lot_size,price_per_share, total_amount, status, allotment_date, demat_account) 

T9 : Dividends (dividend_id, company_id, announcement_date, record_date, payout_date,dividend_per_share, dividend_type, financial_year, total_payout, status) 

T10 : Watchlist (watchlist_id, investor_id, stock_id, added_date, target_price,alert_set, notes, priority_level, watch_status, status) 

T11 : Stock_Alerts (alert_id, investor_id, stock_id, alert_type, threshold_price,triggered, alert_message, created_at, triggered_at, status)

T12 : Analyst_Reports (report_id, stock_id, analyst_name, report_date, recommendation,target_price, report_summary, rating_out_of_5, published_by, statu)

T13 : Market_News (news_id, headline, content, published_date, category,source, related_stock_id, author, impact_level, status) 

T14 :  Stock_Splits (split_id, stock_id, split_ratio, announcement_date, record_date,ex_split_date, reason, approved_by, status, updated_at) 

T15 : Brokerage_Firms (firm_id, name, registration_number, headquarters, contact_email,contact_phone, founder_name, established_year, total_clients, rating) 

*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Investors
CREATE TABLE Investors (
    investor_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    date_of_birth DATE,
    gender VARCHAR(10),
    pan_number VARCHAR(20) UNIQUE,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50)
);

 -- Insert records into the table
INSERT INTO Investors (investor_id, name, email, phone_number, date_of_birth,gender, pan_number, address, city, state)
 VALUES
(1, 'Aarav Mehta', 'aarav.mehta@gmail.com', '9876543210', '1990-05-12', 'Male', 'AARPM1234K', 'A-12, Nehru Nagar', 'Mumbai', 'Maharashtra'),
(2, 'Sneha Iyer', 'sneha.iyer@yahoo.com', '9823456789', '1992-11-22', 'Female', 'SNHIY2345P', '15, Lakshmi Colony', 'Chennai', 'Tamil Nadu'),
(3, 'Rohan Gupta', 'rohan.gupta@rediffmail.com', '9812345678', '1988-07-30', 'Male', 'ROHGU8765T', 'Plot 33, Gomti Nagar', 'Lucknow', 'Uttar Pradesh'),
(4, 'Neha Sharma', 'neha.sharma@gmail.com', '9867894321', '1995-02-18', 'Female', 'NEHSR5432L', 'D-7, Vasant Vihar', 'Delhi', 'Delhi'),
(5, 'Amitabh Rao', 'amitabh.rao@gmail.com', '9845123498', '1987-10-03', 'Male', 'AMIRA4567Q', 'B-9, Banashankari', 'Bangalore', 'Karnataka'),
(6, 'Kavita Joshi', 'kavita.joshi@hotmail.com', '9789456123', '1993-03-15', 'Female', 'KAVJO3344M', 'C-22, Maninagar', 'Ahmedabad', 'Gujarat'),
(7, 'Rakesh Yadav', 'rakesh.yadav@gmail.com', '9876123401', '1991-09-19', 'Male', 'RAKYA7865U', 'J-10, Nadesar', 'Varanasi', 'Uttar Pradesh'),
(8, 'Meera Shah', 'meera.shah@yahoo.com', '9834012345', '1989-06-25', 'Female', 'MERSH1133P', 'Flat 5, Elphinstone Road', 'Mumbai', 'Maharashtra'),
(9, 'Vikram Desai', 'vikram.desai@gmail.com', '9890123456', '1990-01-07', 'Male', 'VIKDE9987W', 'G-6, Alkapuri', 'Vadodara', 'Gujarat'),
(10, 'Pooja Iyer', 'pooja.iyer@outlook.com', '9821345678', '1994-08-29', 'Female', 'POOIY2290K', '16, T. Nagar', 'Chennai', 'Tamil Nadu'),
(11, 'Rajiv Menon', 'rajiv.menon@gmail.com', '9812341234', '1985-12-10', 'Male', 'RAJME0912T', 'F-12, Panampilly Nagar', 'Kochi', 'Kerala'),
(12, 'Tanvi Nair', 'tanvi.nair@yahoo.in', '9845678901', '1996-04-20', 'Female', 'TANNA5609V', 'H-8, Kazhakootam', 'Thiruvananthapuram', 'Kerala'),
(13, 'Siddharth Iyer', 'siddharth.iyer@gmail.com', '9870987654', '1986-07-17', 'Male', 'SIDIY4567A', 'M-5, Banjara Hills', 'Hyderabad', 'Telangana'),
(14, 'Anjali Verma', 'anjali.verma@gmail.com', '9834567890', '1993-01-31', 'Female', 'ANJVE7834L', 'R-19, Gariahat', 'Kolkata', 'West Bengal'),
(15, 'Nikhil Deshmukh', 'nikhil.deshmukh@rediffmail.com', '9887654321', '1992-09-23', 'Male', 'NIKDE3456C', 'L-33, Shivaji Nagar', 'Pune', 'Maharashtra');

-- to display/retrieve table data
SELECT * FROM Investors;               

-- to remove complete data from table
truncate table Investors;

-- to delete complete attributes and records 
drop table Investors;

-- Table 2: Brokers
CREATE TABLE Brokers (
    broker_id INT PRIMARY KEY,
    broker_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    registered_date DATE,
    license_number VARCHAR(50) UNIQUE,
    firm_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    status VARCHAR(20)
);

 -- Insert records into the table
INSERT INTO Brokers (broker_id, broker_name, email, phone_number, registered_date,license_number, firm_name, city, state, status) 
    VALUES
(1, 'Suresh Mehta', 'suresh.mehta@zerodha.com', '9812345670', '2015-06-12', 'LICZM202301', 'Zerodha', 'Mumbai', 'Maharashtra', 'Active'),
(2, 'Pooja Rathi', 'pooja.rathi@angelbroking.com', '9876543219', '2016-07-15', 'LICAB202302', 'Angel Broking', 'Delhi', 'Delhi', 'Active'),
(3, 'Rahul Verma', 'rahul.verma@icicisec.com', '9823456701', '2017-03-10', 'LICIC202303', 'ICICI Securities', 'Lucknow', 'Uttar Pradesh', 'Active'),
(4, 'Neha Shah', 'neha.shah@hdfcsec.com', '9834567892', '2018-01-05', 'LICHD202304', 'HDFC Securities', 'Ahmedabad', 'Gujarat', 'Active'),
(5, 'Rohan Nair', 'rohan.nair@kotaksec.com', '9898765430', '2016-09-17', 'LICKO202305', 'Kotak Securities', 'Chennai', 'Tamil Nadu', 'Active'),
(6, 'Tanvi Iyer', 'tanvi.iyer@motilaloswal.com', '9801234567', '2015-12-21', 'LICMO202306', 'Motilal Oswal', 'Bangalore', 'Karnataka', 'Active'),
(7, 'Kunal Bansal', 'kunal.bansal@upstox.com', '9845678910', '2019-04-08', 'LICUP202307', 'Upstox', 'Pune', 'Maharashtra', 'Active'),
(8, 'Meera Kulkarni', 'meera.kulkarni@5paisa.com', '9812233445', '2020-05-14', 'LIC5P202308', '5Paisa', 'Nagpur', 'Maharashtra', 'Active'),
(9, 'Ankit Desai', 'ankit.desai@edelweiss.com', '9887654320', '2017-11-02', 'LICED202309', 'Edelweiss', 'Surat', 'Gujarat', 'Active'),
(10, 'Divya Nair', 'divya.nair@icicisec.com', '9856123498', '2018-06-30', 'LICIC202310', 'ICICI Securities', 'Kochi', 'Kerala', 'Active'),
(11, 'Rakesh Patil', 'rakesh.patil@angelbroking.com', '9830145623', '2019-08-25', 'LICAB202311', 'Angel Broking', 'Nashik', 'Maharashtra', 'Active'),
(12, 'Sneha Joshi', 'sneha.joshi@zerodha.com', '9821345674', '2020-10-12', 'LICZM202312', 'Zerodha', 'Indore', 'Madhya Pradesh', 'Active'),
(13, 'Aditya Rao', 'aditya.rao@hdfcsec.com', '9809876543', '2015-04-01', 'LICHD202313', 'HDFC Securities', 'Hyderabad', 'Telangana', 'Active'),
(14, 'Kritika Jain', 'kritika.jain@motilaloswal.com', '9876543201', '2016-11-19', 'LICMO202314', 'Motilal Oswal', 'Jaipur', 'Rajasthan', 'Active'),
(15, 'Nitin Saxena', 'nitin.saxena@edelweiss.com', '9812340987', '2017-02-14', 'LICED202315', 'Edelweiss', 'Bhopal', 'Madhya Pradesh', 'Active');

-- to display/retrieve table data
SELECT * FROM Brokers;               

-- to remove complete data from table
truncate table Brokers;

-- to delete complete attributes and records 
drop table Brokers;

-- Table 3: Companies
CREATE TABLE Companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    ceo_name VARCHAR(100),
    sector VARCHAR(50),
    founded_year INT,
    headquarters_city VARCHAR(50),
    headquarters_state VARCHAR(50),
    pan_number VARCHAR(20) UNIQUE,
    cin_number VARCHAR(30) UNIQUE,
    status VARCHAR(20)
);

 -- Insert into the table
INSERT INTO Companies (company_id, company_name, ceo_name, sector, founded_year,headquarters_city, headquarters_state, pan_number, cin_number, status) 
VALUES
(1, 'Reliance Industries', 'Mukesh Ambani', 'Energy', 1966, 'Mumbai', 'Maharashtra', 'RELI1234P', 'L17110MH1973PLC019786', 'Active'),
(2, 'Tata Consultancy Services', 'Rajesh Gopinathan', 'IT Services', 1968, 'Mumbai', 'Maharashtra', 'TCSL5678Q', 'L22210MH1995PLC084781', 'Active'),
(3, 'Infosys Ltd', 'Salil Parekh', 'IT Services', 1981, 'Bangalore', 'Karnataka', 'INFO8765R', 'L85110KA1981PLC013115', 'Active'),
(4, 'HDFC Bank', 'Sashidhar Jagdishan', 'Banking', 1994, 'Mumbai', 'Maharashtra', 'HDFB2345M', 'L65920MH1994PLC080618', 'Active'),
(5, 'ICICI Bank', 'Sandeep Bakhshi', 'Banking', 1994, 'Mumbai', 'Maharashtra', 'ICIC5432N', 'L65190MH1994PLC077472', 'Active'),
(6, 'State Bank of India', 'Dinesh Khara', 'Banking', 1955, 'Mumbai', 'Maharashtra', 'SBIN0987S', 'L99999MH1955GOI000009', 'Active'),
(7, 'Bharti Airtel', 'Gopal Vittal', 'Telecom', 1995, 'New Delhi', 'Delhi', 'BHAI3456K', 'L74899DL1995PLC070609', 'Active'),
(8, 'Wipro Ltd', 'Thierry Delaporte', 'IT Services', 1945, 'Bangalore', 'Karnataka', 'WIPR3210Z', 'L32102KA1945PLC020800', 'Active'),
(9, 'Adani Enterprises', 'Gautam Adani', 'Infrastructure', 1988, 'Ahmedabad', 'Gujarat', 'ADAE9988B', 'L51100GJ1993PLC019067', 'Active'),
(10, 'Asian Paints', 'Amit Syngle', 'Chemicals', 1942, 'Mumbai', 'Maharashtra', 'ASPA1122J', 'L24220MH1945PLC004598', 'Active'),
(11, 'Nestle India', 'Suresh Narayanan', 'FMCG', 1959, 'Gurgaon', 'Haryana', 'NESI9090Q', 'L15202DL1959PLC003786', 'Active'),
(12, 'ITC Ltd', 'Sanjiv Puri', 'FMCG', 1910, 'Kolkata', 'West Bengal', 'ITCL6611F', 'L16005WB1910PLC001985', 'Active'),
(13, 'Tata Motors', 'PB Balaji', 'Automobile', 1945, 'Mumbai', 'Maharashtra', 'TATM8763C', 'L28920MH1945PLC004520', 'Active'),
(14, 'Zomato Ltd', 'Deepinder Goyal', 'Food Tech', 2008, 'Gurgaon', 'Haryana', 'ZOMA5533H', 'U93030DL2010PTC198141', 'Active'),
(15, 'Nykaa', 'Falguni Nayar', 'E-Commerce', 2012, 'Mumbai', 'Maharashtra', 'NYKA7722T', 'U51909MH2012PTC232845', 'Active');

-- to display/retrieve table data
SELECT * FROM Companies;               

-- to remove complete data from table
truncate table Companies;

-- to delete complete attributes and records 
drop table Companies;

-- Table 4: Stocks
CREATE TABLE Stocks (
    stock_id INT PRIMARY KEY,
    company_id INT,
    symbol VARCHAR(10) UNIQUE,
    exchange VARCHAR(50),
    face_value DECIMAL(10,2),
    total_shares BIGINT,
    market_cap DECIMAL(20,2),
    pe_ratio DECIMAL(5,2),
    dividend_yield DECIMAL(5,2),
    status VARCHAR(20),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

-- Insert records into the table
INSERT INTO Stocks (stock_id, company_id, symbol, exchange, face_value,total_shares, market_cap, pe_ratio, dividend_yield, status)
    VALUES
(1, 1, 'RELI', 'NSE', 10.00, 6450000000, 1850000000000.00, 25.40, 0.30, 'Active'),
(2, 2, 'TCS', 'BSE', 1.00, 3750000000, 1340000000000.00, 30.10, 1.20, 'Active'),
(3, 3, 'INFY', 'NSE', 5.00, 4300000000, 850000000000.00, 28.00, 2.00, 'Active'),
(4, 4, 'HDFCBANK', 'BSE', 2.00, 5600000000, 1050000000000.00, 20.50, 1.50, 'Active'),
(5, 5, 'ICICIBANK', 'NSE', 2.00, 5800000000, 900000000000.00, 18.70, 1.80, 'Active'),
(6, 6, 'SBIN', 'NSE', 10.00, 8920000000, 600000000000.00, 14.90, 2.30, 'Active'),
(7, 7, 'AIRTEL', 'BSE', 5.00, 5400000000, 450000000000.00, 45.00, 0.80, 'Active'),
(8, 8, 'WIPRO', 'NSE', 2.00, 5470000000, 270000000000.00, 22.10, 0.90, 'Active'),
(9, 9, 'ADANIENT', 'BSE', 1.00, 1120000000, 190000000000.00, 100.00, 0.10, 'Active'),
(10, 10, 'ASIANPAINT', 'NSE', 1.00, 960000000, 310000000000.00, 65.00, 0.60, 'Active'),
(11, 11, 'NESTLEIND', 'BSE', 10.00, 96415710, 180000000000.00, 72.50, 1.10, 'Active'),
(12, 12, 'ITC', 'NSE', 1.00, 12300000000, 520000000000.00, 22.20, 4.00, 'Active'),
(13, 13, 'TATAMOTORS', 'BSE', 2.00, 3590000000, 180000000000.00, 12.30, 1.00, 'Active'),
(14, 14, 'ZOMATO', 'NSE', 1.00, 8400000000, 66000000000.00, 500.00, 0.00, 'Active'),
(15, 15, 'NYKAA', 'BSE', 1.00, 470000000, 45000000000.00, 200.00, 0.00, 'Active');

-- to display/retrieve table data
SELECT * FROM Stocks;               

-- to remove complete data from table
truncate table Stocks;

-- to delete complete attributes and records 
drop table Stocks;

-- Table 5: Stock_Prices
CREATE TABLE Stock_Prices (
    price_id INT PRIMARY KEY,
    stock_id INT,
    date DATE,
    open_price DECIMAL(10,2),
    close_price DECIMAL(10,2),
    high_price DECIMAL(10,2),
    low_price DECIMAL(10,2),
    volume_traded BIGINT,
    adjusted_close DECIMAL(10,2),
    change_percent DECIMAL(5,2),
    FOREIGN KEY (stock_id) REFERENCES Stocks(stock_id)
);

-- Insert records into the table
INSERT INTO Stock_Prices (price_id, stock_id, date, open_price, close_price,high_price, low_price, volume_traded, adjusted_close, change_percent)
 VALUES
(1, 1, '2025-07-01', 2750.00, 2785.00, 2800.00, 2740.00, 2200000, 2785.00, 1.27),
(2, 2, '2025-07-01', 3720.00, 3700.00, 3750.00, 3690.00, 1800000, 3700.00, -0.54),
(3, 3, '2025-07-01', 1580.00, 1605.00, 1610.00, 1575.00, 2000000, 1605.00, 1.58),
(4, 4, '2025-07-01', 1680.00, 1670.00, 1700.00, 1665.00, 2500000, 1670.00, -0.59),
(5, 5, '2025-07-01', 980.00, 990.00, 995.00, 975.00, 2300000, 990.00, 1.02),
(6, 6, '2025-07-01', 710.00, 720.00, 725.00, 705.00, 2700000, 720.00, 1.41),
(7, 7, '2025-07-01', 880.00, 875.00, 890.00, 870.00, 1500000, 875.00, -0.57),
(8, 8, '2025-07-01', 410.00, 415.00, 420.00, 408.00, 1300000, 415.00, 1.22),
(9, 9, '2025-07-01', 2350.00, 2400.00, 2420.00, 2330.00, 1100000, 2400.00, 2.13),
(10, 10, '2025-07-01', 3400.00, 3380.00, 3420.00, 3360.00, 900000, 3380.00, -0.59),
(11, 11, '2025-07-01', 25000.00, 24800.00, 25100.00, 24700.00, 300000, 24800.00, -0.80),
(12, 12, '2025-07-01', 470.00, 465.00, 475.00, 460.00, 5000000, 465.00, -1.06),
(13, 13, '2025-07-01', 680.00, 695.00, 700.00, 675.00, 3200000, 695.00, 2.21),
(14, 14, '2025-07-01', 125.00, 120.00, 128.00, 118.00, 7000000, 120.00, -4.00),
(15, 15, '2025-07-01', 158.00, 162.00, 165.00, 157.00, 4200000, 162.00, 2.53);

-- to display/retrieve table data
SELECT * FROM Stock_Prices;               

-- to remove complete data from table
truncate table Stock_Prices;

-- to delete complete attributes and records 
drop table Stock_Prices;

-- Table 6: Transactions
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    broker_id INT,
    transaction_type VARCHAR(10),
    transaction_date DATE,
    quantity INT,
    price DECIMAL(10,2),
    total_amount DECIMAL(15,2),
    status VARCHAR(20),
    FOREIGN KEY (investor_id) REFERENCES Investors(investor_id),
    FOREIGN KEY (stock_id) REFERENCES Stocks(stock_id),
    FOREIGN KEY (broker_id) REFERENCES Brokers(broker_id)
);

-- Insert records into the table
INSERT INTO Transactions (transaction_id, investor_id, stock_id, broker_id, transaction_type,transaction_date, quantity, price, total_amount, status)
 VALUES
(1, 1, 1, 1, 'Buy', '2025-07-01', 10, 2785.00, 27850.00, 'Completed'),
(2, 2, 2, 2, 'Buy', '2025-07-01', 5, 3700.00, 18500.00, 'Completed'),
(3, 3, 3, 3, 'Sell', '2025-07-01', 8, 1605.00, 12840.00, 'Completed'),
(4, 4, 4, 4, 'Buy', '2025-07-01', 15, 1670.00, 25050.00, 'Completed'),
(5, 5, 5, 5, 'Sell', '2025-07-01', 12, 990.00, 11880.00, 'Completed'),
(6, 6, 6, 6, 'Buy', '2025-07-01', 20, 720.00, 14400.00, 'Completed'),
(7, 7, 7, 7, 'Buy', '2025-07-01', 25, 875.00, 21875.00, 'Completed'),
(8, 8, 8, 8, 'Sell', '2025-07-01', 18, 415.00, 7470.00, 'Completed'),
(9, 9, 9, 9, 'Buy', '2025-07-01', 6, 2400.00, 14400.00, 'Completed'),
(10, 10, 10, 10, 'Sell', '2025-07-01', 4, 3380.00, 13520.00, 'Completed'),
(11, 11, 11, 11, 'Buy', '2025-07-01', 1, 24800.00, 24800.00, 'Completed'),
(12, 12, 12, 12, 'Buy', '2025-07-01', 30, 465.00, 13950.00, 'Completed'),
(13, 13, 13, 13, 'Sell', '2025-07-01', 22, 695.00, 15290.00, 'Completed'),
(14, 14, 14, 14, 'Buy', '2025-07-01', 40, 120.00, 4800.00, 'Completed'),
(15, 15, 15, 15, 'Buy', '2025-07-01', 35, 162.00, 5670.00, 'Completed');

-- to display/retrieve table data
SELECT * FROM Transactions;               

-- to remove complete data from table
truncate table Transactions;

-- to delete complete attributes and records 
drop table Transactions;

-- Table 7: Portfolios
CREATE TABLE Portfolios (
    portfolio_id INT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    quantity INT,
    average_price DECIMAL(10,2),
    current_price DECIMAL(10,2),
    total_value DECIMAL(15,2),
    profit_loss DECIMAL(15,2),
    last_updated DATE,
    status VARCHAR(20),
    FOREIGN KEY (investor_id) REFERENCES Investors(investor_id),
    FOREIGN KEY (stock_id) REFERENCES Stocks(stock_id)
);

-- Insert records into the table
INSERT INTO Portfolios (portfolio_id, investor_id, stock_id, quantity, average_price,current_price, total_value, profit_loss, last_updated, status) 
VALUES
(1, 1, 1, 10, 2700.00, 2785.00, 27850.00, 850.00, '2025-07-01', 'Active'),
(2, 2, 2, 5, 3600.00, 3700.00, 18500.00, 500.00, '2025-07-01', 'Active'),
(3, 3, 3, 8, 1500.00, 1605.00, 12840.00, 840.00, '2025-07-01', 'Active'),
(4, 4, 4, 15, 1600.00, 1670.00, 25050.00, 1050.00, '2025-07-01', 'Active'),
(5, 5, 5, 12, 950.00, 990.00, 11880.00, 480.00, '2025-07-01', 'Active'),
(6, 6, 6, 20, 700.00, 720.00, 14400.00, 400.00, '2025-07-01', 'Active'),
(7, 7, 7, 25, 860.00, 875.00, 21875.00, 375.00, '2025-07-01', 'Active'),
(8, 8, 8, 18, 400.00, 415.00, 7470.00, 270.00, '2025-07-01', 'Active'),
(9, 9, 9, 6, 2300.00, 2400.00, 14400.00, 600.00, '2025-07-01', 'Active'),
(10, 10, 10, 4, 3300.00, 3380.00, 13520.00, 320.00, '2025-07-01', 'Active'),
(11, 11, 11, 1, 24500.00, 24800.00, 24800.00, 300.00, '2025-07-01', 'Active'),
(12, 12, 12, 30, 450.00, 465.00, 13950.00, 450.00, '2025-07-01', 'Active'),
(13, 13, 13, 22, 680.00, 695.00, 15290.00, 330.00, '2025-07-01', 'Active'),
(14, 14, 14, 40, 115.00, 120.00, 4800.00, 200.00, '2025-07-01', 'Active'),
(15, 15, 15, 35, 160.00, 162.00, 5670.00, 70.00, '2025-07-01', 'Active');

-- to display/retrieve table data
SELECT * FROM Portfolios;               

-- to remove complete data from table
truncate table Portfolios;

-- to delete complete attributes and records 
drop table Portfolios;

 -- Table 8: IPO_Applications
 CREATE TABLE IPO_Applications (
    application_id INT PRIMARY KEY,
    investor_id INT,
    company_id INT,
    apply_date DATE,
    lot_size INT,
    price_per_share DECIMAL(10,2),
    total_amount DECIMAL(15,2),
    status VARCHAR(20),
    allotment_date DATE,
    demat_account VARCHAR(20),
    FOREIGN KEY (investor_id) REFERENCES Investors(investor_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

-- Insert records into the table
INSERT INTO IPO_Applications (application_id, investor_id, company_id, apply_date, lot_size,price_per_share, total_amount, status, allotment_date, demat_account) 
VALUES
(1, 1, 15, '2025-06-20', 1, 160.00, 160.00, 'Allotted', '2025-06-27', 'IN1234567890'),
(2, 2, 14, '2025-06-21', 2, 125.00, 250.00, 'Rejected', NULL, 'IN1234567891'),
(3, 3, 13, '2025-06-22', 3, 680.00, 2040.00, 'Allotted', '2025-06-29', 'IN1234567892'),
(4, 4, 12, '2025-06-23', 1, 470.00, 470.00, 'Allotted', '2025-06-30', 'IN1234567893'),
(5, 5, 11, '2025-06-20', 2, 25000.00, 50000.00, 'Rejected', NULL, 'IN1234567894'),
(6, 6, 10, '2025-06-21', 1, 3400.00, 3400.00, 'Allotted', '2025-06-27', 'IN1234567895'),
(7, 7, 9, '2025-06-22', 2, 2350.00, 4700.00, 'Allotted', '2025-06-28', 'IN1234567896'),
(8, 8, 8, '2025-06-23', 3, 410.00, 1230.00, 'Rejected', NULL, 'IN1234567897'),
(9, 9, 7, '2025-06-24', 1, 880.00, 880.00, 'Allotted', '2025-06-30', 'IN1234567898'),
(10, 10, 6, '2025-06-25', 2, 710.00, 1420.00, 'Allotted', '2025-07-01', 'IN1234567899'),
(11, 11, 5, '2025-06-26', 2, 980.00, 1960.00, 'Rejected', NULL, 'IN1234567800'),
(12, 12, 4, '2025-06-27', 3, 1680.00, 5040.00, 'Allotted', '2025-07-02', 'IN1234567801'),
(13, 13, 3, '2025-06-28', 1, 1580.00, 1580.00, 'Allotted', '2025-07-03', 'IN1234567802'),
(14, 14, 2, '2025-06-29', 2, 3720.00, 7440.00, 'Rejected', NULL, 'IN1234567803'),
(15, 15, 1, '2025-06-30', 1, 2750.00, 2750.00, 'Allotted', '2025-07-04', 'IN1234567804');

-- to display/retrieve table data
SELECT * FROM IPO_Applications;               

-- to remove complete data from table
truncate table IPO_Applications;

-- to delete complete attributes and records 
drop table IPO_Applications;

-- Table 9 : Dividends
CREATE TABLE Dividends (
    dividend_id INT PRIMARY KEY,
    company_id INT,
    announcement_date DATE,
    record_date DATE,
    payout_date DATE,
    dividend_per_share DECIMAL(10,2),
    dividend_type VARCHAR(20),
    financial_year VARCHAR(10),
    total_payout DECIMAL(15,2),
    status VARCHAR(20),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

-- Insert records into the table
INSERT INTO Dividends (dividend_id, company_id, announcement_date, record_date, payout_date,dividend_per_share, dividend_type, financial_year, total_payout, status) 
VALUES
(1, 1, '2025-06-01', '2025-06-10', '2025-06-20', 7.00, 'Final', '2024-25', 4500000000.00, 'Paid'),
(2, 2, '2025-05-25', '2025-06-05', '2025-06-15', 22.00, 'Interim', '2024-25', 8250000000.00, 'Paid'),
(3, 3, '2025-05-20', '2025-05-30', '2025-06-10', 18.00, 'Final', '2024-25', 7740000000.00, 'Paid'),
(4, 4, '2025-05-10', '2025-05-20', '2025-06-01', 16.00, 'Interim', '2024-25', 8960000000.00, 'Paid'),
(5, 5, '2025-05-05', '2025-05-15', '2025-05-30', 14.50, 'Final', '2024-25', 8410000000.00, 'Paid'),
(6, 6, '2025-04-30', '2025-05-10', '2025-05-25', 13.00, 'Interim', '2024-25', 11596000000.00, 'Paid'),
(7, 7, '2025-04-25', '2025-05-05', '2025-05-20', 8.00, 'Final', '2024-25', 4320000000.00, 'Paid'),
(8, 8, '2025-04-20', '2025-04-30', '2025-05-15', 9.50, 'Interim', '2024-25', 5196500000.00, 'Paid'),
(9, 9, '2025-04-15', '2025-04-25', '2025-05-10', 5.00, 'Final', '2024-25', 560000000.00, 'Paid'),
(10, 10, '2025-04-10', '2025-04-20', '2025-05-05', 12.00, 'Final', '2024-25', 1152000000.00, 'Paid'),
(11, 11, '2025-04-05', '2025-04-15', '2025-04-30', 85.00, 'Interim', '2024-25', 819533350.00, 'Paid'),
(12, 12, '2025-04-01', '2025-04-10', '2025-04-25', 11.50, 'Final', '2024-25', 141450000000.00, 'Paid'),
(13, 13, '2025-03-28', '2025-04-08', '2025-04-20', 10.00, 'Interim', '2024-25', 3590000000.00, 'Paid'),
(14, 14, '2025-03-25', '2025-04-05', '2025-04-18', 1.00, 'Final', '2024-25', 84000000.00, 'Paid'),
(15, 15, '2025-03-20', '2025-04-01', '2025-04-15', 2.50, 'Interim', '2024-25', 117500000.00, 'Paid');

-- to display/retrieve table data
SELECT * FROM Dividends;               

-- to remove complete data from table
truncate table Dividends;

-- to delete complete attributes and records 
drop table Dividends;

-- Table 10: WatchList
CREATE TABLE Watchlist (
    watchlist_id INT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    added_date DATE,
    target_price DECIMAL(10,2),
    alert_set BOOLEAN,
    notes TEXT,
    priority_level INT,
    watch_status VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (investor_id) REFERENCES Investors(investor_id),
    FOREIGN KEY (stock_id) REFERENCES Stocks(stock_id)
);

-- Insert records into the table
INSERT INTO Watchlist (watchlist_id, investor_id, stock_id, added_date, target_price,alert_set, notes, priority_level, watch_status, status) 
VALUES
(1, 1, 1, '2025-07-01', 2800.00, TRUE, 'Expecting breakout soon', 1, 'Watching', 'Active'),
(2, 2, 2, '2025-07-01', 3750.00, TRUE, 'Good results expected', 2, 'Watching', 'Active'),
(3, 3, 3, '2025-07-01', 1620.00, FALSE, 'Check quarterly earnings', 3, 'Pending', 'Active'),
(4, 4, 4, '2025-07-01', 1700.00, TRUE, 'Holding for long term', 1, 'Watching', 'Active'),
(5, 5, 5, '2025-07-01', 1000.00, TRUE, 'Will add on dip', 2, 'Watching', 'Active'),
(6, 6, 6, '2025-07-01', 730.00, FALSE, 'Volatile stock', 3, 'Pending', 'Active'),
(7, 7, 7, '2025-07-01', 890.00, TRUE, 'Telecom reforms coming', 1, 'Watching', 'Active'),
(8, 8, 8, '2025-07-01', 430.00, FALSE, 'Watch after results', 2, 'Watching', 'Active'),
(9, 9, 9, '2025-07-01', 2500.00, TRUE, 'High growth potential', 1, 'Watching', 'Active'),
(10, 10, 10, '2025-07-01', 3450.00, FALSE, 'FMCG sector bet', 2, 'Pending', 'Active'),
(11, 11, 11, '2025-07-01', 26000.00, TRUE, 'Premium stock', 1, 'Watching', 'Active'),
(12, 12, 12, '2025-07-01', 475.00, TRUE, 'Strong dividend history', 3, 'Watching', 'Active'),
(13, 13, 13, '2025-07-01', 700.00, FALSE, 'Auto recovery ahead', 2, 'Watching', 'Active'),
(14, 14, 14, '2025-07-01', 130.00, TRUE, 'Startup interest', 1, 'Watching', 'Active'),
(15, 15, 15, '2025-07-01', 170.00, TRUE, 'Looking strong', 2, 'Watching', 'Active');

-- to display/retrieve table data
SELECT * FROM Watchlist;               

-- to remove complete data from table
truncate table Watchlist;

-- to delete complete attributes and records 
drop table Watchlist;

-- Table 11: Stock_Alerts
CREATE TABLE Stock_Alerts (
    alert_id INT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    alert_type VARCHAR(50),
    threshold_price DECIMAL(10,2),
    triggered BOOLEAN,
    alert_message TEXT,
    created_at DATE,
    triggered_at DATE,
    status VARCHAR(20),
    FOREIGN KEY (investor_id) REFERENCES Investors(investor_id),
    FOREIGN KEY (stock_id) REFERENCES Stocks(stock_id)
);

-- Insert records into the table	
INSERT INTO Stock_Alerts (alert_id, investor_id, stock_id, alert_type, threshold_price,triggered, alert_message, created_at, triggered_at, status)
 VALUES
(1, 1, 1, 'Price Above', 2800.00, TRUE, 'Reliance crossed ₹2800', '2025-06-25', '2025-07-01', 'Triggered'),
(2, 2, 2, 'Price Below', 3600.00, FALSE, 'TCS nearing ₹3600', '2025-06-26', NULL, 'Active'),
(3, 3, 3, 'Price Above', 1600.00, TRUE, 'Infosys crossed ₹1600', '2025-06-27', '2025-07-01', 'Triggered'),
(4, 4, 4, 'Price Above', 1700.00, FALSE, 'HDFC Bank watch for ₹1700', '2025-06-28', NULL, 'Active'),
(5, 5, 5, 'Price Below', 950.00, FALSE, 'ICICI Bank below ₹950', '2025-06-29', NULL, 'Active'),
(6, 6, 6, 'Price Above', 725.00, TRUE, 'SBI touched ₹725', '2025-06-28', '2025-07-01', 'Triggered'),
(7, 7, 7, 'Price Above', 880.00, FALSE, 'Airtel close to ₹880', '2025-06-30', NULL, 'Active'),
(8, 8, 8, 'Price Above', 420.00, FALSE, 'Wipro eyeing ₹420', '2025-06-30', NULL, 'Active'),
(9, 9, 9, 'Price Above', 2400.00, TRUE, 'Adani Ent. touched ₹2400', '2025-06-25', '2025-07-01', 'Triggered'),
(10, 10, 10, 'Price Below', 3300.00, FALSE, 'Asian Paints near ₹3300', '2025-06-29', NULL, 'Active'),
(11, 11, 11, 'Price Above', 25000.00, FALSE, 'Nestle to cross ₹25000', '2025-06-30', NULL, 'Active'),
(12, 12, 12, 'Price Above', 470.00, TRUE, 'ITC at ₹470 today', '2025-06-26', '2025-07-01', 'Triggered'),
(13, 13, 13, 'Price Above', 700.00, FALSE, 'Tata Motors may hit ₹700', '2025-06-29', NULL, 'Active'),
(14, 14, 14, 'Price Below', 120.00, TRUE, 'Zomato dipped below ₹120', '2025-06-30', '2025-07-01', 'Triggered'),
(15, 15, 15, 'Price Above', 165.00, TRUE, 'Nykaa moved above ₹165', '2025-06-30', '2025-07-01', 'Triggered');

-- to display/retrieve table data
SELECT * FROM Stock_Alerts;               

-- to remove complete data from table
truncate table Stock_Alerts;

-- to delete complete attributes and records 
drop table Stock_Alerts;

-- Table 12: Analyst_Reports   
CREATE TABLE Analyst_Reports (
    report_id INT PRIMARY KEY,
    stock_id INT,
    analyst_name VARCHAR(100),
    report_date DATE,
    recommendation VARCHAR(20),
    target_price DECIMAL(10,2),
    report_summary TEXT,
    rating_out_of_5 DECIMAL(3,2),
    published_by VARCHAR(100),
    status VARCHAR(20),
    FOREIGN KEY (stock_id) REFERENCES Stocks(stock_id)
);

INSERT INTO Analyst_Reports (report_id, stock_id, analyst_name, report_date, recommendation,target_price, report_summary, rating_out_of_5, published_by, status)
    VALUES
(1, 1, 'Ankit Sharma', '2025-06-28', 'Buy', 2900.00, 'Strong growth in energy sector', 4.5, 'ICICI Securities', 'Published'),
(2, 2, 'Riya Iyer', '2025-06-27', 'Hold', 3800.00, 'Moderate Q1 performance', 3.8, 'Motilal Oswal', 'Published'),
(3, 3, 'Siddharth Nair', '2025-06-26', 'Buy', 1650.00, 'Digital revenue improving', 4.2, 'HDFC Securities', 'Published'),
(4, 4, 'Priya Mehta', '2025-06-25', 'Buy', 1750.00, 'Strong retail banking performance', 4.6, 'Axis Direct', 'Published'),
(5, 5, 'Arjun Joshi', '2025-06-24', 'Sell', 960.00, 'Asset quality concerns', 2.9, 'Kotak Institutional', 'Published'),
(6, 6, 'Sneha Rao', '2025-06-23', 'Hold', 740.00, 'Stable government support', 3.5, 'ICICI Securities', 'Published'),
(7, 7, 'Rahul Desai', '2025-06-22', 'Buy', 900.00, '5G rollout benefit', 4.4, 'Geojit', 'Published'),
(8, 8, 'Tanvi Agarwal', '2025-06-21', 'Hold', 430.00, 'Flat results, maintain rating', 3.7, 'Angel One', 'Published'),
(9, 9, 'Manav Kulkarni', '2025-06-20', 'Buy', 2450.00, 'Strong infra growth outlook', 4.8, 'Motilal Oswal', 'Published'),
(10, 10, 'Neha Saxena', '2025-06-19', 'Sell', 3350.00, 'Margins under pressure', 2.5, 'IIFL', 'Published'),
(11, 11, 'Ashok Verma', '2025-06-18', 'Buy', 26000.00, 'Strong brand & growth', 4.9, 'Sharekhan', 'Published'),
(12, 12, 'Deepika Singh', '2025-06-17', 'Hold', 480.00, 'Stable growth, good dividend', 3.9, 'ICICI Direct', 'Published'),
(13, 13, 'Ritesh Pillai', '2025-06-16', 'Buy', 720.00, 'Auto demand recovery seen', 4.3, 'Axis Capital', 'Published'),
(14, 14, 'Kavya Suresh', '2025-06-15', 'Sell', 118.00, 'High burn rate concern', 2.8, 'JM Financial', 'Published'),
(15, 15, 'Harshita Malhotra', '2025-06-14', 'Buy', 170.00, 'Beauty sector expanding', 4.1, 'Motilal Oswal', 'Published');

-- to display/retrieve table data
SELECT * FROM Analyst_Reports;               

-- to remove complete data from table
truncate table Analyst_Reports;

-- to delete complete attributes and records 
drop table Analyst_Reports;

-- Table 13: Market_news
CREATE TABLE Market_News (
    news_id INT PRIMARY KEY,
    headline VARCHAR(200),
    content TEXT,
    published_date DATE,
    category VARCHAR(50),
    source VARCHAR(100),
    related_stock_id INT,
    author VARCHAR(100),
    impact_level VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (related_stock_id) REFERENCES Stocks(stock_id)
);

-- Insert records into the table
INSERT INTO Market_News (news_id, headline, content, published_date, category,source, related_stock_id, author, impact_level, status) 
VALUES
(1, 'Reliance to expand retail arm', 'Reliance Industries plans ₹20,000 Cr investment in retail segment.', '2025-06-30', 'Business', 'Economic Times', 1, 'Nidhi Shah', 'High', 'Published'),
(2, 'TCS bags $1.5B contract', 'TCS secures deal with US bank for digital transformation.', '2025-06-29', 'IT Sector', 'Mint', 2, 'Anil Sharma', 'Medium', 'Published'),
(3, 'Infosys Q1 results beat estimates', 'Infosys posts 12% YoY rise in net profit.', '2025-06-28', 'Earnings', 'Business Standard', 3, 'Riya Desai', 'Medium', 'Published'),
(4, 'HDFC Bank expands rural outreach', 'New 250 branches in tier-3 cities announced.', '2025-06-27', 'Banking', 'Financial Express', 4, 'Amit Rao', 'Low', 'Published'),
(5, 'ICICI Bank launches fintech subsidiary', 'The subsidiary to focus on digital lending.', '2025-06-26', 'Finance', 'Moneycontrol', 5, 'Divya Patel', 'High', 'Published'),
(6, 'SBI to raise ₹10,000 Cr via bonds', 'State Bank of India to issue bonds for expansion.', '2025-06-25', 'Banking', 'LiveMint', 6, 'Rahul Vyas', 'Medium', 'Published'),
(7, 'Bharti Airtel rolls out 5G services', 'Launch covers all metro cities in phase 1.', '2025-06-24', 'Telecom', 'Telecom Today', 7, 'Sneha Kapoor', 'High', 'Published'),
(8, 'Wipro appoints new CEO', 'Rajiv Menon to replace outgoing CEO in September.', '2025-06-23', 'Corporate', 'CNBC TV18', 8, 'Arjun Mehra', 'Medium', 'Published'),
(9, 'Adani Ent secures green energy project', '₹15,000 Cr contract in Gujarat for solar parks.', '2025-06-22', 'Energy', 'TOI Business', 9, 'Swati Joshi', 'High', 'Published'),
(10, 'Asian Paints sees demand rise', 'Monsoon boost leads to higher rural sales.', '2025-06-21', 'Consumer Goods', 'Hindu Business Line', 10, 'Kavita Joshi', 'Low', 'Published'),
(11, 'Nestle India to increase local sourcing', 'Plan to source 80% of raw materials locally.', '2025-06-20', 'FMCG', 'ET Now', 11, 'Priyanshu Jain', 'Low', 'Published'),
(12, 'ITC hits 52-week high', 'Driven by strong hotel and FMCG performance.', '2025-06-19', 'Market', 'Zee Business', 12, 'Tanya Deshmukh', 'Medium', 'Published'),
(13, 'Tata Motors launches EV SUV', '₹20 lakh vehicle unveiled with 500 km range.', '2025-06-18', 'Auto', 'Business Today', 13, 'Ankit Bhatia', 'High', 'Published'),
(14, 'Zomato expands to tier-2 cities', 'New kitchens launched in 30 towns.', '2025-06-17', 'Startups', 'YourStory', 14, 'Neha Khanna', 'Medium', 'Published'),
(15, 'Nykaa partners with international brands', 'Exclusive launch of 10 new cosmetic labels.', '2025-06-16', 'Retail', 'MoneyControl', 15, 'Shruti Iyer', 'Low', 'Published');

-- to display/retrieve table data
SELECT * FROM Market_News;               

-- to remove complete data from table
truncate table Market_News;

-- to delete complete attributes and records 
drop table Market_News;

 -- Table 14: Stock_Splits
 CREATE TABLE Stock_Splits (
    split_id INT PRIMARY KEY,
    stock_id INT,
    split_ratio VARCHAR(10),
    announcement_date DATE,
    record_date DATE,
    ex_split_date DATE,
    reason TEXT,
    approved_by VARCHAR(100),
    status VARCHAR(20),
    updated_at DATE,
    FOREIGN KEY (stock_id) REFERENCES Stocks(stock_id)
);

-- Insert records into the table
INSERT INTO Stock_Splits (split_id, stock_id, split_ratio, announcement_date, record_date,ex_split_date, reason, approved_by, status, updated_at) 
VALUES
(1, 1, '1:5', '2025-06-10', '2025-06-25', '2025-06-27', 'Enhance liquidity', 'SEBI', 'Completed', '2025-06-28'),
(2, 2, '1:2', '2025-06-11', '2025-06-26', '2025-06-28', 'Attract retail investors', 'SEBI', 'Completed', '2025-06-29'),
(3, 3, '1:3', '2025-06-12', '2025-06-27', '2025-06-29', 'Increase affordability', 'SEBI', 'Completed', '2025-06-30'),
(4, 4, '1:2', '2025-06-13', '2025-06-28', '2025-06-30', 'Shareholder value boost', 'SEBI', 'Completed', '2025-07-01'),
(5, 5, '1:4', '2025-06-14', '2025-06-29', '2025-07-01', 'Better price range', 'SEBI', 'Completed', '2025-07-02'),
(6, 6, '1:2', '2025-06-15', '2025-06-30', '2025-07-02', 'Improve trading volume', 'SEBI', 'Completed', '2025-07-03'),
(7, 7, '1:10', '2025-06-16', '2025-07-01', '2025-07-03', 'Stock restructuring', 'SEBI', 'Completed', '2025-07-04'),
(8, 8, '1:5', '2025-06-17', '2025-07-02', '2025-07-04', 'Retail engagement', 'SEBI', 'Completed', '2025-07-05'),
(9, 9, '1:2', '2025-06-18', '2025-07-03', '2025-07-05', 'Encourage small investors', 'SEBI', 'Completed', '2025-07-06'),
(10, 10, '1:4', '2025-06-19', '2025-07-04', '2025-07-06', 'Liquidity enhancement', 'SEBI', 'Completed', '2025-07-07'),
(11, 11, '1:2', '2025-06-20', '2025-07-05', '2025-07-07', 'Corporate action plan', 'SEBI', 'Completed', '2025-07-07'),
(12, 12, '1:5', '2025-06-21', '2025-07-06', '2025-07-08', 'Broaden investor base', 'SEBI', 'Completed', '2025-07-08'),
(13, 13, '1:2', '2025-06-22', '2025-07-07', '2025-07-09', 'Affordable entry point', 'SEBI', 'Completed', '2025-07-09'),
(14, 14, '1:10', '2025-06-23', '2025-07-08', '2025-07-10', 'Increase share turnover', 'SEBI', 'Completed', '2025-07-10'),
(15, 15, '1:4', '2025-06-24', '2025-07-09', '2025-07-11', 'Reduce share price', 'SEBI', 'Completed', '2025-07-11');

-- to display/retrieve table data
SELECT * FROM Stock_Splits;               

-- to remove complete data from table
truncate table Stock_Splits;

-- to delete complete attributes and records 
drop table Stock_Splits;

-- Table 15: Brokerage_Firms
CREATE TABLE Brokerage_Firms (
    firm_id INT PRIMARY KEY,
    name VARCHAR(100),
    registration_number VARCHAR(50),
    headquarters VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(15),
    founder_name VARCHAR(100),
    established_year INT,
    total_clients INT,
    rating DECIMAL(3,2)
);

-- Insert records into the table
INSERT INTO Brokerage_Firms (firm_id, name, registration_number, headquarters, contact_email,contact_phone, founder_name, established_year, total_clients, rating) 
VALUES
(1, 'Zerodha', 'INZ000031633', 'Bangalore', 'support@zerodha.com', '08047192020', 'Nithin Kamath', 2010, 9000000, 4.8),
(2, 'Groww', 'INZ000208032', 'Bangalore', 'support@groww.in', '08061914444', 'Lalit Keshre', 2016, 7000000, 4.6),
(3, 'Upstox', 'INZ000185137', 'Mumbai', 'support@upstox.com', '02261308000', 'Ravi Kumar', 2011, 6500000, 4.5),
(4, 'Angel One', 'INZ000161534', 'Mumbai', 'support@angelone.in', '02268071111', 'Dinesh Thakkar', 1996, 8000000, 4.7),
(5, 'ICICI Direct', 'INZ000183631', 'Mumbai', 'helpdesk@icicidirect.com', '02239144500', 'Sandeep Bakhshi', 2000, 5000000, 4.4),
(6, 'HDFC Securities', 'INZ000186937', 'Mumbai', 'customercare@hdfcsec.com', '02261712345', 'Ketan Shah', 2000, 4500000, 4.3),
(7, 'Sharekhan', 'INZ000171337', 'Mumbai', 'support@sharekhan.com', '1800227500', 'Shripal Morakhia', 2000, 3000000, 4.2),
(8, 'Motilal Oswal', 'INZ000158836', 'Mumbai', 'query@motilaloswal.com', '02240548000', 'Motilal Oswal', 1987, 3500000, 4.1),
(9, 'Kotak Securities', 'INZ000209409', 'Mumbai', 'service.securities@kotak.com', '18002099191', 'Uday Kotak', 1994, 3800000, 4.2),
(10, 'Axis Direct', 'INZ000161633', 'Mumbai', 'customercare@axisdirect.in', '02240508080', 'Amitabh Chaudhry', 2005, 3200000, 4.0),
(11, '5Paisa', 'INZ000010231', 'Mumbai', 'support@5paisa.com', '8976689766', 'Prakarsh Gagdani', 2016, 2500000, 4.1),
(12, 'Paytm Money', 'INZ000240532', 'Bangalore', 'support@paytmmoney.com', '01204606060', 'Varun Sridhar', 2017, 2800000, 4.0),
(13, 'IIFL Securities', 'INZ000164132', 'Mumbai', 'customercare@iifl.com', '02240071000', 'Nirmal Jain', 1995, 3000000, 4.2),
(14, 'Geojit', 'INZ000104738', 'Kochi', 'customercare@geojit.com', '18004255501', 'C J George', 1987, 2200000, 4.0),
(15, 'Edelweiss', 'INZ000005231', 'Mumbai', 'helpdesk@edelweiss.in', '02242722200', 'Rashesh Shah', 1995, 2700000, 4.1);

-- to display/retrieve table data
SELECT * FROM Brokerage_Firms;               

-- to remove complete data from table
truncate table Brokerage_Firms;

-- to delete complete attributes and records 
drop table Brokerage_Firms;