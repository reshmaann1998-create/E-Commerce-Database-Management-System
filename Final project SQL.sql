CREATE DATABASE ecommerce_db
USE ecommerce_db
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    gender VARCHAR(10),
    registration_date DATE
)
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
)
CREATE TABLE cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    cart_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) )
CREATE TABLE cart_items (
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id))
    CREATE TABLE addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_line VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id))
    CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id))
    CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id))
    CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id))
    CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    rating INT,
    review_text VARCHAR(255),
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id))
    SHOW TABLES
    
INSERT INTO customers (customer_name, email, phone, gender, registration_date)
VALUES('Reshma','reshma@gmail.com','9876543210','Female','2026-01-10'),
('Joshua','joshua@gmail.com','9876543211','Male','2026-01-12'),
('Vino','vino@gmail.com','9876543212','Female','2026-01-15'),
('Samuel','samuel@gmail.com','9876543213','Male','2026-01-20'),
('Priya','priya@gmail.com','9876543214','Female','2026-02-01'),
('John','john@gmail.com','9876543215','Male','2026-02-05'),
('Anitha','anitha@gmail.com','9876543216','Female','2026-02-10'),
('David','david@gmail.com','9876543217','Male','2026-02-15'),
('Meena','meena@gmail.com','9876543218','Female','2026-02-20'),
('Arun','arun@gmail.com','9876543219','Male','2026-03-01')
SELECT * FROM customers
INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Fashion'),
('Home Appliances'),
('Books'),
('Beauty'),
('Sports'),
('Shoes'),
('Mobiles'),
('Laptops'),
('Accessories')
SELECT * FROM categories
    
INSERT INTO products (product_name, category_id, price, stock_quantity)VALUES
('Wireless Headphones',1,2500,50),
('Smart Watch',1,4500,30),
('Bluetooth Speaker',1,3000,40),
('Men T Shirt',2,800,100),
('Women Dress',2,1500,70),
('Kitchen Mixer',3,3500,25),
('Coffee Maker',3,4500,20),
('SQL Book',4,600,50),
('Python Book',4,750,40),
('Face Cream',5,500,80),
('Sports Shoes',6,2500,45),
('Running Shoes',7,3000,35),
('Smartphone',8,25000,20),
('Laptop',9,55000,15),
('Laptop Bag',10,1800,60)
SELECT * FROM products

INSERT INTO cart (customer_id, cart_date)VALUES
(1,'2026-06-01'),
(2,'2026-06-02'),
(3,'2026-06-03'),
(4,'2026-06-04'),
(5,'2026-06-05'),
(6,'2026-06-06'),
(7,'2026-06-07'),
(8,'2026-06-08'),
(9,'2026-06-09'),
(10,'2026-06-10')
SELECT * FROM cart

INSERT INTO cart_items (cart_id, product_id, quantity)VALUES
(1,1,2),
(1,4,1),
(2,2,1),
(2,8,2),
(3,5,1),
(3,10,2),
(4,3,1),
(4,11,1),
(5,6,1),
(5,12,2),
(6,7,1),
(6,15,1),
(7,9,2),
(7,10,1),
(8,13,1),
(8,14,1),
(9,4,2),
(9,11,1),
(10,1,1),
(10,5,1)
SELECT * FROM cart_items

INSERT INTO addresses (customer_id, address_line, city, state, pincode)
VALUES
(1,'Anna Nagar','Chennai','Tamil Nadu','600040'),
(2,'Velachery','Chennai','Tamil Nadu','600042'),
(3,'Madurai Main Road','Madurai','Tamil Nadu','625001'),
(4,'T Nagar','Chennai','Tamil Nadu','600017'),
(5,'Adyar','Chennai','Tamil Nadu','600020'),
(6,'Tambaram','Chennai','Tamil Nadu','600045'),
(7,'Coimbatore Road','Coimbatore','Tamil Nadu','641001'),
(8,'Bangalore Road','Bangalore','Karnataka','560001'),
(9,'Hyderabad Road','Hyderabad','Telangana','500001'),
(10,'Pune Main Road','Pune','Maharashtra','411001')
SELECT * FROM addresses

INSERT INTO orders (customer_id, order_date, total_amount, order_status)
VALUES
(1,'2026-06-10',5800,'Delivered'),
(2,'2026-06-11',5700,'Delivered'),
(3,'2026-06-12',2500,'Shipped'),
(4,'2026-06-13',5500,'Processing'),
(5,'2026-06-14',9500,'Delivered'),
(6,'2026-06-15',6300,'Shipped'),
(7,'2026-06-16',2250,'Delivered'),
(8,'2026-06-17',80000,'Processing'),
(9,'2026-06-18',4100,'Delivered'),
(10,'2026-06-19',2300,'Cancelled')
SELECT * FROM orders

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1,1,2,2500),
(1,4,1,800),
(2,2,1,4500),
(2,8,2,600),
(3,5,1,1500),
(3,10,2,500),
(4,3,1,3000),
(4,11,1,2500),
(5,6,1,3500),
(5,12,2,3000),
(6,7,1,4500),
(6,15,1,1800),
(7,9,2,750),
(7,10,1,500),
(8,13,1,25000),
(8,14,1,55000),
(9,4,2,800),
(9,11,1,2500),
(10,1,1,2300)
SELECT * FROM order_items

INSERT INTO payments (order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1,'2026-06-10','UPI','Completed',5800),
(2,'2026-06-11','Credit Card','Completed',5700),
(3,'2026-06-12','UPI','Completed',2500),
(4,'2026-06-13','Debit Card','Pending',5500),
(5,'2026-06-14','UPI','Completed',9500),
(6,'2026-06-15','Cash','Completed',6300),
(7,'2026-06-16','UPI','Completed',2250),
(8,'2026-06-17','Credit Card','Completed',80000),
(9,'2026-06-18','UPI','Completed',4100),
(10,'2026-06-19','Debit Card','Failed',2300)
SELECT * FROM payments

INSERT INTO reviews (customer_id, product_id, rating, review_text, review_date)
VALUES
(1,1,5,'Very good product','2026-06-15'),
(2,2,4,'Good quality','2026-06-16'),
(3,5,5,'Excellent product','2026-06-17'),
(4,3,4,'Good speaker','2026-06-18'),
(5,6,5,'Very useful','2026-06-19'),
(6,7,4,'Good product','2026-06-20'),
(7,9,5,'Easy to understand','2026-06-21'),
(8,13,5,'Excellent mobile','2026-06-22'),
(9,4,4,'Nice T shirt','2026-06-23'),
(10,11,5,'Comfortable shoes','2026-06-24')
SELECT * FROM reviews

SELECT * FROM products
WHERE stock_quantity > 0
SELECT * FROM products
WHERE price > 5000
SELECT * FROM products
WHERE price BETWEEN 1000 AND 5000                                              
SELECT * FROM products
ORDER BY price DESC                   
SELECT * FROM products                                            
ORDER BY price DESC LIMIT 5         
SELECT * FROM products WHERE product_name LIKE '%Book%'     
SELECT COUNT(*) AS total_customers                                  
FROM customers                              
SELECT COUNT(*) AS total_products
FROM products 
SELECT SUM(total_amount) AS total_sales
FROM orders                
SELECT AVG(total_amount) AS average_order FROM orders     

SELECT MAX(price) AS highest_price FROM products       
SELECT MIN(price) AS lowest_price FROM products         
SELECT COUNT(*) AS total_orders FROM orders
SELECT customer_id, SUM(total_amount) AS total_spent 
FROM orders GROUP BY customer_id
SELECT customer_id, COUNT(*) AS total_orders FROM orders GROUP BY customer_id
SELECT customer_id, AVG(total_amount) AS average_order_amount 
FROM orders GROUP BY customer_id
SELECT customer_id, COUNT(*) AS total_orders 
FROM orders GROUP BY customer_id HAVING COUNT(*) > 1     
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders GROUP BY customer_id                                   
SELECT customer_id, MAX(total_amount) AS highest_order_amount
FROM orders GROUP BY customer_id                                                 
SELECT customer_id, MIN(total_amount) AS lowest_order_amount
FROM orders GROUP BY customer_id                                                 
SELECT category_id, COUNT(*) AS total_products
FROM products GROUP BY category_id                                         
SELECT category_id, AVG(price) AS average_price
FROM products GROUP BY category_id                               
SELECT category_id, MAX(price) AS highest_price
FROM products GROUP BY category_id                                                    
SELECT category_id, MIN(price) AS lowest_price
FROM products GROUP BY category_id               
SELECT COUNT(*) AS products_in_stock
FROM products WHERE stock_quantity > 0             
SELECT customers.customer_name, orders.order_id, orders.total_amount
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id          
SELECT customers.customer_name, orders.order_id, orders.total_amount
FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id          
SELECT order_items.order_id, products.product_name, order_items.quantity
FROM order_items RIGHT JOIN products ON order_items.product_id = products.product_id   
SELECT products.product_name, categories.category_name, products.price
FROM products INNER JOIN categories ON products.category_id = categories.category_id                  
SELECT orders.order_id, orders.total_amount, payments.payment_method, payments.payment_status
FROM orders INNER JOIN payments ON orders.order_id = payments.order_id                                         
SELECT customers.customer_name, orders.order_id, orders.total_amount, payments.payment_method
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN payments ON orders.order_id = payments.order_id                                                  
SELECT customers.customer_name, orders.order_id, order_items.product_id
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN order_items ON orders.order_id = order_items.order_id                                    
SELECT customers.customer_name, SUM(orders.total_amount) AS total_spent
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name                                                   
SELECT product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products)

SELECT product_name, price, RANK() OVER (ORDER BY price DESC) AS price_rank FROM products

SELECT product_name, price, ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num FROM products

SELECT order_id, total_amount, LAG(total_amount) OVER (ORDER BY order_id) AS previous_amount, LEAD(total_amount) OVER (ORDER BY order_id) AS next_amount FROM orders

DELIMITER //

CREATE PROCEDURE show_products()
BEGIN
SELECT * FROM products;
END //

DELIMITER ;

CALL show_products()                     
