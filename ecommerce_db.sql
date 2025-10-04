-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS ECommerceDB;
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2. CREATE TABLE: Categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 3. CREATE TABLE: Products
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE, -- Ensures product codes are unique
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0), -- Price must be non-negative
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    category_id INT,
    
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 4. CREATE TABLE: Customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, 
    phone VARCHAR(20)
);

-- 5. CREATE TABLE: Orders
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0),
    status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending',
    
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. CREATE TABLE: OrderItems 
CREATE TABLE OrderItems (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL,
    
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    
    -- Composite Primary Key 
    PRIMARY KEY (order_id, product_id) 
);

-- 7. CREATE TABLE: Addresses 
CREATE TABLE Addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_type ENUM('Shipping', 'Billing') NOT NULL, 
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20),
    country VARCHAR(100) NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),

    -- Constraint
    UNIQUE KEY uc_customer_address (customer_id, address_type)
);


