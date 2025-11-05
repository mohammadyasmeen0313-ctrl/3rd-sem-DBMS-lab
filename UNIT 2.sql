CREATE DATABASE Unit2;

USE Unit2;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'Alice', 'Johnson', 'HR', 55000.00),
(2, 'Bob', 'Smith', 'Finance', 65000.00),
(3, 'Charlie', 'Lee', 'IT', 70000.00),
(4, 'David', 'Brown', 'IT', 72000.00),
(5, 'Eve', 'Davis', 'Marketing', 58000.00),
(6, 'Frank', 'Wilson', 'Finance', 67000.00),
(7, 'Grace', 'Clark', 'HR', 53000.00),
(8, 'Hank', 'Adams', 'IT', 75000.00),
(9, 'Ivy', 'Miller', 'Marketing', 60000.00),
(10, 'Jack', 'Taylor', 'HR', 54000.00);

SELECT * FROM Employees;

SELECT * FROM Employees WHERE Department = 'IT';

SELECT FirstName, LastName, Salary FROM Employees WHERE Salary > 60000;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (11, 'Karen', 'White', 'Sales', 61000.00);

SET SQL_SAFE_UPDATES = 0;

UPDATE Employees
SET Salary = Salary * 1.05
WHERE Department = 'HR';

select *from Employees;

DELETE FROM Employees WHERE EmployeeID = 3;

-- Aggregation Functions

CREATE TABLE Sales (
    id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2)
);

INSERT INTO Sales (id, product, category, quantity, price) VALUES
(1, 'Laptop', 'Electronics', 3, 800.00),
(2, 'Smartphone', 'Electronics', 5, 600.00),
(3, 'Desk', 'Furniture', 2, 150.00),
(4, 'Chair', 'Furniture', 4, 100.00),
(5, 'Mouse', 'Electronics', 10, 20.00);

select *from Sales;

SELECT 
    category,
    COUNT(*) AS total_items,
    SUM(quantity) AS total_quantity,
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM 
    Sales
GROUP BY 
    category;

-- Using HAVING Clause

SELECT 
    category,
    COUNT(*) AS total_items,
    SUM(quantity) AS total_quantity,
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM 
    Sales
GROUP BY 
    category
HAVING 
    SUM(quantity) > 5;

