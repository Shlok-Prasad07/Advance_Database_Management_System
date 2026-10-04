-- Practical 12: Stored Functions & Triggers 

-- 1. Create a function to return grade of a student based on marks. 

CREATE OR REPLACE FUNCTION get_grade
(
    marks NUMBER
)
RETURN VARCHAR2
IS
    grade VARCHAR2(10);
BEGIN
    IF marks >= 80 THEN
        grade := 'A';
    ELSIF marks >= 60 THEN
        grade := 'B';
    ELSIF marks >= 50 THEN
        grade := 'C';
    ELSE
        grade := 'D';
    END IF;

    RETURN grade;
END;
/

SELECT get_grade(85) AS Grade
FROM DUAL;


-- Output - A

-- 2. Create a function to return annual salary of an employee. 

CREATE OR REPLACE FUNCTION annual_salary
(
    empid NUMBER
)
RETURN NUMBER
IS
    sal NUMBER;
BEGIN
    SELECT Salary
    INTO sal
    FROM Employee
    WHERE Emp_ID = empid;

    RETURN sal * 12;
END;
/

SELECT annual_salary(101) AS Annual_Salary
FROM DUAL;

-- 3. Create a trigger that logs updates to EMPLOYEE salary into an audit table.

CREATE TABLE Salary_Audit
(
    Emp_ID NUMBER,
    Old_Salary NUMBER,
    New_Salary NUMBER
);

CREATE OR REPLACE TRIGGER salary_trigger
AFTER UPDATE OF Salary ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Salary_Audit
    VALUES (:OLD.Emp_ID, :OLD.Salary, :NEW.Salary);
END;
/

UPDATE Employee
SET Salary = 55000
WHERE Emp_ID = 101;

SELECT * FROM Salary_Audit;
