-- Practical 10: Stored Procedures – Basics

-- 1. Create a procedure to update salary of an employee by Emp_ID.

CREATE OR REPLACE PROCEDURE update_salary
IS
BEGIN
    UPDATE Employee
    SET Salary = 55000
    WHERE Emp_ID = 101;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully');
END;
/

-- Execute Procedure

BEGIN
    update_salary;
END;
/

-- Check Result

SELECT * FROM Employee
WHERE Emp_ID = 101;

-- 2. Create a procedure to insert a new student record into STUDENT.

CREATE OR REPLACE PROCEDURE insert_student
IS
BEGIN
    INSERT INTO Student
        (Student_ID, Name, Department, Marks, Grade)
    VALUES
        (6, 'Superman', 'CSE', 78, 'B');

    DBMS_OUTPUT.PUT_LINE('Student inserted successfully');
END;
/
BEGIN
    insert_student;
END;
/

SELECT * FROM Student;

-- 3. Create a procedure to delete an order from ORDERS.

CREATE OR REPLACE PROCEDURE delete_order
IS
BEGIN
    DELETE FROM Orders
    WHERE Order_ID = 1005;

    DBMS_OUTPUT.PUT_LINE('Order deleted successfully');
END;
/

BEGIN
    delete_order;
END;
/

SELECT * FROM Orders;
