-- =========================================
-- JOINS BASICS
-- =========================================

CREATE TABLE Departments
(
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance');

-- INNER JOIN
SELECT 
    e.EmployeeName,
    e.Salary,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.Department = d.DepartmentName;

-- LEFT JOIN
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.Department = d.DepartmentName;

-- RIGHT JOIN
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.Department = d.DepartmentName;
