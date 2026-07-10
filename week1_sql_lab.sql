-- SQL Basics Lab Exercise

-- Part 1 – Create the Database

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INTEGER PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

-- Insert sample data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES
(1, 'HR', 'London'),
(2, 'Finance', 'Frankfurt'),
(3, 'IT', 'Berlin'),
(4, 'Sales', 'Paris'),
(5, 'Marketing', 'Madrid');

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INTEGER,
    DepartmentID INTEGER,
    City VARCHAR(50),
    Salary INTEGER,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample employee data
INSERT INTO Employees
(EmployeeID, FirstName, LastName, Gender, Age, DepartmentID, City, Salary)
VALUES
(101, 'Emma', 'Wilson', 'Female', 28, 1, 'London', 45000),
(102, 'Liam', 'Smith', 'Male', 35, 2, 'Manchester', 62000),
(103, 'Sophia', 'Brown', 'Female', 31, 3, 'Berlin', 70000),
(104, 'Noah', 'Taylor', 'Male', 42, 4, 'Paris', 68000),
(105, 'Olivia', 'Martin', 'Female', 26, 5, 'Madrid', 48000),
(106, 'Lucas', 'Muller', 'Male', 38, 3, 'Munich', 82000),
(107, 'Isabella', 'Garcia', 'Female', 30, 2, 'Barcelona', 61000),
(108, 'Ethan', 'Johnson', 'Male', 45, 1, 'Dublin', 75000),
(109, 'Mia', 'Anderson', 'Female', 27, 4, 'Amsterdam', 52000),
(110, 'James', 'Thomas', 'Male', 33, 3, 'London', 73000);

-- Understanding the Data

-- 1. Display all employees.
SELECT * 
FROM Employees;

-- 2. Display only the employee names and salaries.
SELECT FirstName, LastName, Salary
FROM Employees;

-- 3. Count the total number of employees.
SELECT COUNT(*) AS TotalEmployees
FROM Employees;

-- 4. Display all unique cities.
SELECT DISTINCT City
FROM Employees;

-- 5. Display all unique department IDs.
SELECT DISTINCT DepartmentID
FROM Employees;


-- Filtering

-- 6. Find employees older than 30.
SELECT *
FROM Employees
WHERE Age > 30;

-- 7. Find employees earning more than 60,000.
SELECT *
FROM Employees
WHERE Salary > 60000;

-- 8. Display employees from London.
SELECT *
FROM Employees
WHERE City = 'London';

-- 9. Find employees whose salary is between 50,000 and 75,000.
SELECT *
FROM Employees
WHERE Salary BETWEEN 50000 AND 75000;

-- 10. Display employees whose first name starts with L.
SELECT *
FROM Employees
WHERE FirstName LIKE 'L%';

-- 11. Display employees whose age is less than 35.
SELECT *
FROM Employees
WHERE Age < 35;


-- Sorting

-- 12. Sort employees by salary (highest first).
SELECT *
FROM Employees
ORDER BY Salary DESC;

-- 13. Sort employees by age (youngest first).
SELECT *
FROM Employees
ORDER BY Age ASC;

-- 14. Sort employees by city and then salary.
SELECT *
FROM Employees
ORDER BY City ASC, Salary DESC;


-- Aggregate Functions

-- 15. Find the average salary.
SELECT AVG(Salary) AS AverageSalary
FROM Employees;

-- 16. Find the highest salary.
SELECT MAX(Salary) AS HighestSalary
FROM Employees;

-- 17. Find the minimum salary.
SELECT MIN(Salary) AS MinimumSalary
FROM Employees;

-- 18. Find the average employee age.
SELECT AVG(Age) AS AverageAge
FROM Employees;


-- GROUP BY

-- 19. Count employees in each department.
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;

-- 20. Find the average salary in each department.
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;

-- 21. Find the highest salary in each department.
SELECT DepartmentID, MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY DepartmentID;

-- 22. Show only departments having more than one employee.
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 1;


-- UPDATE

-- 23. Increase salaries of IT employees by 5%.
UPDATE Employees
SET Salary = Salary * 1.05
WHERE DepartmentID = 3;

-- 24. Change the city of EmployeeID 109 to Brussels.
UPDATE Employees
SET City = 'Brussels'
WHERE EmployeeID = 109;


-- DELETE

-- 25. Delete employees whose salary is below 48,000.
DELETE FROM Employees
WHERE Salary < 48000;


-- JOIN Exercises

-- 26. Display each employee along with their department name.
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- 27. Display employee name, department name, and department location.
SELECT
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName,
    Departments.Location
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- 28. Count the number of employees in each department using a JOIN.
SELECT
    Departments.DepartmentName,
    COUNT(Employees.EmployeeID) AS EmployeeCount
FROM Departments
JOIN Employees
ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName;

-- 29. Display all departments, even if they have no employees.
SELECT
    Departments.DepartmentName,
    Employees.FirstName,
    Employees.LastName
FROM Departments
LEFT JOIN Employees
ON Departments.DepartmentID = Employees.DepartmentID;

-- 30. Find the average salary for each department using a JOIN.
SELECT
    Departments.DepartmentName,
    AVG(Employees.Salary) AS AverageSalary
FROM Departments
JOIN Employees
ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName;

-- 31. Display employees who work in departments located in Berlin.
SELECT
    Employees.FirstName,
    Employees.LastName,
    Departments.Location
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.Location = 'Berlin';

-- 32. Display only employees working in the IT department (using a JOIN instead of filtering by ID).
SELECT
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'IT';