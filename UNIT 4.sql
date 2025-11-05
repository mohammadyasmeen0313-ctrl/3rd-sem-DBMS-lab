CREATE DATABASE Unit4;

USE Unit4;

CREATE TABLE Univ_Denorm (
    StudentID INT,
    StudentName VARCHAR(50),
    Major VARCHAR(50),
    CourseID VARCHAR(10),
    CourseName VARCHAR(50),
    Credits INT,
    EnrollmentDate DATE,
    InstructorID INT,
    InstructorName VARCHAR(50),
    Phone VARCHAR(15)
);
    
INSERT INTO univ_denorm VALUES
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 10, 'Dr. Adams', '555-0100'),
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 11, 'Dr. Baker', '555-0111'),
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 10, 'Dr. Adams', '555-0100'),
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 11, 'Dr. Baker', '555-0111'),
(1, 'Alice Smith', 'Computer Science', 'C102', 'Calculus I', 4, '2025-09-02', 11, 'Dr. Baker', '555-0111'),
(3, 'Carol Lee', 'Physics', 'C103', 'Physics I', 4, '2025-09-04', 12, 'Dr. Clark', '555-0122'),
(3, 'Carol Lee', 'Physics', 'C104', 'Modern Physics', 3, '2025-09-05', 13, 'Dr. Daniels', '555-0133'),
(4, 'David Kim', 'Electrical Engineering', 'C105', 'Circuits I', 4, '2025-09-06', 14, 'Dr. Evans', '555-0144'),
(4, 'David Kim', 'Electrical Engineering', 'C106', 'Signals and Systems', 3, '2025-09-07', 15, 'Dr. Foster', '555-0155'),
(2, 'Bob Jones', 'Mathematics', 'C107', 'Linear Algebra', 3, '2025-09-03', 16, 'Dr. Green', '555-0166'),
(1, 'Alice Smith', 'Computer Science', 'C108', 'Data Structures', 4, '2025-09-08', 17, 'Dr. Hill', '555-0177'),
(3, 'Carol Lee', 'Physics', 'C108', 'Data Structures', 4, '2025-09-08', 17, 'Dr. Hill', '555-0177');

select *from univ_denorm;

select *from univ_denorm order by studentID, courseID, InstructorID;

CREATE TABLE Students AS 
SELECT distinct studentID, studentname, Major from univ_denorm;

select *from Students;

create TABLE Courses AS 
select distinct courseID, courseName,credits from univ_denorm;

select *from Courses;

create table Instructors AS
select distinct InstructorID, InstructorName,phone from univ_denorm;

select *from Instructors;

create table Enrollments AS
select distinct studentID, courseID, InstructorID from univ_denorm;

select *from Enrollments;

create table Course_Instructors AS
select distinct studentID,courseID,InstructorID from univ_denorm;

select *from Course_Instructors;

SELECT 
    e.StudentID, 
    s.StudentName, 
    s.Major, 
    c.CourseID, 
    c.CourseName, 
    c.Credits,
    i.InstructorID, 
    i.InstructorName, 
    i.Phone
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Course_Instructors ci ON c.CourseID = ci.CourseID
JOIN Instructors i ON ci.InstructorID = i.InstructorID;




