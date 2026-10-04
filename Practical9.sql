-- Practical 9: Updatable & Non-Updatable Views

-- 1. Create an updatable view of EMPLOYEE
-- with Emp_Name and Salary.

CREATE VIEW emp_view AS
SELECT Emp_Name, Salary
FROM Employee;

SELECT * FROM emp_view;

-- Test UPDATE on Updatable View

UPDATE emp_view
SET Salary = 55000
WHERE Emp_Name = 'John';

SELECT * FROM emp_view;

-- 2. Create a view with aggregate functions
-- (Non-Updatable View)

CREATE VIEW dept_salary AS
SELECT Department_ID,
       SUM(Salary) AS Total_Salary
FROM Employee
GROUP BY Department_ID;

SELECT * FROM dept_salary;

-- 3. Test INSERT/UPDATE on both views.
-- UPDATE on Updatable View

UPDATE emp_view
SET Salary = 50000
WHERE Emp_Name = 'John';

SELECT * FROM emp_view;

-- INSERT on Updatable View

CREATE OR REPLACE VIEW emp_view AS
SELECT Emp_ID, Emp_Name, Salary
FROM Employee;

INSERT INTO emp_view (Emp_ID, Emp_Name, Salary)
VALUES (106, 'Rahul', 60000);

SELECT * FROM emp_view;

-----------------------------------IMP QUESTION--------------------------------

-- 1. Updatable View

-- An updatable view allows INSERT, UPDATE, and sometimes DELETE operations.

-- CREATE VIEW view_name AS
-- SELECT column1, column2
-- FROM table_name
-- WHERE condition;


-- UPDATE emp_view
-- SET Salary = 60000
-- WHERE Emp_Name = 'John';


-- 2. Non-Updatable View

-- A non-updatable view cannot normally be directly modified because it contains things 
-- like aggregate functions, GROUP BY, DISTINCT, etc.

-- CREATE VIEW view_name AS
-- SELECT aggregate_function(column)
-- FROM table_name
-- GROUP BY column;
