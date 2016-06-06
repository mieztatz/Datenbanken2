--------------------------------------------------------
--  DDL for Function MIN_MAX_SCALE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "MIN_MAX_SCALE" 
  (min_old NUMBER, min_new NUMBER, max_old NUMBER, max_new NUMBER, v NUMBER)
RETURN NUMBER
IS
BEGIN
  RETURN (((v - min_old)/(max_old - min_old))*(max_new - min_new)) + min_new;
END;

/
--------------------------------------------------------
--  DDL for Procedure MIN_MAX_CALCULATOR
--------------------------------------------------------
-- Ergebnisse werden in neue Table eingetragen
  CREATE OR REPLACE PROCEDURE "MIN_MAX_CALCULATOR" 
  (min_new NUMBER,max_new NUMBER)
IS
min_old number;
BEGIN
 SELECT MIN(ZAHLEN) INTO min_old FROM NUMBERS;
  INSERT INTO NUMBERS_RESULT(
  SELECT MIN_MAX_SCALE(min_old, min_new, (SELECT MAX(ZAHLEN) FROM NUMBERS), max_new, ZAHLEN)
  FROM NUMBERS);
END;

/

-- Alternative: Update in gleicher Table
CREATE OR REPLACE PROCEDURE "MIN_MAX_CALCULATOR" 
  (min_new NUMBER,max_new NUMBER)
IS
min_old number;
BEGIN
 SELECT MIN(ZAHLEN) INTO min_old FROM NUMBERS;
  UPDATE NUMBERS SET ZAHLEN = MIN_MAX_SCALE(min_old, min_new, (SELECT MAX(ZAHLEN) FROM NUMBERS), max_new, ZAHLEN);
END;

--> Result: 
EXECUTE min_max_calculator(0,10);

SELECT * FROM NUMBERS ORDER BY ZAHLEN ASC;
 ZAHLEN
----------
         5 
        10 
        20 
        25 
        42 
        50 
        53 
       100 
       120 
       142 
       242 
       250 
       342 
       350 
       420 
	   
SELECT to_char(ZAHLEN,'990.99999999') AS ZAHLEN FROM NUMBERS_RESULT ORDER BY ZAHLEN ASC;
  ZAHLEN      
-------------
   0.00000000 
   0.12048193 
   0.36144578 
   0.48192771 
   0.89156627 
   1.08433735 
   1.15662651 
   2.28915663 
   2.77108434 
   3.30120482 
   5.71084337 
   5.90361446 
   8.12048193 
   8.31325301 
  10.00000000