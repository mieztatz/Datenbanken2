--------------------------------------------------------
--  DDL for Table ANGESTELLTE
--------------------------------------------------------
  CREATE TABLE "ANGESTELLTE"(
	"A_NR" NUMBER,
	"A_NAME" VARCHAR2(50), 
	"A_GEBURTSDATUM" DATE, 
	"A_BERUFSBEZEICHNUNG" VARCHAR2(60), 
	"A_MONATSGEHALT" NUMBER, 
	"A_GESCHLECHT" VARCHAR2(10), 
	PRIMARY KEY ("A_NR"));
	
--------------------------------------------------------
--  DDL for Table ARBEITER
--------------------------------------------------------
  CREATE TABLE "ARBEITER"(	
	"A_NAME" VARCHAR2(30), 
	"A_VORNAME" VARCHAR2(30), 
	"A_GEBURTSMONAT" VARCHAR2(5), 
	"A_STUNDENLOHN" NUMBER, 
	PRIMARY KEY ("A_NAME", "A_VORNAME"));
  
--------------------------------------------------------
--  DDL for Table BERUFE
--------------------------------------------------------
  CREATE TABLE "BERUFE"(
	"B_CODE" NUMBER, 
	"B_TYPE" VARCHAR2(30), 
	PRIMARY KEY ("B_CODE"));
   
--------------------------------------------------------
--  DDL for Table GESCHLECHTER
--------------------------------------------------------
  CREATE TABLE "GESCHLECHTER"(
	"G_NAME" VARCHAR2(15),
	"G_CODE" NUMBER, 
	PRIMARY KEY ("G_NAME"));

--------------------------------------------------------
--  DDL for Table PERSONAL
--------------------------------------------------------
  CREATE TABLE "PERSONAL"(
	"P_NR" NUMBER NOT NULL AUTO_INCREMENT, 
	"P_NAME" VARCHAR2(30), 
	"P_VORNAME" VARCHAR2(30), 
	"P_ALTER" NUMBER, 
	"P_GESCHLECHT" NUMBER, 
	"P_BERUFSCODE" NUMBER, 
	"P_JAHRESEINKOMMEN" NUMBER, 
	PRIMARY KEY ("P_NR"), 
	FOREIGN KEY ("P_BERUFSCODE") REFERENCES "BERUFE" ("B_CODE"));

--------------------------------------------------------
--  DDL for Table ZUORDNUNG
--------------------------------------------------------
  CREATE TABLE "ZUORDNUNG"(
	"Z_NR" NUMBER, 
	"Z_TABLE_OLD" VARCHAR2(30), 
	"Z_KEY_OLD" VARCHAR2(60), 
	PRIMARY KEY ("Z_NR"),
	FOREIGN KEY ("Z_NR") REFERENCES "PERSONAL" ("P_NR"));
	

	
--------------------------------------------------------
--  DDL for Function GETLASTNAME
--------------------------------------------------------
CREATE OR REPLACE FUNCTION "GETLASTNAME" 
  (lname VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
  RETURN SUBSTR(lname,instr(lname,' ',0)+1);
END;

/
--------------------------------------------------------
--  DDL for Function GETFIRSTNAME
--------------------------------------------------------
CREATE OR REPLACE FUNCTION "GETFIRSTNAME" 
  (fname VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
  RETURN SUBSTR(fname,0, instr(fname,' ',0));
END;

/
--------------------------------------------------------
--  DDL for Procedure 
--------------------------------------------------------
  CREATE OR REPLACE PROCEDURE "transform" 
IS
p_name VARCHAR2;
p_vorname VARCHAR2;
CURSOR CANGST IS
	SELECT A_Name, A_Geburtsdatum, A_Berufsbezeichnung, A_Monatsgehalt, A_Geschlecht
	FROM Angestellte
BEGIN
  OPEN CANGST;
  LOOP 
	FETCH CANGST INTO p_name
	EXIT WHEN CANGST%NOTFOUND;
	INSERT INTO PERSONAL(p_name,p_vorname) VALUES (GETLASTNAME(p_name),GETFIRSTNAME(name);
  END LOOP; 
  CLOSE ANGST;
END;
 