
-- Practical 3: Conditional Statements in PL/SQL 

-- 1. Write a PL/SQL block to assign grades to students in STUDENT based on marks.

DECLARE
    CURSOR c1 IS
        SELECT Student_ID, Name, Marks
        FROM Student;
BEGIN
    FOR rec IN c1 LOOP

        IF rec.Marks >= 80 THEN
            DBMS_OUTPUT.PUT_LINE(rec.Name || ' Grade A');

        ELSIF rec.Marks >= 60 THEN
            DBMS_OUTPUT.PUT_LINE(rec.Name || ' Grade B');

        ELSIF rec.Marks >= 50 THEN
            DBMS_OUTPUT.PUT_LINE(rec.Name || ' Grade C');

        ELSE
            DBMS_OUTPUT.PUT_LINE(rec.Name || ' Grade D');

        END IF;

    END LOOP;
END;
/

-- Without cursor

DECLARE
    v_grade CHAR(1);
BEGIN
    FOR rec IN (SELECT Name, Marks FROM Student) LOOP
        IF rec.Marks >= 80 THEN
            v_grade := 'A';
        ELSIF rec.Marks >= 60 THEN
            v_grade := 'B';
        ELSIF rec.Marks >= 50 THEN
            v_grade := 'C';
        ELSE
            v_grade := 'D';
        END IF;

        DBMS_OUTPUT.PUT_LINE(rec.Name || ' Grade ' || v_grade);
    END LOOP;
END;
/

-- 2. Write a PL/SQL block to check if an employee earns above/below 50,000.

DECLARE
    CURSOR c1 IS
        SELECT Emp_Name, Salary
        FROM Employee;
BEGIN
    FOR rec IN c1 LOOP

        IF rec.Salary > 50000 THEN
            DBMS_OUTPUT.PUT_LINE(rec.Emp_Name || ' : Above 50000');

        ELSE
            DBMS_OUTPUT.PUT_LINE(rec.Emp_Name || ' : Below or Equal 50000');

        END IF;

    END LOOP;
END;
/


-- Without cursor

declare 
    v_salary number;
Begin
    for rec in(select Emp_Name, Salary from Employee) 
    loop
    IF rec.Salary > 50000 THEN
            DBMS_OUTPUT.PUT_LINE(rec.Emp_Name || ' : Above 50000');

        ELSE
            DBMS_OUTPUT.PUT_LINE(rec.Emp_Name || ' : Below or Equal 50000');

        END IF;

    END LOOP;
END;
/

-- 3. Write a PL/SQL block to categorize orders from ORDERS as “High” (>4000) or “Low”. 

DECLARE
    CURSOR c1 IS
        SELECT Order_ID, Amount
        FROM Orders;
BEGIN
    FOR rec IN c1 LOOP

        IF rec.Amount > 4000 THEN
            DBMS_OUTPUT.PUT_LINE('Order ' || rec.Order_ID || ' : High');

        ELSE
            DBMS_OUTPUT.PUT_LINE('Order ' || rec.Order_ID || ' : Low');

        END IF;

    END LOOP;
END;
/
