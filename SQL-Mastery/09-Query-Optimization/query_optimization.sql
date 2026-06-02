-- =====================================================
-- QUERY OPTIMIZATION TECHNIQUES WITH EXPLANATIONS
-- =====================================================

-- BAD PRACTICE 1: Using SELECT *
-- This fetches all columns even if not needed
-- It increases memory usage and slows performance
SELECT *
FROM Employees;

-- GOOD PRACTICE:
-- Select only required columns to improve performance
SELECT EmployeeId, EmployeeName, Department
FROM Employees;

-- =====================================================

-- BAD PRACTICE 2: Function on column
-- Using YEAR() prevents index usage because function is applied on column
SELECT *
FROM Employees
WHERE YEAR(CreatedDate) = 2025;

-- OPTIMIZED:
-- Use range condition so index can be used efficiently
SELECT *
FROM Employees
WHERE CreatedDate >= '2025-01-01'
AND CreatedDate < '2026-01-01';

-- =====================================================

-- BAD PRACTICE 3: Leading wildcard search
-- '%text%' prevents index usage and forces full table scan
SELECT *
FROM Employees
WHERE EmployeeName LIKE '%arun%';

-- =====================================================

-- BAD PRACTICE 4: Unnecessary DISTINCT
-- DISTINCT adds extra sorting overhead
-- Use only when duplicates actually exist
SELECT DISTINCT Department
FROM Employees;

-- =====================================================

-- BAD PRACTICE 5: Incorrect JOIN condition (cartesian product risk)
-- ON 1=1 creates cross join behavior and huge result set
SELECT *
FROM Employees e
JOIN Departments d
ON 1=1
WHERE e.Department = d.DepartmentName;

-- =====================================================

-- GOOD PRACTICE: Proper JOIN condition
-- Joining tables using correct keys improves performance
SELECT *
FROM Employees e
JOIN Departments d
ON e.Department = d.DepartmentName;

-- =====================================================

-- BEST PRACTICE: Filter early
-- Reduces number of rows before grouping (faster execution)
SELECT Department, COUNT(*) AS EmpCount
FROM Employees
WHERE Department = 'IT'
GROUP BY Department;
