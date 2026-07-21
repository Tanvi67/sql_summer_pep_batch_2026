create database normalization_lab;


use normalization_lab;


create table OrderDats
(
OrderID int, 
customerName varchar(50), 
phone varchar(15), 
address varchar(100), 
productName varchar(50), 
category varchar(30), 
supplierName varchar(50), 
supplierPhone varchar(15), 
Quantity int, 
price decimal(10,2)
);


INSERT INTO OrderDats
(OrderID, customerName, phone, address, productName, category, supplierName, supplierPhone, Quantity, price)
VALUES
(101, 'Rahul Sharma', '9876543210', 'Delhi', 'Laptop', 'Electronics', 'TechWorld', '9811111111', 2, 65000.00),

(102, 'Priya Singh', '9876501234', 'Mumbai', 'Headphones', 'Electronics', 'SoundHub', '9822222222', 1, 2500.00),

(103, 'Aman Verma', '9812345678', 'Pune', 'Office Chair', 'Furniture', 'FurniMart', '9833333333', 3, 4500.00),

(104, 'Neha Gupta', '9123456780', 'Jaipur', 'Notebook', 'Stationery', 'PaperHouse', '9844444444', 10, 120.00),

(105, 'Karan Mehta', '9988776655', 'Chandigarh', 'Water Bottle', 'Accessories', 'DailyNeeds', '9855555555', 5, 350.00);


select * from OrderDats;

rename table OrderDats to OrderData;




INSERT INTO OrderData
VALUES

(106, 'Anjali Kapoor', '9765432101', 'Lucknow', 'Mouse', 'Electronics', 'TechWorld', '9811111111', 2, 800.00),

(107, 'Rohit Kumar', '9876123456', 'Bhopal', 'Keyboard', 'Electronics', 'TechWorld', '9811111111', 1, 1500.00),

(108, 'Sneha Reddy', '9988123456', 'Hyderabad', 'Study Table', 'Furniture', 'FurniMart', '9833333333', 1, 6500.00),

(109, 'Vikas Yadav', '9012345678', 'Kanpur', 'Pen Pack', 'Stationery', 'PaperHouse', '9844444444', 20, 250.00),

(110, 'Pooja Sharma', '9123456789', 'Noida', 'Water Bottle', 'Accessories', 'DailyNeeds', '9855555555', 3, 350.00),

(111, 'Aditya Jain', '9876012345', 'Indore', 'Laptop', 'Electronics', 'TechWorld', '9811111111', 1, 72000.00),

(112, 'Kavya Mishra', '9898989898', 'Patna', 'Notebook', 'Stationery', 'PaperHouse', '9844444444', 15, 100.00),

(113, 'Mohit Arora', '9789012345', 'Amritsar', 'Office Chair', 'Furniture', 'FurniMart', '9833333333', 2, 4800.00);



select * from OrderData;



INSERT INTO OrderData
VALUES

(114, 'Rahul Sharma', '9876543210', 'Delhi', 'Keyboard', 'Electronics', 'TechWorld', '9811111111', 1, 1800.00),

(115, 'Priya Singh', '9876501234', 'Mumbai', 'Notebook', 'Stationery', 'PaperHouse', '9844444444', 12, 120.00),

(116, 'Aman Verma', '9812345678', 'Pune', 'Mouse', 'Electronics', 'TechWorld', '9811111111', 2, 900.00),

(117, 'Neha Gupta', '9123456780', 'Jaipur', 'Office Chair', 'Furniture', 'FurniMart', '9833333333', 1, 4800.00),

(118, 'Rahul Sharma', '9876543210', 'Delhi', 'Water Bottle', 'Accessories', 'DailyNeeds', '9855555555', 4, 350.00),

(119, 'Priya Singh', '9876501234', 'Mumbai', 'Laptop', 'Electronics', 'TechWorld', '9811111111', 1, 68000.00),

(120, 'Karan Mehta', '9988776655', 'Chandigarh', 'Pen Pack', 'Stationery', 'PaperHouse', '9844444444', 15, 250.00),

(121, 'Rahul Sharma', '9876543210', 'Delhi', 'Headphones', 'Electronics', 'SoundHub', '9822222222', 1, 3000.00);


#in above table everything is in single table now we will split the dat in diff-diff tables
create table customers(customerID int primary key, customerName varchar(50), phone varchar(15), address varchar(100));


create table supplier(supplierID int primary key, supplierName varchar(50), supplierPhone varchar(15));


create table products(productID int primary key, productName varchar(50), category varchar(30));


 alter table products add column price decimal(10,2),add column supplierID int;


ALTER TABLE products
ADD CONSTRAINT fk_supplier
FOREIGN KEY (supplierID)
REFERENCES supplier(supplierID);


create table orders(orderID int primary key, customerID int, foreign key(customerID) references customers(customerID));


create table orderDetails(orderID int, productID int, Quantity int, primary key(orderID, productID), foreign key(orderID) references orders(orderID), foreign key(productID) references products(productID));



INSERT INTO customers (customerID, customerName, phone, address)
VALUES
(1, 'Rahul Sharma', '9876543210', 'Delhi'),
(2, 'Priya Singh', '9876501234', 'Mumbai'),
(3, 'Aman Verma', '9812345678', 'Pune'),
(4, 'Neha Gupta', '9123456780', 'Jaipur'),
(5, 'Karan Mehta', '9988776655', 'Chandigarh'),
(6, 'Anjali Kapoor', '9765432101', 'Lucknow'),
(7, 'Rohit Kumar', '9876123456', 'Bhopal'),
(8, 'Sneha Reddy', '9988123456', 'Hyderabad'),
(9, 'Vikas Yadav', '9012345678', 'Kanpur'),
(10, 'Pooja Sharma', '9123456789', 'Noida'),
(11, 'Aditya Jain', '9876012345', 'Indore'),
(12, 'Kavya Mishra', '9898989898', 'Patna'),
(13, 'Mohit Arora', '9789012345', 'Amritsar');


SELECT * FROM customers;




INSERT INTO supplier (supplierID, supplierName, supplierPhone)
VALUES
(201, 'TechWorld', '9811111111'),
(202, 'SoundHub', '9822222222'),
(203, 'FurniMart', '9833333333'),
(204, 'PaperHouse', '9844444444'),
(205, 'DailyNeeds', '9855555555');





SELECT * FROM supplier;






INSERT INTO products (productID, productName, category, price, supplierID)
VALUES
(301, 'Laptop', 'Electronics', 65000.00, 201),
(302, 'Headphones', 'Electronics', 2500.00, 202),
(303, 'Office Chair', 'Furniture', 4500.00, 203),
(304, 'Notebook', 'Stationery', 120.00, 204),
(305, 'Water Bottle', 'Accessories', 350.00, 205),
(306, 'Mouse', 'Electronics', 800.00, 201),
(307, 'Keyboard', 'Electronics', 1500.00, 201),
(308, 'Study Table', 'Furniture', 6500.00, 203),
(309, 'Pen Pack', 'Stationery', 250.00, 204),
(310, 'Java Book', 'Books', 600.00, 204),
(311, 'AI Book', 'Books', 750.00, 204),
(312, 'Python Book', 'Books', 550.00, 204);

SELECT * FROM products;

INSERT INTO orders (orderID, customerID)
VALUES
(101,1),
(102,2),
(103,3),
(104,4),
(105,5),
(106,6),
(107,7),
(108,8),
(109,9),
(110,10),
(111,11),
(112,12),
(113,13),
(114,1),
(115,2),
(116,3),
(117,4),
(118,1),
(119,2),
(120,5),
(121,1);

SELECT * FROM orders;

INSERT INTO orderDetails (orderID, productID, Quantity)
VALUES
(101,301,2),
(102,302,1),
(103,303,3),
(104,304,10),
(105,305,5),
(106,306,2),
(107,307,1),
(108,308,1),
(109,309,20),
(110,305,3),
(111,301,1),
(112,304,15),
(113,303,2),
(114,307,1),
(115,304,12),
(116,306,2),
(117,303,1),
(118,305,4),
(119,301,1),
(120,309,15),
(121,302,1);


SELECT * FROM orderDetails;

/* update Rahul's Phone no. Which table should be updated?*/
SET SQL_SAFE_UPDATES = 0;
update customers set phone ='8888558855' where customerName ="Rahul Sharma";

/* Add one new Customer. Without placing any order. Is it possible?*/
INSERT INTO customers  VALUES (14,"Dev",'32345667456','Delhi');

/* delete order 112. Check whether customer info still exists?*/
delete from orderDetails where orderID=112;
#join order table and customer table
SELECT * FROM 
Orders as o
Inner join customers as c 
ON o.customerid=c.customerid;

#BUISNESS QUESTION
#show product purchased in every order
SELECT* FROM
products as p
Inner join orderdetails as od
ON p.productid=od.productid;     #if i dont use condition then for evry order id it will chk customer id then it move to next orerid then for that gaian chk all custumer id
#another way to do(getting only specific columns)
SELECT
OrderDetails.orderID,
products.productName,
orderDetails.Quantity
FROM OrderDetails
INNER JOIN products
ON orderDetails.productID = products.productID;

#show customer name and product purchased
SELECT
c.customerName,
p.productName,
od.quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
INNER JOIN orderDetails AS od
ON o.orderID = od.orderID
INNER JOIN products AS p
ON od.productID = p.productID;

#show customername ,product name and price
SELECT
c.customerName,
p.productName,
p.price
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
INNER JOIN orderDetails AS od
ON o.orderID = od.orderID
INNER JOIN products AS p
ON od.productID = p.productID;

#total bill for each product purchased
SELECT
od.orderID,
p.productName,
od.Quantity,
p.price,
(od.Quantity * p.price) AS Total_Bill
FROM orderDetails AS od
INNER JOIN products AS p
ON od.productID = p.productID;

#delete only data of all tables
SET FOREIGN_KEY_CHECKS = 0;  #set FK constraint to 0 bcz otherwise FK constraint error will come if we doesnt set it 0 then we need to truncate child table first then parent table

TRUNCATE TABLE orderDetails;
TRUNCATE TABLE orders;
TRUNCATE TABLE products;
TRUNCATE TABLE supplier;
TRUNCATE TABLE customers;

SET FOREIGN_KEY_CHECKS = 1;  #after truncate all tables set FK constraint again to 1

INSERT INTO customers
(customerID, customerName, phone, address)
VALUES
(101,'Amit Sharma','9876543210','Delhi'),
(102,'Priya Singh','9876543211','Mumbai'),
(103,'Rahul Verma','9876543212','Delhi'),
(104,'Sneha Gupta','9876543213','Pune'),
(105,'Arjun Mehta','9876543214','Bangalore'),
(106,'Neha Kapoor','9876543215','Delhi'),
(107,'Rohan Das','9876543216','Kolkata'),
(108,'Simran Kaur','9876543217','Chandigarh'),
(109,'Anjali Roy','9876543218','Mumbai'),
(110,'Vikas Yadav','9876543219','Lucknow'),
(111,'Karan Malhotra','9876543220','Delhi'),
(112,'Pooja Jain','9876543221','Jaipur'),
(113,'Harsh Kumar','9876543222','Delhi'),
(114,'Nikita Sharma','9876543223','Mumbai');

# Supplier
INSERT INTO supplier
(supplierID, supplierName, supplierPhone)
VALUES
(1,'TechWorld','9991111111'),
(2,'HomeEssentials','9991111112'),
(3,'FashionHub','9991111113'),
(4,'FreshFoods','9991111114'),
(5,'OfficeMart','9991111115'),
(6,'Global Suppliers','9991111116'),
(7,'Future Electronics','9991111117'),
(8,'Dream Traders','9991111118');

# Products
INSERT INTO products
(productID, productName, category, price, supplierID)
VALUES
(201,'Laptop','Electronics',55000,1),
(202,'Mouse','Electronics',800,1),
(203,'Keyboard','Electronics',1500,1),
(204,'Office Chair','Furniture',6500,2),
(205,'Dining Table','Furniture',12000,2),
(206,'T-Shirt','Clothing',700,3),
(207,'Jeans','Clothing',1500,3),
(208,'Rice Bag','Groceries',1800,4),
(209,'Cooking Oil','Groceries',1800,4),
(210,'Notebook','Stationery',120,5),
(211,'Printer','Electronics',12000,5),
(212,'Monitor','Electronics',15000,7),
(213,'Headphones','Electronics',2500,7),
(214,'Bookshelf','Furniture',6500,2),
(215,'Pen Drive','Electronics',800,1);

# Orders
INSERT INTO orders
(orderID, customerID)
VALUES
(1001,101),
(1002,102),
(1003,101),
(1004,103),
(1005,104),
(1006,105),
(1007,106),
(1008,107),
(1009,108),
(1010,109),
(1011,105),
(1012,110);

# Order Details
INSERT INTO orderDetails
(orderID, productID, Quantity)
VALUES
(1001,201,1),
(1001,202,2),

(1002,203,1),
(1002,206,3),

(1003,204,1),
(1003,203,5),

(1004,205,1),
(1004,207,2),

(1005,208,4),
(1005,209,3),

(1006,201,1),
(1006,213,2),

(1007,202,4),
(1007,211,1),

(1008,203,2),

(1009,212,1),
(1009,206,2),

(1010,207,3),
(1010,208,2),

(1011,201,1),
(1011,205,1),

(1012,202,3),
(1012,209,4);


# Show supplier of every product

SELECT
p.productName,
s.supplierName
FROM products AS p
INNER JOIN supplier AS s
ON p.supplierID = s.supplierID;

#same que using left table    #If you specifically want to see products even if some don't have a supplier
SELECT
p.productName,
s.supplierName
FROM products AS p
LEFT JOIN supplier AS s
ON p.supplierID = s.supplierID;

#complete order report
SELECT*
FROM orders AS o
INNER JOIN orderdetails AS od
ON o.orderId = od.orderId;


# Complete Order Report
SELECT
o.orderID,
c.customerName,
p.productName,
od.Quantity,
p.price,
(od.Quantity * p.price) AS Total_Bill
FROM orders AS o
INNER JOIN customers AS c
ON o.customerID = c.customerID
INNER JOIN orderDetails AS od
ON o.orderID = od.orderID
INNER JOIN products AS p
ON od.productID = p.productID;

#list of customers whether they have placed orders or not  #we will use left join in this case because i want all customers, including those who have not placed any order.
SELECT
c.customerID,
c.customerName,
o.orderID
FROM customers AS c
LEFT JOIN orders AS o
ON c.customerID = o.customerID;

#LEVEL 1
#Q1 The sales manager wants a report showing every customers name along with the Order Id they placed
#if i want only customers who have placed orders (INNER JOIN)
SELECT c.customerName, o.orderId
FROM Customers AS c
INNER JOIN Orders AS o
ON c.customerId = o.customerId;
#If i want all customers, even those who have not placed any orders (LEFT JOIN)
SELECT c.customerName, o.orderId
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.customerId = o.customerId;

#Q2 Display the product name,price , and supplier name for every product available in the store
SELECT p.productName, p.price, s.supplierName
FROM products AS p
LEFT JOIN supplier AS s
ON p.supplierId = s.supplierId;
#Q3 the warehouse manager wants to know which products belong to the electronics category along with the supplier supplying them
SELECT
    p.productName,
    p.category,
    s.supplierName
FROM products AS p
INNER JOIN supplier AS s
ON p.supplierID = s.supplierID
WHERE p.category = 'Electronics';

#Q4 show customer names who have placed an order .Arrange the result alphabetically
#here we will use inner join bcz we only want those customers who have placed orders
SELECT c.customerName
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
ORDER BY c.customerName ASC;

#Q5 display every supplier alog with the products supplied by them.sort supplier names in ascending order
SELECT
    s.supplierName,
    p.productName
FROM supplier AS s
LEFT JOIN products AS p
ON s.supplierID = p.supplierID
ORDER BY s.supplierName ASC;

#Q6 The finance team wants the Order ID ,Product Name ,Quantity and Price for every purchased product
SELECT
od.orderID,
p.productName,
od.Quantity,
p.price
FROM orderDetails AS od
INNER JOIN products AS p
ON od.productID = p.productID;

#Display customer name ,product name and quantity purchased
SELECT
c.customerName,
p.productName,
od.Quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
INNER JOIN orderDetails AS od
ON o.orderID = od.orderID
INNER JOIN products AS p
ON od.productID = p.productID;

#find all products costing more than 1000 along with their supplier names
SELECT
p.productName,
p.price,
s.supplierName
FROM products AS p
INNER JOIN supplier AS s
ON p.supplierID = s.supplierID
WHERE p.price > 1000;

#FILTERING + JOINS
#Display customers whose names start with 'A' along with the orders they placed 
SELECT
c.customerName,
o.orderID
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
WHERE c.customerName LIKE 'A%';

# show all products supplied by suppliers whose name contain the word Tech
SELECT
p.productName,
s.supplierName
FROM products AS p
INNER JOIN supplier AS s
ON p.supplierID = s.supplierID
WHERE s.supplierName LIKE '%Tech%';

#find products costing bw 500 and 3000 along with supplier names. sort by price descending 
SELECT
p.productName,
p.price,
s.supplierName
FROM products AS p
INNER JOIN supplier AS s
ON p.supplierID = s.supplierID
WHERE p.price BETWEEN 500 AND 3000
ORDER BY p.price DESC;

#display customers living in Delhi along with their orderIDs
SELECT
c.customerName,
o.orderID
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
WHERE c.address = 'Delhi';

#show all purchased products whose quantity is greater than 5. display product name and quantity
SELECT
p.productName,
od.Quantity
FROM orderDetails AS od
INNER JOIN products AS p
ON od.productID = p.productID
WHERE od.Quantity > 5;

#find all suppliers supplying products in either electronics or furniture category
SELECT
s.supplierName,
p.productName,
p.category
FROM supplier AS s
INNER JOIN products AS p
ON s.supplierID = p.supplierID
WHERE p.category = 'Electronics'
OR p.category = 'Furniture';
   
# ANOTHER WAY USING IN OPERATOR
SELECT
s.supplierName,
p.productName,
p.category
FROM supplier AS s
INNER JOIN products AS p
ON s.supplierID = p.supplierID
WHERE p.category IN ('Electronics', 'Furniture');

#display all customers except those living in Mumbai ,along with the orders they placed
SELECT
c.customerName,
c.address,
o.orderID
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
WHERE c.address != 'Mumbai';

#ADVANCED BUSINESS THINLKING
#The management wants to know the Top 5 most expensive purchased products along with customer name ,supplier name,quantity purchased and price.
SELECT
c.customerName,
p.productName,
s.supplierName,
od.Quantity,
p.price
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
INNER JOIN orderDetails AS od
ON o.orderID = od.orderID
INNER JOIN products AS p
ON od.productID = p.productID
INNER JOIN supplier AS s
ON p.supplierID = s.supplierID
ORDER BY p.price DESC
LIMIT 5;

#Find the customer who has purchased the highest total quantity of products .display customer name and total quantity
SELECT
c.customerName,
SUM(od.Quantity) AS Total_Quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
INNER JOIN orderDetails AS od
ON o.orderID = od.orderID
GROUP BY c.customerID, c.customerName
ORDER BY Total_Quantity DESC
LIMIT 1;

