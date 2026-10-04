-- Practical 6: Explicit Cursors

-- 1. Write a PL/SQL block with explicit cursor to display all employee names and salaries.

DECLARE
    CURSOR emp_cursor IS
        SELECT ename, sal FROM employee;

    v_name employee.ename%TYPE;
    v_salary employee.sal%TYPE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name ||
                             '  Salary: ' || v_salary);
    END LOOP;

    CLOSE emp_cursor;
END;
/

-- 2. Write a PL/SQL block to fetch student records one by one from STUDENT. 

DECLARE
    CURSOR stu_cursor IS
        SELECT Student_ID, Name, Department, Marks, Grade
        FROM Student;

    v_id Student.Student_ID%TYPE;
    v_name Student.Name%TYPE;
    v_department Student.Department%TYPE;
    v_marks Student.Marks%TYPE;
    v_grade Student.Grade%TYPE;

BEGIN
    OPEN stu_cursor;

    LOOP
        FETCH stu_cursor
        INTO v_id, v_name, v_department, v_marks, v_grade;

        EXIT WHEN stu_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_id ||
            ' Name: ' || v_name ||
            ' Department: ' || v_department ||
            ' Marks: ' || v_marks ||
            ' Grade: ' || v_grade
        );
    END LOOP;

    CLOSE stu_cursor;
END;
/

-- 3.Write a PL/SQL block to display department-wise salary totals.

DECLARE
    CURSOR dept_cursor IS
        SELECT Department_ID, SUM(Salary)
        FROM Employee
        GROUP BY Department_ID;

    v_dept Employee.Department_ID%TYPE;
    v_total NUMBER;
BEGIN
    OPEN dept_cursor;

    LOOP
        FETCH dept_cursor INTO v_dept, v_total;
        EXIT WHEN dept_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Department: ' || v_dept ||
            '  Total Salary: ' || v_total
        );
    END LOOP;

    CLOSE dept_cursor;
END;
/
 
----------------------------------IMP QUESTION----------------------------------
-- what is cursor ?
-- Cursors in PL/SQL are used to process query results row by row.
--  They can be explicit or implicit, with explicit cursors offering more control over the query execution cycle.

-- Cursor: A cursor is a pointer used in PL/SQL to process the rows returned by a SQL query one by one.
-- Exam POV: Cursor is used to fetch and process multiple records one by one.


--  . Implicit Cursor

-- An implicit cursor is automatically created and managed by Oracle whenever you execute SQL statements such as:

-- INSERT
-- UPDATE
-- DELETE
-- SELECT ... INTO

-- You do not need to declare or open it yourself.

-- 2. Explicit Cursor

-- An explicit cursor is created and controlled by the programmer when a query returns multiple rows and you want to process them one by one.

-- You normally follow these steps:

-- DECLARE → OPEN → FETCH → CLOSE



-- Easy way to remember

-- Implicit = Oracle controls it.
-- Explicit = Programmer controls it.



-- Syntax
-- DECLARE
--     CURSOR cursor_name IS
--         SELECT column_name
--         FROM table_name;

-- BEGIN
--     OPEN cursor_name;

--     FETCH cursor_name INTO variable_name;

--     CLOSE cursor_name;
-- END;
-- /
