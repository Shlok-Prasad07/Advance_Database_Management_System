-- Practical 2: PL/SQL - Create the following Tables. (Assume DataTypes) 

-- Student: 

CREATE TABLE Student
(
    Student_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Department VARCHAR2(20),
    Marks NUMBER,
    Grade CHAR(1)
);

INSERT INTO Student 
VALUES (1,'Amit','CSE',85,'A');
INSERT INTO Student 
VALUES (2,'Riya','ECE',72,'B');
INSERT INTO Student 
VALUES (3,'Karan','CSE',55,'C');
INSERT INTO Student 
VALUES (4,'Megha','ME',90,'A');
INSERT INTO Student 
VALUES (5,'Ankit','CSE',40,'D');

-- Employee Table:

CREATE TABLE Employee
(
    Emp_ID NUMBER PRIMARY KEY,
    Emp_Name VARCHAR2(50),
    Department_ID NUMBER,
    Salary NUMBER,
    Hire_Date DATE
);

INSERT INTO Employee 
VALUES (101,'John',10,50000,DATE '2021-01-15');
INSERT INTO Employee 
VALUES (102,'Meera',20,60000,DATE '2020-05-10');
INSERT INTO Employee 
VALUES (103,'Arjun',10,45000,DATE '2022-02-20');
INSERT INTO Employee 
VALUES (104,'Priya',30,70000,DATE '2019-09-05');
INSERT INTO Employee 
VALUES (105,'Dev',20,55000,DATE '2021-12-01');

-- Customer Table:

CREATE TABLE Customer
(
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(50),
    City VARCHAR2(30),
    Phone VARCHAR2(15)
);

INSERT INTO Customer 
VALUES (1,'Rahul','Ahmedabad','9876543210');
INSERT INTO Customer 
VALUES (2,'Sneha','Surat','9123456780');
INSERT INTO Customer 
VALUES (3,'Vikas','Rajkot','9988776655');
INSERT INTO Customer 
VALUES (4,'Neha','Vadodara','9898989898');

-- Department Table

CREATE TABLE Department
(
    Department_ID NUMBER PRIMARY KEY,
    Department_Name VARCHAR2(50),
    Location VARCHAR2(50)
);

INSERT INTO Department 
VALUES (10,'HR','Delhi');
INSERT INTO Department 
VALUES (20,'IT','Bangalore');
INSERT INTO Department 
VALUES (30,'Finance','Mumbai');

-- Orders Table:

CREATE TABLE Orders
(
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Order_Date DATE,
    Amount NUMBER,

    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID)
);

INSERT INTO Orders 
VALUES (1001,1,DATE '2023-06-15',2500);
INSERT INTO Orders 
VALUES (1002,2,DATE '2023-07-01',1500);
INSERT INTO Orders 
VALUES (1003,1,DATE '2023-07-05',3000);
INSERT INTO Orders 
VALUES (1004,3,DATE '2023-07-10',4500);
INSERT INTO Orders 
VALUES (1005,4,DATE '2023-08-01',5000);

COMMIT;

-- Basic PL/SQL Block 
-- 1. Write a PL/SQL block to calculate total and average marks from STUDENT. 

DECLARE
    v_total NUMBER;
    v_avg NUMBER;
BEGIN
    SELECT SUM(Marks), AVG(Marks)
    INTO v_total, v_avg
    FROM Student;

    DBMS_OUTPUT.PUT_LINE('Total Marks = ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Average Marks = ' || v_avg);
END;
/

-- 2. Write a PL/SQL block to display employee names and salaries from EMPLOYEE.

DECLARE
BEGIN
    FOR rec IN (SELECT Emp_Name, Salary FROM Employee)
    LOOP
        DBMS_OUTPUT.PUT_LINE(rec.Emp_Name || ' : ' || rec.Salary);
    END LOOP;
END;
/

-- 3. Write a PL/SQL block to display total sales amount from ORDERS. 

DECLARE
    v_total NUMBER;
BEGIN
    SELECT SUM(Amount)
    INTO v_total
    FROM Orders;

    DBMS_OUTPUT.PUT_LINE('Total Sales = ' || v_total);
END;
/
