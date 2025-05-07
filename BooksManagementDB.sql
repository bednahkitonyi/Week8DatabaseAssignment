create database BooksManagementDB;
use BooksManagementDB;


CREATE TABLE Book(book_id INT PRIMARY KEY, title VARCHAR(50),author VARCHAR(20),genre VARCHAR(20),publisher VARCHAR(60),lang VARCHAR(15), page_count INT);

INSERT INTO Book(book_id, title, author, genre, publisher, lang, page_count)
VALUES 
(1, "To Kill a Mockingbird", "Harper Lee", "Fiction", "Lippincott ", "English", 281),
(2, "1984", "George Orwell", "Dystopian", "Secker & Warburg", "English", 328),
(3, "The Alchemist", "Paulo Coelho", "Adventure", "HarperCollins", "English", 208),
(4, "The Great Gatsby", "F. Scott Fitzgerald", "Classic", "Charles Scribner's Sons", "English", 180),
(5, "Things Fall Apart", "Chinua Achebe", "Historical Fiction", "Heinemann", "English", 209);




CREATE TABLE Author( Author_id INT PRIMARY KEY, First_name VARCHAR(15), Last_name VARCHAR(10),Dob DATE ,Nationality VARCHAR(15),Biography TEXT); 

INSERT INTO Author(Author_id, First_name, Last_name, Dob, Nationality, Biography) 
VALUES
(1, 'Harper', 'Lee', '1926-04-28', 'American', 'Harper Lee was an American novelist best known for her 1960 novel ''To Kill a Mockingbird''.'),
(2, 'George', 'Orwell', '1903-06-25', 'British', 'George Orwell was an English novelist and essayist, famous for works like ''1984'' and ''Animal Farm''.'),
(3, 'Paulo', 'Coelho', '1947-08-24', 'Brazilian', 'Paulo Coelho is a Brazilian lyricist and novelist, best known for his novel ''The Alchemist''.'),
(4, 'F. Scott', 'Fitzgerald', '1896-09-24', 'American', 'F. Scott Fitzgerald was an American novelist and short story writer, widely regarded for ''The Great Gatsby''.'),
(5, 'Chinua', 'Achebe', '1930-11-16', 'Nigerian', 'Chinua Achebe was a Nigerian novelist, poet, and critic, best known for ''Things Fall Apart''.'); 


CREATE TABLE Book_authors (
    book_id INT,
    Author_id INT,
    Author_order INT,
    Rol VARCHAR(20),
    PRIMARY KEY (book_id, Author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (Author_id) REFERENCES Author(Author_id)
);


INSERT INTO Book_authors (book_id, Author_id, Author_order, Rol) 
VALUES 
(1, 1, 1, 'Author'),         -- "To Kill a Mockingbird" by Harper Lee
(2, 2, 1, 'Author'),         -- "1984" by George Orwell
(3, 3, 1, 'Author'),         -- "The Alchemist" by Paulo Coelho
(4, 4, 1, 'Author'),         -- "The Great Gatsby" by F. Scott Fitzgerald
(5, 5, 1, 'Author');         -- "Things Fall Apart" by Chinua Achebe



CREATE TABLE Book_lang(Lang_id INT PRIMARY KEY,lang_name VARCHAR(30));

INSERT INTO Book_lang (Lang_id, lang_name) 
VALUES
(1, 'English'),
(2, 'French'),
(3, 'Spanish'),
(4, 'German'),
(5, 'Swahili');



-- Publishers table


CREATE TABLE publishers(publisher_id INT PRIMARY KEY ,Publisher_name VARCHAR(30),Country VARCHAR(20),Established_year INT,Contact VARCHAR(50));

INSERT INTO publishers (publisher_id, Publisher_name, Country, Established_year, Contact) 
VALUES
(1, 'J.B. Lippincott & Co.', 'United States', 1836, '+1-800-555-1234'),
(2, 'Secker & Warburg', 'United Kingdom', 1935, '+44-20-7946-0958'),
(3, 'HarperCollins', 'United States', 1989, '+1-212-207-7000'),
(4, 'Charles Scribner\'s Sons', 'United States', 1846, '+1-800-555-5678'),
(5, 'Heinemann', 'United Kingdom', 1890, '+44-20-7946-0977');


CREATE TABLE Customers(customer_id INT AUTO_INCREMENT  PRIMARY KEY , First_name VARCHAR(20),Last_name VARCHAR(20),Email VARCHAR(50),Phone_num VARCHAR(20));

INSERT INTO Customers (customer_id, First_name, Last_name, Email, Phone_num) 
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '+1-555-123-4567'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '+1-555-234-5678'),
(3, 'Carlos', 'Mendez', 'carlos.m@example.com', '+52-555-345-6789'),
(4, 'Amina', 'Yusuf', 'amina.yusuf@example.com', '+254-712-345-678'),
(5, 'Liu', 'Wei', 'liu.wei@example.cn', '+86-10-1234-5678');


CREATE TABLE Customer_addresses ( address_id INT PRIMARY KEY,customer_id INT, address_type VARCHAR(30),country  VARCHAR(30),is_default BOOLEAN ,FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));
INSERT INTO Customer_addresses (address_id, customer_id, address_type, country, is_default)
VALUES
(1, 1, 'Home', 'United States', TRUE),
(2, 1, 'Work', 'United States', FALSE),
(3, 2, 'Home', 'United Kingdom', TRUE),
(4, 3, 'Home', 'Mexico', TRUE),
(5, 4, 'Home', 'Kenya', TRUE),
(6, 5, 'Work', 'China', FALSE);



CREATE TABLE Address_status(status_id INT AUTO_INCREMENT PRIMARY KEY,status_name ENUM('Active', 'Inactive', 'Pending', 'Suspended'),des_cription TEXT,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

INSERT INTO Address_status (status_name, des_cription)
VALUES
('Active', 'The address is active and in use.'),
('Inactive', 'The address is not currently in use.'),
('Pending', 'The address is under review or verification.'),
('Suspended', 'The address has been suspended due to policy violations.');


CREATE TABLE Address (address_id INT PRIMARY KEY, address_line1 VARCHAR(100), city VARCHAR(50), state_province VARCHAR(50), postal_code VARCHAR(20), country VARCHAR(50));

INSERT INTO Address (address_id, address_line1, city, state_province, postal_code, country) VALUES
(1, '123 Maple Street', 'Springfield', 'Illinois', '62704', 'United States'),
(2, '45 Queen Street', 'London', 'Greater London', 'SW1A 1AA', 'United Kingdom'),
(3, '89 Avenida Reforma', 'Mexico City', 'CDMX', '06600', 'Mexico'),
(4, '12 Moi Avenue', 'Nairobi', 'Nairobi County', '00100', 'Kenya'),
(5, '77 Beijing Road', 'Beijing', 'Beijing Municipality', '100000', 'China');


CREATE TABLE Country (country_id INT PRIMARY KEY, country_name VARCHAR(50), country_code VARCHAR(5));

INSERT INTO Country (country_id, country_name, country_code) VALUES
(1, 'Kenya', 'KE'),
(2, 'Uganda', 'UG'),
(3, 'Tanzania', 'TZ'),
(4, 'Nigeria', 'NG'),
(5, 'South Africa', 'ZA'),
(6, 'United States', 'US'),
(7, 'United Kingdom', 'UK');



CREATE TABLE Order_status (order_status_id INT PRIMARY KEY, status_name VARCHAR(50), is_final BOOLEAN);

INSERT INTO Order_status (order_status_id, status_name, is_final) VALUES 
(1, 'Pending', FALSE), 
(2, 'Paid', FALSE), 
(3, 'Cancelled', TRUE), 
(4, 'Shipped', FALSE), 
(5, 'Delivered', TRUE);



CREATE TABLE Customer_order (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, order_status_id INT, shipping_address_id INT, billing_address_id INT, total_amount DECIMAL(10,2), payment_method VARCHAR(30), tracking_number VARCHAR(50), FOREIGN KEY (customer_id) REFERENCES Customers(customer_id), FOREIGN KEY (order_status_id) REFERENCES Order_status(order_status_id));


INSERT INTO Customer_order (order_id, customer_id, order_date, order_status_id, shipping_address_id, billing_address_id, total_amount, payment_method, tracking_number) 
VALUES 
(1, 1, '2025-04-01', 1, 101, 102, 250.75, 'Credit Card', 'TRACK123456'),
(2, 2, '2025-04-02', 2, 103, 104, 320.50, 'PayPal', 'TRACK987654'),
(3, 3, '2025-04-03', 3, 105, 106, 150.00, 'Bank Transfer', NULL),
(4, 4, '2025-04-04', 1, 107, 108, 420.00, 'Credit Card', 'TRACK654321'),
(5, 5, '2025-04-05', 2, 109, 110, 530.20, 'PayPal', 'TRACK321987');


CREATE TABLE Order_line (order_line_id INT PRIMARY KEY, order_id INT, book_id INT, quantity INT, unit_price DECIMAL(10,2), discount DECIMAL(10,2), FOREIGN KEY (order_id) REFERENCES Customer_order(order_id), FOREIGN KEY (book_id) REFERENCES Book(book_id));

INSERT INTO Order_line (order_line_id, order_id, book_id, quantity, unit_price, discount) 
VALUES 
(1, 1, 1, 2, 125.38, 10.00), 
(2, 2, 2, 3, 106.83, 15.00), 
(3, 3, 3, 1, 150.00, 5.00), 
(4, 4, 4, 2, 210.00, 20.00), 
(5, 5, 5, 4, 132.55, 12.00);


CREATE TABLE Shipping_method (shipping_method_id INT PRIMARY KEY, name VARCHAR(50), estimated_days INT, per_item_price DECIMAL(10,2), is_active BOOLEAN);

INSERT INTO Shipping_method (shipping_method_id, name, estimated_days, per_item_price, is_active) 
VALUES 
(1, 'Standard', 7, 5.00, TRUE), 
(2, 'Express', 3, 10.00, TRUE), 
(3, 'Overnight', 1, 25.00, TRUE), 
(4, 'Pickup', 0, 0.00, TRUE);


CREATE TABLE Order_history (history_id INT PRIMARY KEY, order_id INT, status_id INT, changed_at TIMESTAMP, changed_by VARCHAR(50), FOREIGN KEY (order_id) REFERENCES Customer_order(order_id), FOREIGN KEY (status_id) REFERENCES Order_status(order_status_id));

INSERT INTO Order_history (history_id, order_id, status_id, changed_at, changed_by) 
VALUES 
(1, 1, 1, '2025-04-01 10:00:00', 'Admin'),
(2, 2, 2, '2025-04-02 14:30:00', 'System'),
(3, 3, 3, '2025-04-03 09:00:00', 'Customer'),
(4, 4, 1, '2025-04-04 12:45:00', 'Admin'),
(5, 5, 2, '2025-04-05 16:30:00', 'System');






