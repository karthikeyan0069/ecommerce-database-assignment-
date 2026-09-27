-- TASK 2 - E-COMMERCE ORDER MANAGEMENT SYSTEM
-- Category and Product Tables

-- 1. Create Database
CREATE DATABASE ECommerceTask2;

-- 2. Select Database
USE ECommerceTask2;


-- =========================================
-- 3. CREATE CATEGORY TABLE
-- =========================================

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(255) NOT NULL
);


-- =========================================
-- 4. CREATE PRODUCT TABLE
-- =========================================

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL UNIQUE,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock_Quantity INT NOT NULL,

    CONSTRAINT fk_product_category
        FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID),

    CONSTRAINT chk_product_price
        CHECK (Price > 0),

    CONSTRAINT chk_product_stock
        CHECK (Stock_Quantity >= 0)
);


-- =========================================
-- 5. INSERT CATEGORY DATA
-- =========================================

INSERT INTO Category
(Category_ID, Category_Name, Description)
VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Men and women clothing products'),
(3, 'Books', 'Educational and general books'),
(4, 'Home Appliances', 'Appliances used at home'),
(5, 'Sports', 'Sports and fitness products');


-- =========================================
-- 6. INSERT PRODUCT DATA
-- Minimum 10 products
-- =========================================

INSERT INTO Product
(Product_ID, Product_Name, Category_ID, Price, Stock_Quantity)
VALUES
(101, 'Laptop', 1, 55000.00, 20),
(102, 'Smartphone', 1, 25000.00, 35),
(103, 'Wireless Headphones', 1, 2500.00, 50),

(104, 'T-Shirt', 2, 799.00, 60),
(105, 'Running Shoes', 2, 2499.00, 40),

(106, 'Python Programming Book', 3, 899.00, 25),
(107, 'Data Science Book', 3, 1099.00, 20),

(108, 'Air Conditioner', 4, 42000.00, 10),
(109, 'Washing Machine', 4, 32000.00, 15),

(110, 'Cricket Bat', 5, 3500.00, 30);


-- =========================================
-- 7. DISPLAY CATEGORY TABLE
-- =========================================

SELECT * FROM Category;


-- =========================================
-- 8. DISPLAY PRODUCT TABLE
-- =========================================

SELECT * FROM Product;


-- =========================================
-- 9. INSERT OPERATION
-- Add a new product
-- =========================================

INSERT INTO Product
(Product_ID, Product_Name, Category_ID, Price, Stock_Quantity)
VALUES
(111, 'Smart Watch', 1, 4999.00, 25);


-- =========================================
-- 10. UPDATE OPERATION
-- Modify product price
-- =========================================

UPDATE Product
SET Price = 5299.00
WHERE Product_ID = 111;


-- =========================================
-- 11. UPDATE STOCK QUANTITY
-- Increase stock after new shipment
-- =========================================

UPDATE Product
SET Stock_Quantity = Stock_Quantity + 20
WHERE Product_ID = 101;


-- =========================================
-- 12. DELETE OPERATION
-- Remove discontinued product
-- =========================================

DELETE FROM Product
WHERE Product_ID = 111;


-- =========================================
-- 13. CATEGORY-WISE PRODUCT REPORTS
-- =========================================


-- A. Display all products under each category

SELECT
    c.Category_Name,
    p.Product_ID,
    p.Product_Name,
    p.Price,
    p.Stock_Quantity
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
ORDER BY c.Category_Name;


-- B. Count number of products in each category

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Product_Count
FROM Category c
LEFT JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name;


-- C. Find highest-priced product in each category

SELECT
    c.Category_Name,
    p.Product_Name,
    p.Price
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
WHERE p.Price = (
    SELECT MAX(p2.Price)
    FROM Product p2
    WHERE p2.Category_ID = p.Category_ID
);


-- D. Display categories having more than 5 products

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Product_Count
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name
HAVING COUNT(p.Product_ID) > 5;


-- E. Find average product price category-wise

SELECT
    c.Category_Name,
    ROUND(AVG(p.Price), 2) AS Average_Price
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name;
