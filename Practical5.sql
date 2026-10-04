-- Practical 5: Implicit Cursors 

-- 1. Write a PL/SQL block to update all employee salaries by 10% and display affected rows.

BEGIN
    UPDATE Employee
    SET Salary = Salary + (Salary * 0.10);

    DBMS_OUTPUT.PUT_LINE('Rows Updated = ' || SQL%ROWCOUNT);

    COMMIT;
END;
/

-- 2. Write a PL/SQL block to delete students with marks < 50 and display SQL%ROWCOUNT. 


BEGIN
    DELETE FROM Student
    WHERE Marks < 50;

    DBMS_OUTPUT.PUT_LINE('Rows Deleted = ' || SQL%ROWCOUNT);

    COMMIT;
END;
/


-- 3. Write a PL/SQL block to insert a new order and check SQL%ROWCOUNT.

BEGIN
    INSERT INTO Orders
    VALUES (1006, 2, DATE '2026-08-06', 6000);

    DBMS_OUTPUT.PUT_LINE('Rows Inserted = ' || SQL%ROWCOUNT);

    COMMIT;
END;
/
Select * from Orders
