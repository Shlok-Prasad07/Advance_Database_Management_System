-- Practical 7: Parameterized Cursors 

-- 1. Write a PL/SQL block to display employees of a given Department ID. 

DECLARE
    CURSOR emp_cur(p_dept NUMBER) IS
        SELECT Emp_Name
        FROM Employee
        WHERE Department_ID = p_dept;
    v_name Employee.Emp_Name%TYPE;
BEGIN
    OPEN emp_cur(20);
    LOOP
        FETCH emp_cur INTO v_name;
        EXIT WHEN emp_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_name);
    END LOOP;
    CLOSE emp_cur;
END;
/

-- 2. Write a PL/SQL block to list orders for a given Customer ID. 
  
--method-1
DECLARE
    CURSOR c1(c_id NUMBER) IS
        SELECT Order_ID, Amount
        FROM Orders
        WHERE Customer_ID = c_id;
BEGIN
    FOR x IN c1(1)
    LOOP
        DBMS_OUTPUT.PUT_LINE(x.Order_ID || ' ' || x.Amount);
    END LOOP;
END;
/


--method-2
DECLARE
    CURSOR order_cur(p_customer_id NUMBER) IS
        SELECT Order_ID, Order_Date, Amount
        FROM Orders
        WHERE Customer_ID = p_customer_id;

    v_order_id Orders.Order_ID%TYPE;
    v_order_date Orders.Order_Date%TYPE;
    v_amount Orders.Amount%TYPE;

BEGIN
    OPEN order_cur(1);

    LOOP
        FETCH order_cur INTO v_order_id, v_order_date, v_amount;

        EXIT WHEN order_cur%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_order_id || ' ' || v_order_date || ' ' || v_amount
        );
    END LOOP;

    CLOSE order_cur;
END;
/

-- 3. Write a PL/SQL block to calculate total marks for a given Student ID.

DECLARE
    CURSOR c1(s_id NUMBER) IS
        SELECT Marks
        FROM Student
        WHERE Student_ID = s_id;
    total NUMBER := 0;
BEGIN
    FOR x IN c1(1)
    LOOP
        total := total + x.Marks;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Marks = ' || total);
END;
/
  
--method-2
DECLARE
    CURSOR marks_cur(p_student_id NUMBER) IS
        SELECT Marks
        FROM Student
        WHERE Student_ID = p_student_id;

    v_marks Student.Marks%TYPE;

BEGIN
    OPEN marks_cur(1);

    LOOP
        FETCH marks_cur INTO v_marks;

        EXIT WHEN marks_cur%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Total Marks = ' || v_marks);
    END LOOP;

    CLOSE marks_cur;
END;
/

-------------------------------------------------IMP QUESTION--------------------------------------
-- Easy way to remember Parameterized Cursor
-- CURSOR c1(parameter NUMBER) IS
--     SELECT ...
--     WHERE column = parameter;

-- Then:

-- FOR x IN c1(value)
-- LOOP
--     ...
-- END LOOP;


-- What is a Parameterized Cursor?

-- English:
-- A parameterized cursor is a cursor that accepts parameters and uses those 
-- parameters to fetch specific records from a table.

-- Gujlish:
-- Parameterized cursor evo cursor che je parameter/value accept kare che. 
-- Aa parameter na basis par cursor specific records fetch kare che.

-- Why do we use Parameterized Cursor?

-- English:
-- We use a parameterized cursor when we want to execute the same cursor for different values.

-- Gujlish:
-- Jyare same cursor ne different values sathe multiple times use karvo hoy tyare parameterized cursor use kariye.

