-- Practical 8: Creating & Using Views 
-- 1. Create a view to display student names and grades from STUDENT. 

CREATE VIEW student_view AS
SELECT Name, Grade
FROM Student;

SELECT * FROM student_view;

-- 2. Create a view to display employees earning above 50,000. 

CREATE VIEW employee_view AS
SELECT Emp_Name, Salary
FROM Employee
WHERE Salary > 50000;

SELECT * FROM employee_view;

-- 3. Query data from the created views. 

-- Student View
SELECT * FROM student_view;

-- Employee View
SELECT * FROM employee_view;.


---Extra 10 question

-- Q1
CREATE VIEW high_salary_employees AS
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 80000;


-- Q2
CREATE VIEW active_projects AS
SELECT ProjectID, ProjectName, Deadline
FROM Projects
WHERE Status = 'Active';


-- Q3
CREATE VIEW My_departments AS
SELECT *
FROM Departments
WHERE Location = 'New York';


-- Q4
CREATE VIEW employee_department_info AS
SELECT e.FirstName, e.LastName, e.Salary, d.DeptName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- Q5
CREATE VIEW employee_project_assignments AS
SELECT e.FirstName, e.LastName, p.ProjectName,
       a.AssignedRole, a.HoursWorked
FROM Employees e
JOIN Assignments a
ON e.EmployeeID = a.EmployeeID
JOIN Projects p
ON a.ProjectID = p.ProjectID;


-- Q6
CREATE VIEW department_employee_count AS
SELECT d.DeptName, d.Location,
       COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DeptName, d.Location;


-- Q7
CREATE OR REPLACE VIEW high_salary_employees AS
SELECT FirstName, LastName, Salary, DepartmentID
FROM Employees
WHERE Salary > 80000;


-- Q8
UPDATE high_salary_employees
SET Salary = 98000
WHERE FirstName = 'Alice'
AND LastName = 'Smith';


-- Q9
CREATE VIEW assignment_details AS
SELECT *
FROM Assignments;

DELETE FROM assignment_details
WHERE AssignmentID = 303;


-- Q10
DROP VIEW My_departments;

--------------------------------------IMP QUESTION----------------------------------------

-- What is a View?

-- English:
-- A View is a virtual table created from one or more tables using a SQL/Select query.
  
-- Easy example:

-- CREATE VIEW student_view AS
-- SELECT Name, Grade
-- FROM Student;

-----5-Rules of view.
-- View should be based on one table/single table.
-- It should not contain aggregate functions.
-- It should not contain GROUP BY.
-- It should not contain DISTINCT.
-- It should not contain calculated/derived columns. or no query 
