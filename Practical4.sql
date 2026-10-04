-- Practical 4: Exception Handling in PL/SQL 

-- 1. Write a PL/SQL block to divide two numbers and handle division by zero. 

DECLARE
    a NUMBER := 20;
    b NUMBER := 0;
    c NUMBER;
BEGIN
    c := a / b;

    DBMS_OUTPUT.PUT_LINE(c);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by Zero');
END;
/

-- 2. Write a PL/SQL block to fetch a student by ID and handle NO_DATA_FOUND.

DECLARE
    v_name Student.Name%TYPE;
BEGIN
    SELECT Name
    INTO v_name
    FROM Student
    WHERE Student_ID = 10;

    DBMS_OUTPUT.PUT_LINE(v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student Not Found');
END;
/

-- 3. Write a PL/SQL block to update salary and handle TOO_MANY_ROWS exception.

DECLARE
    v_salary Employee.Salary%TYPE;
BEGIN
    SELECT Salary
    INTO v_salary
    FROM Employee
    WHERE Department_ID = 20;

    UPDATE Employee
    SET Salary = Salary + 5000
    WHERE Department_ID = 20;

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee found.');
END;
/
