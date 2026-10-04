-- Practical 1: Subquery, Nested Query, Group By, Having 

-- Table 1: Departments 

CREATE TABLE Departments
(
    DepartmentID NUMBER PRIMARY KEY,
    DeptName VARCHAR2(50),
    Budget NUMBER,
    Location VARCHAR2(50),
    ManagerID NUMBER
);

INSERT INTO Departments 
VALUES (10,'Engineering',500000,'New York',101);
INSERT INTO Departments 
VALUES (20,'Marketing',150000,'San Francisco',104);
INSERT INTO Departments 
VALUES (30,'Sales',200000,'Chicago',105);
INSERT INTO Departments 
VALUES (40,'HR',80000,'New York',103);
INSERT INTO Departments 
VALUES (50,'Finance',300000,'San Francisco',102);

Select * from Departments 

-- Table 2: Employees 

CREATE TABLE Employees
(
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(30),
    LastName VARCHAR2(30),
    DepartmentID NUMBER,
    Salary NUMBER,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

INSERT INTO 
Employees VALUES (101,'Alice','Smith',10,95000);
INSERT INTO 
Employees VALUES (102,'Bob','Jones',50,105000);
INSERT INTO 
Employees VALUES (103,'Charlie','Brown',40,60000);
INSERT INTO 
Employees VALUES (104,'Diana','Prince',20,85000);
INSERT INTO 
Employees VALUES (105,'Evan','Wright',30,75000);

-- Table 3: Projects 

CREATE TABLE Projects
(
    ProjectID NUMBER PRIMARY KEY,
    ProjectName VARCHAR2(100),
    DepartmentID NUMBER,
    Status VARCHAR2(20),
    Deadlines NUMBER,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

INSERT INTO 
Projects VALUES (201,'Cloud Migration',10,'Active',2026);
INSERT INTO 
Projects VALUES (202,'Ad Campaign',20,'Active',2026);
INSERT INTO 
Projects VALUES (203,'SEO Overhaul',20,'Completed',2025);
INSERT INTO 
Projects VALUES (204,'CRM Upgrade',30,'Active',2027);
INSERT INTO 
Projects VALUES (205,'Audit 2026',50,'Active',2026);

-- Table 4: Assignments 

CREATE TABLE Assignments
(
    AssignmentID NUMBER PRIMARY KEY,
    EmployeeID NUMBER,
    ProjectID NUMBER,
    HoursWorked NUMBER,
    Role VARCHAR2(50),

    FOREIGN KEY (EmployeeID)
    REFERENCES Employees(EmployeeID),

    FOREIGN KEY (ProjectID)
    REFERENCES Projects(ProjectID)
);

INSERT INTO Assignments 
VALUES (301,101,201,120,'Lead Architect');
INSERT INTO Assignments 
VALUES (302,104,202,80,'Manager');
INSERT INTO Assignments 
VALUES (303,104,203,45,'Analyst');
INSERT INTO Assignments 
VALUES (304,105,204,95,'Consultant');
INSERT INTO Assignments 
VALUES (305,102,205,60,'Auditor');

COMMIT;

-- 1. Display the first name, last name, and salary of all employees who make more money than the average salary of the entire company. 
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);

-- 2. Extract the project ID, role, and hours worked from the assignments table for the individual entry that has logged the absolute maximum number of hours.
SELECT ProjectID, Role, HoursWorked
FROM Assignments
WHERE HoursWorked =
(
    SELECT MAX(HoursWorked)
    FROM Assignments
);

-- 3. Find the first and last names of employees who work in departments located specifically in 'San Francisco', using a nested structure. 
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID IN
(
    SELECT DepartmentID
    FROM Departments
    WHERE Location = 'San Francisco'
);

-- 4. Fetch all details from the departments table that are currently handling projects with deadlines scheduled beyond the year 2025. 
SELECT *
FROM Departments
WHERE DepartmentID IN
(
    SELECT DepartmentID
    FROM Projects
    WHERE Deadlines > 2025
);

-- 5. Find the total sum of budgets allocated to each distinct location in the departments table.
SELECT Location,
       SUM(Budget) AS Total_Budget
FROM Departments
GROUP BY Location;

-- 6. Find both the lowest (minimum) and highest (maximum) salaries offered within each department ID.
SELECT DepartmentID,
       MIN(Salary) AS Minimum_Salary,
       MAX(Salary) AS Maximum_Salary
FROM Employees
GROUP BY DepartmentID;

-- 7. Display locations whose combined departmental budgets sum up to a total greater than 400,000. 
SELECT Location,
       SUM(Budget) AS Total_Budget
FROM Departments
GROUP BY Location
HAVING SUM(Budget) > 400000;

-- 8. List the names of assignment roles that have maintained a collective average workload of more than 50 hours. 
SELECT Role,
       AVG(HoursWorked) AS Average_Hours
FROM Assignments
GROUP BY Role
HAVING AVG(HoursWorked) > 50;
