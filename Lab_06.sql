USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Lab06')
	DROP DATABASE Lab06
GO

CREATE DATABASE Lab06
GO

USE Lab06
GO

CREATE TABLE Category
(
	CategoryID INT IDENTITY,
	CategoryName VARCHAR(20),
	CONSTRAINT pk_categoryid PRIMARY KEY (CategoryID)
)
GO

CREATE TABLE Product
(
	ProductID INT IDENTITY,
	ProductName VARCHAR(50),
	Unit VARCHAR(10),
	ProductCost Money,
	Quantity INT,
	Status INT,
	Description varchar(50),
	CategoryID INT,
	CONSTRAINT pk_productid PRIMARY KEY (ProductID)
)
GO


CREATE TABLE Customer
(
	CustomerID INT IDENTITY,
	CustomerName VARCHAR(50),
	Address VARCHAR(100),
	Tel VARCHAR(13),
	CONSTRAINT pk_customerid PRIMARY KEY (CustomerID)
)
GO

CREATE TABLE Orders
(
	OrderID INT,
	OrderDate datetime,
	CustomerID int,
	Status INT,
	CONSTRAINT pk_orderid PRIMARY KEY (OrderID)
)
GO

CREATE TABLE OrderDetails
(
	OrderID INT,
	ProductID INT,
	Quantity INT,
	Price money
)


ALTER TABLE Product
	ADD CONSTRAINT fk_catid FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)

ALTER TABLE Orders
	ADD CONSTRAINT fk_customerid FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)

ALTER TABLE OrderDetails
	ADD CONSTRAINT fk_orderid FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)

ALTER TABLE OrderDetails
	ADD CONSTRAINT fk_productid FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
GO

INSERT INTO Category VALUES
	('Computer'),
	('NotePad'),
	('Laptop'),
	('SmartPhone'),
	('NotVerySmartPhone'),
	('Other')
GO

-- ProductID INT IDENTITY,
-- 	1.ProductName VARCHAR(50),
-- 	2.Unit VARCHAR(10),
-- 	3.ProductCost Money,
-- 	4.Quantity INT,
-- 	5.Status INT,
-- 	6.Description varchar(50),
-- 	7.CategoryID INT,

INSERT INTO Product VALUES
	('Alienware Case', 'Set',60000000,1,1,'Gaming monster',1),
	('Customized Dell', 'Set',32000000,0,2,'Dell''s Customized case',1),
	('Ipad 3', 'Unit',10000000,4,1,'Very fast',1),
	('Ipad 4', 'Unit',15000000,10,1,'Latest notepad',2),
	('MSI GF63', 'Unit',18000000,8,1,'Average gaming laptop',3),
	('Iphone X', 'Unit',18000000,3,1,'Second-Hand',4),
	('Nokia 1110i', 'Unit',20000000,5,1,'Not very smart but hard',5),
	('May Tinh T450','Chiec',1000,5,1,'May nhap moi',1),
	('Dien Thoai Nokia5670','Chiec',200,4,1,'Dien thoai dang hot',5),
	('May in SamSung 450','Chiec',100,2,1,'May in dang e',6)
GO

-- CustomerID INT,
-- CustomerName VARCHAR(50),
-- Address VARCHAR(100),
-- Tel VARCHAR(13)

INSERT INTO Customer VALUES
	('Nguyen Van An','111 Nguyen Trai, Thanh Xuan, Ha Noi','0987654321'),
	('Nguyen Thi B','Ha Nam','0895678345'),
	('Nguyen Van C','Bac Ninh','0978768937'),
	('Nguyen Thi D','Bac Giang','0986467682'),
	('Nguyen Thi E','Ha Noi','065987653')
GO

-- OrderID INT,
-- OrderDate datetime,
-- CustomerID int,
-- Status INT,
INSERT INTO Orders VALUES
	(123,'11/18/2009',1,2),
	(124,'12/11/2011',2,1),
	(125,'09/07/2020',4,3)
GO

-- OrderID INT,
-- ProductID INT,
-- Quantity INT,
-- Price money
INSERT INTO OrderDetails VALUES
	(123,8,1,1100),
	(123,9,2,199),
	(123,10,1,120),
	(124,6,1,14000000),
	(125,1,1,62000000)
GO

--4
SELECT Orders.OrderID,Customer.CustomerName FROM Orders
	JOIN Customer ON Orders.CustomerID = Customer.CustomerID 
	GROUP BY Orders.OrderID,Customer.CustomerName
GO
SELECT * FROM Product
GO
SELECT * FROM Orders
	JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GO

--5
SELECT CustomerName FROM Customer ORDER BY CustomerName ASC
SELECT ProductName,ProductCost FROM Product ORDER BY ProductCost DESC
SELECT Customer.CustomerName,Orders.OrderID,Product.ProductName FROM Orders
	JOIN Customer ON Orders.CustomerID = Customer.CustomerID
	JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
	JOIN Product ON OrderDetails.ProductID = Product.ProductID
	WHERE Orders.CustomerID LIKE 1
GO

--6
