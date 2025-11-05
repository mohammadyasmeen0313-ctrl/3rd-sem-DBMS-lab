CREATE DATABASE Unit1;

USE Unit1;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender CHAR(1),
    dob DATE,
    dept_id INT
);

INSERT INTO Students VALUES (1001, 'Alice', 'F', '2001-03-15', 1);

SELECT * FROM Students;



