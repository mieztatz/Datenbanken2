--------------------------------------------------------
--  DDL for Table NUMBERS
--------------------------------------------------------
  CREATE TABLE "NUMBERS" 
   (	"ZAHLEN" NUMBER
   );

/

--------------------------------------------------------
--  DDL for Table NUMBERS_RESULT
--------------------------------------------------------
  CREATE TABLE "NUMBERS_RESULT" 
   (	"ZAHLEN" NUMBER
   );

/

Insert into DBST47.NUMBERS (ZAHLEN) values ('10');
Insert into DBST47.NUMBERS (ZAHLEN) values ('20');
Insert into DBST47.NUMBERS (ZAHLEN) values ('25');
Insert into DBST47.NUMBERS (ZAHLEN) values ('250');
Insert into DBST47.NUMBERS (ZAHLEN) values ('350');
Insert into DBST47.NUMBERS (ZAHLEN) values ('100');
Insert into DBST47.NUMBERS (ZAHLEN) values ('5');
Insert into DBST47.NUMBERS (ZAHLEN) values ('50');
Insert into DBST47.NUMBERS (ZAHLEN) values ('53');
Insert into DBST47.NUMBERS (ZAHLEN) values ('42');
Insert into DBST47.NUMBERS (ZAHLEN) values ('120');
Insert into DBST47.NUMBERS (ZAHLEN) values ('142');
Insert into DBST47.NUMBERS (ZAHLEN) values ('242');
Insert into DBST47.NUMBERS (ZAHLEN) values ('342');
Insert into DBST47.NUMBERS (ZAHLEN) values ('420');

/

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
-- Ergebnisse werden in neue Table "NUMBERS_RESULT" eingetragen
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

Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('0,120481927710843373493975903614457831325');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('0,361445783132530120481927710843373493976');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('0,481927710843373493975903614457831325301');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('5,90361445783132530120481927710843373494');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('8,31325301204819277108433734939759036145');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('2,28915662650602409638554216867469879518');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('0');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('1,08433734939759036144578313253012048193');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('1,15662650602409638554216867469879518072');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('0,891566265060240963855421686746987951807');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('2,77108433734939759036144578313253012048');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('3,30120481927710843373493975903614457831');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('5,71084337349397590361445783132530120482');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('8,12048192771084337349397590361445783133');
Insert into DBST47.NUMBERS_RESULT (ZAHLEN) values ('10');

/

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
