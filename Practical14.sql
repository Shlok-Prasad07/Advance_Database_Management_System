--Practical 14: Library Management System (Case Study) 

--Create tables: BOOK(Book_ID, Title, Author, Price), ISSUE(Book_ID, Student_ID, Issue_Date, Return_Date). 

CREATE TABLE BOOK
(
    Book_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(50),
    Author VARCHAR2(50),
    Price NUMBER
);

INSERT INTO BOOK VALUES (1, 'Java Programming', 'James', 500);
INSERT INTO BOOK VALUES (2, 'Database System', 'Korth', 600);
INSERT INTO BOOK VALUES (3, 'Web Development', 'John', 450);

COMMIT;

CREATE TABLE ISSUE
(
    Book_ID NUMBER,
    Student_ID NUMBER,
    Issue_Date DATE,
    Return_Date DATE
);

INSERT INTO ISSUE
VALUES (1, 101, DATE '2026-09-01', NULL);

INSERT INTO ISSUE
VALUES (2, 102, DATE '2026-09-01', DATE '2026-09-20');

COMMIT;

-- 1. Check if a book is available before issuing. 

DECLARE
    v_count NUMBER;
    v_book_id NUMBER := 1;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM ISSUE
    WHERE Book_ID = v_book_id
    AND Return_Date IS NULL;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Book is Available');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Book is Not Available');
    END IF;
END;
/

-- 2. Calculate fine if a book is returned late. 

DECLARE
    v_issue_date DATE := DATE '2026-09-01';
    v_return_date DATE := DATE '2026-09-20';
    v_days NUMBER;
    v_fine NUMBER;
BEGIN
    v_days := v_return_date - v_issue_date;

    IF v_days > 15 THEN
        v_fine := (v_days - 15) * 10;

        DBMS_OUTPUT.PUT_LINE('Fine = ' || v_fine);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No Fine');
    END IF;
END;
/

-- 3. Maintain an issue history using a trigger. 

CREATE TABLE ISSUE_HISTORY
(
    Book_ID NUMBER,
    Student_ID NUMBER,
    Issue_Date DATE
);

CREATE OR REPLACE TRIGGER issue_history_trigger
AFTER INSERT ON ISSUE
FOR EACH ROW
BEGIN
    INSERT INTO ISSUE_HISTORY
        (Book_ID, Student_ID, Issue_Date)
    VALUES
        (:NEW.Book_ID, :NEW.Student_ID, :NEW.Issue_Date);
END;
/

INSERT INTO ISSUE
VALUES (3, 103, SYSDATE, NULL);

SELECT * FROM ISSUE_HISTORY;
