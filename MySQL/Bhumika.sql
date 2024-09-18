--------------------------------------
create database bhumika;
--------------------------------------
use bhumika;
--------------------------------------
desc EmployeeInfoTable;
desc EmployeePosition;
select * from EmployeeInfoTable;
select * from EmployeePosition;

Table1 --------------------------------------
create table EmployeeInfoTable (EmpID bigint Primary Key,EmpFname varchar(30) NOT NULL,EmpLname varchar(20) NOT NULL,Department varchar(30),Project varchar(10),Address varchar(30),DOB Date,Gender char(1));

EmployeeInfoTable (Insert Table1)--------------------------------------
Insert Qurey(DML) --------------------------------------
insert into EmployeeInfoTable values (1,'Ajay','Shah','HR','P1','Hyderabad(HYD)','1976-12-01','M');
insert into EmployeeInfoTable values (2,'Nilisha','Mishra','Admin','P2','Delhi(DEL)','1968-05-02','F');
insert into EmployeeInfoTable values (3,'Rahul','Shrivastav','Account','P3','Mumbai(BOM)','1980-01-01','M');
insert into EmployeeInfoTable values (4,'Ami','Kulkarni','HR','P1','Hyderabad(HYD)','1992-05-02','F');
insert into EmployeeInfoTable values (5,'Ankit','Kapoor','Admin','P2',' Delhi(DEL)','1994-07-03','M');

Table2  --------------------------------------
create table EmployeePosition (EmpID bigint , EmpPosition varchar(30) NOT NULL,DateOfJoining Date,Salary bigint,FOREIGN KEY (EmpID) REFERENCES EmployeeInfoTable(EmpID));

EmployeePosition (Insert Table1) --------------------------------------
insert into EmployeePosition values (1,'Manager','2022-05-01',500000);
insert into EmployeePosition values (2,'Executive','2022-05-02',75000);
insert into EmployeePosition values (3,'Manager','2022-05-01',90000);
insert into EmployeePosition values (4,'Lead','2022-05-02',85000);
insert into EmployeePosition values (5,'Executive','2022-05-01',300000);

Practical (Select Query)  --------------------------------------
1.Write a query to fetch the number of employees working in the department ‘HR’.--------------------------------------
select Count(*) from EmployeeInfoTable where department = 'HR';
2.Write a query to retrieve the first four characters of EmpLname from the EmployeeInfotable.--------------------------------------
SELECT SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfoTable;
3.Write q query to find all the employees whose salary is between 50000 to 100000.--------------------------------------
Select * from EmployeePosition where Salary between 50000 And 100000;
4.Write a query to fetch all employees who also hold the managerial position.--------------------------------------
SELECT E.EmpFname, E.EmpLname, P.EmpPosition FROM EmployeeInfoTable E INNER JOIN EmployeePosition P ON E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');
5. --------------------------------------------------------
SELECT * FROM EmployeeInfoTable E WHERE EXISTS (SELECT * FROM EmployeePosition P WHERE E.EmpId = P.EmpId);
6.Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.--------------------------------------
Select Distinct Salary from EmployeePosition E1 where 2 >= (Select Count(Distinct Salary) from EmployeePosition E2 where E1.Salary >= E2.Salary) Order By E1.Salary Desc; 
7.Write a query to retrieve EmpPostion along with total salaries paid for each of them.--------------------------------------
Select EmpPosition,Sum(Salary) from EmployeePosition Group By EmpPosition;
8. Write a query to fetch 50% records from the EmployeeInfo table.--------------------------------------
Select * from EmployeeInfoTable where EmpID <= (Select Count(EmpID)/2 from EmployeeInfoTable);

View-----------------------------------------------------------------
create view empview As select EmpID,EmpFname,Department,Project from EmployeeInfoTable;
select * from empview;
drop view empview;
select * from view2;

Mam Question --------------------------------------------------------
create table oldEmployee(Emp_ID bigint primary key,Emp_Name varchar(30) NOT NULL,Emp_Salary float,Address varchar(50));
create table newEmployee(Emp_ID bigint primary key,Emp_Name varchar(30) NOT NULL,Emp_Salary float,Address varchar(50));
insert into newEmployee (select * from emp where empsalary >=3000);
update oldEmployee set Emp_Salary = Emp_Salary + 5000 where Emp_ID In (Select Emp_ID from Department where Dept_Grade = 'A');
Delete from oldEmployee where Emp_ID In (Select Emp_ID from Department where Dept_Grade = 'C');
select e.empname AS "employeename" , m.empname AS "managername" from EmployeeInfoTable e Join EmployeeInfoTable m On e.empid = m.manager_id;