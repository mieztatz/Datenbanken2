--------------------------------------------------------
--  Datei erstellt -Montag-Juni-20-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type AVAILABLE_IN_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."AVAILABLE_IN_T" AS OBJECT(
Item_ID REF Item_t,
Item_Stock INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type AVAILABLELIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."AVAILABLELIST" as table of Available_In_t;
  
/
--------------------------------------------------------
--  DDL for Type COMPANY_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."COMPANY_T" AS OBJECT(
Comp_ID  INTEGER,
Comp_Name VARCHAR2(20),
Comp_Contact REF Contact_T,
Comp_Type COMP_TYPE_T,
Comp_Sholders SHAREHOLDERLIST,
Comp_Manager MANAGERLIST,
Comp_Directors DIRECTORLIST,
Comp_Stores STORELIST) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type COMP_TYPE_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."COMP_TYPE_T" AS OBJECT(
Typ_Desc VARCHAR2(30)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type COMP_TYPE1_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."COMP_TYPE1_T" UNDER COMP_TYPE_T(
Area  VARCHAR2(5)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type COMP_TYPE2_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."COMP_TYPE2_T" UNDER COMP_TYPE_T(
Market  VARCHAR2(10)) NOT FINAL;
  
/
--------------------------------------------------------
--  DDL for Type CONTACT_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."CONTACT_T" AS OBJECT(
Street  VARCHAR2(30),
HNUMBER INTEGER,
Code VARCHAR2(5),
City VARCHAR2(20),
Phone_Numbers PHONENUMBERLIST,
Fax VARCHAR2(12)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type CUSTOMER_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."CUSTOMER_T" AS OBJECT(
Cust_ID VARCHAR2(5),
Cust_Name VARCHAR2(20),
Cust_Contact REF Contact_t,
Cust_Gender INTEGER(1),
Cust_DOB DATE,
Cust_Bonus_Points INTEGER,
Cust_Trans TRANSACTIONLIST) NOT FINAL; 
  
/
--------------------------------------------------------
--  DDL for Type DEPARTMENTLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."DEPARTMENTLIST" as table of Department_t;

/
--------------------------------------------------------
--  DDL for Type DEPARTMENT_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."DEPARTMENT_T" AS OBJECT(
Dept_ID INTEGER,
Dept_Name VARCHAR2(20),
Dept_Head VARCHAR2(25),
Dept_Employees EMPLOYEELIST) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type DIRECTORLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."DIRECTORLIST" as table of Director_t;

/
--------------------------------------------------------
--  DDL for Type DIRECTOR_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."DIRECTOR_T" AS OBJECT(
Manag_ID REF Management_t,
Bonus INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_CASUAL_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."EMPLOYEE_CASUAL_T" UNDER "EMPLOYEE_T"(
  Hourly_Wage INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_FULLTIME_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."EMPLOYEE_FULLTIME_T" UNDER "EMPLOYEE_T"(
  Annual_Wage INTEGER,
  Emp_Bonus INTEGER) NOT FINAL;
  
/
--------------------------------------------------------
--  DDL for Type EMPLOYEELIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."EMPLOYEELIST" as table of Employee_t;

/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_PARTTIME_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."EMPLOYEE_PARTTIME_T" UNDER "EMPLOYEE_T"(
  Weekly_Wage INTEGER) NOT FINAL;
  
/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."EMPLOYEE_T" AS OBJECT(
Emp_ID VARCHAR2(5),
Emp_Name VARCHAR2(30),
Emp_Contact REF Contact_T) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type ITEMLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."ITEMLIST" as table of REF Item_t;
  
/
--------------------------------------------------------
--  DDL for Type ITEM_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."ITEM_T" AS OBJECT(
Item_ID VARCHAR2(5),
Item_Name VARCHAR2(20),
Item_Desc VARCHAR2(20),
Item_Cost VARCHAR2(4),
Item_Price VARCHAR2(5),
Item_Trans TRANSACTIONLIST) NOT FINAL; 
/
--------------------------------------------------------
--  DDL for Type MAKER_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."MAKER_T" AS OBJECT(
Maker_ID VARCHAR2(5),
Maker_Name VARCHAR2(20),
Maker_Contact REF Contact_T,
Items ITEMLIST) NOT FINAL;  
  
/
--------------------------------------------------------
--  DDL for Type MANAGEMENT_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."MANAGEMENT_T" AS OBJECT(
Manag_ID INTEGER,
Manag_Name VARCHAR2(30),
Manag_Contact REF Contact_T) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type MANAGERLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."MANAGERLIST" as table of Manager_t;

/
--------------------------------------------------------
--  DDL for Type MANAGER_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."MANAGER_T" AS OBJECT(
Manag_ID REF Management_t, 
Manag_Type VARCHAR2(30),
Yearly_Salary VARCHAR2(10)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type OWN_SHARES_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."OWN_SHARES_T" AS OBJECT(
Sholder_ID REF Shareholder_t,
Share_Amount INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type PHONENUMBERLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."PHONENUMBERLIST" as table of VARCHAR2(12);

/
--------------------------------------------------------
--  DDL for Type SHAREHOLDERLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."SHAREHOLDERLIST" as table of Own_Shares_t;

/
--------------------------------------------------------
--  DDL for Type SHAREHOLDER_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."SHAREHOLDER_T" AS OBJECT(
Sholder_ID  INTEGER,
Sholder_Name VARCHAR2(30),
Sholder_Contact REF Contact_T) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type STORELIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."STORELIST" as table of Store_t;

/
--------------------------------------------------------
--  DDL for Type STORE_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."STORE_T" AS OBJECT(
Store_ID VARCHAR2(5),
Store_Location VARCHAR2(20),
Store_Contact REF Contact_T,
Store_Manage VARCHAR2(30),
Store_Depts DEPARTMENTLIST,
Store_Items AVAILABLELIST) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type TRANSACTIONLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."TRANSACTIONLIST" as table of REF Transaction_t;

/
--------------------------------------------------------
--  DDL for Type TRANSACTION_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DBST47"."TRANSACTION_T" AS OBJECT(
Trans_ID INTEGER,
Trans_Date DATE,
Store_Contact REF Contact_T,
Quantity INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Sequence PNR_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "DBST47"."PNR_SEQUENCE"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ANGESTELLTE
--------------------------------------------------------

  CREATE TABLE "DBST47"."ANGESTELLTE" 
   (	"A_NR" NUMBER, 
	"A_NAME" VARCHAR2(50 BYTE), 
	"A_GEBURTSDATUM" DATE, 
	"A_BERUFSBEZEICHNUNG" VARCHAR2(60 BYTE), 
	"A_MONATSGEHALT" NUMBER, 
	"A_GESCHLECHT" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ARBEITER
--------------------------------------------------------

  CREATE TABLE "DBST47"."ARBEITER" 
   (	"A_NAME" VARCHAR2(30 BYTE), 
	"A_VORNAME" VARCHAR2(30 BYTE), 
	"A_GEBURTSMONAT" VARCHAR2(5 BYTE), 
	"A_STUNDENLOHN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BERUFE
--------------------------------------------------------

  CREATE TABLE "DBST47"."BERUFE" 
   (	"B_CODE" NUMBER, 
	"B_TYPE" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GESCHLECHTER
--------------------------------------------------------

  CREATE TABLE "DBST47"."GESCHLECHTER" 
   (	"G_NAME" VARCHAR2(15 BYTE), 
	"G_CODE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NUMBERS
--------------------------------------------------------

  CREATE TABLE "DBST47"."NUMBERS" 
   (	"ZAHLEN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NUMBERS_RESULT
--------------------------------------------------------

  CREATE TABLE "DBST47"."NUMBERS_RESULT" 
   (	"ZAHLEN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PERSONAL
--------------------------------------------------------

  CREATE TABLE "DBST47"."PERSONAL" 
   (	"P_NR" NUMBER, 
	"P_NAME" VARCHAR2(30 BYTE), 
	"P_VORNAME" VARCHAR2(30 BYTE), 
	"P_ALTER" NUMBER, 
	"P_GESCHLECHT" NUMBER, 
	"P_BERUFSCODE" NUMBER, 
	"P_JAHRESEINKOMMEN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZUORDNUNG
--------------------------------------------------------

  CREATE TABLE "DBST47"."ZUORDNUNG" 
   (	"Z_NR" NUMBER, 
	"Z_TABLE_OLD" VARCHAR2(30 BYTE), 
	"Z_KEY_OLD" VARCHAR2(60 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into DBST47.ANGESTELLTE
SET DEFINE OFF;
Insert into DBST47.ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('1','Fabian Uhlmann',to_date('03.11.88','DD.MM.RR'),'Informatiker','2000','männlich');
Insert into DBST47.ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('2','Diana Irmscher',to_date('01.01.90','DD.MM.RR'),'Informatiker','2001','weiblich');
Insert into DBST47.ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('3','Alexandra Vogel',to_date('01.10.92','DD.MM.RR'),'Informatiker','9999','weiblich');
Insert into DBST47.ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('4','Alexander Boxhorn',to_date('27.07.82','DD.MM.RR'),'Logistiker','1375','männlich');
REM INSERTING into DBST47.ARBEITER
SET DEFINE OFF;
REM INSERTING into DBST47.BERUFE
SET DEFINE OFF;
REM INSERTING into DBST47.GESCHLECHTER
SET DEFINE OFF;
Insert into DBST47.GESCHLECHTER (G_NAME,G_CODE) values ('Alexandra','1');
Insert into DBST47.GESCHLECHTER (G_NAME,G_CODE) values ('Fabian','2');
REM INSERTING into DBST47.NUMBERS
SET DEFINE OFF;
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
REM INSERTING into DBST47.NUMBERS_RESULT
SET DEFINE OFF;
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
REM INSERTING into DBST47.PERSONAL
SET DEFINE OFF;
REM INSERTING into DBST47.ZUORDNUNG
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table ARBEITER
--------------------------------------------------------

  ALTER TABLE "DBST47"."ARBEITER" ADD PRIMARY KEY ("A_NAME", "A_VORNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSONAL
--------------------------------------------------------

  ALTER TABLE "DBST47"."PERSONAL" ADD PRIMARY KEY ("P_NR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GESCHLECHTER
--------------------------------------------------------

  ALTER TABLE "DBST47"."GESCHLECHTER" ADD PRIMARY KEY ("G_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BERUFE
--------------------------------------------------------

  ALTER TABLE "DBST47"."BERUFE" ADD PRIMARY KEY ("B_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZUORDNUNG
--------------------------------------------------------

  ALTER TABLE "DBST47"."ZUORDNUNG" ADD PRIMARY KEY ("Z_NR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ANGESTELLTE
--------------------------------------------------------

  ALTER TABLE "DBST47"."ANGESTELLTE" ADD PRIMARY KEY ("A_NR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERSONAL
--------------------------------------------------------

  ALTER TABLE "DBST47"."PERSONAL" ADD FOREIGN KEY ("P_BERUFSCODE")
	  REFERENCES "DBST47"."BERUFE" ("B_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZUORDNUNG
--------------------------------------------------------

  ALTER TABLE "DBST47"."ZUORDNUNG" ADD FOREIGN KEY ("Z_NR")
	  REFERENCES "DBST47"."PERSONAL" ("P_NR") ENABLE;
--------------------------------------------------------
--  DDL for Function GETAGE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBST47"."GETAGE" 
  (birthdate Date)
RETURN VARCHAR2
IS
BEGIN
  RETURN Trunc((months_between(sysdate, birthdate) /12),0);
END;

/
--------------------------------------------------------
--  DDL for Function GETFIRSTNAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBST47"."GETFIRSTNAME" 
  (fname VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
  RETURN SUBSTR(fname,0, instr(fname,' ')-1);
END;

/
--------------------------------------------------------
--  DDL for Function GETGENDER
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBST47"."GETGENDER" 
  (vname VARCHAR2)
RETURN NUMBER
IS
gendercode NUMBER;
BEGIN
  SELECT G_CODE INTO gendercode FROM GESCHLECHTER WHERE G_NAME = vname;
  IF gendercode = NULL THEN gendercode := 0; 
  END IF;
  RETURN gendercode;
END;

/
--------------------------------------------------------
--  DDL for Function GETGENDERCODE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBST47"."GETGENDERCODE" 
  (gender VARCHAR2)
RETURN NUMBER
IS
gendercode NUMBER;
BEGIN
  IF gender = 'männlich' THEN gendercode := 1; 
  ELSIF gender = 'weiblich' THEN gendercode := 2;
  ELSE gendercode := 0;
  END IF;
  RETURN gendercode;
END;

/
--------------------------------------------------------
--  DDL for Function GETGENDERCODEFROMNAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBST47"."GETGENDERCODEFROMNAME" 
  (vname VARCHAR2)
RETURN NUMBER
IS
gendercode NUMBER;
BEGIN
  SELECT G_CODE INTO gendercode FROM GESCHLECHTER WHERE G_NAME = vname;
  IF gendercode = NULL THEN gendercode := 0; 
  END IF;
  RETURN gendercode;
END;

/
--------------------------------------------------------
--  DDL for Function GETLASTNAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBST47"."GETLASTNAME" 
  (lname VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
  RETURN SUBSTR(lname,INSTR(lname,' ')+1);
END;

/
--------------------------------------------------------
--  DDL for Function MIN_MAX_SCALE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBST47"."MIN_MAX_SCALE" 
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
set define off;

  CREATE OR REPLACE PROCEDURE "DBST47"."MIN_MAX_CALCULATOR" 
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
--------------------------------------------------------
--  DDL for Procedure TRANSFORMATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "DBST47"."TRANSFORMATION" 
IS
p_name VARCHAR2(30);
p_vorname VARCHAR2(30);
p_age DATE;
p_geschlecht VARCHAR2(10);
CURSOR CANGST IS
	SELECT A_Name, A_Geburtsdatum, A_Geschlecht
	FROM Angestellte;
BEGIN
  OPEN CANGST;
  LOOP 
	FETCH CANGST INTO p_name, p_age, p_geschlecht;
	EXIT WHEN CANGST%NOTFOUND;
  SELECT GETFIRSTNAME(p_name) INTO p_vorname FROM DUAL;
  INSERT INTO PERSONAL(p_nr,p_name,p_vorname,p_alter,p_geschlecht) VALUES (pnr_sequence.nextval,GETLASTNAME(p_name),p_vorname,GETAGE(p_age),GETGENDERCODE(p_geschlecht));
  END LOOP; 
  CLOSE CANGST;
END;

/
