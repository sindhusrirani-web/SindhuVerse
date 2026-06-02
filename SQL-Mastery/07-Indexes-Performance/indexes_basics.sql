-- =========================================
-- INDEXES BASICS
-- =========================================

-- Create index on Department column
CREATE INDEX IX_Employees_Department
ON Employees(Department);

-- Create index on Salary column
CREATE INDEX IX_Employees_Salary
ON Employees(Salary);

-- =========================================
-- WHY INDEX IS IMPORTANT
-- =========================================

-- Without index: full table scan
SELECT *
FROM Employees
WHERE Department = 'IT';

-- With index: faster lookup (index seek)
SELECT *
FROM Employees
WHERE Salary > 50000;

-- =========================================
-- COMPOSITE INDEX
-- =========================================

CREATE INDEX IX_Employees_Dept_Salary
ON Employees(Department, Salary);

-- Helps queries like:
SELECT *
FROM Employees
WHERE Department = 'IT'
AND Salary > 50000;
