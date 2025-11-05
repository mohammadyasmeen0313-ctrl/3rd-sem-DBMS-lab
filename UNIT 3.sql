CREATE DATABASE Unit3;

USE Unit3;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

select *from Departments;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 60000),
(103, 'Carol', 3, 55000),
(104, 'David', 2, 62000),
(105, 'Eve', NULL, 45000);   

select *from Employees;

SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM Employees e, Departments d
WHERE e.dept_id = d.dept_id;

SELECT emp_id, name, salary, dept_name
FROM Employees
NATURAL JOIN Departments;

SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
  ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM Employees e
LEFT JOIN Departments d
  ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
  ON e.dept_id = d.dept_id;

-- Set operations

SELECT dept_id FROM Employees UNION SELECT dept_id FROM Departments;

SELECT dept_id FROM Employees
UNION ALL
SELECT dept_id FROM Departments;

SELECT dept_id FROM Employees
WHERE dept_id IN (SELECT dept_id FROM Departments);

SELECT d.dept_id
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
WHERE e.dept_id IS NULL;


-- nested

SELECT name FROM employees WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = 'IT');

-- Correlated Subquery:

CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

-- Insert sample data
INSERT INTO employees1 (emp_id, name, dept_id, salary) VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 1, 60000),
(103, 'Charlie', 1, 55000),
(104, 'David', 2, 40000),
(105, 'Eva', 2, 45000),
(106, 'Frank', 2, 70000),
(107, 'Grace', 3, 80000),
(108, 'Henry', 3, 82000),
(109, 'Ivy', 3, 75000);

SELECT e1.name, e1.salary FROM employees1 e1 WHERE e1.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e1.dept_id = e2.dept_id);

-- views and materalized views

CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > 50000;

SELECT * FROM high_salary_employees;

CREATE MATERIALIZED VIEW dept_avg_salary AS SELECT dept_id, AVG(salary) as avg_salary FROM employees GROUP BY dept_id; SELECT * FROM dept_avg_salary;