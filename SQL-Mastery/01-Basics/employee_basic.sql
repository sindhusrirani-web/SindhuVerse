-- Employee Basic Table

CREATE TABLE Employees
(
    EmployeeId INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);

INSERT INTO Employees VALUES
(1,'Arun','IT',50000,'Hyderabad'),
(2,'Meena','HR',45000,'Chennai'),
(3,'Ravi','IT',70000,'Bangalore'),
(4,'Kiran','Finance',60000,'Hyderabad');

-- Select all employees
SELECT * FROM Employees;

-- IT employees
SELECT * FROM Employees
WHERE Department = 'IT';

-- Highest salary
SELECT TOP 1 * FROM Employees
ORDER BY Salary DESC;
