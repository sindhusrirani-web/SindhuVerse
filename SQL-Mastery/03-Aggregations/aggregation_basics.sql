-- =========================================
-- AGGREGATION FUNCTIONS
-- =========================================

-- COUNT: total employees
SELECT COUNT(*) AS TotalEmployees
FROM Employees;

-- SUM: total salary
SELECT SUM(Salary) AS TotalSalary
FROM Employees;

-- AVG: average salary
SELECT AVG(Salary) AS AverageSalary
FROM Employees;

-- MIN & MAX salary
SELECT 
    MIN(Salary) AS MinSalary,
    MAX(Salary) AS MaxSalary
FROM Employees;

-- =========================================
-- GROUP BY
-- =========================================

-- Employees count by department
SELECT 
    Department,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- Total salary by department
SELECT 
    Department,
    SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

-- =========================================
-- HAVING (filter after grouping)
-- =========================================

-- Departments with more than 1 employee
SELECT 
    Department,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 1;

-- Departments with total salary > 50000
SELECT 
    Department,
    SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 50000;
