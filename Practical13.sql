-- Practical 13: Sales & Billing System (Case Study) 

-- • Use existing CUSTOMER and ORDERS tables. 
-- • Write PL/SQL programs to: 

-- 1. Generate a monthly sales report for each customer (cursor). 

DECLARE
    CURSOR c1 IS
        SELECT Customer_ID,
               SUM(Amount) AS Total_Sales
        FROM Orders
        GROUP BY Customer_ID;

BEGIN
    FOR rec IN c1 LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Customer ID: ' || rec.Customer_ID ||
            ' Total Sales: ' || rec.Total_Sales
        );

    END LOOP;
END;
/

-- 2. Create a view for high-value customers (orders > 10,000 total). 

CREATE OR REPLACE VIEW high_value_customer AS
SELECT Customer_ID,
       SUM(Amount) AS Total_Amount
FROM Orders
GROUP BY Customer_ID
HAVING SUM(Amount) > 10000;

SELECT * FROM high_value_customer;

-- 3. Write a procedure to apply discount (10%) if order amount exceeds 5000. 

CREATE OR REPLACE PROCEDURE apply_discount
(
    p_order_id IN NUMBER
)
IS
BEGIN
    UPDATE Orders
    SET Amount = Amount - (Amount * 0.10)
    WHERE Order_ID = p_order_id
    AND Amount > 5000;

    DBMS_OUTPUT.PUT_LINE('Discount applied successfully');
END;
/

BEGIN
    apply_discount(1005);
END;
/

SELECT * FROM Orders;
