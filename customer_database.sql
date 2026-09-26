-- E-Commerce Order Management System
-- Database Creation and Customer Data

-- 1. Create Database
CREATE DATABASE ECommerce;

-- 2. Select Database
USE ECommerce;

-- 3. Create Customer Table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Registration_Date DATE NOT NULL
);

-- 4. Insert Customer Records
INSERT INTO Customer
(Customer_ID, Customer_Name, Email, Phone, Address, City, Registration_Date)
VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9876543210',
 '12 Main Road', 'Karur', '2026-01-10'),

(2, 'Priya S', 'priya@gmail.com', '9876543211',
 '24 Gandhi Street', 'Coimbatore', '2026-01-15'),

(3, 'Rahul M', 'rahul@gmail.com', '9876543212',
 '18 Anna Nagar', 'Chennai', '2026-02-05'),

(4, 'Divya R', 'divya@gmail.com', '9876543213',
 '45 Temple Road', 'Trichy', '2026-02-12'),

(5, 'Kavin P', 'kavin@gmail.com', '9876543214',
 '8 Market Street', 'Salem', '2026-03-01'),

(6, 'Sneha V', 'sneha@gmail.com', '9876543215',
 '32 Lake Road', 'Erode', '2026-03-10'),

(7, 'Vijay K', 'vijay@gmail.com', '9876543216',
 '16 Nehru Street', 'Madurai', '2026-03-18'),

(8, 'Keerthana M', 'keerthana@gmail.com', '9876543217',
 '29 Park Avenue', 'Tiruppur', '2026-04-02'),

(9, 'Sanjay R', 'sanjay@gmail.com', '9876543218',
 '11 Bus Stand Road', 'Namakkal', '2026-04-15'),

(10, 'Nithya P', 'nithya@gmail.com', '9876543219',
 '7 College Road', 'Karur', '2026-05-01');

-- 5. Display Customer Records
SELECT * FROM Customer;
