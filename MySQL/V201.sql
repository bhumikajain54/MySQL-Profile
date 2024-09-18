show databases;
create database v201;
use v201;
create table student (id int,name varchar(20),phone bigint,DOB date);
drop table students;
SELECT * FROM v201.student;
insert into student (id,name,phone,dob) values(101,'Bhumika Jain',7464151462,'2001-08-01');
insert into student values(102,'Bhumika Jain',7464151462,'2001-08-01');
insert into student values(103,'Omkar',8668673752,'2002-03-24');
drop table student;
create table student (id int primary Key auto_increment, name varchar(20) NOT NULL, email varchar(20) unique,  phone bigint, DOB date, Age int , city varchar(20) default'Mumbai',D_id int , Check(age>18), foreign key(D_id) references department(D_id));
create table department (D_Id int primary key,D_Name varchar(20),HOD varchar(30));
create table student1 (id int,name varchar(20),phone bigint,DOB date);
insert into student1 (id,name,phone,dob) values(101,'Bhumika Jain',7464151462,'2001-08-01');
insert into student1 values(102,'Bhumika Jain',7464151462,'2001-08-01');
insert into student1 values(103,'Omkar',8668673752,'2002-03-24');
delete from student where id=102;
drop table student;
drop database v201;

truncate table student;
DQL queries -----------------------------------------------------
select * from student;
select * from student where city='Surat';
select * from student where city = 'Surat' and id >= 4;
select * from student where id > 3 or city='Mumbai';
select name,dep from student1;
select * from student where age>25 and age<30;


like operator---------------------------------------------------- 
select * from student where name Like 'Jai %';
select * from student where city like 'S%';
select * from student where name Like '% Prasad';
select * from student where name Like '% Prasad %';
select * from student where name Like '___Prasad %';
select * from student where name Like '%___Prasad%';
select * from student where name Like '[sg]eeta';
select * from student where name Like 'h[ai]t';
select * from student where name Like 'b[i-z]t';
select * from student where name Like 'b[iz]t';
select * from student where name Like 'b[!iz]t';

drop table student2;
create table student3 (id int primary Key, name varchar(20) NOT NULL, Age int , city varchar(20),Dep varchar(20));

insert	into student3 values(1,'Bhumika',23,'Mumbai','IT');
insert	into student3 values(2,'Mahima',20,'Mumbai','finance');
insert	into student3 values(3,'jaya',21,'Mumbai','IT');
insert	into student3 values(4,'Prachi',20,'Mumbai','IT');
insert	into student3 values(5,'Mahima',20,'Mumbai','finance');
insert	into student3 values(6,'Navin',26,'Mumbai','finance');
insert	into student3 values(7,'ABC',35,'Mumbai','IT');
insert	into student3 values(8,'XYZ',25,'Mumbai','Management');
insert	into student3 values(9,'PQR',38,'Mumbai','Chemical');
select * from student3 where age>25 and age<30;


between operator---------------------------------------------------- 
select * from student3 where age between 25 and 35;

limit operator---------------------------------------------------- 
select * from student3 limit 3;
select * from student3 where dep="IT" limit 2;
select * from student3 limit 3 offset 2;
select * from student3 limit 2 offset 2;
select * from student3 where dep ='IT' or dep ='Management' or dep ='finance' or dep ='Chemical';

in operator---------------------------------------------------- 
select * from student3 where dep in ('IT','Management');

Not in operator---------------------------------------------------- 
select * from student3 where dep not in ('IT','finance');

Distinct -----------------
select Distinct Dep from student3;
Distinct count-----------------
select Distinct(count(*)) Dep from student3;
select count(distinct dep) from student3;

Update Query(DML)--------------------
update student3 set city='Balaghat' where id=2;

Alter Query(DDL)--------------------
alter table student1 ADD age int;
alter table student1 modify column name varchar(30) ;
alter table student1 Drop column age;
alter table student rename column city to cityState;
alter table student1 Add constraint id_pk primary key(id);
alter table student1 Drop primary key;
alter table student3 Add constraint age_check check(age>18);
alter table student3 drop check age_check;

Aggregate function--------
create table emp(id int(5) primary key, name varchar(30),salary bigint,date datetime, dob datetime);
INSERT INTO emp (id, name, salary, date, dob)
VALUES 
(10001, 'Alice Johnson', 55000, '2024-08-14 09:00:00', '1990-05-21 00:00:00'),
(10002, 'Bob Smith', 62000, '2024-08-14 09:30:00', '1985-07-14 00:00:00'),
(10003, 'Charlie Brown', 47000, '2024-08-14 10:00:00', '1992-03-09 00:00:00'),
(10004, 'Diana White', 53000, '2024-08-14 10:30:00', '1988-01-15 00:00:00'),
(10005, 'Evan Taylor', 60000, '2024-08-14 11:00:00', '1991-11-11 00:00:00'),
(10006, 'Fiona Davis', 58000, '2024-08-14 11:30:00', '1989-09-24 00:00:00'),
(10007, 'George Harris', 49000, '2024-08-14 12:00:00', '1993-06-30 00:00:00'),
(10008, 'Hannah Moore', 51000, '2024-08-14 12:30:00', '1994-04-02 00:00:00'),
(10009, 'Ian Clark', 61000, '2024-08-14 13:00:00', '1987-08-18 00:00:00'),
(10010, 'Julia Miller', 54000, '2024-08-14 13:30:00', '1990-12-05 00:00:00');

select * from emp;
select count(*) from emp;
select Avg(salary) from emp;
select sum(salary) from emp;
select max(salary) from emp;
select min(salary) from emp;

Date and Time function----------
select Now();
select curdate();
select curtime();
alter table emp ADD dob datetime;
drop table emp;
select Date(DOB) from emp;
select extract(month from dob) from emp;


String function -----------
select Bin(4);
select bit_length('text');
select char_length('text');
select concat('My','S','QL');
select concat_ws(',','My','SQL');
select Insert('Hellohi',3,4,'Bye');
select insert('Indiamycountry',3,4,'Bye');
select left('foobarbar',4);
select repeat('SQL',4);

Join------
drop table A;
drop table B;
create table A (PK int primary key, value varchar(50));
insert into A values
(1, 'FOX'),
 (2, 'COP'),
 (3, 'TAXI'),
 (6, 'WASHINGTON'),
 (7, 'DELL'),
 (5, 'ARIZONA'),
 (4, 'LINCOLN'),
 (10, 'LUCENT');
 
 
 create table B (PK int, value varchar(50),FOREIGN KEY (PK) REFERENCES A(PK));
 insert into B values
 (1, 'TROT'),
 (2, 'CAR'),
 (3, 'CAB'),
 (6, 'MONUMENT'),
 (7, 'PC'),
 (5, 'MICROSOFT'),
 (4, 'APPLE'),
 (10,'SCOTCH');
 
SELECT * FROM A INNER JOIN B ON A.PK = B.PK;
SELECT * FROM A, B WHERE A.PK =  B.PK;
SELECT * FROM A Natural Join B;
SELECT * FROM A Left Outer Join B ON A.PK = B.PK;
SELECT * FROM A Right Outer Join B ON A.PK = B.PK;
(SELECT * FROM A Left Outer Join B ON A.PK = B.PK) Union (SELECT * FROM A Right Outer Join B ON A.PK = B.PK);
SELECT * FROM A CROSS JOIN B;
Select * from A Full Join B on A.PK = B.Pk;    -----(It is not use in MySQL)--------

SELECT * FROM A JOIN B USING (PK);
select * from student s, record r where s.city = r.city;
select * from student s Join record r On s.city = r.city;
select s.name,s.city,r.id,r.class from student s , record r where s.id < r.id;
select s.name,s.city,r.id,r.class from student s Join record r On s.id < r.id;
select e.empname AS "employeename" , m.empname AS "managername" from emp e Join emp m On e.empid = m.manager_id;
Subquery-----------
create table student5 (RollNo bigint primary key,Name varchar(30),Marks bigint,city varchar(30));
insert	into student5 values(1001,'Bhumika',85,'Agar');
insert	into student5 values(1002,'Mahima',78,'Delhi');
insert	into student5 values(1003,'jaya',87,'Gurgaon');
insert	into student5 values(1004,'Prachi',95,'Noida');
insert	into student5 values(1005,'Navin',99,'Agar');
insert	into student5 values(1006,'ABC',90,'Mumbai');
select * from student5 where marks > 85;
select * from student5 where marks > (Select avg(marks) from student5); 
select * from student5 where city = 'Agar' or city = 'Delhi';
select * from student5 where city in ('Agar' , 'Delhi');
select * from student5 where RollNo in (select RollNo from student5 where city = 'Agar' or city = 'Delhi');

create table faculty_details(Faculty_ID bigint primary key,Name varchar(30),Dept_ID bigint,Address varchar(50));
insert	into faculty_details values(101,'Bhumika',1,'Agar');
insert	into faculty_details values(102,'Mahima',2,'Delhi'); 
insert	into faculty_details values(103,'jaya',Null,'Gurgaon');
insert	into faculty_details values(104,'Prachi',4,'Noida');
insert	into faculty_details values(105,'Navin',3,'Agar');
insert	into faculty_details values(106,'ABC',Null,'Mumbai');
insert	into faculty_details values(107,'Abha',5,'Delhi');

create table department1(Dept_ID bigint,Faculty_ID bigint,Dept_Name varchar(30));
insert	into department1 values(1,101,'BCA');
insert	into department1 values(2,102,'B.Tech'); 
insert	into department1 values(3,103,'BBA');
insert	into department1 values(4,104,'MBA');
insert	into department1 values(5,105,'MCA');

select * from faculty_details where Address = 'Gurgaon' or Address = 'Noida';
select * from department1 where Faculty_ID in (select Faculty_ID from faculty_details where Address = 'Gurgaon' or Address = 'Noida');

call faculty_detailsProcedure();
Views---------------------------------
Create table emp(empId int,empName varchar(30),city varchar(50),email varchar(50),phoneNo int,password varchar(50));
create view empview As select empid,empname,email,phoneno from emp;
select * from empview;
drop view empview;


create table customer_table(customerName varchar(30),customerNumber varchar(10) primary key,city varchar(50),state varchar(30),postalcode bigint,creditlimit float);
INSERT INTO customer_table VALUES
('John Doe', 'CUST001', 'New York', 'NY', 10001, 5000.00),
('Jane Smith', 'CUST002', 'Los Angeles', 'CA', 90001, 7500.50),
('Emily Johnson', 'CUST003', 'Chicago', 'IL', 60601, 3000.75),
('Michael Brown', 'CUST004', 'Houston', 'TX', 77001, 12000.00),
('Jessica Davis', 'CUST005', 'Phoenix', 'AZ', 85001, 9500.25),
('David Wilson', 'CUST006', 'Philadelphia', 'PA', 19101, 6000.00),
('Sarah Miller', 'CUST007', 'San Antonio', 'TX', 78201, 8000.80),
('Daniel Garcia', 'CUST008', 'San Diego', 'CA', 92101, 7000.40),
('Laura Martinez', 'CUST009', 'Dallas', 'TX', 75201, 11000.00),
('James Rodriguez', 'CUST010', 'San Jose', 'CA', 95101, 5000.90);

INSERT INTO customer_table (customerName, customerNumber, city, state, postalcode, creditlimit) VALUES
('Charles Green', 'CUST011', 'Miami', 'FL', 33101, 15000.00),
('Patricia Hall', 'CUST012', 'Denver', 'CO', 80201, 25000.50),
('Andrew Walker', 'CUST013', 'Seattle', 'WA', 98101, 35000.75),
('Barbara King', 'CUST014', 'Boston', 'MA', 02101, 45000.00),
('Anthony Wright', 'CUST015', 'Detroit', 'MI', 48201, 55000.25),
('Linda Lewis', 'CUST016', 'Orlando', 'FL', 32801, 65000.00),
('George Young', 'CUST017', 'Las Vegas', 'NV', 89101, 75000.80),
('Mary Harris', 'CUST018', 'Portland', 'OR', 97201, 85000.40),
('Kenneth Clark', 'CUST019', 'Atlanta', 'GA', 30301, 95000.00),
('Elizabeth Adams', 'CUST020', 'Charlotte', 'NC', 28201, 105000.90);

select customerName  as platinum from customer_table where creditlimit >9000;
select customerName as platinum from customer_table where customerNumber ='CUST004' and creditlimit >9000;
call platinumCustomerList();
call Creditlimit('CUST011',@level);
select @level;

Create Table students (student_id INT PRIMARY KEY,name VARCHAR(100),eng INT,maths INT,science INT,percentage DECIMAL(5, 2));

INSERT INTO students (student_id, name, eng, maths, science, percentage) VALUES 
(1, 'John Doe', 85, 90, 80, 85.0),
(2, 'Jane Smith', 78, 88, 84, 83.3),
(3, 'Emily Johnson', 92, 95, 89, 92.0),
(4, 'Michael Brown', 70, 75, 80, 75.0),
(5, 'Sarah Davis', 88, 92, 90, 90.0),
(6, 'David Wilson', 65, 70, 68, 67.7),
(7, 'Laura Clark', 95, 98, 97, 96.7),
(8, 'Daniel Lewis', 82, 85, 88, 85.0),
(9, 'Sophia Walker', 76, 80, 79, 78.3),
(10, 'Chris Young', 90, 93, 91, 91.3);

DELIMITER $$
 Create procedure percentage(IN stud_id Int, Out grade varchar(5))
 Begin
 Declare per DECIMAL(10,2) Default 0;
 Select percentage into per from students where student_id=stud_id;
  If per>90 then 
      set grade="A+";
elseif per>=80 and per<=90 then
      set grade="A";
elseif per>=70 and per<=80 then
      set grade="B+";
elseif per>=55 and per<=70 then
      set grade="B";
elseif per>=45 and per<=55 then
      set grade="B";
elseif per>=35 and per<=45 then
      set grade="D";      
else
	 set grade="Fail";
END if;               
END $$  

call percentage(6, @level);
select @level;

create table employeeTable2(employeeNumber bigint primary key,lastName varchar(50),firstName varchar(50),email varchar(30),officecode varchar(30),reportsTo varchar(30),jobTitle varchar(30));
-- Insert 10 records
INSERT INTO employeeTable2 (employeeNumber, lastName, firstName, email, officeCode, reportsTo, jobTitle) VALUES
(101, 'Smith', 'John', 'john.smith@example.com', '001', '1001', 'Manager'),
(102, 'Doe', 'Jane', 'jane.doe@example.com', '002', '1002', 'Sales Rep'),
(103, 'Brown', 'James', 'james.brown@example.com', '003', '1001', 'Engineer'),
(104, 'Johnson', 'Emily', 'emily.johnson@example.com', '004', '1003', 'HR Specialist'),
(105, 'Williams', 'David', 'david.williams@example.com', '005', '1001', 'Accountant'),
(106, 'Taylor', 'Sophia', 'sophia.taylor@example.com', '006', '1004', 'Analyst'),
(107, 'Anderson', 'Michael', 'michael.anderson@example.com', '007', '1005', 'Developer'),
(108, 'Thomas', 'Linda', 'linda.thomas@example.com', '008', '1002', 'Consultant'),
(109, 'Jackson', 'Robert', 'robert.jackson@example.com', '009', '1003', 'Marketing'),
(110, 'White', 'Olivia', 'olivia.white@example.com', '010', '1004', 'Designer');


DELIMITER $$
CREATE PROCEDURE GetEmailList()
BEGIN
    DECLARE emailList VARCHAR(1000);

    -- Use GROUP_CONCAT to concatenate emails separated by semicolons
    SELECT GROUP_CONCAT(email SEPARATOR ';') INTO emailList
    FROM employeeTable2;

    -- Display the resulting list
    SELECT emailList;
END $$
call GetEmailList();

drop procedure createEmailList;


DELIMITER $$
CREATE PROCEDURE CreateEmailList(INOUT emailList VARCHAR(4000))
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE emailAddress VARCHAR(100) DEFAULT "";
    
    -- declare cursor for employee email
    DECLARE curEmail
		CURSOR FOR
			SELECT email FROM employeeTable2;
            
	-- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET finished = 1;
        
	OPEN curEmail;
    
    getEmail: LOOP
		FETCH curEmail INTO emailAddress;
        IF finished = 1 THEN
			LEAVE getEmail;
		END IF;
        
        -- built email list
        
        SET emailList = CONCAT(emailList, ';', emailAddress);
	END LOOP getEmail;
    CLOSE curEmail;
    
END $$
set @Emaillist ="";
call CreateEmailList(@Emaillist);

select @Emaillist;

-- Create Items table
CREATE TABLE Items (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create item_changes table
CREATE TABLE item_changes (
    changeId INT PRIMARY KEY,
    itemId INT,
    changeType VARCHAR(50),
    changeTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Items (id, name, price) VALUES
(1, 'Item1', 10.99),
(2, 'Item2', 20.49),
(3, 'Item3', 30.00),
(4, 'Item4', 40.75),
(5, 'Item5', 50.20),
(6, 'Item6', 60.00),
(7, 'Item7', 70.95),
(8, 'Item8', 80.30),
(9, 'Item9', 90.15),
(10, 'Item10', 100.00);
INSERT INTO item_changes (changeId, itemId, changeType) VALUES
(1, 1, 'INSERT'),
(2, 2, 'INSERT'),
(3, 3, 'UPDATE'),
(4, 4, 'DELETE'),
(5, 5, 'INSERT'),
(6, 6, 'UPDATE'),
(7, 7, 'DELETE'),
(8, 8, 'INSERT'),
(9, 9, 'UPDATE'),
(10, 10, 'DELETE');
create table employee2(empId bigint primary key,firstName varchar(50),lastName varchar(50),email varchar(30),phone bigint,managerId varchar(30),deptid varchar(30));
INSERT INTO employee2 (empId, firstName, lastName, email, phone, managerId, deptid) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 1234567890, '2', 'D001'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 2345678901, '3', 'D002'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 3456789012, '4', 'D001'),
(4, 'Bob', 'Williams', 'bob.williams@example.com', 4567890123, '5', 'D003'),
(5, 'Charlie', 'Brown', 'charlie.brown@example.com', 5678901234, '1', 'D002'),
(6, 'David', 'Davis', 'david.davis@example.com', 6789012345, '2', 'D001'),
(7, 'Eve', 'Clark', 'eve.clark@example.com', 7890123456, '3', 'D003'),
(8, 'Frank', 'Miller', 'frank.miller@example.com', 8901234567, '4', 'D001'),
(9, 'Grace', 'Wilson', 'grace.wilson@example.com', 9012345678, '5', 'D002'),
(10, 'Hank', 'Taylor', 'hank.taylor@example.com', 1230984567, '1', 'D003');

DELIMITER $$
CREATE PROCEDURE GetEmployee1(in empId bigint)
BEGIN
    
    select e.firstName,e.lastName, m.firstName from employee2 e Join employee2 m On m.managerId = e.empId;
END $$
call GetEmployee1(1);

