create database s;
use s;
Employee Table(Create and Insert)
CREATE TABLE employee ( id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),salary DECIMAL(10, 2),dept_id INT, role VARCHAR(50));
INSERT INTO employee (id, first_name, last_name, salary, dept_id, role) VALUES
(1, 'Rahul', 'Sharma', 45000, 1, 'IT_PROG'),
(2, 'Pratik', 'Gajne', 67000, 2, 'ML_ENGG'),
(3, 'Naresh', 'Bhatt', 48000, 1, 'IT_PROG'),
(4, 'Nisha', 'Shetty', 65000, 1, 'IT_PROG'),
(5, 'Vishal', 'Kumar', 56000, 2, 'TESTER'),
(6, 'Niranjan', 'Pandey', 43000, 1, 'IT_PROG'),
(7, 'Simran', 'Mehta', 56000, 1, 'SUPPORT'),
(8, 'Vipul', 'Shekhawat', 67000, 2, 'SUPPORT'),
(9, 'Binay', 'Gosh', 32000, 1, 'IT_PROG'),
(10, 'Nitin', 'Rao', 54000, 2, 'TESTER');
select * from employee;

Department Table(Create and Insert)
CREATE TABLE department (id INT PRIMARY KEY,dept_name VARCHAR(50));
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'CS');
select * from department;

View------------------------------------------------
1.  Write a sql query to create view named as EmployeeView for those employee with role as "IT_PROG". EmployeeView. contains id, first_name, last_name, role.
CREATE VIEW EmployeeView AS SELECT id, first_name, last_name role FROM employee WHERE role = 'IT_PROG';
2. Write a sql query to insert a new a new record in the EmployeeView as shown below.
INSERT INTO employeeView VALUES (11, 'Piyush', 'Bansal', 52000, 2, 'Data Analyst');
3. Write a sql query to change the role of all employee from EmployeeView from "IT_PROG" to "IT_PROGRAMMER".
SET SQL_SAFE_UPDATES = 0;
UPDATE employee SET role = 'IT_PROGRAMMER' WHERE role = 'IT_PROG';
4. Write a query to delete a employee from EmployeeView with id=5.
DELETE FROM employeeView WHERE id = 5;

Q3.With respect to above table , create view named as EmployeeDetails that contains  id, first_name, last_name, salary of those employees whose salary is greater than the average salary from the employee table.
CREATE VIEW EmployeeDetails AS SELECT id, first_name, last_name, salary FROM employee WHERE salary > (SELECT AVG(salary) FROM employee);
select * from EmployeeDetails;
With respect to Employee and Department table shown above, write a query  to create view named as EmployeeDet that shows  employee details such as. id, first_name, last_name, salary, department_name.
CREATE VIEW EmployeeDet AS
SELECT e.id, e.first_name, e.last_name, e.salary, d.dept_name AS department_name FROM employee e JOIN department d ON e.dept_id = d.id;


create database b;
use b;
-- Create the department table
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_id INT,
    location_id INT
);

-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    mobile VARCHAR(50),
    hire_date DATE,
    job_id INT,
    salary FLOAT,
    manager_id INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
-- Inserting into department table
INSERT INTO department (dept_id, dept_name, manager_id, location_id) VALUES
(1, 'HR', 101, 1001),
(2, 'IT', 102, 1002),
(3, 'Finance', 103, 1003),
(4, 'Marketing', 104, 1004),
(5, 'Sales', 105, 1005),
(6, 'Operations', 106, 1006),
(7, 'Research', 107, 1007),
(8, 'Development', 108, 1008),
(9, 'Support', 109, 1009),
(10, 'Admin', 110, 1010);

-- Inserting into employee table
INSERT INTO employee (emp_id, first_name, last_name, email, mobile, hire_date, job_id, salary, manager_id, dept_id) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '2020-01-01', 201, 60000, 101, 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2019-02-01', 202, 65000, 102, 2),
(3, 'Jim', 'Beam', 'jim.beam@example.com', '1230984567', '2018-03-01', 203, 55000, 103, 3),
(4, 'Jill', 'Stark', 'jill.stark@example.com', '3216549870', '2021-04-01', 204, 50000, 104, 4),
(5, 'Jack', 'Black', 'jack.black@example.com', '2135468790', '2020-05-01', 205, 70000, 105, 5),
(6, 'Julia', 'Roberts', 'julia.roberts@example.com', '2315648790', '2017-06-01', 206, 80000, 106, 6),
(7, 'Jeremy', 'Clark', 'jeremy.clark@example.com', '4567891230', '2016-07-01', 207, 90000, 107, 7),
(8, 'Jessica', 'Alba', 'jessica.alba@example.com', '3214567890', '2015-08-01', 208, 75000, 108, 8),
(9, 'Jason', 'Momoa', 'jason.momoa@example.com', '7894561230', '2014-09-01', 209, 65000, 109, 9),
(10, 'Jake', 'Gyllenhaal', 'jake.gyllenhaal@example.com', '1236547890', '2022-10-01', 210, 60000, 110, 10);

DELIMITER $$
CREATE PROCEDURE get_employee()
BEGIN
    SELECT 
        e.first_name, 
        e.last_name, 
        e.email, 
        d.dept_name
    FROM 
        employee e
    INNER JOIN 
        department d 
    ON 
        e.dept_id = d.dept_id;
END $$


CALL get_employee();
