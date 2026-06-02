-- =========================================
-- WINDOW FUNCTIONS
-- =========================================

-- 1. ROW_NUMBER()
-- Assign unique rank to employees by salary

SELECT 
    EmployeeName,
    Department,
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Employees;

-- =========================================

-- 2. RANK()
-- Same salary gets same rank (skips next rank)

SELECT 
    EmployeeName,
    Department,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- =========================================

-- 3. DENSE_RANK()
-- Same salary gets same rank (no gaps)

SELECT 
    EmployeeName,
    Department,
    Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseSalaryRank
FROM Employees;

-- =========================================

-- 4. PARTITION BY (VERY IMPORTANT)

-- Department-wise ranking
SELECT 
    EmployeeName,
    Department,
    Salary,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DeptRank
FROM Employees;

-- =========================================

-- 5. TOP 1 employee per department

WITH RankedEmployees AS
(
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rn
    FROM Employees
)
SELECT *
FROM RankedEmployees
WHERE rn = 1;
