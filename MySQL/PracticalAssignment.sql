create database Assignment;
use Assignment;
Practical1 (Desc) ------
desc Client_Master;
desc Product_Master;
desc Salesman_Master ;

Practical1 (select Query) ------
select * from Client_Master;
select * from Product_Master;
select * from Salesman_Master;

Practical2 (Desc) ------
desc  Sales_Order ;
desc Sales_Order_Details ;

Practical2 (select Query) ------
select * from  Sales_Order;
select * from Sales_Order_Details;

Practical1 (Create Table1) ------
create table Client_Master(CLIENTNO VARCHAR(6) primary key, Name varchar(20) Not Null,Address1 varchar(30),Address2 varchar(30),City varchar(15),Pincode bigint, State varchar(15),Baldue float);

Practical1 (Insert Table1) ------
Insert Qurey(DML) ---------------------
insert into Client_Master values ('C10001','Aanya Sharma','125, Arera Colony', 'E-7','Bhopal','462016','Madhya Pradesh','5000.00');
insert into Client_Master values ('C10002','Karthik Patel','10, MG Road', 'Near Rajwada','Indore','452002','Madhya Pradesh','8000.82');
insert into Client_Master values ('C10003','Meera Singh','56, Rajpur Road', 'Near Clock Tower','Dehradun','248001','Uttarakhand','2000.65');
insert into Client_Master values ('C10004','Rajat Deshmukh','43, Jwalapur', 'Near Vishnu Ghat','Haridwar','249401','Uttarakhand','9000.00');
insert into Client_Master values ('C10005','Sneha Kapoor','120, Shankar Nagar', 'Near Telibandha Talab','Raipur','492007','Chhattisgarh','12540.95');
insert into Client_Master values ('C10006','Arjun Malhotra','34, Vyapar Vihar', 'Near Bus Stand','Bilaspur','495001','Chhattisgarh','5000.12');
insert into Client_Master values ('C10007','Priya Iyer','14, C.G. Road', ' Near Law Garden','Ahmedabad','380009','Gujarat','2000.20');
insert into Client_Master values ('C10008','Ankit Mehra','21, Ring Road', 'Near Sahara Darwaja','Surat','462016','Gujarat','1000.20');
insert into Client_Master values ('C10009','Kavita Rao','8, Park Street', 'Near Park Circus','Kolkata','700016','West Bengal','15000.64');
insert into Client_Master values ('C10010','Rohan Joshi','32, GT Road', 'Near Howrah Railway Station','Howrah',' 711101','West Bengal','10000.5');

Practical1 (Insert Table2) ------
create table Product_Master(ProductNo varchar(6) primary key, Description varchar(15) Not Null,Profitpercent bigint Not Null,UNITMEASURE varchar(10) Not null,QTYONHAND bigint Not null, REORDERLVL bigint Not null,SELLPRICE float Not null,COSTPRICE float Not null,check(SELLPRICE != 0),check(COSTPRICE != 0));

Practical1 (Insert Table2) ------
INSERT INTO Product_Master VALUES 
('P10001', 'Samsung S21', 20, 'Piece', 50, 10, 799.99, 639.99);
INSERT INTO Product_Master VALUES
('P10002', 'iPhone 13', 25, 'Piece', 30, 5, 999.99, 749.99);
INSERT INTO Product_Master VALUES
('P10003', 'OnePlus 9', 18, 'Piece', 40, 8, 729.99, 598.99);
INSERT INTO Product_Master VALUES
('P10004', 'Google Pixel 6', 22, 'Piece', 20, 5, 699.99, 549.99);
INSERT INTO Product_Master VALUES
('P10005', 'Xiaomi Mi 11', 15, 'Piece', 60, 12, 649.99, 552.49);
INSERT INTO Product_Master VALUES
('P10006', 'Sony Xperia 5', 20, 'Piece', 25, 6, 849.99, 679.99);
INSERT INTO Product_Master VALUES
('P10007', 'Oppo Find X3', 19, 'Piece', 35, 7, 799.99, 647.99);
INSERT INTO Product_Master VALUES
('P10008', 'Huawei P50', 17, 'Piece', 45, 9, 699.99, 580.99);
INSERT INTO Product_Master VALUES
('P10009', 'Nokia G50', 10, 'Piece', 70, 15, 349.99, 314.99);
INSERT INTO Product_Master VALUES
('P10010', 'Asus ROG 5', 30, 'Piece', 15, 3, 999.99, 699.99);

Practical1 (Insert Table3) ------
create table Salesman_Master(SALESMANNO varchar(6) primary key,SALESMANNAME varchar(20) Not Null,Address1 varchar(30) Not Null,Address2 varchar(30),City varchar(20),Pincode bigint, State varchar(20), SALAMT float Not Null, TGTTOGET float Not Null, YTDSALES float Not Null, REMARKS varchar(60),check(SALAMT != 0),check(TGTTOGET != 0));

Practical1 (Insert Table3) ------
INSERT INTO Salesman_Master VALUES 
('S10001', 'John Doe', '123 Maple St', 'Apt 101', 'New York', 10001, 'NY', 50000, 200000, 150000, 'Exceeds target'),
('S10002', 'Jane Smith', '456 Oak St', NULL, 'Los Angeles', 90001, 'CA', 45000, 180000, 120000, 'Meets target'),
('S10003', 'Mike Johnson', '789 Pine St', 'Suite 201', 'Chicago', 60601, 'IL', 40000, 160000, 110000, 'Close to target'),
('S10004', 'Emily Davis', '321 Birch St', 'Apt 202', 'Houston', 77001, 'TX', 55000, 220000, 200000, 'Excellent performance'),
('S10005', 'David Wilson', '654 Cedar St', NULL, 'Phoenix', 85001, 'AZ', 48000, 190000, 130000, 'Steady performer'),
('S10006', 'Sarah Taylor', '987 Spruce St', 'Apt 303', 'Philadelphia', 19101, 'PA', 47000, 185000, 125000, 'Good progress'),
('S10007', 'Chris Brown', '135 Elm St', NULL, 'San Antonio', 78201, 'TX', 46000, 175000, 115000, 'Consistent performer'),
('S10008', 'Megan Anderson', '246 Fir St', 'Suite 404', 'San Diego', 92101, 'CA', 49000, 195000, 140000, 'Above average'),
('S10009', 'James White', '357 Palm St', 'Apt 505', 'Dallas', 75201, 'TX', 52000, 210000, 160000, 'High achiever'),
('S10010', 'Lisa Green', '468 Willow St', NULL, 'San Jose', 95101, 'CA', 53000, 215000, 170000, 'Outstanding performance');

Practical2 (Create Table4) ---------

CREATE TABLE Sales_Order (
    ORDERNO VARCHAR(6) PRIMARY KEY CHECK (ORDERNO LIKE 'O%'),
    CLIENTNO VARCHAR(6),
    ORDERDATE DATE NOT NULL,
    DELYADDR VARCHAR(25),
    SALESMANNO VARCHAR(6),
    DELYTYPE CHAR(1) DEFAULT 'F' CHECK (DELYTYPE IN ('P', 'F')),
    BILLYN CHAR(1),
    DELYDATE DATE,
    ORDERSTATUS VARCHAR(10) CHECK (ORDERSTATUS IN ('In Process', 'Fulfilled', 'BackOrder', 'Cancelled')),
    FOREIGN KEY (CLIENTNO) REFERENCES Client_Master(ClientNo),
    FOREIGN KEY (SALESMANNO) REFERENCES SalesMan_Master(SalesManNo),
    CONSTRAINT chk_DelyDate CHECK (DELYDATE >= ORDERDATE)
);

Practical2 (Insert Table4) ---------

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10001', 'C10001', '2024-07-01', '456 Maple St', 'S10001', 'F', 'N', '2024-07-05', 'Fulfilled');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10002', 'C10002', '2024-07-15', '789 Oak St', 'S10002', 'P', 'Y', '2024-07-20', 'In Process');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10003', 'C10003', '2024-08-01', '101 Pine St', 'S10003', 'F', 'N', '2024-08-10', 'BackOrder');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10004', 'C10004', '2024-08-10', '202 Birch St', 'S10004', 'P', 'Y', '2024-08-15', 'Cancelled');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10005', 'C10005', '2024-08-12', '303 Cedar St', 'S10005', 'F', 'N', '2024-08-17', 'Fulfilled');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10006', 'C10006', '2024-08-15', '404 Elm St', 'S10006', 'P', 'Y', '2024-08-20', 'In Process');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10007', 'C10007', '2024-08-18', '505 Maple St', 'S10001', 'F', 'N', '2024-08-25', 'BackOrder');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10008', 'C10008', '2024-08-20', '606 Oak St', 'S10002', 'P', 'Y', '2024-08-30', 'Cancelled');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10009', 'C10009', '2024-08-22', '707 Pine St', 'S10003', 'F', 'N', '2024-09-01', 'Fulfilled');

INSERT INTO Sales_Order (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10010', 'C10010', '2024-08-25', '808 Birch St', 'S10004', 'P', 'Y', '2024-09-05', 'In Process');

Practical2 (Create Table5) ---------
CREATE TABLE Sales_Order_Details (
    OrderNo VARCHAR(6),
    ProductNo VARCHAR(6),
    QtyOrdered INT,
    QtyDisp INT,
    ProductRate DECIMAL(10,2),
    FOREIGN KEY (OrderNo) REFERENCES Sales_Order(ORDERNO),
    FOREIGN KEY (ProductNo) REFERENCES Product_Master(ProductNo)
);

Practical2 (Insert Table5) ---------
INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10001', 'P10001', 5, 2, 150.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10001', 'P10002', 3, 1, 200.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10002', 'P10003', 10, 5, 120.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10002', 'P10004', 7, 3, 180.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10003', 'P10005', 8, 2, 250.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10003', 'P10006', 6, 4, 160.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10004', 'P10007', 4, 1, 300.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10004', 'P10008', 5, 0, 220.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10005', 'P10009', 2, 2, 500.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10005', 'P10010', 3, 1, 350.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10006', 'P10001', 5, 2, 150.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10007', 'P10001', 5, 2, 300.00);

INSERT INTO Sales_Order_Details (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES ('O10008', 'P10005', 5, 2, 15000.00);

Practical1 (Select Query , Alter Query, And Delete) ---------
select NAME,CITY,STATE from Client_Master;
select PRODUCTNO,DESCRIPTION from Product_Master;
select CLIENTNO,NAME from Client_Master where CITY='Haridwar';
select SALESMANNAME from Salesman_Master where SALAMT=46000;
update Client_Master set CITY='Dehradun',PINCODE = 560025, STATE = 'Uttarakhand'  where CLIENTNO = 'C10003';
update Product_Master set COSTPRICE = 950 where  DESCRIPTION = 'OnePlus 9';
set SQL_SAFE_UPDATES=0;
update Salesman_Master set CITY='Pune',PINCODE = 411005, STATE = 'Maharashtra'  where SALESMANNO = 'S10007';
delete from Salesman_Master where SALAMT = 46000.00;
delete from Product_Master where QTYONHAND = 10;
delete from Client_Master where STATE = 'Kolkata';
alter table Client_Master add TELEPHONE bigint;
alter table Salesman_Master rename to sman_mast;
delete from Salesman_Master;

Practical2 (Select Query) ---------

SELECT Name FROM Client_Master WHERE SUBSTR(Name, 2, 1) = 'a';
SELECT * FROM Client_Master WHERE City LIKE 'H%';
SELECT * FROM Client_Master WHERE City IN ('Dehradun', 'Kolkata');
SELECT * FROM Client_Master WHERE BalDue > 10000;
SELECT * FROM Sales_Order WHERE EXTRACT(MONTH FROM ORDERDATE) = 2;
SELECT * FROM Sales_Order WHERE CLIENTNO IN ('C10001', 'C10002');
SELECT * FROM Product_Master WHERE SELLPRICE > 500 AND SELLPRICE <= 750;
SELECT ProductNo, SELLPRICE, SELLPRICE * 15 AS new_price FROM Product_Master WHERE SELLPRICE > 500;
SELECT Name, City, State FROM Client_Master WHERE State <> 'Madhya Pradesh';
SELECT COUNT(*) AS total_orders FROM Sales_Order;
SELECT AVG(SELLPRICE) AS average_price FROM Product_Master;
SELECT MAX(SELLPRICE) AS max_price, MIN(SELLPRICE) AS min_price FROM Product_Master;
SELECT COUNT(*) AS count_products FROM Product_Master WHERE SELLPRICE <= 500;
SELECT * FROM Product_Master WHERE QTYONHAND < REORDERLVL;

Practical2 (Date Manipulation Operation)---------

SELECT ORDERNO, DATE_FORMAT(ORDERDATE, '%W') AS Order_Day  FROM Sales_Order LIMIT 0, 1000;
SELECT ORDERNO, DATE_FORMAT(DELYDATE, '%M %d') AS Delivery_Date FROM Sales_Order LIMIT 0, 1000;
SELECT ORDERNO, DATE_FORMAT(ORDERDATE, '%d %M %Y') AS Formatted_OrderDate FROM Sales_Order;
SELECT CURRENT_DATE + INTERVAL 15 DAY AS Date_After_15_Days LIMIT 1000;

Practical3(Group By and Having clause)-----------


Select P.ProductNo,P.Description,sum(Sod.Qtyordered) from Product_Master P, Sales_Order_Details Sod where P.ProductNo = Sod.ProductNo Group By P.ProductNo, P.Description;
Select P.ProductNo,P.Description,sum(Sod.Qtyordered),sum(Sod.ProductRate) from Product_Master P, Sales_Order_Details Sod where P.ProductNo = Sod.ProductNo Group By P.ProductNo,P.Description;
SELECT C.CLIENTNO, AVG(SoD.QtyOrdered) AS average_quantity_sold FROM  Client_Master C, Sales_Order So, Sales_Order_Details SoD 
WHERE C.CLIENTNO = So.CLIENTNO AND So.ORDERNO = SoD.OrderNo GROUP BY C.CLIENTNO HAVING  MAX(SoD.QtyOrdered * SoD.ProductRate) <= 15000.00;
SELECT SUM(SoD.QtyOrdered * SoD.ProductRate) AS total_billed_orders 
FROM Sales_Order So, Sales_Order_Details SoD 
WHERE So.ORDERNO = SoD.OrderNo AND So.BILLYN = 'Y' AND MONTH(So.ORDERDATE) = 8;

Join---------------
select SoD.ProductNo,sum(SoD.Qtyordered) 
from Sales_Order_Details SoD , Sales_Order So 
where So.ORDERNO = SoD.OrderNo  and MONTH(So.ORDERDATE) = 8 
Group by SoD.ProductNo; 

select SoD.ProductNo,sum(SoD.Qtyordered) 
from Sales_Order_Details SoD inner join Sales_Order So 
where So.ORDERNO = SoD.OrderNo and MONTH(So.ORDERDATE) = 8
Group by SoD.ProductNo;

select SoD.ProductNo,sum(SoD.Qtyordered) 
from Sales_Order_Details SoD inner join Sales_Order So 
on So.ORDERNO = SoD.OrderNo 
where MONTH(So.ORDERDATE) = 8
Group by SoD.ProductNo;

select Sod.ProductNo,p.Description
from Sales_Order_Details Sod , Sales_Order So, Product_Master p
where So.ORDERNO = SoD.OrderNo and Sod.ProductNo = p.ProductNo  
Group by p.ProductNo 
having  max(SoD.Qtyordered);

select Sod.ProductNo,p.Description
from Sales_Order_Details Sod inner join Sales_Order So natural join Product_Master p
where So.ORDERNO = SoD.OrderNo and Sod.ProductNo = p.ProductNo  
Group by p.ProductNo 
having  max(SoD.Qtyordered);

select Sod.ProductNo,p.Description
from Sales_Order_Details Sod inner join Sales_Order So natural join Product_Master p
where So.ORDERNO = SoD.OrderNo and Sod.ProductNo = p.ProductNo  
Group by p.ProductNo 
having  max(SoD.Qtyordered);

SELECT C.Name
FROM Client_Master C, Sales_Order So, Sales_Order_Details Sod, Product_Master P
WHERE C.ClientNo = So.ClientNo
  AND So.OrderNo = Sod.OrderNo
  AND Sod.ProductNo = P.ProductNo
  AND P.Description = 'Google Pixel 6';


SELECT C.Name
FROM Client_Master C
INNER JOIN Sales_Order S ON C.ClientNo = S.ClientNo
INNER JOIN Sales_Order_Details SOD ON S.OrderNo = SOD.OrderNo
INNER JOIN Product_Master P ON SOD.ProductNo = P.ProductNo
WHERE P.Description = 'Google Pixel 6';

SELECT P.ProductNo, P.Description, S.OrderNo, S.ClientNo, Sod.Qtyordered
FROM Client_Master C, Sales_Order S, Sales_Order_Details Sod, Product_Master P
WHERE C.ClientNo = S.ClientNo
  AND S.OrderNo = Sod.OrderNo
  AND Sod.ProductNo = P.ProductNo
  AND P.Description = 'iPhone 13'
  AND Sod.Qtyordered < 5;

SELECT P.ProductNo, P.Description, S.OrderNo, S.ClientNo, Sod.Qtyordered
FROM Client_Master C inner join Sales_Order S natural join Sales_Order_Details Sod natural join Product_Master P
ON C.ClientNo = S.ClientNo
  AND S.OrderNo = Sod.OrderNo
  AND Sod.ProductNo = P.ProductNo
  AND P.Description = 'iPhone 13'
  AND Sod.Qtyordered < 5;
--------------------------------------------------------------------------
select SoD.ProductNo,sum(SoD.Qtyordered) 
from Sales_Order_Details SoD , Sales_Order So 
where So.ORDERNO = SoD.OrderNo  and MONTH(So.ORDERDATE) = 8 
Group by SoD.ProductNo; 
--------------------------------------------------------------------------
select SoD.ProductNo,sum(SoD.Qtyordered) 
from Sales_Order_Details SoD inner join Sales_Order So 
where So.ORDERNO = SoD.OrderNo and MONTH(So.ORDERDATE) = 8
Group by SoD.ProductNo;
--------------------------------------------------------------------------
select SoD.ProductNo,sum(SoD.Qtyordered) 
from Sales_Order_Details SoD inner join Sales_Order So 
on So.ORDERNO = SoD.OrderNo 
where MONTH(So.ORDERDATE) = 8
Group by SoD.ProductNo;
--------------------------------------------------------------------------
select Sod.ProductNo,p.Description
from Sales_Order_Details Sod , Sales_Order So, Product_Master p
where So.ORDERNO = SoD.OrderNo and Sod.ProductNo = p.ProductNo  
Group by p.ProductNo 
having  max(SoD.Qtyordered);
--------------------------------------------------------------------------
select Sod.ProductNo,p.Description
from Sales_Order_Details Sod inner join Sales_Order So natural join Product_Master p
where So.ORDERNO = SoD.OrderNo and Sod.ProductNo = p.ProductNo  
Group by p.ProductNo 
having  max(SoD.Qtyordered);
--------------------------------------------------------------------------
select Sod.ProductNo,p.Description
from Sales_Order_Details Sod inner join Sales_Order So natural join Product_Master p
on So.ORDERNO = SoD.OrderNo 
where Sod.ProductNo = p.ProductNo  
Group by p.ProductNo 
having  max(SoD.Qtyordered);
--------------------------------------------------------------------------
SELECT C.Name
FROM Client_Master C, Sales_Order So, Sales_Order_Details Sod, Product_Master P
WHERE C.ClientNo = So.ClientNo
  AND So.OrderNo = Sod.OrderNo
  AND Sod.ProductNo = P.ProductNo
  AND P.Description = 'Monitor';
--------------------------------------------------------------------------
SELECT C.Name
FROM Client_Master C
INNER JOIN Sales_Order S ON C.ClientNo = S.ClientNo
INNER JOIN Sales_Order_Details SOD ON S.OrderNo = SOD.OrderNo
INNER JOIN Product_Master P ON SOD.ProductNo = P.ProductNo
WHERE P.Description = 'Monitor';
--------------------------------------------------------------------------
SELECT P.ProductNo, P.Description, S.OrderNo, S.ClientNo, Sod.Qtyordered
FROM Client_Master C, Sales_Order S, Sales_Order_Details Sod, Product_Master P
WHERE C.ClientNo = S.ClientNo
  AND S.OrderNo = Sod.OrderNo
  AND Sod.ProductNo = P.ProductNo
  AND P.Description = 'Printer'
  AND Sod.Qtyordered < 5;
--------------------------------------------------------------------------
SELECT P.ProductNo, P.Description, S.OrderNo, S.ClientNo, Sod.Qtyordered
FROM Client_Master C inner join Sales_Order S natural join Sales_Order_Details Sod natural join Product_Master P
ON C.ClientNo = S.ClientNo
  AND S.OrderNo = Sod.OrderNo
  AND Sod.ProductNo = P.ProductNo
  AND P.Description = 'Printer'
  AND Sod.Qtyordered < 5;
--------------------------------------------------------------------------
-- 7. Finding the products and their quantities for the orders placed by 'Ivan Bayross' and 'Mamta Muzumdar'.
SELECT p.ProductNo, p.Description, sod.QtyOrdered
FROM Product_Master p
JOIN Sales_Order_Details sod ON p.ProductNo = sod.ProductNo
JOIN Sales_Order so ON sod.OrderNo = so.OrderNo
JOIN Client_Master cm ON so.ClientNo = cm.ClientNo
WHERE cm.NAME IN ('Aanya Sharma', 'Karthik Patel');
--------------------------------------------------------------------------
-- 8. Finding the products and their quantities for the orders placed by ClientNo 'C00001' and 'C00002'.
SELECT p.ProductNo, p.Description, sod.QtyOrdered
FROM Product_Master p
JOIN Sales_Order_Details sod ON p.ProductNo = sod.ProductNo
JOIN Sales_Order so ON sod.OrderNo = so.OrderNo
WHERE so.ClientNo IN ('C10001', 'C10002');


Subquery-----------


SELECT p.ProductNo, p.Description FROM Product_Master p WHERE p.ProductNo IN ( SELECT ProductNo FROM Sales_Order_Details WHERE QtyOrdered = 4);
SELECT p.ProductNo, p.Description FROM Product_Master p WHERE p.ProductNo IN ( SELECT ProductNo FROM Sales_Order_Details WHERE QtyOrdered = 2);
--------------------------------------------------------------------------
SELECT c.NAME, c.ADDRESS1, c.ADDRESS2, c.CITY, c.STATE, c.PINCODE FROM Client_Master c WHERE c.CLIENTNO IN (SELECT CLIENTNO FROM Sales_Order WHERE ORDERNO = 'O10001');
--------------------------------------------------------------------------
SELECT c.NAME FROM Client_Master c WHERE c.CLIENTNO IN (select CLIENTNO from Sales_Order where month(OrderDate) > 7);
--------------------------------------------------------------------------
SELECT cm.CLIENTNO, cm.NAME FROM Client_Master cm WHERE cm.CLIENTNO IN (SELECT so.CLIENTNO FROM Sales_Order so WHERE  so.ORDERNO IN (SELECT sod.OrderNo FROM Sales_Order_Details sod WHERE sod.ProductNo IN (SELECT pm.PRODUCTNO FROM Product_Master pm WHERE pm.DESCRIPTION = 'OnePlus 9')));
--------------------------------------------------------------------------
SELECT c.CLIENTNO, c.NAME from Client_Master c where c.CLIENTNO in (select s.CLIENTNO from Sales_Order s where s.ORDERNO in (select sod.OrderNo from Sales_Order_Details sod where sod.ProductRate >= 250));
--------------------------------------------------------------------------