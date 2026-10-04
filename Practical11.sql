-- Practical 11: Stored Procedures with Parameters 

-- 1. Create a procedure that accepts Department ID and displays employee count. 

CREATE OR REPLACE PROCEDURE emp_count
(
    p_dept_id IN NUMBER
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Employee
    WHERE Department_ID = p_dept_id;

    DBMS_OUTPUT.PUT_LINE('Employee Count: ' || v_count);
END;
/

BEGIN
    emp_count(10);
END;
/

-- Output - Employee Count: 2

-- 2. Create a procedure to calculate total order amount for a given Customer ID. 

CREATE OR REPLACE PROCEDURE total_order
(
    p_customer_id IN NUMBER
)
IS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(Amount), 0)
    INTO v_total
    FROM Orders
    WHERE Customer_ID = p_customer_id;

    DBMS_OUTPUT.PUT_LINE('Total Order Amount: ' || v_total);
END;
/

-- Execute Procedure

BEGIN
    total_order(1);
END;
/

-- Output - Total Order Amount: 5500

-- 3. Create a procedure to return student details by Student_ID.

CREATE OR REPLACE PROCEDURE student_details
(
    p_student_id IN NUMBER
)
IS
    v_name       VARCHAR2(50);
    v_department VARCHAR2(20);
    v_marks      NUMBER;
    v_grade      CHAR(1);
BEGIN
    SELECT Name, Department, Marks, Grade
    INTO v_name, v_department, v_marks, v_grade
    FROM Student
    WHERE Student_ID = p_student_id;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Department: ' || v_department);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
END;
/

-- Execute Procedure

BEGIN
    student_details(1);
END;
/

-- Output 

-- Name: Amit
-- Department: CSE
-- Marks: 85
-- Grade: A
