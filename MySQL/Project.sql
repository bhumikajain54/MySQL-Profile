create database sanitaryware;
use sanitaryware;

-- Create tables --
CREATE TABLE User (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('Admin', 'Customer') -- ENUM type for role
);

CREATE TABLE Category (
    categoryId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE Product (
    productId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    categoryId INT,
    FOREIGN KEY (categoryId) REFERENCES Category(categoryId)
);

CREATE TABLE `Order` (
    orderId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    orderDate DATE,
    status VARCHAR(50),
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (userId) REFERENCES User(userId)
);

CREATE TABLE OrderItem (
    orderItemId INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    productId INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE ShoppingCart (
    cartId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    FOREIGN KEY (userId) REFERENCES User(userId)
);

CREATE TABLE CartItem (
    cartItemId INT PRIMARY KEY AUTO_INCREMENT,
    cartId INT,
    productId INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (cartId) REFERENCES ShoppingCart(cartId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Payment (
    paymentId INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    paymentDate DATE,
    paymentMethod VARCHAR(50),
    amount DECIMAL(10, 2),
    paymentStatus VARCHAR(50),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId)
);

CREATE TABLE Address (
    addressId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postalCode VARCHAR(10),
    country VARCHAR(100),
    FOREIGN KEY (userId) REFERENCES User(userId)
);

CREATE TABLE Review (
    reviewId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    productId INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    reviewDate DATE,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

-- Insert Queries --
-- Insert data into User
INSERT INTO User (name, email, password, role) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'password123', 'Customer'),
('Bob Smith', 'bob.smith@example.com', 'password123', 'Customer'),
('Carol Davis', 'carol.davis@example.com', 'password123', 'Admin'),
('David Brown', 'david.brown@example.com', 'password123', 'Customer'),
('Emily Wilson', 'emily.wilson@example.com', 'password123', 'Customer'),
('Frank Moore', 'frank.moore@example.com', 'password123', 'Admin'),
('Grace Taylor', 'grace.taylor@example.com', 'password123', 'Customer'),
('Henry Anderson', 'henry.anderson@example.com', 'password123', 'Customer'),
('Irene Thomas', 'irene.thomas@example.com', 'password123', 'Customer'),
('James Martinez', 'james.martinez@example.com', 'password123', 'Admin');

-- Insert data into Category
INSERT INTO Category (name, description) VALUES
('Toilets', 'Various types of toilets including one-piece, two-piece, and wall-hung.'),
('Sinks', 'Different styles of sinks including pedestal, wall-mounted, and undermount.'),
('Bathtubs', 'Various bathtubs including freestanding, alcove, and corner styles.'),
('Shower Systems', 'Complete shower systems with various features.'),
('Faucets', 'Faucets for sinks, bathtubs, and showers.'),
('Mirrors', 'Bathroom mirrors in various shapes and sizes.'),
('Cabinets', 'Bathroom cabinets for storage solutions.'),
('Tiles', 'Tiles for floors and walls in various styles.'),
('Accessories', 'Bathroom accessories including towel racks, soap dispensers, etc.'),
('Water Heaters', 'Water heaters for residential and commercial use.');

-- Insert data into Product
INSERT INTO Product (name, description, price, stock, categoryId) VALUES
('Kohler Toilet Model A', 'Comfortable one-piece toilet with modern design.', 299.99, 50, 1),
('Moen Sink Model B', 'Pedestal sink with classic styling.', 159.99, 30, 2),
('American Standard Bathtub Model C', 'Freestanding bathtub with elegant curves.', 499.99, 20, 3),
('Delta Shower System Model D', 'Complete shower system with rainfall showerhead.', 349.99, 15, 4),
('Hansgrohe Faucet Model E', 'Contemporary faucet with precise control.', 129.99, 40, 5),
('Grohe Mirror Model F', 'Frameless bathroom mirror with LED lighting.', 199.99, 25, 6),
('Villeroy & Boch Cabinet Model G', 'Bathroom cabinet with ample storage space.', 279.99, 10, 7),
('Pfister Tile Model H', 'Decorative tiles for stylish bathroom floors.', 29.99, 100, 8),
('Brizo Accessory Model I', 'Elegant towel rack with modern design.', 79.99, 60, 9),
('TOTO Water Heater Model J', 'Efficient water heater for residential use.', 399.99, 12, 10);

-- Insert data into `Order`
INSERT INTO `Order` (userId, orderDate, status, totalAmount) VALUES
(1, '2024-08-01', 'Shipped', 299.99),
(2, '2024-08-02', 'Processing', 159.99),
(3, '2024-08-03', 'Delivered', 499.99),
(4, '2024-08-04', 'Shipped', 349.99),
(5, '2024-08-05', 'Processing', 129.99),
(6, '2024-08-06', 'Delivered', 199.99),
(7, '2024-08-07', 'Shipped', 279.99),
(8, '2024-08-08', 'Processing', 29.99),
(9, '2024-08-09', 'Delivered', 79.99),
(10, '2024-08-10', 'Shipped', 399.99);

-- Insert data into OrderItem
INSERT INTO OrderItem (orderId, productId, quantity, price) VALUES
(1, 1, 1, 299.99),
(2, 2, 1, 159.99),
(3, 3, 1, 499.99),
(4, 4, 1, 349.99),
(5, 5, 1, 129.99),
(6, 6, 1, 199.99),
(7, 7, 1, 279.99),
(8, 8, 5, 29.99),
(9, 9, 1, 79.99),
(10, 10, 1, 399.99);

-- Insert data into ShoppingCart
INSERT INTO ShoppingCart (userId) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Insert data into CartItem
INSERT INTO CartItem (cartId, productId, quantity, price) VALUES
(1, 1, 1, 299.99),
(2, 2, 2, 159.99),
(3, 3, 1, 499.99),
(4, 4, 1, 349.99),
(5, 5, 3, 129.99),
(6, 6, 1, 199.99),
(7, 7, 2, 279.99),
(8, 8, 5, 29.99),
(9, 9, 4, 79.99),
(10, 10, 1, 399.99);

-- Insert data into Payment
INSERT INTO Payment (orderId, paymentDate, paymentMethod, amount, paymentStatus) VALUES
(1, '2024-08-02', 'Credit Card', 299.99, 'Completed'),
(2, '2024-08-03', 'PayPal', 159.99, 'Pending'),
(3, '2024-08-04', 'Credit Card', 499.99, 'Completed'),
(4, '2024-08-05', 'Credit Card', 349.99, 'Completed'),
(5, '2024-08-06', 'Credit Card', 129.99, 'Pending'),
(6, '2024-08-07', 'PayPal', 199.99, 'Completed'),
(7, '2024-08-08', 'Credit Card', 279.99, 'Completed'),
(8, '2024-08-09', 'PayPal', 29.99, 'Pending'),
(9, '2024-08-10', 'Credit Card', 79.99, 'Completed'),
(10, '2024-08-11', 'Credit Card', 399.99, 'Completed');

-- Insert data into Address
INSERT INTO Address (userId, street, city, state, postalCode, country) VALUES
(1, '123 Main St', 'Albuquerque', 'NM', '87101', 'USA'),
(2, '456 Elm St', 'Toronto', 'ON', 'M5A 1A1', 'Canada'),
(3, '789 Oak St', 'London', 'ENG', 'SW1A 1AA', 'UK'),
(4, '101 Pine St', 'Sydney', 'NSW', '2000', 'Australia'),
(5, '202 Maple St', 'Berlin', 'BE', '10115', 'Germany'),
(6, '303 Cedar St', 'Paris', 'IDF', '75001', 'France'),
(7, '404 Birch St', 'Tokyo', 'TK', '100-0001', 'Japan'),
(8, '505 Willow St', 'Rome', 'RM', '00100', 'Italy'),
(9, '606 Aspen St', 'São Paulo', 'SP', '01000-000', 'Brazil'),
(10, '707 Spruce St', 'Cape Town', 'WC', '8000', 'South Africa');

drop table Address;
-- Insert data into Review
INSERT INTO Review (userId, productId, rating, comment, reviewDate) VALUES
(1, 1, 5, 'Excellent toilet, works perfectly.', '2024-08-02'),
(2, 2, 4, 'Nice sink, but the installation was difficult.', '2024-08-03'),
(3, 3, 5, 'Amazing bathtub, very comfortable.', '2024-08-04'),
(4, 4, 4, 'Good shower system, but a bit noisy.', '2024-08-05'),
(5, 5, 3, 'The faucet is okay, nothing extraordinary.', '2024-08-06'),
(6, 6, 5, 'Great mirror with LED, very bright.', '2024-08-07'),
(7, 7, 4, 'Nice cabinet, but the color was slightly different.', '2024-08-08'),
(8, 8, 5, 'Beautiful tiles, good quality.', '2024-08-09'),
(9, 9, 4, 'Stylish towel rack, but a bit pricey.', '2024-08-10'),
(10, 10, 5, 'Water heater works as expected, very efficient.', '2024-08-11');
