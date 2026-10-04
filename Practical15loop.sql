--PL/SQL Loop and Number Programs

--p1 Print 1 to 10.

DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

--p2 Print Even Numbers from 1 to 20.

DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..20 LOOP
        IF MOD(i, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;

--p3 Print prime numbers from 1 to 50.

DECLARE
    count_num NUMBER;
BEGIN
    FOR i IN 2..50 LOOP
        count_num := 0;

        -- Count factors
        FOR j IN 1..i LOOP
            IF MOD(i, j) = 0 THEN
                count_num := count_num + 1;
            END IF;
        END LOOP;

        -- Prime number has exactly 2 factors
        IF count_num = 2 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;

--p4 Fibonacci series — first 10 terms.
DECLARE
    a NUMBER := 0;
    b NUMBER := 1;
    c NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(a);

        c := a + b;
        a := b;
        b := c;
    END LOOP;
END;

--p5 PL/SQL block to reverse a given number using a WHILE loop.

DECLARE
    n NUMBER := 12345;
    rev NUMBER := 0;
    rem NUMBER;
BEGIN
    WHILE n > 0 LOOP
        rem := MOD(n, 10);
        rev := rev * 10 + rem;
        n := TRUNC(n / 10);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Reverse = ' || rev);
END;
/

-- p6 PL/SQL block to calculate the sum of digits of a given number using WHILE loop.

SET SERVEROUTPUT ON;

DECLARE
    n NUMBER := 12345;
    sum NUMBER := 0;
    rem NUMBER;
BEGIN
    WHILE n > 0 LOOP
        rem := MOD(n, 10);
        sum := sum + rem;
        n := TRUNC(n / 10);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Sum of digits = ' || sum);
END;
/

-- p7 PL/SQL block to print odd prime numbers between 1 to 50 using nested WHILE loops.

DECLARE
    n NUMBER := 3;
    i NUMBER;
    flag NUMBER;
BEGIN
    WHILE n <= 50 LOOP
        i := 2;
        flag := 1;

        WHILE i <= n / 2 LOOP
            IF MOD(n, i) = 0 THEN
                flag := 0;
                EXIT;
            END IF;

            i := i + 1;
        END LOOP;

        IF flag = 1 THEN
            DBMS_OUTPUT.PUT_LINE(n);
        END IF;

        n := n + 2;
    END LOOP;
END;
/

-- p8 PL/SQL block to calculate the factorial of a given number using a FOR loop.



DECLARE
    n NUMBER := 5;
    fact NUMBER := 1;
BEGIN
    FOR i IN 1..n LOOP
        fact := fact * i;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Factorial = ' || fact);
END;
/

--p9 Write a PL/SQL block to check whether a number is Armstrong or not.

DECLARE
    n NUMBER := 153;
    temp NUMBER;
    rem NUMBER;
    sum NUMBER := 0;
BEGIN
    temp := n;

    WHILE temp > 0 LOOP
        rem := MOD(temp, 10);
        sum := sum + (rem * rem * rem);
        temp := TRUNC(temp / 10);
    END LOOP;

    IF sum = n THEN
        DBMS_OUTPUT.PUT_LINE(n || ' is Armstrong Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(n || ' is Not Armstrong Number');
    END IF;
END;
/
