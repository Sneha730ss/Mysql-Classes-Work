-- ------------------------------------------------------------- Advance Questions --------------------------------------------------------------------------
-- -------------------------------------------------------------- Subqueries --------------------------------------------------------------------------------

-- 1. Write a query to find the top 5 customers with the highest total order amount.
select c.customer_id, c.customer_name, SUM(o.order_amount) as total_amount
from customers cross
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_amount desc
limit 5;

-- 2. Retrieve the names of customers who have placed order in the past 30 days.
select distinct c.customer_name
from customers cross
join orders o on c.customer_id = o.customer_id
Where o.order_date >= curdate() - Interval 30 day;

-- 3. find the products that have been ordered at least three times. 
select p.product_id, p.product_name, count(od.order_id) as order_count
from products p
join orderDetails od on p.product_id = od.product_id
group by p.product_id, p.product_name
having count(od.order_id) >= 3;

--  4. Retrieve the order details for orders placed by customers from a specific city. 
select o.order_id, c.customer_name, c.city, o.order_date, o.order_amount
from orders o
join customers c on o.customer_id = c.customer_id
where c.city = 'Mumbai';

-- 5. Write a query to find the customers who have placed orders for products with a price greater than $100. 
select distinct c.customer_name
from customers c
join orders o on c.customer_id = o.customer_id
join orderDetails od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where p.price > 100;

-- 6. Get the average order amount for each customer. 
select c.customer_id, c.customer_name, avg(o.order_amount) as avg_order_amount
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 7. Find the products that have never been ordered. 
select p.product_id, p.product_name
from products p 
left join orderDetails od on p.product_id = od.product_id
where od.order_id is null;

-- 8. Retrieve the names of customers who have placed orders on weekends. 
select distinct c.customer_name
from customers c
join orders o on c.customer_id = o.customer_id
where dayofweek(o.order_date) in (1, 7);
 
-- 9. Get the total order amount for each month.
select date_format(o.order_date, '%Y-%m') as month, sum(order_amount) as total_amount
from orders o 
group by date_format(o.order_date, '%Y-%m')
order by month;

-- 10. Write a query to find the customers who have placed orders more than two different products.  
select c.customer_name, count(distinct od.product_id) as product_count
from customers c
join orders o on c.customer_id = o.customer_id
join orderDetails od on o.order_id = od.order_id
group by c.customer_name
having count(distinct od.product_id) > 2;

-- ------------------------------------------------------------- Joins ---------------------------------------------------------------------------------------------

-- 1. Retrieve the order details along with the customer name and product name for each other.
select o.order_id, c.customer_name, p.product_name, od.quantity, o.order_date, o.order_amount 
from orders o
join customers c on o.customer_id = c.customer_id
join orderDetails od on o.order_id = od.order_id
join products p on od.product_id = p.product_id;

-- 2. Find the products and their corresponding suppliers names. 
select p.product_id, p.product_name, s.supplier_name
from products p 
join suppliers s on p.supplier_id = s.supplier_id;

-- 3. Get a list of customers who have never placed an order. 
select c.customer_id, c.customer_name from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_id is null;

-- 4. Retrieve the names of customres along with the total quantity of products they ordered.
select c.customer_name, sum(od.quantity) as total_quantity from customers c
join orders o on c.customer_id = o.customer_id
join orderDetails od on o.order_id = od.order_id
group by c.customer_name;

-- 5. find the products that have been ordered by customers from a specific country. 
SELECT DISTINCT 
    p.product_name
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
JOIN Orders o ON od.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.country = 'India';

-- 6. Get the total order amount for each customer, including those who have not placed any orders. 
SELECT 
    c.customer_id,
    c.customer_name,
    IFNULL(SUM(o.order_amount), 0) AS total_order_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 7. Retrieve the orders details for orders placed by customers with a specific occupation. 
SELECT 
    o.order_id,
    c.customer_name,
    c.occupation,
    o.order_date,
    o.order_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.occupation = 'Engineer';

-- 8. Find the customers who have placed orders for products with a price higher than the average price of all products. 
SELECT DISTINCT 
    c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.price > (SELECT AVG(price) FROM Products);

-- 9. Retrieve the names of customers along with the total number of orders they have placed.
 SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

 -- 10. Get a list of products and the total quantity ordered for each product. 
 SELECT 
    p.product_name,
    SUM(od.quantity) AS total_quantity_ordered
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- --------------------------------------------------------------- Filtering and Sorting --------------------------------------------------------------------

-- 1. Retrieve all customers with names starting with 'A' and ending with 'n'. 
SELECT *
FROM Customers
WHERE customer_name LIKE 'A%n';

-- 2. Find the products with names containing at least one digit. 
SELECT *
FROM Products
WHERE product_name REGEXP '[0-9]';

-- 3. Get the list of employees sorted by their salary in ascending order. Null values should appear at the end. 
SELECT *
FROM Employees
ORDER BY 
  CASE WHEN salary IS NULL THEN 1 ELSE 0 END,
  salary ASC;

-- 4. Retrieve the customers whose names contain exactly five characters. 
SELECT *
FROM Customers
WHERE customer_name LIKE '_____';   -- 5 underscores = 5 characters

-- 5. Find the products with names starting with 'S' and ending with 'e'. 
SELECT *
FROM Products
WHERE product_name LIKE 'S%e';

-- 6. Get the list of employees sorted by their last name and then  y their first name. 
SELECT *
FROM Employees
ORDER BY last_name ASC, first_name ASC;

-- 7. Retrieve the orders placed on a specific date and sort them by the customer name in alphabetical order. 
SELECT o.order_id, o.order_date, c.customer_name, o.order_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_date = '2025-10-10'
ORDER BY c.customer_name ASC;

-- 8. Find the products with names containing exactly three letters. 
SELECT *
FROM Products
WHERE product_name LIKE '___';   -- 3 underscores = 3 letters

-- 9. Get the list of employees sorted by their salary in descending order. 
SELECT *
FROM Employees
ORDER BY salary DESC;

-- 10. Retrieve the customers whose names contains a space character. 
SELECT *
FROM Customers
WHERE customer_name LIKE '% %';

-- -------------------------------------------------------------- Aggregations and Grouping -----------------------------------------------------------------

-- 1. Calculate the total quantity and total amount for each order. 
SELECT 
    o.order_id,
    SUM(od.quantity) AS total_quantity,
    SUM(od.quantity * od.price) AS total_amount
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
GROUP BY o.order_id;

-- 2. Find the average age and the number of employees for each job title. 
SELECT 
    job_title,
    AVG(age) AS average_age,
    COUNT(*) AS number_of_employees
FROM Employees
GROUP BY job_title;

-- 3. Get the total number od products in each category. 
SELECT 
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;

-- 4. Calculate the average rating and the number of rebviews for each product. 
SELECT 
    p.product_name,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS number_of_reviews
FROM Products p
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_name;

-- 5. Find the customers with the highest and lowest total order amounts. 
SELECT c.customer_name, SUM(o.order_amount) AS total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_amount DESC
LIMIT 1;  -- Highest

-- For lowest:
SELECT c.customer_name, SUM(o.order_amount) AS total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_amount ASC
LIMIT 1;  -- Lowest

-- 6. Get the maximum and minimum ages for each department. 
SELECT 
    d.department_name,
    MAX(e.age) AS max_age,
    MIN(e.age) AS min_age
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 7. Calculate the total sales amount and the number of orders for each month. 
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(order_amount) AS total_sales,
    COUNT(order_id) AS number_of_orders
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 8. Find the average price and the number of products for each supplier. 
SELECT 
    s.supplier_name,
    AVG(p.price) AS average_price,
    COUNT(p.product_id) AS number_of_products
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name;

-- 9. Get the maximum and minimum prices for each product category. 
SELECT 
    c.category_name,
    MAX(p.price) AS max_price,
    MIN(p.price) AS min_price
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;

-- 10. Calculate the average rating and the number of reviews for each product category. 
SELECT 
    c.category_name,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS number_of_reviews
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY c.category_name;

-- ----------------------------------------------------------------- Data Manipulation ----------------------------------------------------------------------

-- 1. Increase the salary of all employees by 10%. 
UPDATE Employees
SET salary = salary * 1.10;

-- 2. Delete all orders older than 1 year and their associated order items. 
START TRANSACTION;

DELETE FROM OrderDetails
WHERE order_id IN (
    SELECT order_id FROM Orders
    WHERE order_date < CURDATE() - INTERVAL 1 YEAR
);

DELETE FROM Orders
WHERE order_date < CURDATE() - INTERVAL 1 YEAR;

COMMIT;

-- 3. Insert a new category into the database and update all products of a specific category to the new category in a single transaction. 
START TRANSACTION;

INSERT INTO Categories (category_name)
VALUES ('New Category');

UPDATE Products
SET category_id = (SELECT category_id FROM Categories WHERE category_name = 'New Category')
WHERE category_id = (SELECT category_id FROM Categories WHERE category_name = 'Old Category');

COMMIT;

-- 4. Update the discount percentage for all products in a specific price range. 
UPDATE Products
SET discount = 15
WHERE price BETWEEN 500 AND 1000;

-- 5. Delete all reviews with a rating lower than 3. 
DELETE FROM Reviews
WHERE rating < 3;

-- 6. Insert a new customer into the database along with their associated orders and order items in a single transaction.
START TRANSACTION;

-- Insert customer
INSERT INTO Customers (customer_name)
VALUES ('Sneha Sahu');

-- Insert order
INSERT INTO Orders (customer_id, order_date, order_amount)
VALUES (LAST_INSERT_ID(), CURDATE(), 2000);

-- Insert order items (assuming product IDs 101, 102)
INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES (LAST_INSERT_ID(), 101, 2, 500),
       (LAST_INSERT_ID(), 102, 1, 1000);

COMMIT;

-- 7. Increase the salary of all employees in a specific department by 15%. 
UPDATE Employees
SET salary = salary * 1.15
WHERE department_id = (
    SELECT department_id FROM Departments WHERE department_name = 'IT'
);

-- 8. Delete all products that have not been ordered. 
DELETE FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM OrderDetails
);

-- 9. Inset a new suppier into the database along with their associated products and ensure that all the records are inserted or none at all. 
START TRANSACTION;

INSERT INTO Suppliers (supplier_name)
VALUES ('TechNova Supplies');

INSERT INTO Products (product_name, supplier_id, category_id, price)
VALUES 
('Smart Sensor', LAST_INSERT_ID(), 2, 1200),
('AI Module', LAST_INSERT_ID(), 2, 2200);

COMMIT;

-- 10. Update the order dates for all orders placed on weekends to the following Monday. 
UPDATE Orders
SET order_date = DATE_ADD(order_date, INTERVAL (9 - DAYOFWEEK(order_date)) % 7 DAY)
WHERE DAYOFWEEK(order_date) IN (1, 7);  -- Sunday (1) or Saturday (7)

-- -------------------------------------------------------------- Database Concepts -------------------------------------------------------------------------

-- 1. Create a view to display the total sales amount for each product. 
CREATE VIEW Product_Sales AS
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity * od.price) AS total_sales
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name;

select * from Product_Sales;

-- 2. Optimize a query that retrieves the order details for a specific customer, sorting them by the order date in descending order. 
SELECT * 
FROM Orders 
WHERE customer_id = 101
ORDER BY order_date DESC;

CREATE INDEX idx_orders_customer_date ON Orders(customer_id, order_date DESC);

SELECT order_id, order_date, order_amount
FROM Orders
WHERE customer_id = 101
ORDER BY order_date DESC;

-- 3. Create an index on the 'last_name' column of the 'Employees' table and measure the performance improvement on a specific query. 
CREATE INDEX idx_employees_lastname ON Employees(last_name);

-- 4. Create a view to display the average rating and the number of reviews for each product. 
CREATE VIEW Product_Ratings AS
SELECT 
    p.product_id,
    p.product_name,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM Products p
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name;

-- 5. Optimize a query that retrieves the top 10 customers with the highest total order amounts. 
SELECT c.customer_name, SUM(o.order_amount) AS total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_amount DESC
LIMIT 10;

CREATE INDEX idx_orders_customer_amount ON Orders(customer_id, order_amount);

-- 6. Create an index on the 'order_date' column of the 'Orders table and analyze the query performance for a specific date range. 
CREATE INDEX idx_orders_date ON Orders(order_date);
EXPLAIN
SELECT *
FROM Orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31';

-- 7. Create a view to display the average salary for each department. 
CREATE VIEW Department_AvgSalary AS
SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 8. optimize a query that retrieves the list of products with their respective categories, filtering them by a specific category. 
SELECT p.product_name, c.category_name
FROM Products p
JOIN Categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Electronics';

CREATE INDEX idx_products_category ON Products(category_id);
CREATE INDEX idx_categories_name ON Categories(category_name);

-- 9. Create an index on the 'Product_name' column of the 'Products' table and analyze the query performance for a specific search term. 
CREATE INDEX idx_products_name ON Products(product_name);

EXPLAIN
SELECT * 
FROM Products 
WHERE product_name LIKE 'Smart%';

-- 10. Create a view to display the total order amount for each customer. 
CREATE VIEW Customer_TotalOrders AS
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_order_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- ------------------------------------------------------------- SQL Functions ------------------------------------------------------------------------------

-- 1. Retrieve the top 3 customers based on their total order amounts, and calculate the percentage of each customer's order amount compared to the total. 
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_amount,
    ROUND(SUM(o.order_amount) * 100 / (SELECT SUM(order_amount) FROM Orders), 2) AS percentage_of_total
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_amount DESC
LIMIT 3;

-- 2. Create a stored procedure to update the salary of an employee and log the change in a separate table. 
CREATE TABLE Salary_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_date DATETIME DEFAULT NOW()
);

DELIMITER //
CREATE PROCEDURE UpdateEmployeeSalary(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    DECLARE old_salary DECIMAL(10,2);
    
    SELECT salary INTO old_salary FROM Employees WHERE employee_id = emp_id;
    
    UPDATE Employees
    SET salary = new_salary
    WHERE employee_id = emp_id;
    
    INSERT INTO Salary_Log (employee_id, old_salary, new_salary)
    VALUES (emp_id, old_salary, new_salary);
END //
DELIMITER ;

CALL UpdateEmployeeSalary(101, 75000);

-- 3. Calculate the average rating for each product and assign a rank based on the ratiing using a window function. 
SELECT 
    p.product_id,
    p.product_name,
    AVG(r.rating) AS avg_rating,
    RANK() OVER (ORDER BY AVG(r.rating) DESC) AS rating_rank
FROM Products p
JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name;

-- 4. Implement a stored procedure to insert a new order along with its order item into the database. 
DELIMITER //
CREATE PROCEDURE InsertNewOrder(
    IN cust_id INT,
    IN prod_id INT,
    IN qty INT,
    IN price DECIMAL(10,2)
)
BEGIN
    DECLARE new_order_id INT;
    DECLARE total_amount DECIMAL(10,2);
    
    SET total_amount = qty * price;

    INSERT INTO Orders (customer_id, order_date, order_amount)
    VALUES (cust_id, CURDATE(), total_amount);
    
    SET new_order_id = LAST_INSERT_ID();
    
    INSERT INTO OrderDetails (order_id, product_id, quantity, price)
    VALUES (new_order_id, prod_id, qty, price);
END //
DELIMITER ;

CALL InsertNewOrder(201, 10, 3, 500);

-- 5. Retrieve the top 5 products based on the cumulative sales amount using a window function. 
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity * od.price) AS total_sales,
    RANK() OVER (ORDER BY SUM(od.quantity * od.price) DESC) AS sales_rank
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 5;

-- 6. Create a stored procedure to calculate the total order amount for a specific customer and return the result. 
DELIMITER //
CREATE PROCEDURE GetCustomerTotal(IN cust_id INT, OUT total_amount DECIMAL(10,2))
BEGIN
    SELECT SUM(order_amount)
    INTO total_amount
    FROM Orders
    WHERE customer_id = cust_id;
END //
DELIMITER ;

CALL GetCustomerTotal(201, @total);
SELECT @total AS Customer_Total;

-- 7. Calculate the average rating for each product category and assign a rank based on the rating using a window function. 
SELECT 
    c.category_name,
    AVG(r.rating) AS avg_rating,
    RANK() OVER (ORDER BY AVG(r.rating) DESC) AS rating_rank
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN Reviews r ON p.product_id = r.product_id
GROUP BY c.category_name;

-- 8. Implement a stored procedure to delete a customer and all associated orders and order items from the database. 
DELIMITER //
CREATE PROCEDURE DeleteCustomerData(IN cust_id INT)
BEGIN
    DELETE FROM OrderDetails
    WHERE order_id IN (SELECT order_id FROM Orders WHERE customer_id = cust_id);

    DELETE FROM Orders
    WHERE customer_id = cust_id;

    DELETE FROM Customers
    WHERE customer_id = cust_id;
END //
DELIMITER ;

CALL DeleteCustomerData(201);

-- 9. Retrieve the top 3 employees based on their total sales amounts using a window function. 
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(o.order_amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(o.order_amount) DESC) AS sales_rank
FROM Employees e
JOIN Orders o ON e.employee_id = o.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_sales DESC
LIMIT 3;

-- 10. Create a stored procedure to update the quantity in stock for a specific product and log the change in a separate table. 
CREATE TABLE Stock_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    old_stock INT,
    new_stock INT,
    change_date DATETIME DEFAULT NOW()
);

DELIMITER //
CREATE PROCEDURE UpdateProductStock(
    IN prod_id INT,
    IN new_stock INT
)
BEGIN
    DECLARE old_stock INT;

    SELECT quantity_in_stock INTO old_stock FROM Products WHERE product_id = prod_id;

    UPDATE Products
    SET quantity_in_stock = new_stock
    WHERE product_id = prod_id;

    INSERT INTO Stock_Log (product_id, old_stock, new_stock)
    VALUES (prod_id, old_stock, new_stock);
END //
DELIMITER ;

CALL UpdateProductStock(105, 150);

-- -------------------------------------------------------------- Normalization -----------------------------------------------------------------------------

-- 1. Normalize the given unnormalized table into 3rd normal form (3NF). 
Students(student_id PK, student_name)
Courses(course_id PK, course_name, instructor)
StudentCourses(student_id FK, course_id FK)

-- 2. Write a recursive SQL query to find all ancestors of a specific employee in a hierarchical employee table. 
WITH RECURSIVE managers AS (
    SELECT employee_id, manager_id, first_name, last_name, 0 AS depth
    FROM Employees
    WHERE employee_id = 123 -- starting employee

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.first_name, e.last_name, m.depth + 1
    FROM Employees e
    JOIN managers m ON e.employee_id = m.manager_id
)
SELECT * FROM managers WHERE depth > 0;

-- 3. Use advanced SQL techniques to pivot the given table and transform rows into columns. 
SELECT
    product,
    MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan,
    MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb,
    MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar
FROM Sales
GROUP BY product;

-- 5. Write a recursive SQL query to find all dependent employees under a specific manager in a hierarchical organization structure. 
WITH RECURSIVE subordinates AS (
    SELECT employee_id, first_name, last_name, manager_id, 1 AS depth
    FROM Employees
    WHERE manager_id = 10 -- starting manager

    UNION ALL

    SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, s.depth + 1
    FROM Employees e
    JOIN subordinates s ON e.manager_id = s.employee_id
)
SELECT * FROM subordinates ORDER BY depth;

-- 6. Use advanced SQL technique to unpivot the given table and transform columns into rows. 
SELECT product, 'Jan' AS month, Jan AS revenue FROM MonthlySales
UNION ALL
SELECT product, 'Feb', Feb FROM MonthlySales
UNION ALL
SELECT product, 'Mar', Mar FROM MonthlySales;

-- 8. Write a recursive SQL query to find all categories and their subcategories in a hierarchical category table. 
WITH RECURSIVE category_hierarchy AS (
    SELECT category_id, category_name, parent_id, 0 AS depth
    FROM Categories
    WHERE parent_id IS NULL

    UNION ALL

    SELECT c.category_id, c.category_name, c.parent_id, ch.depth + 1
    FROM Categories c
    JOIN category_hierarchy ch ON c.parent_id = ch.category_id
)
SELECT * FROM category_hierarchy ORDER BY depth, category_name;

-- 9. Use advanced SQL techniques to perform a cross join between two tables. 
SELECT p.product_name, c.color_name
FROM Products p
CROSS JOIN Colors c;

-- ------------------------------------------------------------- Performance optimization -------------------------------------------------------------------

-- 1. Optimize a query that retrieves customer details along with their total order amounts for a specific date range. 
SELECT
  c.customer_id,
  c.customer_name,
  COALESCE(SUM(o.order_amount),0) AS total_amount
FROM Customers c
LEFT JOIN Orders o
  ON c.customer_id = o.customer_id
  AND o.order_date BETWEEN '2025-01-01' AND '2025-06-30'   -- push date filter into JOIN
GROUP BY c.customer_id, c.customer_name
ORDER BY total_amount DESC;

-- 2. Identify and eliminate unnecessary joins in a query that retrieves product details and their corresponding categories. 
CREATE INDEX idx_products_category ON Products(category_id);

SELECT p.product_id, p.product_name, c.category_name
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;

-- 3. Rewrite a subquery as a join in a query that retrieves the order details along with the customer names for all orders. 
SELECT od.order_id, od.product_id, od.quantity, od.price,
       o.customer_id, c.customer_name
FROM OrderDetails od
JOIN Orders o ON od.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id;

-- 4. Optimize a query that calculates the average rating for each product by using appropriate indexes. 
CREATE INDEX idx_reviews_product_rating ON Reviews(product_id, rating);

SELECT p.product_id, p.product_name, AVG(r.rating) AS avg_rating, COUNT(*) AS review_count
FROM Products p
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name;

-- 5. Identify an eliminate redundant joins in a query that retrieves employee details along with their department information. 
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.department_id;

-- 6. Rewrite a subquery as a join in a query that retrieves the names of customers who have placed at least two orders. 
SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2;

-- 7. Optimize a query that calculates the total sales amount for each month by using appropriate indexes. 
-- index on Orders.order_date helps grouping by date
CREATE INDEX idx_orders_order_date ON Orders(order_date);

-- if you compute totals via OrderDetails, ensure quick join to Orders:
CREATE INDEX idx_orderdetails_orderid ON OrderDetails(order_id);

SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month_year,
       SUM(od.quantity * od.price) AS total_sales,
       COUNT(DISTINCT o.order_id) AS number_of_orders
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
WHERE o.order_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY month_year
ORDER BY month_year;

-- 8. Identify and eliminate unnecessary joins in a query that retrieves product details and their correspondin suppliers names. 
CREATE INDEX idx_products_supplier ON Products(supplier_id);

SELECT p.product_id, p.product_name, s.supplier_name
FROM Products p
JOIN Suppliers s ON p.supplier_id = s.supplier_id;

-- 9. Rewrite a subquery as a join in a query that retrieves the names of customers who have placed orders in the past 30 days. 
CREATE INDEX idx_orders_customer_date ON Orders(customer_id, order_date);

SELECT DISTINCT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- 10. Optimize a query that retrieves the top 5 products with the highest sales amounts by using appropriate indexes.   
CREATE INDEX idx_od_product_qty_price ON OrderDetails(product_id, quantity, price);
CREATE INDEX idx_products_id ON Products(product_id);

SELECT p.product_id, p.product_name, SUM(od.quantity * od.price) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 5;

-- ------------------------------------------------------------- SQL Techniques -----------------------------------------------------------------------------

-- 1. Write a recursive SQL query to find all categories and their subcategories in a hierarchical category table. 
WITH RECURSIVE category_hierarchy AS (
  -- anchor: top-level categories (parent_id IS NULL)
  SELECT
    category_id,
    category_name,
    parent_id,
    0 AS depth,
    CAST(category_name AS CHAR(1000)) AS path
  FROM Categories
  WHERE parent_id IS NULL

  UNION ALL

  -- recursive step: find children
  SELECT
    c.category_id,
    c.category_name,
    c.parent_id,
    ch.depth + 1 AS depth,
    CONCAT(ch.path, ' > ', c.category_name) AS path
  FROM Categories c
  JOIN category_hierarchy ch ON c.parent_id = ch.category_id
)
SELECT *
FROM category_hierarchy
ORDER BY path;

-- 2. Use a common table expression to calculate the running total of order amounts for each customer. 
WITH customer_orders AS (
  SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_amount
  FROM Orders o
)
SELECT
  co.customer_id,
  co.order_id,
  co.order_date,
  co.order_amount,
  SUM(co.order_amount) OVER (
    PARTITION BY co.customer_id
    ORDER BY co.order_date, co.order_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM customer_orders co
ORDER BY co.customer_id, co.order_date, co.order_id;

-- 3. Apply window functions to calculate the average rating and the maximum rating for each product. 
SELECT DISTINCT
  r.product_id,
  AVG(r.rating) OVER (PARTITION BY r.product_id)   AS avg_rating,
  MAX(r.rating) OVER (PARTITION BY r.product_id)   AS max_rating
FROM Reviews r;

-- 4. Write a recursive SQL query to find all the employees and their direct reports in a hierarchical employee table. 
WITH RECURSIVE emp_tree AS (
  -- anchor: top-level managers (those without a manager) OR choose any starting point
  SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.manager_id,
    0 AS depth,
    CAST(CONCAT(e.first_name, ' ', e.last_name) AS CHAR(1000)) AS path
  FROM Employees e
  WHERE e.manager_id IS NULL

  UNION ALL

  SELECT
    r.employee_id,
    r.first_name,
    r.last_name,
    r.manager_id,
    et.depth + 1 AS depth,
    CONCAT(et.path, ' > ', r.first_name, ' ', r.last_name) AS path
  FROM Employees r
  JOIN emp_tree et ON r.manager_id = et.employee_id
)
SELECT *
FROM emp_tree
ORDER BY path;

-- 5. Use a common table expression to calculate the cumulative sum of quantities for each product. 
WITH product_sales AS (
  SELECT
    od.order_id,
    od.product_id,
    od.quantity,
    COALESCE(o.order_date, '1970-01-01') AS order_date
  FROM OrderDetails od
  LEFT JOIN Orders o ON od.order_id = o.order_id
)
SELECT
  ps.product_id,
  ps.order_id,
  ps.order_date,
  ps.quantity,
  SUM(ps.quantity) OVER (
    PARTITION BY ps.product_id
    ORDER BY ps.order_date, ps.order_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_quantity
FROM product_sales ps
ORDER BY ps.product_id, ps.order_date, ps.order_id;

-- 6. Apply window functions to calculate the minimum and maximum order amounts for each month. 
SELECT
  o.order_id,
  o.order_date,
  o.order_amount,
  DATE_FORMAT(o.order_date, '%Y-%m') AS month_year,
  MIN(o.order_amount) OVER (
    PARTITION BY DATE_FORMAT(o.order_date, '%Y-%m')
  ) AS month_min_amount,
  MAX(o.order_amount) OVER (
    PARTITION BY DATE_FORMAT(o.order_date, '%Y-%m')
  ) AS month_max_amount
FROM Orders o
ORDER BY month_year, o.order_date;

-- 7. Write a recursive SQL query to find all ancestors of a specific employee in a hierarchical employee table. 
-- replace :emp_id with the target employee id (e.g., 123)
WITH RECURSIVE managers AS (
  -- start from the employee whose ancestors we need
  SELECT
    e.employee_id,
    e.manager_id,
    e.first_name,
    e.last_name,
    0 AS depth
  FROM Employees e
  WHERE e.employee_id = emp_id

  UNION ALL

  -- step up to manager
  SELECT
    m.employee_id,
    m.manager_id,
    m.first_name,
    m.last_name,
    managers.depth + 1
  FROM Employees m
  JOIN managers ON m.employee_id = managers.manager_id
  WHERE managers.manager_id IS NOT NULL
)
SELECT *
FROM managers
WHERE depth > 0     -- depth>0 gives only ancestors (omit to include the original employee)
ORDER BY depth;

-- 8. Use a common table expression to calculate the average rating and the number of reviews for each product. 
WITH prod_reviews AS (
  SELECT product_id, rating
  FROM Reviews
)
SELECT
  pr.product_id,
  AVG(pr.rating)     AS avg_rating,
  COUNT(*)           AS review_count
FROM prod_reviews pr
GROUP BY pr.product_id
ORDER BY avg_rating DESC;

-- 9. Apply window functions to calculate the rank and dense rank of sales amounts for each product. 
WITH product_totals AS (
  SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity * od.price) AS total_sales
  FROM Products p
  LEFT JOIN OrderDetails od ON p.product_id = od.product_id
  GROUP BY p.product_id, p.product_name
)
SELECT
  pt.*,
  RANK()      OVER (ORDER BY pt.total_sales DESC)  AS sales_rank,
  DENSE_RANK()OVER (ORDER BY pt.total_sales DESC)  AS sales_dense_rank
FROM product_totals pt
ORDER BY pt.total_sales DESC;

-- 10. Write a recursiev SQL query to find all dependent employees under a specific manager in a hierarchical organization structure. 
-- replace :manager_id with the manager you want to expand (e.g., 10)
WITH RECURSIVE subordinates AS (
  -- immediate direct reports of the manager
  SELECT
    e.employee_id,
    e.manager_id,
    e.first_name,
    e.last_name,
    1 AS depth,
    CAST(CONCAT(e.first_name, ' ', e.last_name) AS CHAR(1000)) AS path
  FROM Employees e
  WHERE e.manager_id = manager_id

  UNION ALL

  -- find reports of reports
  SELECT
    e2.employee_id,
    e2.manager_id,
    e2.first_name,
    e2.last_name,
    s.depth + 1 AS depth,
    CONCAT(s.path, ' > ', e2.first_name, ' ', e2.last_name) AS path
  FROM Employees e2
  JOIN subordinates s ON e2.manager_id = s.employee_id
)
SELECT *
FROM subordinates
ORDER BY depth, path;

