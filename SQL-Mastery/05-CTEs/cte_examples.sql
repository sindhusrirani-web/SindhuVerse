-- =========================================
-- COMMON TABLE EXPRESSIONS (CTE)
-- =========================================

-- 1. Simple CTE
-- Employees with salary above average

WITH AvgSalaryCTE AS
(
    SELECT AVG(Salary) AS AvgSalary
    FROM Employees
)
SELECT *
FROM Employees e
CROSS JOIN AvgSalaryCTE a
WHERE e.Salary > a.AvgSalary;

-- =========================================

-- 2. CTE for grouping
-- Department wise employee count

WITH DeptCTE AS
(
    SELECT 
        Department,
        COUNT(*) AS EmployeeCount
    FROM Employees
    GROUP BY Department
)
SELECT *
FROM DeptCTE;

-- =========================================

-- 3. CTE + filtering
-- Departments with more than 1 employee

WITH DeptCTE AS
(
    SELECT 
        Department,
        COUNT(*) AS EmployeeCount
    FROM Employees
    GROUP BY Department
)
SELECT *
FROM DeptCTE
WHERE EmployeeCount > 1;

-- =========================================

-- 4. Multiple CTEs
WITH DeptCTE AS
(
    SELECT Department, COUNT(*) AS EmpCount
    FROM Employees
    GROUP BY Department
),
SalaryCTE AS
(
    SELECT Department, SUM(Salary) AS TotalSalary
    FROM Employees
    GROUP BY Department
)
SELECT 
    d.Department,
    d.EmpCount,
    s.TotalSalary
FROM DeptCTE d
JOIN SalaryCTE s
ON d.Department = s.Department;
