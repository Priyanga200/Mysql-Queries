CREATE DATABASE company_db;
USE company_db;

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT,
    join_date DATE NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
);

INSERT INTO departments (dept_name) VALUES 
('HR'),
('Finance'),
('IT'),
('Marketing'),
('Operations');

INSERT INTO employees (first_name, last_name, email, salary, dept_id, join_date) VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', 75000, 1, '2023-06-15'),
('Priya', 'Verma', 'priya.verma@example.com', 88000, 2, '2021-09-20'),
('Rajesh', 'Gupta', 'rajesh.gupta@example.com', 96000, 3, '2022-12-05'),
('Neha', 'Reddy', 'neha.reddy@example.com', 73000, 4, '2020-08-10'),
('Vikram', 'Patel', 'vikram.patel@example.com', 99000, 5, '2021-11-25'),
('Kiran', 'Joshi', 'kiran.joshi@example.com', 81000, 3, '2023-04-12'),
('Arjun', 'Singh', 'arjun.singh@example.com', 89000, 4, '2019-05-18');

-- RETRIEVE DATA --

-- Retrieve all employees' details --
SELECT * FROM employees;

-- Retrieve all employees in the IT department --
SELECT * FROM employees 
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = 'IT');

-- Retrieve employees who earn more than 80,000 --
SELECT * FROM employees
WHERE salary > 80000;

-- UPDATE DATA --

-- Increase the salary of employees in Finance by 10% --
UPDATE employees
SET salary = salary * 1.10
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name='Finance');

-- Change the department of an employee whose email is 'rajesh.gupta@example.com' to IT --
UPDATE employees 
SET dept_id=(select dept_id from departments WHERE dept_name = 'IT')
WHERE email='rajesh.gupta@example.com';

-- DELETE DATA --

-- Delete an employee who joined before 2021 --
DELETE FROM employees
WHERE join_date < '2021-01-01';

-- Delete a department that has no employees --
DELETE FROM departments
WHERE dept_id NOT IN (SELECT DISTINCT dept_id FROM employees);

-- SUBQUERY --

-- Find employees who earn more than the average salary of all employees --
SELECT emp_id,first_name,last_name,salary
FROM employees
WHERE salary > (SELECT Avg(salary) FROM employees);

-- Find employees who work in the same department as ‘Neha Reddy’ --
SELECT first_name,last_name,dept_id
FROM employees
WHERE dept_id = (SELECT dept_id from employees WHERE first_name = 'Neha' AND last_name = 'Reddy');

-- Retrieve the department with the highest number of employees --
SELECT dept_name
FROM departments
WHERE dept_id = (SELECT dept_id FROM employees GROUP BY dept_id ORDER BY COUNT(*) DESC LIMIT 1);
