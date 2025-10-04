# Week 8 Assignment: E-Commerce Database Management System

This repository contains the final project for Week 8, demonstrating the design and implementation of a full-featured relational database using MySQL for an E-Commerce Store.

The database covers essential entities, relationships, and constraints required to manage products, categories, customers, orders, and addresses.

## Live GitHub Repository

You can access the project repository here:

[https://github.com/IsaacDev14/Week-8-Assignment-Final-Project](git@github.com:IsaacDev14/Week-8-Assignment-Final-Project.git)

## Database Overview

The E-Commerce database is designed to handle core online store functionalities including:

* Product management
* Category classification
* Customer accounts
* Orders and order items
* Customer addresses (shipping and billing)

### Entities and Relationships

1. **Categories**: One-to-Many relationship with Products (One category can have multiple products).
2. **Products**: Stores product details and links to Categories.
3. **Customers**: Holds customer information.
4. **Orders**: One-to-Many relationship with Customers. Tracks order date, total, and status.
5. **OrderItems**: Many-to-Many relationship between Orders and Products. Composite primary key ensures no duplicate product items per order.
6. **Addresses**: One-to-Many relationship with Customers. Each customer can have one Shipping and one Billing address.

### Key Features and Constraints

* Primary Keys and Foreign Keys ensure relational integrity.
* Unique constraints on `sku` (Products) and `email` (Customers) prevent duplicates.
* ENUMs for controlled values (`status` for Orders, `address_type` for Addresses).
* CHECK constraints on numeric fields like `price`, `stock_quantity`, and `quantity` (requires MySQL 8.0.16+).
* Composite primary key in `OrderItems` ensures each product appears only once per order.

## Getting Started

To set up the database on your local machine, follow these steps:

### 1. Clone the Repository

```bash
git clone git@github.com:IsaacDev14/Week-8-Assignment-Final-Project.git
```

### 2. Open SQL Client

Use MySQL Workbench, phpMyAdmin, or any MySQL client of your choice.

### 3. Execute SQL Script

* Locate the `.sql` file in the repository.
* Run the script to create the database, tables, and sample relationships.

## Project Structure

```
/root
├── library_management.sql    # Main SQL file with CREATE DATABASE and CREATE TABLE statements
├── README.md                # Project documentation
```

## Sample Queries

* List all products with their categories:

```sql
SELECT p.name AS product_name, c.category_name
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;
```

* List all orders with customer names:

```sql
SELECT o.order_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, o.total_amount, o.status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;
```

* List all items in a specific order:

```sql
SELECT oi.order_id, p.name AS product_name, oi.quantity, oi.unit_price
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_id = 1;
```

## Outcome

* Fully functional relational database for an E-Commerce Store.
* Properly defined entities, relationships, and constraints.
* Ready for integration with CRUD applications or further development.

