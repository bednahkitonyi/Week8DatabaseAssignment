# 📚 Books Management Database
 
This project is a fully normalized relational database system designed to manage books, authors, customers, and order processes for a bookstore or online book retail platform.
 
---
 
## 🗂️ Table of Contents
 
- [Features](#features)
- [Entity-Relationship Overview](#entity-relationship-overview)
- [Database Schema](#database-schema)
- [Setup Instructions](#setup-instructions)
- [Example Queries](#example-queries)
- [Future Improvements](#future-improvements)
 
---
 
## ✅ Features
 
- Store detailed book metadata including language and publisher
- Support for multiple authors per book (many-to-many relationship)
- Track customer details, addresses, and shipping
- Full order processing with history and line items
- Built-in order status tracking
 
---
 
## 🧩 Entity-Relationship Overview
 
### Key Entities
 
- **Book**
- **Author**
- **Book_authors** (Junction table)
- **Book_lang**
- **Publishers**
- **Customers**
- **Addresses**
- **Customer_order**
- **Order_line**
- **Shipping**
- **Order_history**
 
### Simplified Relationships
 
- A `Book` can have **multiple Authors** (via `Book_authors`)
- A `Book` is written in one `Book_lang` and published by one `Publisher`
- A `Customer` can have multiple `Addresses`
- A `Customer_order` includes multiple `Order_line` items
- Each `Customer_order` has one `Shipping` record
- The `Order_history` table tracks the status changes of an order over time
 
---
 
## 🧱 Database Schema
 
### 🔹 Book
 
| Field        | Type         | Description                     |
|--------------|--------------|---------------------------------|
| book_id      | INT (PK)     | Unique identifier for a book    |
| title        | VARCHAR(50)  | Title of the book               |
| genre        | VARCHAR(20)  | Genre of the book               |
| publisher_id | INT (FK)     | References `Publishers`         |
| lang_id      | INT (FK)     | References `Book_lang`          |
| page_count   | INT          | Number of pages                 |
 
---
 
### 🔹 Author
 
| Field        | Type         | Description              |
|--------------|--------------|--------------------------|
| author_id    | INT (PK)     | Unique ID for author     |
| first_name   | VARCHAR(15)  | Author's first name      |
| last_name    | VARCHAR(10)  | Author's last name       |
| dob          | DATE         | Date of birth            |
| nationality  | VARCHAR(15)  | Author's nationality     |
| biography    | TEXT         | Short biography          |
 
---
 
### 🔹 Book_authors
 
| Field     | Type      | Description                          |
|-----------|-----------|--------------------------------------|
| book_id   | INT (FK)  | References `Book`                    |
| author_id | INT (FK)  | References `Author`                  |
| PRIMARY KEY (book_id, author_id)                              |
 
---
 
### 🔹 Book_lang
 
| Field     | Type         | Description         |
|-----------|--------------|---------------------|
| lang_id   | INT (PK)     | Language ID         |
| language  | VARCHAR(15)  | Name of language    |
 
---
 
### 🔹 Publishers
 
| Field         | Type         | Description            |
|---------------|--------------|------------------------|
| publisher_id  | INT (PK)     | Publisher ID           |
| publisher     | VARCHAR(60)  | Publisher name         |
 
---
 
### 🔹 Customers
 
| Field        | Type         | Description                |
|--------------|--------------|----------------------------|
| customer_id  | INT (PK)     | Customer ID                |
| first_name   | VARCHAR(20)  | First name                 |
| last_name    | VARCHAR(20)  | Last name                  |
| email        | VARCHAR(50)  | Email address              |
| phone_number | VARCHAR(15)  | Phone number               |
 
---
 
### 🔹 Addresses
 
| Field        | Type         | Description                      |
|--------------|--------------|----------------------------------|
| address_id   | INT (PK)     | Address ID                       |
| customer_id  | INT (FK)     | References `Customers`           |
| street       | VARCHAR(100) | Street address                   |
| city         | VARCHAR(30)  | City                             |
| state        | VARCHAR(30)  | State                            |
| zip_code     | VARCHAR(10)  | Postal code                      |
| country      | VARCHAR(30)  | Country                          |
 
---
 
### 🔹 Customer_order
 
| Field        | Type         | Description                      |
|--------------|--------------|----------------------------------|
| order_id     | INT (PK)     | Unique order ID                  |
| customer_id  | INT (FK)     | Customer placing the order       |
| order_date   | DATE         | Date the order was placed        |
 
---
 
### 🔹 Order_line
 
| Field      | Type         | Description                        |
|------------|--------------|------------------------------------|
| order_id   | INT (FK)     | References `Customer_order`        |
| book_id    | INT (FK)     | References `Book`                  |
| quantity   | INT          | Number of copies ordered           |
| price      | DECIMAL(10,2)| Price per unit at time of order    |
| PRIMARY KEY (order_id, book_id)                                  |
 
---
 
### 🔹 Shipping
 
| Field        | Type         | Description                          |
|--------------|--------------|--------------------------------------|
| shipping_id  | INT (PK)     | Unique ID for shipping record        |
| order_id     | INT (FK)     | Order being shipped                  |
| address_id   | INT (FK)     | Address where it's shipped           |
| shipped_date | DATE         | Date of shipment                     |
| delivery_est | DATE         | Estimated delivery date              |
 
---
 
### 🔹 Order_history
 
| Field         | Type         | Description                           |
|---------------|--------------|---------------------------------------|
| history_id    | INT (PK)     | Unique history record ID              |
| order_id      | INT (FK)     | Order being tracked                   |
| status        | VARCHAR(20)  | Order status (e.g., Pending, Shipped) |
| updated_at    | TIMESTAMP    | Time the status was updated           |
 
---
 
## 🛠️ Setup Instructions
 
1. **Create a MySQL Database**
   ```sql
   CREATE DATABASE BooksManagementDB;
   USE BooksManagementDB;
