-- ---------------------------------------------- Database Queries -----------------------------------------------

-- Create a Database
Create database Flipkart;

-- to work on it, you need to use it first
use Flipkart;

-- Delete a database
Drop database Flipkart;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*

T1 : Users (user_id, name, email, password, phone_number, gender, date_of_birth, address, city) 

T2 : Sellers (seller_id, name, email, password, phone_number, shop_name, gst_number, address, city, rating)

T3 : Categories (category_id, name, description, parent_category_id, level, status,created_by, created_at, updated_by, updated_at)

T4 : Products (product_id, name, description, price, discount, stock, rating, seller_id, category_id, warranty_period)

T5 : Product_Images (image_id, product_id, image_url, is_primary, uploaded_at,uploaded_by, resolution, size_kb, file_type, status)

T6 : Orders (order_id, user_id, total_amount, order_date, delivery_date, status,payment_status, shipping_method, coupon_code, address_id) 

T7 : Order_Items (order_item_id, order_id, product_id, quantity, unit_price, discount, total_price,return_status, replacement_status, shipment_status)

T8 : Cart (cart_id, user_id, product_id, quantity, added_date,price, discount, total, status, stock_status)

T9 : Wishlist (wishlist_id, user_id, product_id, added_date, priority_level,price_at_time, discount_at_time, stock_available, notification_sent, status)

T10 :  Payments (payment_id, order_id, user_id, payment_date, amount,payment_method, transaction_id, status, gateway_response, refund_status)

T11 : Addresses (address_id, user_id, name, phone_number, address_line1, address_line2,city, state, pincode, address_type) 

T12 : Shipping (shipping_id, order_id, courier_name, tracking_number, shipped_date,estimated_delivery, actual_delivery, shipping_status, delivery_person, delivery_contact)

T13 : Product_Reviews (review_id, product_id, user_id, rating, review_text, review_date,helpful_count, is_verified_purchase, reply_from_seller, status)

T14 : Coupons (coupon_id, code, description, discount_percent, max_discount_amount,min_order_amount, start_date, end_date, usage_limit, status) 

T15 : Returns (return_id, order_item_id, user_id, reason, request_date,return_status, refund_amount, approved_by, pickup_date, refund_date)

*/

-- --------------------------------------- Table Related Queries --------------------------------------

-- Table 1: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    phone_number VARCHAR(15),
    gender VARCHAR(10),
    date_of_birth DATE,
    address TEXT,
    city VARCHAR(50)
);

-- Insert records into the table
INSERT INTO Users (user_id, name, email, password, phone_number, gender, date_of_birth, address, city) 
VALUES
(1, 'Aarav Mehta', 'aarav.mehta@example.com', 'pass@123', '9876543210', 'Male', '1995-06-15', '123 MG Road', 'Mumbai'),
(2, 'Priya Sharma', 'priya.sharma@example.com', 'priya@2021', '9867452301', 'Female', '1998-03-22', '56 Nehru Nagar', 'Delhi'),
(3, 'Rohan Verma', 'rohan.verma@example.com', 'rohan#456', '9845123678', 'Male', '1990-12-10', '77 Residency Road', 'Bangalore'),
(4, 'Sneha Iyer', 'sneha.iyer@example.com', 'sneha123', '9801234567', 'Female', '1993-08-05', '9 Indira Nagar', 'Chennai'),
(5, 'Vikram Patel', 'vikram.patel@example.com', 'vikram@patel', '9756423810', 'Male', '1991-01-30', '12 Satellite Road', 'Ahmedabad'),
(6, 'Anjali Reddy', 'anjali.reddy@example.com', 'anjali$22', '9834765123', 'Female', '1996-09-17', '44 Jubilee Hills', 'Hyderabad'),
(7, 'Karan Singh', 'karan.singh@example.com', 'karan2022', '9745236789', 'Male', '1994-05-20', '89 Civil Lines', 'Lucknow'),
(8, 'Pooja Joshi', 'pooja.joshi@example.com', 'pooja@joshi', '9893456789', 'Female', '1999-07-12', '32 Shastri Nagar', 'Pune'),
(9, 'Arjun Das', 'arjun.das@example.com', 'arjun#789', '9736452781', 'Male', '1992-11-11', '76 Park Street', 'Kolkata'),
(10, 'Divya Nair', 'divya.nair@example.com', 'divya@456', '9823456712', 'Female', '1997-02-28', '45 Marine Drive', 'Cochin'),
(11, 'Rahul Jain', 'rahul.jain@example.com', 'rahul#jain', '9789023456', 'Male', '1990-10-25', '88 Ashok Vihar', 'Jaipur'),
(12, 'Meera Shah', 'meera.shah@example.com', 'meera@1234', '9812345678', 'Female', '1995-04-14', '23 Ghatkopar East', 'Mumbai'),
(13, 'Nikhil Aggarwal', 'nikhil.aggarwal@example.com', 'nikhil789', '9778456123', 'Male', '1993-06-09', '19 Connaught Place', 'Delhi'),
(14, 'Swati Kulkarni', 'swati.kulkarni@example.com', 'swati@pass', '9856765432', 'Female', '1998-01-18', '65 FC Road', 'Pune'),
(15, 'Amitabh Rao', 'amitabh.rao@example.com', 'amit#987', '9723456789', 'Male', '1991-03-07', '101 MG Road', 'Bangalore');

-- to display/retrieve table data
SELECT * FROM Users;               

-- to remove complete data from table
truncate table Users;

-- to delete complete attributes and records 
drop table Users;

-- Table 2: Sellers
CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    phone_number VARCHAR(15),
    shop_name VARCHAR(100),
    gst_number VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    rating FLOAT CHECK (rating BETWEEN 0 AND 5)
);

-- Insert records into the table
INSERT INTO Sellers (seller_id, name, email, password, phone_number, shop_name, gst_number, address, city, rating)
 VALUES
(1, 'Rajesh Gupta', 'rajesh.gupta@sellers.com', 'rajesh@123', '9876543211', 'Gupta Electronics', 'GSTIN12345678', '12 MG Road', 'Delhi', 4.5),
(2, 'Neha Patel', 'neha.patel@sellers.com', 'neha@patel', '9765432189', 'Patel Fashion', 'GSTIN87654321', '34 Satellite Road', 'Ahmedabad', 4.2),
(3, 'Vikram Reddy', 'vikram.reddy@sellers.com', 'vikram@456', '9854761230', 'Reddy Mobiles', 'GSTIN23456789', '89 Banjara Hills', 'Hyderabad', 4.7),
(4, 'Pooja Mehta', 'pooja.mehta@sellers.com', 'pooja@mehta', '9845672312', 'Mehta Home Decor', 'GSTIN34567890', '56 Ashram Road', 'Mumbai', 4.0),
(5, 'Amit Jain', 'amit.jain@sellers.com', 'amit@jain', '9734561234', 'Jain Enterprises', 'GSTIN45678901', '78 Connaught Place', 'Delhi', 3.9),
(6, 'Divya Iyer', 'divya.iyer@sellers.com', 'divya@iyer', '9823456789', 'Iyer Books', 'GSTIN56789012', '22 Mount Road', 'Chennai', 4.3),
(7, 'Manoj Shah', 'manoj.shah@sellers.com', 'manoj@shah', '9812345678', 'Shah Footwear', 'GSTIN67890123', '67 SG Highway', 'Ahmedabad', 4.1),
(8, 'Kavita Nair', 'kavita.nair@sellers.com', 'kavita@nair', '9801234567', 'Nair Handicrafts', 'GSTIN78901234', '100 Marine Drive', 'Kochi', 4.6),
(9, 'Ravi Das', 'ravi.das@sellers.com', 'ravi@das', '9790123456', 'Das Electronics', 'GSTIN89012345', '55 Park Street', 'Kolkata', 4.4),
(10, 'Anita Singh', 'anita.singh@sellers.com', 'anita@singh', '9789123456', 'Singh Sarees', 'GSTIN90123456', '101 Gomti Nagar', 'Lucknow', 4.0),
(11, 'Sandeep Kulkarni', 'sandeep.kulkarni@sellers.com', 'sandeep@kulkarni', '9778123456', 'Kulkarni Sports', 'GSTIN01234567', '88 FC Road', 'Pune', 4.8),
(12, 'Ruchi Bansal', 'ruchi.bansal@sellers.com', 'ruchi@bansal', '9767123456', 'Bansal Jewels', 'GSTIN11223344', '40 Nehru Place', 'Delhi', 3.8),
(13, 'Naveen Yadav', 'naveen.yadav@sellers.com', 'naveen@yadav', '9756123456', 'Yadav Electronics', 'GSTIN22334455', '60 Sector 22', 'Noida', 4.1),
(14, 'Swati Joshi', 'swati.joshi@sellers.com', 'swati@joshi', '9745123456', 'Joshi Boutique', 'GSTIN33445566', '79 Lakshmi Road', 'Pune', 4.2),
(15, 'Harsh Malhotra', 'harsh.malhotra@sellers.com', 'harsh@malhotra', '9734123456', 'Malhotra Furnitures', 'GSTIN44556677', '91 Phase 5', 'Mohali', 4.4);

-- to display/retrieve table data
SELECT * FROM Sellers;               

-- to remove complete data from table
truncate table Sellers;

-- to delete complete attributes and records 
drop table Sellers;

-- Table 3: Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    parent_category_id INT,
    level INT,
    status VARCHAR(20),
    created_by VARCHAR(100),
    created_at DATE,
    updated_by VARCHAR(100),
    updated_at DATE
);

-- Insert records into the table
INSERT INTO Categories (category_id, name, description, parent_category_id, level, status,created_by, created_at, updated_by, updated_at)
 VALUES
(1, 'Electronics', 'Devices like mobiles, laptops, and appliances', NULL, 1, 'Active', 'Rajesh Kumar', '2024-01-10', 'Rajesh Kumar', '2024-01-15'),
(2, 'Mobiles', 'Smartphones and accessories', 1, 2, 'Active', 'Pooja Verma', '2024-01-11', 'Pooja Verma', '2024-01-16'),
(3, 'Laptops', 'Personal and gaming laptops', 1, 2, 'Active', 'Ankit Sharma', '2024-01-12', 'Ankit Sharma', '2024-01-16'),
(4, 'Home Appliances', 'Refrigerators, ACs, and kitchen appliances', 1, 2, 'Active', 'Divya Nair', '2024-01-13', 'Divya Nair', '2024-01-17'),
(5, 'Fashion', 'Clothing, footwear, and accessories', NULL, 1, 'Active', 'Neha Patel', '2024-01-14', 'Neha Patel', '2024-01-18'),
(6, 'Men\'s Clothing', 'Shirts, jeans, and more for men', 5, 2, 'Active', 'Ravi Reddy', '2024-01-15', 'Ravi Reddy', '2024-01-19'),
(7, 'Women\'s Clothing', 'Ethnic and western wear for women', 5, 2, 'Active', 'Anjali Shah', '2024-01-16', 'Anjali Shah', '2024-01-20'),
(8, 'Footwear', 'Shoes, sandals, slippers', 5, 2, 'Active', 'Karan Malhotra', '2024-01-17', 'Karan Malhotra', '2024-01-21'),
(9, 'Jewellery', 'Artificial and gold-plated jewellery', 5, 2, 'Active', 'Sneha Iyer', '2024-01-18', 'Sneha Iyer', '2024-01-22'),
(10, 'Books', 'Academic, novels, and stationery', NULL, 1, 'Active', 'Manoj Joshi', '2024-01-19', 'Manoj Joshi', '2024-01-23'),
(11, 'Kids', 'Toys, games, and baby products', NULL, 1, 'Active', 'Priya Mehra', '2024-01-20', 'Priya Mehra', '2024-01-24'),
(12, 'Groceries', 'Daily groceries and household items', NULL, 1, 'Active', 'Sandeep Yadav', '2024-01-21', 'Sandeep Yadav', '2024-01-25'),
(13, 'Beauty & Personal Care', 'Skincare, haircare, grooming', NULL, 1, 'Active', 'Ruchi Bansal', '2024-01-22', 'Ruchi Bansal', '2024-01-26'),
(14, 'Sports', 'Fitness equipment and accessories', NULL, 1, 'Active', 'Amit Thakur', '2024-01-23', 'Amit Thakur', '2024-01-27'),
(15, 'Furniture', 'Home and office furniture', NULL, 1, 'Active', 'Swati Kulkarni', '2024-01-24', 'Swati Kulkarni', '2024-01-28');

-- to display/retrieve table data
SELECT * FROM Categories;               

-- to remove complete data from table
truncate table Categories;

-- to delete complete attributes and records 
drop table Categories;

-- Table 4: Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(200),
    description TEXT,
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    stock INT,
    rating FLOAT,
    seller_id INT,
    category_id INT,
    warranty_period VARCHAR(50),
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Insert records into the table
INSERT INTO Products (product_id, name, description, price, discount, stock, rating, seller_id, category_id, warranty_period)
 VALUES
(1, 'Samsung Galaxy M14', 'Smartphone with 6000mAh battery and triple camera', 13999.00, 10.00, 50, 4.3, 1, 2, '1 Year'),
(2, 'Lenovo Ideapad Slim 3', '15.6" FHD Laptop with Ryzen 5 processor', 42990.00, 15.00, 20, 4.5, 3, 3, '2 Years'),
(3, 'LG 7kg Washing Machine', 'Fully automatic top-load washing machine', 17490.00, 12.50, 10, 4.2, 4, 4, '2 Years'),
(4, 'Arrow Men\'s Formal Shirt', 'Slim fit cotton formal shirt for office wear', 1499.00, 20.00, 80, 4.1, 2, 6, '6 Months'),
(5, 'Biba Women\'s Kurta', 'Printed cotton kurta with 3/4 sleeves', 1099.00, 25.00, 100, 4.4, 2, 7, '6 Months'),
(6, 'Sparx Men\'s Running Shoes', 'Stylish and comfortable sports shoes', 2299.00, 18.00, 60, 4.0, 7, 8, '1 Year'),
(7, 'Voylla Necklace Set', 'Gold-plated bridal jewellery set', 1999.00, 30.00, 40, 4.3, 12, 9, '6 Months'),
(8, 'NCERT Class 10 Maths Book', 'Latest edition with updated syllabus', 350.00, 5.00, 200, 4.6, 6, 10, 'N/A'),
(9, 'LuvLap Baby Stroller', 'Adjustable and foldable baby stroller', 5999.00, 10.00, 15, 4.5, 11, 11, '1 Year'),
(10, 'Aashirvaad Atta 10kg', 'Whole wheat flour with chakki grinding', 489.00, 7.00, 150, 4.2, 13, 12, 'N/A'),
(11, 'Lakmé Face Cream', 'Moisturizer with SPF for daily use', 249.00, 10.00, 90, 4.1, 14, 13, '1 Year'),
(12, 'Cosco Cricket Bat', 'Willow bat for beginners and pros', 1299.00, 15.00, 25, 4.0, 11, 14, '1 Year'),
(13, 'Nilkamal Plastic Chair', 'Strong and durable for home use', 899.00, 8.00, 70, 4.2, 15, 15, '3 Years'),
(14, 'Mi Smart LED TV 32"', 'HD Ready Android Smart TV with WiFi', 15999.00, 10.00, 30, 4.3, 1, 4, '1 Year'),
(15, 'Realme Narzo 60x', '5G smartphone with fast charging', 12999.00, 10.00, 40, 4.4, 1, 2, '1 Year');

-- to display/retrieve table data
SELECT * FROM Products;               

-- to remove complete data from table
truncate table Products;

-- to delete complete attributes and records 
drop table Products;

-- Table 5: Product_images
CREATE TABLE Product_Images (
    image_id INT PRIMARY KEY,
    product_id INT,
    image_url TEXT,
    is_primary BOOLEAN,
    uploaded_at DATE,
    uploaded_by VARCHAR(100),
    resolution VARCHAR(20),
    size_kb INT,
    file_type VARCHAR(10),
    status VARCHAR(20),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert records into the table
INSERT INTO Product_Images (image_id, product_id, image_url, is_primary, uploaded_at,uploaded_by, resolution, size_kb, file_type, status)
 VALUES
(1, 1, 'https://images.flipkart.com/samsung_m14.jpg', TRUE, '2024-02-01', 'Rajesh Gupta', '1080x2400', 350, 'JPG', 'Active'),
(2, 2, 'https://images.flipkart.com/lenovo_slim3.jpg', TRUE, '2024-02-02', 'Vikram Reddy', '1920x1080', 480, 'JPG', 'Active'),
(3, 3, 'https://images.flipkart.com/lg_wash_machine.jpg', TRUE, '2024-02-03', 'Pooja Mehta', '1200x1600', 550, 'PNG', 'Active'),
(4, 4, 'https://images.flipkart.com/arrow_formal_shirt.jpg', TRUE, '2024-02-04', 'Neha Patel', '800x1000', 300, 'JPG', 'Active'),
(5, 5, 'https://images.flipkart.com/biba_kurti.jpg', TRUE, '2024-02-05', 'Anjali Shah', '900x1100', 270, 'PNG', 'Active'),
(6, 6, 'https://images.flipkart.com/sparx_shoes.jpg', TRUE, '2024-02-06', 'Manoj Shah', '1000x1200', 320, 'JPG', 'Active'),
(7, 7, 'https://images.flipkart.com/voylla_necklace.jpg', TRUE, '2024-02-07', 'Ruchi Bansal', '1200x1200', 430, 'JPG', 'Active'),
(8, 8, 'https://images.flipkart.com/ncert_maths.jpg', TRUE, '2024-02-08', 'Divya Iyer', '700x900', 180, 'JPG', 'Active'),
(9, 9, 'https://images.flipkart.com/luvlap_stroller.jpg', TRUE, '2024-02-09', 'Priya Mehra', '1000x1200', 520, 'PNG', 'Active'),
(10, 10, 'https://images.flipkart.com/aashirvaad_atta.jpg', TRUE, '2024-02-10', 'Sandeep Yadav', '800x800', 200, 'JPG', 'Active'),
(11, 11, 'https://images.flipkart.com/lakme_cream.jpg', TRUE, '2024-02-11', 'Swati Kulkarni', '600x800', 150, 'PNG', 'Active'),
(12, 12, 'https://images.flipkart.com/cosco_bat.jpg', TRUE, '2024-02-12', 'Amit Thakur', '1200x800', 310, 'JPG', 'Active');

-- to display/retrieve table data
SELECT * FROM Product_Images;               

-- to remove complete data from table
truncate table Product_Images;

-- to delete complete attributes and records 
drop table Product_Images;

-- Table 6: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    delivery_date DATE,
    status VARCHAR(50),
    payment_status VARCHAR(50),
    shipping_method VARCHAR(50),
    coupon_code VARCHAR(20),
    address_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert records into the table
INSERT INTO Orders (order_id, user_id, total_amount, order_date, delivery_date, status,payment_status, shipping_method, coupon_code, address_id) 
VALUES
(1, 1, 13999.00, '2024-03-01', '2024-03-05', 'Delivered', 'Paid', 'Standard', 'FLAT100', 101),
(2, 2, 42990.00, '2024-03-02', '2024-03-08', 'Delivered', 'Paid', 'Express', 'SAVE500', 102),
(3, 3, 17490.00, '2024-03-03', '2024-03-07', 'Delivered', 'Paid', 'Standard', '', 103),
(4, 4, 1499.00, '2024-03-04', '2024-03-06', 'Delivered', 'Paid', 'Standard', 'NEW50', 104),
(5, 5, 1099.00, '2024-03-05', '2024-03-07', 'Delivered', 'Paid', 'Standard', '', 105),
(6, 6, 2299.00, '2024-03-06', '2024-03-09', 'Shipped', 'Paid', 'Express', 'SPRING10', 106),
(7, 7, 1999.00, '2024-03-07', '2024-03-12', 'Processing', 'Unpaid', 'Standard', '', 107),
(8, 8, 350.00, '2024-03-08', '2024-03-11', 'Delivered', 'Paid', 'Standard', '', 108),
(9, 9, 5999.00, '2024-03-09', '2024-03-13', 'Delivered', 'Paid', 'Express', 'FLAT200', 109),
(10, 10, 489.00, '2024-03-10', '2024-03-12', 'Delivered', 'Paid', 'Standard', '', 110),
(11, 11, 249.00, '2024-03-11', '2024-03-13', 'Delivered', 'Paid', 'Standard', '', 111),
(12, 12, 1299.00, '2024-03-12', '2024-03-15', 'Delivered', 'Paid', 'Standard', 'SPORT20', 112),
(13, 13, 899.00, '2024-03-13', '2024-03-16', 'Shipped', 'Paid', 'Express', '', 113),
(14, 14, 15999.00, '2024-03-14', '2024-03-19', 'Processing', 'Unpaid', 'Standard', '', 114),
(15, 15, 12999.00, '2024-03-15', '2024-03-18', 'Delivered', 'Paid', 'Express', 'PHONE100', 115);

-- to display/retrieve table data
SELECT * FROM Orders;               

-- to remove complete data from table
truncate table Orders;

-- to delete complete attributes and records 
drop table Orders;

-- Table 7: Order_Items
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    total_price DECIMAL(10,2),
    return_status VARCHAR(50),
    replacement_status VARCHAR(50),
    shipment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert records into the table
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price, discount, total_price,return_status, replacement_status, shipment_status)
 VALUES
(1, 1, 1, 1, 13999.00, 10.00, 12599.10, 'No Return', 'Not Applicable', 'Delivered'),
(2, 2, 2, 1, 42990.00, 15.00, 36541.50, 'No Return', 'Not Applicable', 'Delivered'),
(3, 3, 3, 1, 17490.00, 12.50, 15353.25, 'No Return', 'Not Applicable', 'Delivered'),
(4, 4, 4, 2, 1499.00, 20.00, 2398.40, 'Return Requested', 'Not Applicable', 'Delivered'),
(5, 5, 5, 1, 1099.00, 25.00, 824.25, 'No Return', 'Not Applicable', 'Delivered'),
(6, 6, 6, 1, 2299.00, 18.00, 1885.18, 'No Return', 'Not Applicable', 'Shipped'),
(7, 7, 7, 1, 1999.00, 30.00, 1399.30, 'Return Initiated', 'Pending', 'Processing'),
(8, 8, 8, 1, 350.00, 5.00, 332.50, 'No Return', 'Not Applicable', 'Delivered'),
(9, 9, 9, 1, 5999.00, 10.00, 5399.10, 'No Return', 'Not Applicable', 'Delivered'),
(10, 10, 10, 1, 489.00, 7.00, 454.77, 'No Return', 'Not Applicable', 'Delivered'),
(11, 11, 11, 2, 249.00, 10.00, 448.20, 'No Return', 'Not Applicable', 'Delivered'),
(12, 12, 12, 1, 1299.00, 15.00, 1104.15, 'No Return', 'Not Applicable', 'Delivered'),
(13, 13, 13, 1, 899.00, 8.00, 827.08, 'Return Completed', 'Replacement Approved', 'Shipped'),
(14, 14, 14, 1, 15999.00, 10.00, 14399.10, 'No Return', 'Not Applicable', 'Processing'),
(15, 15, 15, 1, 12999.00, 10.00, 11699.10, 'No Return', 'Not Applicable', 'Delivered');

-- to display/retrieve table data
SELECT * FROM Order_Items;               

-- to remove complete data from table
truncate table Order_Items;

-- to delete complete attributes and records 
drop table Order_Items;

-- Table 8: Cart
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    added_date DATE,
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    total DECIMAL(10,2),
    status VARCHAR(20),
    stock_status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert records into the table
INSERT INTO Cart (cart_id, user_id, product_id, quantity, added_date,price, discount, total, status, stock_status)
 VALUES
(1, 1, 1, 1, '2024-04-01', 13999.00, 10.00, 12599.10, 'Active', 'In Stock'),
(2, 2, 5, 2, '2024-04-02', 1099.00, 25.00, 1648.50, 'Active', 'In Stock'),
(3, 3, 3, 1, '2024-04-03', 17490.00, 12.50, 15353.25, 'Saved', 'In Stock'),
(4, 4, 6, 1, '2024-04-04', 2299.00, 18.00, 1885.18, 'Active', 'In Stock'),
(5, 5, 4, 2, '2024-04-05', 1499.00, 20.00, 2398.40, 'Active', 'Low Stock'),
(6, 6, 9, 1, '2024-04-06', 5999.00, 10.00, 5399.10, 'Saved', 'In Stock'),
(7, 7, 2, 1, '2024-04-07', 42990.00, 15.00, 36541.50, 'Active', 'Out of Stock'),
(8, 8, 10, 3, '2024-04-08', 489.00, 7.00, 1364.31, 'Active', 'In Stock'),
(9, 9, 11, 2, '2024-04-09', 249.00, 10.00, 448.20, 'Active', 'In Stock'),
(10, 10, 7, 1, '2024-04-10', 1999.00, 30.00, 1399.30, 'Saved', 'In Stock'),
(11, 11, 8, 2, '2024-04-11', 350.00, 5.00, 665.00, 'Active', 'In Stock'),
(12, 12, 13, 1, '2024-04-12', 899.00, 8.00, 827.08, 'Active', 'In Stock'),
(13, 13, 12, 1, '2024-04-13', 1299.00, 15.00, 1104.15, 'Active', 'In Stock'),
(14, 14, 15, 1, '2024-04-14', 12999.00, 10.00, 11699.10, 'Saved', 'In Stock'),
(15, 15, 14, 1, '2024-04-15', 15999.00, 10.00, 14399.10, 'Active', 'In Stock');

-- to display/retrieve table data
SELECT * FROM Cart;               

-- to remove complete data from table
truncate table Cart;

-- to delete complete attributes and records 
drop table Cart;

-- Table 9: Wishlist
CREATE TABLE Wishlist (
    wishlist_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    added_date DATE,
    priority_level INT,
    price_at_time DECIMAL(10,2),
    discount_at_time DECIMAL(5,2),
    stock_available BOOLEAN,
    notification_sent BOOLEAN,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert records into the table
INSERT INTO Wishlist (wishlist_id, user_id, product_id, added_date, priority_level,price_at_time, discount_at_time, stock_available, notification_sent, status)
 VALUES
(1, 1, 1, '2024-05-01', 1, 13999.00, 10.00, TRUE, TRUE, 'Active'),
(2, 2, 5, '2024-05-02', 2, 1099.00, 25.00, TRUE, FALSE, 'Active'),
(3, 3, 3, '2024-05-03', 1, 17490.00, 12.50, TRUE, TRUE, 'Active'),
(4, 4, 6, '2024-05-04', 3, 2299.00, 18.00, TRUE, FALSE, 'Saved'),
(5, 5, 4, '2024-05-05', 2, 1499.00, 20.00, FALSE, TRUE, 'Active'),
(6, 6, 9, '2024-05-06', 1, 5999.00, 10.00, TRUE, TRUE, 'Active'),
(7, 7, 2, '2024-05-07', 1, 42990.00, 15.00, FALSE, FALSE, 'Saved'),
(8, 8, 10, '2024-05-08', 3, 489.00, 7.00, TRUE, FALSE, 'Active'),
(9, 9, 11, '2024-05-09', 2, 249.00, 10.00, TRUE, TRUE, 'Active'),
(10, 10, 7, '2024-05-10', 1, 1999.00, 30.00, TRUE, TRUE, 'Active'),
(11, 11, 8, '2024-05-11', 3, 350.00, 5.00, TRUE, FALSE, 'Active'),
(12, 12, 13, '2024-05-12', 2, 899.00, 8.00, TRUE, TRUE, 'Saved'),
(13, 13, 12, '2024-05-13', 1, 1299.00, 15.00, TRUE, FALSE, 'Active'),
(14, 14, 15, '2024-05-14', 2, 12999.00, 10.00, TRUE, TRUE, 'Active'),
(15, 15, 14, '2024-05-15', 1, 15999.00, 10.00, FALSE, FALSE, 'Saved');

-- to display/retrieve table data
SELECT * FROM Wishlist;               

-- to remove complete data from table
truncate table Wishlist;

-- to delete complete attributes and records 
drop table Wishlist;

-- Table 10: Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    user_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    status VARCHAR(20),
    gateway_response TEXT,
    refund_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert records into the table
INSERT INTO Payments (payment_id, order_id, user_id, payment_date, amount,payment_method, transaction_id, status, gateway_response, refund_status)
 VALUES
(1, 1, 1, '2024-03-01', 12599.10, 'UPI', 'TXN1001MUMBAI', 'Success', 'Payment received successfully', 'No Refund'),
(2, 2, 2, '2024-03-02', 36541.50, 'Credit Card', 'TXN1002DELHI', 'Success', 'Payment processed', 'No Refund'),
(3, 3, 3, '2024-03-03', 15353.25, 'Net Banking', 'TXN1003BLR', 'Success', 'Payment received', 'No Refund'),
(4, 4, 4, '2024-03-04', 2398.40, 'Debit Card', 'TXN1004CHENNAI', 'Success', 'Amount credited', 'Refund Initiated'),
(5, 5, 5, '2024-03-05', 824.25, 'UPI', 'TXN1005AHMEDABAD', 'Success', 'Success via UPI', 'No Refund'),
(6, 6, 6, '2024-03-06', 1885.18, 'Credit Card', 'TXN1006HYD', 'Success', 'Processed successfully', 'No Refund'),
(7, 7, 7, NULL, 1399.30, 'UPI', 'TXN1007LUCKNOW', 'Pending', 'Awaiting confirmation', 'No Refund'),
(8, 8, 8, '2024-03-08', 332.50, 'Net Banking', 'TXN1008PUNE', 'Success', 'Payment completed', 'No Refund'),
(9, 9, 9, '2024-03-09', 5399.10, 'Credit Card', 'TXN1009KOL', 'Success', 'Transaction settled', 'No Refund'),
(10, 10, 10, '2024-03-10', 454.77, 'UPI', 'TXN1010COCHIN', 'Success', 'Received through GPay', 'No Refund'),
(11, 11, 11, '2024-03-11', 448.20, 'Debit Card', 'TXN1011JAIPUR', 'Success', 'Amount deducted', 'No Refund'),
(12, 12, 12, '2024-03-12', 1104.15, 'UPI', 'TXN1012MUM', 'Success', 'Transaction completed', 'No Refund'),
(13, 13, 13, '2024-03-13', 827.08, 'Net Banking', 'TXN1013DEL', 'Success', 'Payment done', 'Refund Completed'),
(14, 14, 14, NULL, 14399.10, 'Credit Card', 'TXN1014PUNE', 'Pending', 'Awaiting bank confirmation', 'No Refund'),
(15, 15, 15, '2024-03-15', 11699.10, 'UPI', 'TXN1015BLR', 'Success', 'UPI payment success', 'No Refund');

-- to display/retrieve table data
SELECT * FROM Payments;               

-- to remove complete data from table
truncate table Payments;

-- to delete complete attributes and records 
drop table Payments;

-- Table 11: Addresses
CREATE TABLE Addresses (
    address_id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    address_line1 TEXT,
    address_line2 TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    address_type VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert records into the table
INSERT INTO Addresses (address_id, user_id, name, phone_number, address_line1, address_line2,city, state, pincode, address_type) 
VALUES
(101, 1, 'Aarav Mehta', '9876543210', '123 MG Road', 'Near City Mall', 'Mumbai', 'Maharashtra', '400001', 'Home'),
(102, 2, 'Priya Sharma', '9867452301', '56 Nehru Nagar', 'Opp. Park', 'Delhi', 'Delhi', '110001', 'Home'),
(103, 3, 'Rohan Verma', '9845123678', '77 Residency Road', '3rd Floor', 'Bangalore', 'Karnataka', '560025', 'Work'),
(104, 4, 'Sneha Iyer', '9801234567', '9 Indira Nagar', 'Next to SBI Bank', 'Chennai', 'Tamil Nadu', '600020', 'Home'),
(105, 5, 'Vikram Patel', '9756423810', '12 Satellite Road', 'Near Big Bazaar', 'Ahmedabad', 'Gujarat', '380015', 'Home'),
(106, 6, 'Anjali Reddy', '9834765123', '44 Jubilee Hills', 'Opp. Apollo Hospital', 'Hyderabad', 'Telangana', '500033', 'Home'),
(107, 7, 'Karan Singh', '9745236789', '89 Civil Lines', 'Near Railway Colony', 'Lucknow', 'Uttar Pradesh', '226001', 'Work'),
(108, 8, 'Pooja Joshi', '9893456789', '32 Shastri Nagar', 'Flat No. 302', 'Pune', 'Maharashtra', '411005', 'Home'),
(109, 9, 'Arjun Das', '9736452781', '76 Park Street', 'Above Café Coffee Day', 'Kolkata', 'West Bengal', '700016', 'Home'),
(110, 10, 'Divya Nair', '9823456712', '45 Marine Drive', 'Near Gateway Plaza', 'Cochin', 'Kerala', '682011', 'Work'),
(111, 11, 'Rahul Jain', '9789023456', '88 Ashok Vihar', 'Block B', 'Jaipur', 'Rajasthan', '302001', 'Home'),
(112, 12, 'Meera Shah', '9812345678', '23 Ghatkopar East', 'Next to ICICI Bank', 'Mumbai', 'Maharashtra', '400077', 'Home'),
(113, 13, 'Nikhil Aggarwal', '9778456123', '19 Connaught Place', '2nd Floor', 'Delhi', 'Delhi', '110001', 'Work'),
(114, 14, 'Swati Kulkarni', '9856765432', '65 FC Road', 'Above Pizza Hut', 'Pune', 'Maharashtra', '411004', 'Home'),
(115, 15, 'Amitabh Rao', '9723456789', '101 MG Road', 'Near Bus Stand', 'Bangalore', 'Karnataka', '560001', 'Home');

-- to display/retrieve table data
SELECT * FROM Addresses;               

-- to remove complete data from table
truncate table Addresses;

-- to delete complete attributes and records 
drop table Addresses;

-- Table 12: Shipping
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    courier_name VARCHAR(50),
    tracking_number VARCHAR(50),
    shipped_date DATE,
    estimated_delivery DATE,
    actual_delivery DATE,
    shipping_status VARCHAR(50),
    delivery_person VARCHAR(100),
    delivery_contact VARCHAR(15),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert records into the table
INSERT INTO Shipping (shipping_id, order_id, courier_name, tracking_number, shipped_date,estimated_delivery, actual_delivery, shipping_status, delivery_person, delivery_contact)
 VALUES
(1, 1, 'Delhivery', 'DL123456789', '2024-03-01', '2024-03-05', '2024-03-05', 'Delivered', 'Ravi Kumar', '9876543210'),
(2, 2, 'Blue Dart', 'BD987654321', '2024-03-02', '2024-03-08', '2024-03-08', 'Delivered', 'Sunil Mehra', '9812345678'),
(3, 3, 'Ekart', 'EK1122334455', '2024-03-03', '2024-03-07', '2024-03-07', 'Delivered', 'Amit Sinha', '9801234567'),
(4, 4, 'Ecom Express', 'EC5566778899', '2024-03-04', '2024-03-06', '2024-03-06', 'Delivered', 'Pankaj Verma', '9798765432'),
(5, 5, 'Delhivery', 'DL1123581321', '2024-03-05', '2024-03-07', '2024-03-07', 'Delivered', 'Deepak Chauhan', '9765432109'),
(6, 6, 'Blue Dart', 'BD1029384756', '2024-03-06', '2024-03-09', NULL, 'Shipped', 'Karan Joshi', '9745632189'),
(7, 7, 'Ekart', 'EK6677889900', '2024-03-07', '2024-03-12', NULL, 'Processing', 'Mohit Bansal', '9823456710'),
(8, 8, 'Ecom Express', 'EC9090909090', '2024-03-08', '2024-03-11', '2024-03-11', 'Delivered', 'Vikas Yadav', '9732165478'),
(9, 9, 'Delhivery', 'DL1414213562', '2024-03-09', '2024-03-13', '2024-03-13', 'Delivered', 'Siddharth Desai', '9809765432'),
(10, 10, 'Blue Dart', 'BD1122112211', '2024-03-10', '2024-03-12', '2024-03-12', 'Delivered', 'Rajeev Menon', '9789012345'),
(11, 11, 'Ekart', 'EK777888999', '2024-03-11', '2024-03-13', '2024-03-13', 'Delivered', 'Santosh Rane', '9723456789'),
(12, 12, 'Ecom Express', 'EC4545454545', '2024-03-12', '2024-03-15', '2024-03-15', 'Delivered', 'Ajay Thakur', '9911223344'),
(13, 13, 'Delhivery', 'DL999888777', '2024-03-13', '2024-03-16', NULL, 'Shipped', 'Yogesh Kapoor', '9900112233'),
(14, 14, 'Blue Dart', 'BD5432167890', '2024-03-14', '2024-03-19', NULL, 'Processing', 'Rakesh Mishra', '9988776655'),
(15, 15, 'Ekart', 'EK1597534862', '2024-03-15', '2024-03-18', '2024-03-18', 'Delivered', 'Naveen Rao', '9876540987');

-- to display/retrieve table data
SELECT * FROM Shipping;               

-- to remove complete data from table
truncate table Shipping;

-- to delete complete attributes and records 
drop table Shipping;

-- Table 13: Product_reviews
CREATE TABLE Product_Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE,
    helpful_count INT,
    is_verified_purchase BOOLEAN,
    reply_from_seller TEXT,
    status VARCHAR(20),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert records into the table
INSERT INTO Product_Reviews (review_id, product_id, user_id, rating, review_text, review_date,helpful_count, is_verified_purchase, reply_from_seller, status)
 VALUES
(1, 1, 1, 5, 'Amazing phone with long battery life. Totally worth the price!', '2024-03-10', 12, TRUE, 'Thank you for your feedback!', 'Published'),
(2, 2, 2, 4, 'Good laptop for students. Display quality is nice.', '2024-03-11', 8, TRUE, 'Glad you liked it!', 'Published'),
(3, 3, 3, 5, 'Works great and cleans efficiently. Happy with the purchase.', '2024-03-12', 5, TRUE, 'Thanks for shopping with us!', 'Published'),
(4, 4, 4, 3, 'Material is okay, fitting could be better.', '2024-03-13', 3, TRUE, 'We’ll work on it.', 'Published'),
(5, 5, 5, 4, 'Color is vibrant and fabric is soft. Liked it!', '2024-03-14', 6, TRUE, 'Thank you for your kind words!', 'Published'),
(6, 6, 6, 2, 'Design is nice but sole quality is not good.', '2024-03-15', 2, TRUE, 'Sorry for the experience. We’ll improve.', 'Published'),
(7, 7, 7, 5, 'Perfect for wedding functions. Loved the look.', '2024-03-16', 7, TRUE, 'Happy to hear that!', 'Published'),
(8, 8, 8, 4, 'Latest edition, useful for board exam prep.', '2024-03-17', 4, TRUE, 'Thanks for your trust!', 'Published'),
(9, 9, 9, 5, 'Smooth ride and durable stroller. Baby loves it.', '2024-03-18', 9, TRUE, 'So glad to hear that!', 'Published'),
(10, 10, 10, 5, 'Fresh and authentic atta. Satisfied.', '2024-03-19', 6, TRUE, 'Thanks for your trust!', 'Published'),
(11, 11, 11, 4, 'Good moisturizer. Non-sticky and smells great.', '2024-03-20', 3, TRUE, 'We appreciate your review!', 'Published'),
(12, 12, 12, 3, 'Average bat for beginners. Not for pros.', '2024-03-21', 2, TRUE, 'Thank you for the feedback.', 'Published'),
(13, 13, 13, 4, 'Strong and reliable. Good for daily use.', '2024-03-22', 4, TRUE, 'Thank you for choosing us!', 'Published'),
(14, 14, 14, 5, 'Excellent smart TV with great picture quality.', '2024-03-23', 10, TRUE, 'Thank you! Enjoy streaming!', 'Published'),
(15, 15, 15, 5, 'Very fast and responsive phone. Must buy!', '2024-03-24', 11, TRUE, 'Thanks for your valuable feedback!', 'Published');

-- to display/retrieve table data
SELECT * FROM Product_Reviews;               

-- to remove complete data from table
truncate table Product_Reviews;

-- to delete complete attributes and records 
drop table Product_Reviews;

-- Table 14: Coupons
CREATE TABLE Coupons (
    coupon_id INT PRIMARY KEY,
    code VARCHAR(20),
    description TEXT,
    discount_percent DECIMAL(5,2),
    max_discount_amount DECIMAL(10,2),
    min_order_amount DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    usage_limit INT,
    status VARCHAR(20)
);

-- Insert records into the table
INSERT INTO Coupons (coupon_id, code, description, discount_percent, max_discount_amount,min_order_amount, start_date, end_date, usage_limit, status) 
VALUES
(1, 'FLAT100', 'Flat ₹100 off on orders above ₹999', 10.00, 100.00, 999.00, '2024-04-01', '2024-07-31', 500, 'Active'),
(2, 'SAVE200', 'Save ₹200 on electronics', 12.50, 200.00, 1500.00, '2024-04-05', '2024-08-15', 300, 'Active'),
(3, 'MONSOON25', 'Monsoon special 25% off', 25.00, 300.00, 1000.00, '2024-06-01', '2024-07-30', 100, 'Active'),
(4, 'FIRST50', '₹50 off on first purchase', 5.00, 50.00, 500.00, '2024-01-01', '2024-12-31', 1, 'Active'),
(5, 'RAKHI10', '10% off on Raksha Bandhan gifts', 10.00, 150.00, 800.00, '2024-07-01', '2024-08-25', 200, 'Upcoming'),
(6, 'FREEDOM75', 'Independence Day offer 15%', 15.00, 500.00, 2000.00, '2024-08-10', '2024-08-20', 150, 'Upcoming'),
(7, 'SAVEONAPP', 'Extra 10% off on app orders', 10.00, 120.00, 1000.00, '2024-05-01', '2024-09-30', 250, 'Active'),
(8, 'WOMEN20', '20% off on Women’s Wear', 20.00, 250.00, 999.00, '2024-03-08', '2024-09-30', 100, 'Active'),
(9, 'NEWUSER', 'Exclusive for new users', 15.00, 150.00, 700.00, '2024-01-01', '2024-12-31', 1, 'Active'),
(10, 'FESTIVE30', '30% festive discount', 30.00, 400.00, 2000.00, '2024-10-01', '2024-11-15', 500, 'Inactive'),
(11, 'KITCHEN15', '15% off on kitchen essentials', 15.00, 200.00, 1200.00, '2024-06-10', '2024-08-10', 80, 'Active'),
(12, 'PHONE100', 'Flat ₹100 off on mobile phones', 5.00, 100.00, 5000.00, '2024-04-01', '2024-09-01', 300, 'Active'),
(13, 'BOOKLOVE', '₹75 off on books above ₹499', 10.00, 75.00, 499.00, '2024-05-10', '2024-08-10', 150, 'Active'),
(14, 'MEGADEAL', 'Mega Sale - 20% off', 20.00, 300.00, 1500.00, '2024-06-15', '2024-07-20', 200, 'Active'),
(15, 'STUDENT10', 'Extra 10% off for students', 10.00, 100.00, 800.00, '2024-01-15', '2024-12-15', 100, 'Active');

-- to display/retrieve table data
SELECT * FROM Coupons;               

-- to remove complete data from table
truncate table Coupons;

-- to delete complete attributes and records 
drop table Coupons;

-- Table 15: Returns
CREATE TABLE Returns (
    return_id INT PRIMARY KEY,
    order_item_id INT,
    user_id INT,
    reason TEXT,
    request_date DATE,
    return_status VARCHAR(50),
    refund_amount DECIMAL(10,2),
    approved_by VARCHAR(100),
    pickup_date DATE,
    refund_date DATE,
    FOREIGN KEY (order_item_id) REFERENCES Order_Items(order_item_id)
);

-- Insert records into the table
INSERT INTO Returns (return_id, order_item_id, user_id, reason, request_date,return_status, refund_amount, approved_by, pickup_date, refund_date)
 VALUES
(1, 4, 4, 'Size too small', '2024-04-01', 'Approved', 2398.40, 'Priya Sharma', '2024-04-03', '2024-04-07'),
(2, 7, 7, 'Product damaged on delivery', '2024-04-02', 'Pending', 1399.30, 'Karan Patel', NULL, NULL),
(3, 13, 13, 'Received wrong item', '2024-04-03', 'Approved', 827.08, 'Divya Nair', '2024-04-05', '2024-04-08'),
(4, 6, 6, 'Low quality material', '2024-04-04', 'Rejected', 0.00, 'Anjali Reddy', NULL, NULL),
(5, 12, 12, 'Not satisfied with the product', '2024-04-05', 'Approved', 1104.15, 'Rahul Jain', '2024-04-07', '2024-04-10'),
(6, 2, 2, 'Defective laptop', '2024-04-06', 'Approved', 36541.50, 'Vikram Patel', '2024-04-09', '2024-04-13'),
(7, 10, 10, 'Product not as described', '2024-04-07', 'Rejected', 0.00, 'Rohan Verma', NULL, NULL),
(8, 8, 8, 'Late delivery, no longer needed', '2024-04-08', 'Approved', 332.50, 'Sneha Iyer', '2024-04-10', '2024-04-12'),
(9, 11, 11, 'Item expired', '2024-04-09', 'Approved', 448.20, 'Meera Shah', '2024-04-11', '2024-04-15'),
(10, 14, 14, 'Better price elsewhere', '2024-04-10', 'Pending', 14399.10, 'Swati Kulkarni', NULL, NULL),
(11, 5, 5, 'Color mismatch', '2024-04-11', 'Rejected', 0.00, 'Aarav Mehta', NULL, NULL),
(12, 9, 9, 'Duplicate product', '2024-04-12', 'Approved', 5399.10, 'Pooja Joshi', '2024-04-14', '2024-04-17'),
(13, 3, 3, 'Does not meet expectations', '2024-04-13', 'Approved', 15353.25, 'Nikhil Aggarwal', '2024-04-15', '2024-04-18'),
(14, 15, 15, 'Changed my mind', '2024-04-14', 'Pending', 11699.10, 'Amitabh Rao', NULL, NULL),
(15, 1, 1, 'Duplicate order placed', '2024-04-15', 'Approved', 12599.10, 'Arjun Das', '2024-04-17', '2024-04-20');

-- to display/retrieve table data
SELECT * FROM Returns;               

-- to remove complete data from table
truncate table Returns;

-- to delete complete attributes and records 
drop table Returns;













