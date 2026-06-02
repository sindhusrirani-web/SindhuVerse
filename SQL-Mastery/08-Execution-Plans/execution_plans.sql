-- =========================================
-- EXECUTION PLANS CONCEPTS
-- =========================================

-- Enable Actual Execution Plan in SSMS:
-- Shortcut: Ctrl + M

-- =========================================
-- 1. TABLE SCAN (BAD for large data)
-- =========================================

SELECT *
FROM Employees
WHERE Department = 'IT';

-- If no index exists → SQL scans full table

-- =========================================
-- 2. INDEX SEEK (GOOD performance)
-- =========================================

-- After creating index on Department
SELECT *
FROM Employees
WHERE Department = 'IT';

-- SQL directly jumps using index

-- =========================================
-- 3. EXAMPLE: SLOW QUERY PATTERN
-- =========================================

SELECT *
FROM Employees
WHERE Salary * 1.1 > 60000;

-- Problem: function on column → index not used

-- =========================================
-- 4. OPTIMIZED VERSION
-- =========================================

SELECT *
FROM Employees
WHERE Salary > 60000 / 1.1;

-- Now index can be used

-- =========================================
-- 5. FILTER EARLY (BEST PRACTICE)
-- =========================================

SELECT Department, COUNT(*)
FROM Employees
WHERE Department = 'IT'
GROUP BY Department;
