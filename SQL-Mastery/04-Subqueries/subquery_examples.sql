-- =========================================
-- SUBQUERIES
-- =========================================

-- 1. Subquery in WHERE clause
-- Find employees whose salary is greater than average salary

SELECT *
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- =========================================

-- 2. Subquery with IN
-- Employees in departments that exist in Departments table

SELECT *
FROM Employees
WHERE Department IN (
    SELECT DepartmentName
    FROM Departments
);

-- =========================================

-- 3. Subquery in SELECT clause
-- Show employee and total employees in same department

SELECT 
    EmployeeName,
    Department,
    (SELECT COUNT(*) 
     FROM Employees e2 
     WHERE e2.Department = e1.Department) AS DeptEmployeeCount
FROM Employees e1;

-- =========================================

-- 4. EXISTS example
-- Departments that have at least one employee

SELECT *
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.Department = d.DepartmentName
);
