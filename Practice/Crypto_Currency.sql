-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database Crypto_Currency;

-- to work on it, you need to use it first
use Crypto_Currency;

-- Delete a database
Drop database Crypto_Currency;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*
T1 : Users (user_id, full_name, email, password, phone_number,gender, date_of_birth, country, state, city) 

T2 : Wallets (wallet_id, user_id, wallet_address, wallet_type, balance,currency, is_active, created_at, last_accessed, status) 

T3 : Cryptocurrencies (crypto_id, name, symbol, launch_year, total_supply,circulating_supply, consensus_mechanism, founder,official_website, status)

T4 : Transactions (transaction_id, wallet_id, crypto_id, transaction_type, amount,transaction_date, transaction_status, network_fee, reference_id, remarks)

T5 :  Exchanges (exchange_id, name, country, established_year, founder,daily_volume_usd, number_of_pairs, license_number, support_email, status) 

T6 : KYC_Details (kyc_id, user_id, document_type, document_number, issued_by,issue_date, expiry_date, verification_status, verified_by, verified_on)

T7 :  Crypto_Prices (price_id, crypto_id, price_usd, price_inr, market_cap_usd,volume_24h_usd, price_date, price_time, source, status) 

T8 : Fiat_Conversions (conversion_id, user_id, from_currency, to_currency, amount,converted_amount, conversion_rate, conversion_date, platform, status)

T9 : Trade_Orders (order_id, user_id, crypto_id, order_type, order_price,quantity, total_value, order_date, status, exchange_id) 

T10 : Mining_Activities (mining_id, user_id, crypto_id, mining_type, hash_rate,power_consumption_kw, rewards_earned, mining_pool, start_date, status)

T11 : Staking_Activities (staking_id, user_id, crypto_id, staking_amount, staking_date,lock_period_days, reward_rate, rewards_earned, platform, status) 

T12 : Crypto_News (news_id, title, content, source, published_date,author, category, crypto_id, views, status) 

T13 : Security_Logs (log_id, user_id, login_time, ip_address, device_type,location, action, status, remarks, security_level)

T14 : Token_Launches (token_id, token_name, crypto_id, launch_date, launch_platform,total_supply, initial_price, current_price, status, launched_by) 

T15 : Airdrops (airdrop_id, user_id, crypto_id, airdrop_name, tokens_received,received_date, eligibility_criteria, status, campaign_source, verified) 

*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    phone_number VARCHAR(15),
    gender VARCHAR(10),
    date_of_birth DATE,
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into the table
INSERT INTO Users (user_id, full_name, email, password, phone_number,gender, date_of_birth, country, state, city) 
VALUES
(1, 'Rahul Mehra', 'rahul.mehra@example.com', 'rahul123', '9876543210', 'Male', '1995-04-12', 'India', 'Maharashtra', 'Mumbai'),
(2, 'Priya Sharma', 'priya.sharma@example.com', 'priya321', '9823456789', 'Female', '1992-06-23', 'India', 'Delhi', 'New Delhi'),
(3, 'Amit Desai', 'amit.desai@example.com', 'amit999', '9811122233', 'Male', '1988-12-02', 'India', 'Gujarat', 'Ahmedabad'),
(4, 'Sneha Iyer', 'sneha.iyer@example.com', 'sneha456', '9898989898', 'Female', '1994-03-15', 'India', 'Tamil Nadu', 'Chennai'),
(5, 'Karan Kapoor', 'karan.kapoor@example.com', 'karan789', '9877070707', 'Male', '1990-08-08', 'India', 'Punjab', 'Ludhiana'),
(6, 'Anjali Verma', 'anjali.verma@example.com', 'anjali147', '9765432109', 'Female', '1997-01-19', 'India', 'Uttar Pradesh', 'Lucknow'),
(7, 'Siddharth Nair', 'siddharth.nair@example.com', 'sid444', '9900990099', 'Male', '1989-11-30', 'India', 'Kerala', 'Kochi'),
(8, 'Neha Reddy', 'neha.reddy@example.com', 'neha321', '9855551212', 'Female', '1993-07-07', 'India', 'Telangana', 'Hyderabad'),
(9, 'Rohit Joshi', 'rohit.joshi@example.com', 'rohit000', '9797979797', 'Male', '1996-09-05', 'India', 'Rajasthan', 'Jaipur'),
(10, 'Isha Singh', 'isha.singh@example.com', 'isha999', '9786453120', 'Female', '1995-02-14', 'India', 'Bihar', 'Patna'),
(11, 'Vikram Bhatia', 'vikram.bhatia@example.com', 'vikram321', '9845612378', 'Male', '1987-05-22', 'India', 'Haryana', 'Gurgaon'),
(12, 'Meera Das', 'meera.das@example.com', 'meera654', '9734567890', 'Female', '1998-10-11', 'India', 'West Bengal', 'Kolkata'),
(13, 'Arjun Sinha', 'arjun.sinha@example.com', 'arjun987', '9911223344', 'Male', '1991-12-25', 'India', 'Jharkhand', 'Ranchi'),
(14, 'Ritika Jain', 'ritika.jain@example.com', 'ritika888', '9887766554', 'Female', '1993-04-30', 'India', 'Madhya Pradesh', 'Bhopal'),
(15, 'Manoj Kulkarni', 'manoj.kulkarni@example.com', 'manoj147', '9812345670', 'Male', '1990-01-05', 'India', 'Karnataka', 'Bangalore');

-- to display/retrieve table data
SELECT * FROM Users;               

-- to remove complete data from table
truncate table Users;

-- to delete complete attributes and records 
drop table Users;

-- Table 2: Wallets
CREATE TABLE Wallets (
    wallet_id INT PRIMARY KEY,
    user_id INT,
    wallet_address VARCHAR(255) UNIQUE,
    wallet_type VARCHAR(50),
    balance DECIMAL(18,8),
    currency VARCHAR(10),
    is_active BOOLEAN,
    created_at DATE,
    last_accessed DATE,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert records into the tables
INSERT INTO Wallets (wallet_id, user_id, wallet_address, wallet_type, balance,currency, is_active, created_at, last_accessed, status) 
VALUES
(1, 1, '0xrahul001btc', 'Hot', 0.52340100, 'BTC', TRUE, '2024-08-01', '2025-07-05', 'Active'),
(2, 2, '0xpriyaeth123', 'Cold', 3.21000000, 'ETH', TRUE, '2023-11-12', '2025-07-04', 'Active'),
(3, 3, '0xamitusdt444', 'Hot', 1200.50500000, 'USDT', TRUE, '2024-05-15', '2025-07-06', 'Active'),
(4, 4, '0xsneha000btc', 'Hot', 0.23458000, 'BTC', TRUE, '2024-09-01', '2025-07-05', 'Active'),
(5, 5, '0xkaraneth800', 'Cold', 8.12300000, 'ETH', TRUE, '2023-10-22', '2025-07-03', 'Active'),
(6, 6, '0xanjaliusdt321', 'Hot', 540.45000000, 'USDT', TRUE, '2024-06-01', '2025-07-02', 'Active'),
(7, 7, '0xsidbtc987', 'Cold', 0.10556000, 'BTC', TRUE, '2023-12-20', '2025-07-01', 'Active'),
(8, 8, '0xnehaxrp567', 'Hot', 600.99990000, 'XRP', TRUE, '2024-01-01', '2025-07-06', 'Active'),
(9, 9, '0xrohitltc101', 'Cold', 1.23400000, 'LTC', TRUE, '2024-02-15', '2025-07-06', 'Active'),
(10, 10, '0xishadoge77', 'Hot', 120000.00000000, 'DOGE', TRUE, '2024-04-05', '2025-07-06', 'Active'),
(11, 11, '0xvikrambtc205', 'Cold', 0.00789000, 'BTC', TRUE, '2023-09-09', '2025-07-06', 'Active'),
(12, 12, '0xmeeraeth112', 'Hot', 1.80000000, 'ETH', TRUE, '2024-03-10', '2025-07-06', 'Active'),
(13, 13, '0xarjunbnb003', 'Hot', 4.45670000, 'BNB', TRUE, '2024-01-20', '2025-07-06', 'Active'),
(14, 14, '0xritikashiba88', 'Cold', 900000.00000000, 'SHIBA', TRUE, '2023-08-18', '2025-07-06', 'Active'),
(15, 15, '0xmanojdot123', 'Hot', 110.00000000, 'DOT', TRUE, '2024-05-01', '2025-07-06', 'Active');

-- to display/retrieve table data
SELECT * FROM Wallets;               

-- to remove complete data from table
truncate table Wallets;

-- to delete complete attributes and records 
drop table Wallets;

-- Table 3: Cryptocurrencies
CREATE TABLE Cryptocurrencies (
    crypto_id INT PRIMARY KEY,
    name VARCHAR(50),
    symbol VARCHAR(10),
    launch_year INT,
    total_supply BIGINT,
    circulating_supply BIGINT,
    consensus_mechanism VARCHAR(50),
    founder VARCHAR(100),
    official_website VARCHAR(100),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Cryptocurrencies (crypto_id, name, symbol, launch_year, total_supply,circulating_supply, consensus_mechanism, founder,official_website, status)
    VALUES
(1, 'Bitcoin', 'BTC', 2009, 21000000, 19400000, 'Proof of Work', 'Satoshi Nakamoto', 'https://bitcoin.org', 'Active'),
(2, 'Ethereum', 'ETH', 2015, 120000000, 117000000, 'Proof of Stake', 'Vitalik Buterin', 'https://ethereum.org', 'Active'),
(3, 'Tether', 'USDT', 2014, 85000000000, 84000000000, 'Centralized', 'Brock Pierce', 'https://tether.to', 'Active'),
(4, 'Binance Coin', 'BNB', 2017, 200000000, 168000000, 'Proof of Stake', 'Changpeng Zhao', 'https://www.binance.com', 'Active'),
(5, 'Ripple', 'XRP', 2012, 100000000000, 52000000000, 'Ripple Protocol', 'Brad Garlinghouse', 'https://ripple.com', 'Active'),
(6, 'Dogecoin', 'DOGE', 2013, 1000000000000, 143000000000, 'Proof of Work', 'Billy Markus', 'https://dogecoin.com', 'Active'),
(7, 'Litecoin', 'LTC', 2011, 84000000, 73000000, 'Proof of Work', 'Charlie Lee', 'https://litecoin.org', 'Active'),
(8, 'Cardano', 'ADA', 2017, 45000000000, 35000000000, 'Proof of Stake', 'Charles Hoskinson', 'https://cardano.org', 'Active'),
(9, 'Polkadot', 'DOT', 2020, 1100000000, 980000000, 'Nominated PoS', 'Gavin Wood', 'https://polkadot.network', 'Active'),
(10, 'Shiba Inu', 'SHIBA', 2020, 1000000000000000, 589000000000000, 'ERC-20 Token', 'Ryoshi', 'https://shibatoken.com', 'Active'),
(11, 'Tron', 'TRX', 2017, 100000000000, 89000000000, 'Delegated PoS', 'Justin Sun', 'https://tron.network', 'Active'),
(12, 'Solana', 'SOL', 2020, 500000000, 440000000, 'Proof of History', 'Anatoly Yakovenko', 'https://solana.com', 'Active'),
(13, 'Avalanche', 'AVAX', 2020, 720000000, 350000000, 'Avalanche', 'Emin Gün Sirer', 'https://avax.network', 'Active'),
(14, 'Polygon', 'MATIC', 2019, 10000000000, 9300000000, 'Proof of Stake', 'Jaynti Kanani', 'https://polygon.technology', 'Active'),
(15, 'Uniswap', 'UNI', 2020, 1000000000, 600000000, 'Ethereum Token', 'Hayden Adams', 'https://uniswap.org', 'Active');

-- to display/retrieve table data
SELECT * FROM Cryptocurrencies;               

-- to remove complete data from table
truncate table Cryptocurrencies;

-- to delete complete attributes and records 
drop table Cryptocurrencies;

-- Table 4: Transactions
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    wallet_id INT,
    crypto_id INT,
    transaction_type VARCHAR(10),
    amount DECIMAL(18,8),
    transaction_date DATE,
    transaction_status VARCHAR(20),
    network_fee DECIMAL(10,4),
    reference_id VARCHAR(100),
    remarks TEXT,
    FOREIGN KEY (wallet_id) REFERENCES Wallets(wallet_id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id)
);

-- Insert records into the table
INSERT INTO Transactions (transaction_id, wallet_id, crypto_id, transaction_type, amount,transaction_date, transaction_status, network_fee, reference_id, remarks)
 VALUES
(1, 1, 1, 'Buy', 0.15000000, '2025-07-01', 'Completed', 0.0005, 'TXN001BTC', 'Bought during dip'),
(2, 2, 2, 'Sell', 1.20000000, '2025-07-02', 'Completed', 0.0050, 'TXN002ETH', 'Partial profit booking'),
(3, 3, 3, 'Buy', 500.00000000, '2025-07-03', 'Completed', 0.1000, 'TXN003USDT', 'Stable coin swap'),
(4, 4, 1, 'Send', 0.05000000, '2025-07-03', 'Pending', 0.0002, 'TXN004BTC', 'Transfer to exchange'),
(5, 5, 2, 'Buy', 3.00000000, '2025-07-04', 'Completed', 0.0075, 'TXN005ETH', 'ETH for staking'),
(6, 6, 3, 'Receive', 250.00000000, '2025-07-05', 'Completed', 0.0000, 'TXN006USDT', 'Gift from friend'),
(7, 7, 1, 'Buy', 0.01200000, '2025-07-05', 'Completed', 0.0001, 'TXN007BTC', 'Micro purchase'),
(8, 8, 5, 'Send', 100.00000000, '2025-07-06', 'Completed', 0.0025, 'TXN008XRP', 'XRP payment'),
(9, 9, 7, 'Buy', 0.50000000, '2025-07-06', 'Completed', 0.0010, 'TXN009LTC', 'Long-term hold'),
(10, 10, 6, 'Sell', 10000.00000000, '2025-07-06', 'Completed', 5.0000, 'TXN010DOGE', 'Profit on meme coin'),
(11, 11, 1, 'Buy', 0.00500000, '2025-07-06', 'Pending', 0.0001, 'TXN011BTC', 'Small investment'),
(12, 12, 2, 'Buy', 0.80000000, '2025-07-06', 'Completed', 0.0040, 'TXN012ETH', 'Holding for growth'),
(13, 13, 4, 'Receive', 2.00000000, '2025-07-06', 'Completed', 0.0000, 'TXN013BNB', 'BNB airdrop'),
(14, 14, 10, 'Sell', 500000.00000000, '2025-07-06', 'Completed', 10.0000, 'TXN014SHIBA', 'Profit from hype'),
(15, 15, 9, 'Buy', 20.00000000, '2025-07-06', 'Completed', 0.0500, 'TXN015DOT', 'Polkadot entry');

-- to display/retrieve table data
SELECT * FROM Transactions;               

-- to remove complete data from table
truncate table Transactions;

-- to delete complete attributes and records 
drop table Transactions;

-- Table 5: Exchanges
CREATE TABLE Exchanges (
    exchange_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50),
    established_year INT,
    founder VARCHAR(100),
    daily_volume_usd DECIMAL(20,2),
    number_of_pairs INT,
    license_number VARCHAR(50),
    support_email VARCHAR(100),
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Exchanges (exchange_id, name, country, established_year, founder,daily_volume_usd, number_of_pairs, license_number, support_email, status) 
VALUES
(1, 'WazirX', 'India', 2018, 'Nischal Shetty', 45000000.00, 120, 'INXCR12345', 'support@wazirx.com', 'Active'),
(2, 'CoinDCX', 'India', 2018, 'Sumit Gupta', 60000000.00, 150, 'INXDCX67890', 'support@coindcx.com', 'Active'),
(3, 'ZebPay', 'India', 2014, 'Mahin Gupta', 20000000.00, 100, 'INXZEB12121', 'support@zebpay.com', 'Active'),
(4, 'Koinex', 'India', 2017, 'Rakesh Yadav', 10000000.00, 80, 'INXKOIN007', 'support@koinex.in', 'Inactive'),
(5, 'Bitbns', 'India', 2017, 'Gaurav Dahake', 30000000.00, 90, 'INXBIT78901', 'support@bitbns.com', 'Active'),
(6, 'CoinSwitch Kuber', 'India', 2020, 'Ashish Singhal', 55000000.00, 130, 'INXCSW45500', 'support@coinswitch.co', 'Active'),
(7, 'Giottus', 'India', 2018, 'Vikram Subburaj', 18000000.00, 75, 'INXGIOT98888', 'support@giottus.com', 'Active'),
(8, 'BuyUCoin', 'India', 2016, 'Shivam Thakral', 12000000.00, 65, 'INXBUYC33333', 'support@buyucoin.com', 'Active'),
(9, 'Unocoin', 'India', 2013, 'Sathvik Vishwanath', 25000000.00, 70, 'INXUNO09876', 'support@unocoin.com', 'Active'),
(10, 'Krypto', 'India', 2021, 'Varun Mehta', 1000000.00, 40, 'INXKRY20210', 'support@krypto.in', 'Active'),
(11, 'BitIndia', 'India', 2017, 'Sahil Kohli', 8000000.00, 50, 'INXBITIND00', 'support@bitindia.co', 'Inactive'),
(12, 'IndoEx', 'India', 2019, 'Sandeep Nayak', 17000000.00, 60, 'INXINDO9923', 'support@indoex.com', 'Active'),
(13, 'CoinBazaar', 'India', 2020, 'Rahul Patil', 22000000.00, 55, 'INXBAZAAR91', 'support@coinbazaar.in', 'Active'),
(14, 'LocalBitcoins India', 'India', 2015, 'Ajay Singh', 15000000.00, 45, 'INXLOCALBTC', 'support@localbitcoins.in', 'Inactive'),
(15, 'XCoin', 'India', 2022, 'Neha Kulkarni', 900000.00, 20, 'INXXCOIN333', 'support@xcoin.in', 'Active');


-- to display/retrieve table data
SELECT * FROM Exchanges;               

-- to remove complete data from table
truncate table Exchanges;

-- to delete complete attributes and records 
drop table Exchanges;

-- Table 6: KYC_Details
CREATE TABLE KYC_Details (
    kyc_id INT PRIMARY KEY,
    user_id INT,
    document_type VARCHAR(50),
    document_number VARCHAR(50),
    issued_by VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    verification_status VARCHAR(20),
    verified_by VARCHAR(100),
    verified_on DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert records into the table
INSERT INTO KYC_Details (kyc_id, user_id, document_type, document_number, issued_by,issue_date, expiry_date, verification_status, verified_by, verified_on)
 VALUES
(1, 1, 'Aadhaar', '1234-5678-9101', 'UIDAI', '2017-01-15', '2032-01-15', 'Verified', 'Ravi Kumar', '2023-12-01'),
(2, 2, 'PAN', 'ASDPS1234F', 'Income Tax Dept', '2016-05-20', NULL, 'Verified', 'Priya Sinha', '2023-11-15'),
(3, 3, 'Aadhaar', '2345-6789-1011', 'UIDAI', '2018-03-10', '2033-03-10', 'Verified', 'Anil Mehta', '2023-12-05'),
(4, 4, 'Passport', 'L1234567', 'MEA India', '2015-06-12', '2025-06-12', 'Verified', 'Sneha Jain', '2023-10-10'),
(5, 5, 'Aadhaar', '3456-7890-1122', 'UIDAI', '2019-04-01', '2034-04-01', 'Pending', 'Karan Malhotra', '2023-12-10'),
(6, 6, 'PAN', 'BCDPT6789M', 'Income Tax Dept', '2017-08-30', NULL, 'Verified', 'Rajiv Shah', '2023-11-20'),
(7, 7, 'Aadhaar', '4567-8901-1223', 'UIDAI', '2020-07-18', '2035-07-18', 'Verified', 'Deepika Rao', '2023-12-02'),
(8, 8, 'Passport', 'N2345678', 'MEA India', '2016-12-25', '2026-12-25', 'Rejected', 'Anurag Mishra', '2023-11-28'),
(9, 9, 'PAN', 'EFGPT2345D', 'Income Tax Dept', '2015-02-14', NULL, 'Verified', 'Siddharth Kumar', '2023-11-15'),
(10, 10, 'Aadhaar', '5678-9012-1324', 'UIDAI', '2018-10-09', '2033-10-09', 'Verified', 'Meera Joshi', '2023-12-04'),
(11, 11, 'Passport', 'P3456789', 'MEA India', '2017-11-01', '2027-11-01', 'Pending', 'Aarti Bansal', '2023-12-01'),
(12, 12, 'Aadhaar', '6789-0123-1425', 'UIDAI', '2016-05-05', '2031-05-05', 'Verified', 'Rahul Trivedi', '2023-11-10'),
(13, 13, 'PAN', 'GHYTR1234K', 'Income Tax Dept', '2014-09-23', NULL, 'Verified', 'Sunita Iyer', '2023-11-29'),
(14, 14, 'Aadhaar', '7890-1234-1526', 'UIDAI', '2017-03-19', '2032-03-19', 'Rejected', 'Naveen Chopra', '2023-11-27'),
(15, 15, 'Passport', 'Q4567890', 'MEA India', '2019-06-11', '2029-06-11', 'Verified', 'Namrata Desai', '2023-12-03');

-- to display/retrieve table data
SELECT * FROM Users;               

-- to remove complete data from table
truncate table Users;

-- to delete complete attributes and records 
drop table Users;

-- Table 7: Crypto_Prices
CREATE TABLE Crypto_Prices (
    price_id INT PRIMARY KEY,
    crypto_id INT,
    price_usd DECIMAL(18,8),
    price_inr DECIMAL(18,2),
    market_cap_usd DECIMAL(20,2),
    volume_24h_usd DECIMAL(20,2),
    price_date DATE,
    price_time TIME,
    source VARCHAR(100),
    status VARCHAR(20),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id)
);

-- Insert records into the table
INSERT INTO Crypto_Prices (price_id, crypto_id, price_usd, price_inr, market_cap_usd,volume_24h_usd, price_date, price_time, source, status) 
VALUES
(1, 1, 62815.21000000, 5234212.50, 1220000000000.00, 28000000000.00, '2025-07-06', '10:00:00', 'CoinMarketCap', 'Live'),
(2, 2, 3200.55000000, 266412.30, 389000000000.00, 18000000000.00, '2025-07-06', '10:05:00', 'CoinGecko', 'Live'),
(3, 3, 1.00000000, 83.25, 84000000000.00, 48000000000.00, '2025-07-06', '10:10:00', 'Binance', 'Live'),
(4, 4, 530.45000000, 44133.20, 90000000000.00, 2500000000.00, '2025-07-06', '10:15:00', 'CoinDCX', 'Live'),
(5, 5, 0.62, 51.63, 32000000000.00, 1900000000.00, '2025-07-06', '10:20:00', 'WazirX', 'Live'),
(6, 6, 0.08900000, 7.39, 12400000000.00, 1000000000.00, '2025-07-06', '10:25:00', 'ZebPay', 'Live'),
(7, 7, 85.65000000, 7123.43, 6200000000.00, 780000000.00, '2025-07-06', '10:30:00', 'Bitbns', 'Live'),
(8, 8, 0.41000000, 34.10, 14500000000.00, 1250000000.00, '2025-07-06', '10:35:00', 'CoinSwitch', 'Live'),
(9, 9, 6.75000000, 561.40, 7800000000.00, 960000000.00, '2025-07-06', '10:40:00', 'Giottus', 'Live'),
(10, 10, 0.00001234, 0.001, 6900000000.00, 710000000.00, '2025-07-06', '10:45:00', 'BuyUCoin', 'Live'),
(11, 11, 0.08800000, 7.33, 7900000000.00, 640000000.00, '2025-07-06', '10:50:00', 'Unocoin', 'Live'),
(12, 12, 155.23000000, 12912.55, 8900000000.00, 530000000.00, '2025-07-06', '10:55:00', 'CryptoCompare', 'Live'),
(13, 13, 29.50000000, 2454.87, 11200000000.00, 470000000.00, '2025-07-06', '11:00:00', 'IndoEx', 'Live'),
(14, 14, 0.72000000, 59.95, 6300000000.00, 390000000.00, '2025-07-06', '11:05:00', 'PolygonTech', 'Live'),
(15, 15, 8.65000000, 719.42, 4800000000.00, 340000000.00, '2025-07-06', '11:10:00', 'Uniswap.org', 'Live');

-- to display/retrieve table data
SELECT * FROM Users;               

-- to remove complete data from table
truncate table Users;

-- to delete complete attributes and records 
drop table Users;

-- Table 8: Fiat_Conversions
CREATE TABLE Fiat_Conversions (
    conversion_id INT PRIMARY KEY,
    user_id INT,
    from_currency VARCHAR(10),
    to_currency VARCHAR(10),
    amount DECIMAL(18,2),
    converted_amount DECIMAL(18,2),
    conversion_rate DECIMAL(10,4),
    conversion_date DATE,
    platform VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert records into the table
INSERT INTO Fiat_Conversions (conversion_id, user_id, from_currency, to_currency, amount,converted_amount, conversion_rate, conversion_date, platform, status)
 VALUES
(1, 1, 'INR', 'USDT', 10000.00, 120.10, 83.2800, '2025-07-06', 'WazirX', 'Success'),
(2, 2, 'INR', 'BTC', 50000.00, 0.0098, 510204.82, '2025-07-06', 'CoinDCX', 'Success'),
(3, 3, 'INR', 'ETH', 25000.00, 0.0934, 267684.02, '2025-07-06', 'ZebPay', 'Success'),
(4, 4, 'INR', 'USDT', 15000.00, 180.20, 83.2500, '2025-07-06', 'Bitbns', 'Success'),
(5, 5, 'USD', 'INR', 200.00, 16650.00, 83.2500, '2025-07-06', 'CoinSwitch', 'Success'),
(6, 6, 'INR', 'BTC', 30000.00, 0.0057, 563157.89, '2025-07-06', 'Giottus', 'Pending'),
(7, 7, 'INR', 'DOGE', 5000.00, 67640.45, 0.0739, '2025-07-06', 'BuyUCoin', 'Success'),
(8, 8, 'INR', 'ETH', 42000.00, 0.1584, 265000.00, '2025-07-06', 'Unocoin', 'Success'),
(9, 9, 'USD', 'INR', 500.00, 41625.00, 83.2500, '2025-07-06', 'IndoEx', 'Success'),
(10, 10, 'INR', 'ADA', 10000.00, 293.56, 34.0600, '2025-07-06', 'LocalBitcoins', 'Success'),
(11, 11, 'INR', 'BNB', 8000.00, 0.1830, 43770.00, '2025-07-06', 'XCoin', 'Success'),
(12, 12, 'INR', 'XRP', 10000.00, 193.71, 51.63, '2025-07-06', 'CoinBazaar', 'Success'),
(13, 13, 'USD', 'INR', 100.00, 8325.00, 83.2500, '2025-07-06', 'CryptoBazaar', 'Success'),
(14, 14, 'INR', 'SHIBA', 5000.00, 405674675.32, 0.00001234, '2025-07-06', 'ShibaXpress', 'Success'),
(15, 15, 'INR', 'DOT', 7000.00, 12.47, 561.40, '2025-07-06', 'PolkaTrade', 'Success');

-- to display/retrieve table data
SELECT * FROM Users;               

-- to remove complete data from table
truncate table Users;

-- to delete complete attributes and records 
drop table Users;

-- Table 9: Trade_Orders
CREATE TABLE Trade_Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    crypto_id INT,
    order_type VARCHAR(10),
    order_price DECIMAL(18,8),
    quantity DECIMAL(18,8),
    total_value DECIMAL(18,2),
    order_date DATE,
    status VARCHAR(20),
    exchange_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id),
    FOREIGN KEY (exchange_id) REFERENCES Exchanges(exchange_id)
);

-- Insert records into the table
INSERT INTO Trade_Orders (order_id, user_id, crypto_id, order_type, order_price,quantity, total_value, order_date, status, exchange_id) 
VALUES
(1, 1, 1, 'Buy', 62000.00000000, 0.01000000, 620.00, '2025-07-06', 'Executed', 1),
(2, 2, 2, 'Sell', 3150.00000000, 1.50000000, 4725.00, '2025-07-06', 'Executed', 2),
(3, 3, 3, 'Buy', 1.00000000, 100.00000000, 100.00, '2025-07-06', 'Executed', 3),
(4, 4, 4, 'Buy', 530.00000000, 2.00000000, 1060.00, '2025-07-06', 'Pending', 4),
(5, 5, 5, 'Sell', 0.61000000, 1000.00000000, 610.00, '2025-07-06', 'Executed', 5),
(6, 6, 6, 'Buy', 0.08500000, 5000.00000000, 425.00, '2025-07-06', 'Cancelled', 6),
(7, 7, 7, 'Buy', 82.00000000, 3.00000000, 246.00, '2025-07-06', 'Executed', 7),
(8, 8, 8, 'Sell', 0.40000000, 250.00000000, 100.00, '2025-07-06', 'Executed', 8),
(9, 9, 9, 'Buy', 6.50000000, 10.00000000, 65.00, '2025-07-06', 'Executed', 9),
(10, 10, 10, 'Sell', 0.00001200, 10000000.00000000, 120.00, '2025-07-06', 'Executed', 10),
(11, 11, 1, 'Buy', 61500.00000000, 0.00800000, 492.00, '2025-07-06', 'Pending', 11),
(12, 12, 2, 'Sell', 3100.00000000, 1.00000000, 3100.00, '2025-07-06', 'Executed', 12),
(13, 13, 4, 'Buy', 500.00000000, 3.00000000, 1500.00, '2025-07-06', 'Executed', 13),
(14, 14, 5, 'Sell', 0.60500000, 2000.00000000, 1210.00, '2025-07-06', 'Executed', 14),
(15, 15, 9, 'Buy', 6.70000000, 15.00000000, 100.50, '2025-07-06', 'Executed', 15);

-- to display/retrieve table data
SELECT * FROM Trade_Orders;               

-- to remove complete data from table
truncate table Trade_Orders;

-- to delete complete attributes and records 
drop table Trade_Orders;

-- Table 10: Mining_Activities
CREATE TABLE Mining_Activities (
    mining_id INT PRIMARY KEY,
    user_id INT,
    crypto_id INT,
    mining_type VARCHAR(20),
    hash_rate DECIMAL(10,2),
    power_consumption_kw DECIMAL(10,2),
    rewards_earned DECIMAL(18,8),
    mining_pool VARCHAR(100),
    start_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id)
);

-- Insert records into the table
INSERT INTO Mining_Activities (mining_id, user_id, crypto_id, mining_type, hash_rate,power_consumption_kw, rewards_earned, mining_pool, start_date, status)
 VALUES
(1, 1, 1, 'Solo', 45.20, 1200.50, 0.00320000, 'Antpool', '2025-06-01', 'Active'),
(2, 2, 2, 'Pool', 120.00, 980.00, 0.25000000, 'Ethermine', '2025-05-10', 'Completed'),
(3, 3, 6, 'Solo', 30.55, 650.00, 340.00000000, 'Litepool', '2025-04-25', 'Active'),
(4, 4, 1, 'Pool', 90.00, 1500.75, 0.00150000, 'SlushPool', '2025-03-15', 'Inactive'),
(5, 5, 4, 'Pool', 65.00, 720.30, 1.20000000, 'Binance Pool', '2025-06-20', 'Active'),
(6, 6, 6, 'Pool', 85.75, 780.50, 215.00000000, 'Dogepool', '2025-06-15', 'Completed'),
(7, 7, 1, 'Solo', 40.40, 1050.00, 0.00200000, 'NiceHash', '2025-06-05', 'Active'),
(8, 8, 2, 'Pool', 100.00, 860.60, 0.18000000, 'F2Pool', '2025-05-01', 'Completed'),
(9, 9, 7, 'Solo', 25.00, 500.00, 0.35000000, 'LiteMiner', '2025-04-10', 'Active'),
(10, 10, 10, 'Pool', 500.00, 100.00, 10000000.00000000, 'ShibaFarm', '2025-05-30', 'Active'),
(11, 11, 3, 'Pool', 95.00, 780.00, 200.00000000, 'TetherMine', '2025-06-25', 'Completed'),
(12, 12, 9, 'Solo', 15.00, 300.00, 0.10000000, 'DotMine', '2025-06-01', 'Active'),
(13, 13, 5, 'Pool', 35.00, 420.00, 0.50000000, 'RippleMiner', '2025-04-15', 'Completed'),
(14, 14, 12, 'Solo', 60.00, 880.00, 0.28000000, 'SolanaFarm', '2025-06-10', 'Active'),
(15, 15, 13, 'Pool', 48.50, 650.00, 0.42000000, 'AvalanchePool', '2025-06-18', 'Active');

-- to display/retrieve table data
SELECT * FROM Mining_Activities;               

-- to remove complete data from table
truncate table Mining_Activities;

-- to delete complete attributes and records 
drop table Mining_Activities;

-- Table 11: Staking_Activities
CREATE TABLE Staking_Activities (
    staking_id INT PRIMARY KEY,
    user_id INT,
    crypto_id INT,
    staking_amount DECIMAL(18,8),
    staking_date DATE,
    lock_period_days INT,
    reward_rate DECIMAL(5,2),
    rewards_earned DECIMAL(18,8),
    platform VARCHAR(100),
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id)
);

-- Insert records into the table
INSERT INTO Staking_Activities (staking_id, user_id, crypto_id, staking_amount, staking_date,lock_period_days, reward_rate, rewards_earned, platform, status) 
VALUES
(1, 1, 2, 2.50000000, '2025-05-01', 30, 5.00, 0.01250000, 'CoinDCX Earn', 'Active'),
(2, 2, 4, 10.00000000, '2025-04-15', 60, 7.50, 0.07500000, 'WazirX Staking', 'Completed'),
(3, 3, 9, 15.00000000, '2025-06-01', 90, 6.25, 0.14062500, 'Polkadot Hub', 'Active'),
(4, 4, 5, 500.00000000, '2025-05-20', 30, 4.00, 8.00000000, 'Ripple Vault', 'Completed'),
(5, 5, 8, 100.00000000, '2025-06-10', 15, 3.50, 0.14500000, 'Shiba Stake', 'Active'),
(6, 6, 7, 5.00000000, '2025-05-25', 45, 4.75, 0.01187500, 'LitePool Stake', 'Active'),
(7, 7, 2, 3.00000000, '2025-06-05', 30, 5.25, 0.01575000, 'CoinSwitch Vault', 'Active'),
(8, 8, 14, 200.00000000, '2025-05-30', 60, 6.00, 0.20000000, 'Polygon Yield', 'Completed'),
(9, 9, 13, 25.00000000, '2025-06-02', 90, 6.50, 0.40625000, 'Avalanche Power', 'Active'),
(10, 10, 11, 300.00000000, '2025-06-08', 30, 4.00, 0.30000000, 'DogeLocker', 'Active'),
(11, 11, 15, 8.00000000, '2025-06-15', 60, 5.00, 0.02000000, 'Uniswap Earn', 'Active'),
(12, 12, 6, 2000.00000000, '2025-06-01', 15, 2.50, 1.25000000, 'DOGE Stake India', 'Completed'),
(13, 13, 12, 0.50000000, '2025-06-12', 90, 7.00, 0.03150000, 'Solana Stake', 'Active'),
(14, 14, 3, 100.00000000, '2025-06-14', 7, 1.00, 0.01923077, 'USDT Vault', 'Active'),
(15, 15, 10, 1000000.00000000, '2025-06-20', 15, 3.00, 45000.00000000, 'Shiba Boost', 'Completed');

-- to display/retrieve table data
SELECT * FROM Staking_Activities;               

-- to remove complete data from table
truncate table Staking_Activities;

-- to delete complete attributes and records 
drop table Staking_Activities;

-- Table 12: Crypto_News
CREATE TABLE Crypto_News (
    news_id INT PRIMARY KEY,
    title VARCHAR(200),
    content TEXT,
    source VARCHAR(100),
    published_date DATE,
    author VARCHAR(100),
    category VARCHAR(50),
    crypto_id INT,
    views INT,
    status VARCHAR(20),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id)
);

-- Insert records into the table
INSERT INTO Crypto_News (news_id, title, content, source, published_date,author, category, crypto_id, views, status) 
VALUES
(1, 'Bitcoin Hits New High', 'Bitcoin crosses ₹52 lakhs amid global rally.', 'The Hindu Business Line', '2025-07-05', 'Rajesh Nair', 'Market Update', 1, 10500, 'Published'),
(2, 'Ethereum Merge Update', 'Latest upgrade improves speed and efficiency.', 'Moneycontrol', '2025-07-04', 'Sneha Kapoor', 'Technology', 2, 8500, 'Published'),
(3, 'USDT Adoption Rises in India', 'Tether used in over 30% of Indian crypto transactions.', 'Economic Times', '2025-07-03', 'Amit Sharma', 'Adoption', 3, 6200, 'Published'),
(4, 'Binance Coin Under Scrutiny', 'Regulatory pressure increases on Binance-backed token.', 'LiveMint', '2025-07-02', 'Neha Joshi', 'Regulation', 4, 7100, 'Published'),
(5, 'Ripple Partnership with SBI', 'Ripple expands cross-border payments with Indian bank.', 'Zee Business', '2025-07-01', 'Piyush Verma', 'Business', 5, 5300, 'Published'),
(6, 'DOGE Rebounds After Elon Tweet', 'Elon Musk tweets send DOGE price surging.', 'NDTV Profit', '2025-06-30', 'Aarav Mehta', 'Social Media', 6, 9500, 'Published'),
(7, 'Litecoin Transactions Surge', 'Litecoin sees a 40% jump in daily transactions.', 'Times of India', '2025-06-29', 'Kavita Singh', 'Market Update', 7, 4800, 'Published'),
(8, 'SHIBA INU Listed on WazirX', 'SHIBA now tradable on major Indian exchange.', 'CNBC TV18', '2025-06-28', 'Nikhil Rao', 'Adoption', 8, 6900, 'Published'),
(9, 'DOT Adds Smart Contracts', 'Polkadot introduces WASM-based contracts.', 'News18', '2025-06-27', 'Preeti Shetty', 'Technology', 9, 5600, 'Published'),
(10, 'SHIBA Army Trends on X', 'Massive Indian support for meme coin causes spike.', 'India Today', '2025-06-26', 'Devika Menon', 'Community', 10, 8800, 'Published'),
(11, 'XRP Sees Legal Win', 'Court sides with Ripple in ongoing lawsuit.', 'Mint', '2025-06-25', 'Manoj Pillai', 'Legal', 5, 7200, 'Published'),
(12, 'SOLANA Network Glitch', 'Temporary downtime due to validator sync issue.', 'YourStory', '2025-06-24', 'Rhea Sinha', 'Technology', 12, 4100, 'Published'),
(13, 'AVAX Climbs After Avalanche Rush', 'Incentives drive growth in Avalanche DeFi.', 'Business Today', '2025-06-23', 'Yash Gupta', 'DeFi', 13, 4600, 'Published'),
(14, 'Polygon Ties with Flipkart', 'Partnership to enhance Web3 commerce.', 'Moneycontrol', '2025-06-22', 'Tanya Iyer', 'Business', 14, 7800, 'Published'),
(15, 'UNI Holders Vote on Fee Switch', 'Governance proposal sparks debate in Uniswap.', 'TimesNow', '2025-06-21', 'Rajat Deshmukh', 'Governance', 15, 3400, 'Published');

-- to display/retrieve table data
SELECT * FROM Crypto_News;               

-- to remove complete data from table
truncate table Crypto_News;

-- to delete complete attributes and records 
drop table Crypto_News;

-- Table 13: Security_Logs
CREATE TABLE Security_Logs (
    log_id INT PRIMARY KEY,
    user_id INT,
    login_time DATETIME,
    ip_address VARCHAR(50),
    device_type VARCHAR(50),
    location VARCHAR(100),
    action VARCHAR(100),
    status VARCHAR(20),
    remarks TEXT,
    security_level VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert records into the table
INSERT INTO Security_Logs (log_id, user_id, login_time, ip_address, device_type,location, action, status, remarks, security_level)
 VALUES
(1, 1, '2025-07-06 09:32:10', '103.82.110.21', 'Mobile', 'Mumbai, Maharashtra', 'Login', 'Success', 'Logged in from mobile app', 'High'),
(2, 2, '2025-07-06 10:14:45', '49.205.76.33', 'Desktop', 'Delhi', '2FA Verification', 'Success', 'OTP verified', 'Medium'),
(3, 3, '2025-07-06 11:02:31', '115.242.55.19', 'Laptop', 'Bengaluru, Karnataka', 'Password Change', 'Success', 'Password updated', 'High'),
(4, 4, '2025-07-06 08:15:00', '103.50.63.17', 'Tablet', 'Ahmedabad, Gujarat', 'Login Attempt', 'Failed', 'Incorrect password', 'Low'),
(5, 5, '2025-07-05 21:45:20', '106.203.120.11', 'Mobile', 'Hyderabad, Telangana', 'Device Change', 'Success', 'New device approved', 'High'),
(6, 6, '2025-07-06 07:25:10', '223.176.45.99', 'Desktop', 'Chennai, Tamil Nadu', 'Logout', 'Success', 'Manual logout', 'Medium'),
(7, 7, '2025-07-06 06:55:55', '183.82.91.15', 'Mobile', 'Kolkata, West Bengal', 'Login', 'Success', 'Regular access', 'Low'),
(8, 8, '2025-07-06 13:14:28', '182.75.29.5', 'Laptop', 'Pune, Maharashtra', 'Account Lock', 'Failed', 'Too many failed attempts', 'Critical'),
(9, 9, '2025-07-06 14:40:00', '27.56.120.88', 'Mobile', 'Nagpur, Maharashtra', 'Login', 'Success', 'Biometric used', 'High'),
(10, 10, '2025-07-06 15:22:14', '103.25.57.13', 'Tablet', 'Surat, Gujarat', 'Logout', 'Success', 'Idle timeout', 'Medium'),
(11, 11, '2025-07-05 23:30:00', '122.162.18.90', 'Desktop', 'Bhopal, MP', 'Login', 'Success', 'Logged in successfully', 'Low'),
(12, 12, '2025-07-06 12:05:20', '49.207.65.43', 'Laptop', 'Patna, Bihar', 'Password Reset', 'Success', 'Email OTP verified', 'High'),
(13, 13, '2025-07-06 16:11:35', '117.197.48.19', 'Mobile', 'Jaipur, Rajasthan', 'Login', 'Failed', 'Wrong password', 'Low'),
(14, 14, '2025-07-06 17:42:07', '115.119.45.2', 'Laptop', 'Lucknow, UP', '2FA Verification', 'Success', 'Authentication complete', 'High'),
(15, 15, '2025-07-06 18:28:19', '157.39.25.77', 'Mobile', 'Ranchi, Jharkhand', 'Device Change', 'Success', 'Device added to whitelist', 'Medium');

-- to display/retrieve table data
SELECT * FROM Security_Logs;               

-- to remove complete data from table
truncate table Security_Logs;

-- to delete complete attributes and records 
drop table Security_Logs;

-- Table 14: Token_Launches
CREATE TABLE Token_Launches (
    token_id INT PRIMARY KEY,
    token_name VARCHAR(100),
    crypto_id INT,
    launch_date DATE,
    launch_platform VARCHAR(100),
    total_supply DECIMAL(20,2),
    initial_price DECIMAL(10,4),
    current_price DECIMAL(10,4),
    status VARCHAR(20),
    launched_by VARCHAR(100),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id)
);

-- Insert records into the table
INSERT INTO Token_Launches (token_id, token_name, crypto_id, launch_date, launch_platform,total_supply, initial_price, current_price, status, launched_by) 
VALUES
(1, 'BitDesh', 1, '2023-05-01', 'CoinDCX', 21000000.00, 30000.0000, 62000.0000, 'Active', 'Ravi Sharma'),
(2, 'EthBharat', 2, '2022-10-15', 'WazirX', 120000000.00, 1500.0000, 3150.0000, 'Active', 'Sneha Kapoor'),
(3, 'TetherRupee', 3, '2024-02-10', 'ZebPay', 5000000000.00, 1.0000, 1.0000, 'Stable', 'Amit Joshi'),
(4, 'BNB Yatra', 4, '2023-11-12', 'Binance India', 170000000.00, 250.0000, 530.0000, 'Active', 'Neha Joshi'),
(5, 'XRP India', 5, '2023-08-20', 'Giottus', 1000000000.00, 0.3000, 0.6100, 'Active', 'Kiran Desai'),
(6, 'DeshDoge', 6, '2024-01-25', 'BuyUCoin', 5000000000.00, 0.0420, 0.0850, 'Active', 'Raj Verma'),
(7, 'LiteMaha', 7, '2023-06-05', 'CoinSwitch', 84000000.00, 70.0000, 82.0000, 'Active', 'Riya Patil'),
(8, 'SHIBA Hind', 8, '2023-12-18', 'Unocoin', 1000000000000.00, 0.00000600, 0.00001200, 'Active', 'Deepak Kumar'),
(9, 'PolkaNation', 9, '2023-07-10', 'PolkaTrade', 1000000000.00, 3.5000, 6.5000, 'Active', 'Ishita Mehta'),
(10, 'ShibaXpress', 10, '2024-05-14', 'ShibaXpress', 4000000000000.00, 0.00000500, 0.00001200, 'Active', 'Nikhil Singh'),
(11, 'DOGE India', 6, '2023-09-09', 'CryptoBazaar', 10000000000.00, 0.0350, 0.0850, 'Active', 'Anjali Rathod'),
(12, 'SOL Ignite', 12, '2023-04-25', 'SolanaStake', 500000000.00, 25.0000, 90.0000, 'Active', 'Siddharth Menon'),
(13, 'Avalanche Bharat', 13, '2022-12-12', 'AvalancheHub', 720000000.00, 30.0000, 110.0000, 'Active', 'Meera Nair'),
(14, 'Matic India', 14, '2023-03-17', 'PolygonTech', 10000000000.00, 1.0000, 3.8000, 'Active', 'Naveen Pillai'),
(15, 'UniVote', 15, '2024-01-01', 'Uniswap.org', 1000000000.00, 5.0000, 10.0000, 'Active', 'Komal Yadav');

-- to display/retrieve table data
SELECT * FROM Token_Launches;               

-- to remove complete data from table
truncate table Token_Launches;

-- to delete complete attributes and records 
drop table Token_Launches;

-- Table 15: Airdrops
CREATE TABLE Airdrops (
    airdrop_id INT PRIMARY KEY,
    user_id INT,
    crypto_id INT,
    airdrop_name VARCHAR(100),
    tokens_received DECIMAL(18,8),
    received_date DATE,
    eligibility_criteria TEXT,
    status VARCHAR(20),
    campaign_source VARCHAR(100),
    verified BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id)
);

-- Insert records into the table
INSERT INTO Airdrops (airdrop_id, user_id, crypto_id, airdrop_name, tokens_received,received_date, eligibility_criteria, status, campaign_source, verified) 
VALUES
(1, 1, 10, 'SHIBA Super Drop', 500000.00000000, '2025-06-10', 'Signed up before May 2025', 'Received', 'Twitter Campaign', TRUE),
(2, 2, 5, 'Ripple Booster', 100.00000000, '2025-06-11', 'Held 500+ XRP', 'Received', 'Referral Program', TRUE),
(3, 3, 14, 'Polygon Power Airdrop', 150.00000000, '2025-06-12', 'Completed KYC on Polygon', 'Received', 'Airdrop Alert India', TRUE),
(4, 4, 2, 'ETH Reward Pack', 0.10000000, '2025-06-13', 'ETH wallet verified', 'Received', 'CoinDCX Event', TRUE),
(5, 5, 6, 'Dogecoin Dhamaka', 5000.00000000, '2025-06-14', 'Retweeted campaign post', 'Received', 'DogeIndia Campaign', TRUE),
(6, 6, 1, 'BTC Loyalty Bonus', 0.00500000, '2025-06-15', 'Active user for 12 months', 'Received', 'Bitcoin Bharat', TRUE),
(7, 7, 12, 'SOL Flash Drop', 1.00000000, '2025-06-16', 'Joined Telegram group', 'Received', 'Solana Desh', TRUE),
(8, 8, 15, 'Uniswap India Drop', 2.00000000, '2025-06-17', 'Used Uniswap DEX', 'Received', 'UniReward Portal', TRUE),
(9, 9, 3, 'Tether Cashback', 500.00000000, '2025-06-18', 'Held Tether for 6 months', 'Received', 'USDT Campaign', TRUE),
(10, 10, 8, 'SHIBA Loot', 1000000.00000000, '2025-06-19', 'Shared on Instagram', 'Received', 'Shiba Army India', TRUE),
(11, 11, 9, 'DOT Desh Drop', 2.00000000, '2025-06-20', 'Polkadot Wallet User', 'Received', 'PolkaBridge Event', TRUE),
(12, 12, 7, 'Litecoin Ladoo', 1.00000000, '2025-06-21', 'Shared campaign post', 'Received', 'LTC Bhakt India', TRUE),
(13, 13, 4, 'BNB Surprise', 0.50000000, '2025-06-22', 'Completed daily quiz', 'Received', 'BNB Mania India', TRUE),
(14, 14, 11, 'DOGE Wave', 3000.00000000, '2025-06-23', 'Invited 5 friends', 'Received', 'DogeStorm', TRUE),
(15, 15, 13, 'AVAX Airdrop', 1.00000000, '2025-06-24', 'Created Avalanche wallet', 'Received', 'Avalanche Bharat', TRUE);

-- to display/retrieve table data
SELECT * FROM Airdrops;               

-- to remove complete data from table
truncate table Airdrops;

-- to delete complete attributes and records 
drop table Airdrops;
