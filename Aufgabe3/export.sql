--------------------------------------------------------
--  DDL for Sequence PNR_SEQUENCE
--------------------------------------------------------
   CREATE SEQUENCE  "PNR_SEQUENCE";

/

--------------------------------------------------------
--  DDL for Table ANGESTELLTE
--------------------------------------------------------
  CREATE TABLE "ANGESTELLTE" 
   (	"A_NR" NUMBER, 
	"A_NAME" VARCHAR2(50), 
	"A_GEBURTSDATUM" DATE, 
	"A_BERUFSBEZEICHNUNG" VARCHAR2(60), 
	"A_MONATSGEHALT" NUMBER, 
	"A_GESCHLECHT" VARCHAR2(10),
	PRIMARY KEY ("A_NR")
   );

/

--------------------------------------------------------
--  DDL for Table ARBEITER
--------------------------------------------------------
  CREATE TABLE "ARBEITER" 
   (	"A_NAME" VARCHAR2(30), 
	"A_VORNAME" VARCHAR2(30), 
	"A_GEBURTSMONAT" VARCHAR2(5), 
	"A_STUNDENLOHN" NUMBER,
	PRIMARY KEY ("A_NAME", "A_VORNAME")
   );

/

--------------------------------------------------------
--  DDL for Table BERUFE
--------------------------------------------------------
  CREATE TABLE "BERUFE" 
   (	"B_CODE" NUMBER, 
	"B_TYPE" VARCHAR2(30),
	PRIMARY KEY ("B_CODE")
   );

/

--------------------------------------------------------
--  DDL for Table GESCHLECHTER
--------------------------------------------------------
  CREATE TABLE "GESCHLECHTER" 
   (	"G_NAME" VARCHAR2(15), 
	"G_CODE" NUMBER,
	PRIMARY KEY ("G_NAME")
   );

/

--------------------------------------------------------
--  DDL for Table PERSONAL
--------------------------------------------------------
  CREATE TABLE "PERSONAL" 
   (	"P_NR" NUMBER, 
	"P_NAME" VARCHAR2(30), 
	"P_VORNAME" VARCHAR2(30), 
	"P_ALTER" NUMBER, 
	"P_GESCHLECHT" NUMBER, 
	"P_BERUFSCODE" NUMBER, 
	"P_JAHRESEINKOMMEN" NUMBER,
	PRIMARY KEY ("P_NR"),
	FOREIGN KEY ("P_BERUFSCODE") REFERENCES "BERUFE" ("B_CODE")
   );

/

--------------------------------------------------------
--  DDL for Table ZUORDNUNG
--------------------------------------------------------

  CREATE TABLE "DBST47"."ZUORDNUNG" 
   (	"Z_NR" NUMBER, 
	"Z_TABLE_OLD" VARCHAR2(30), 
	"Z_KEY_OLD" VARCHAR2(60),
	PRIMARY KEY ("Z_NR"),
	FOREIGN KEY ("Z_NR") REFERENCES "PERSONAL" ("P_NR")
   );

/

--------------------------------------------------------
--  Inserts in Table ANGESTELLTE
--------------------------------------------------------
Insert into ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('1','Fabian Uhlmann',to_date('03.11.88','DD.MM.RR'),'Informatiker','2000','m\E4nnlich');
Insert into ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('2','Diana Irmscher',to_date('01.01.90','DD.MM.RR'),'Informatiker','2001','weiblich');
Insert into ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('3','Alexandra Vogel',to_date('01.10.92','DD.MM.RR'),'Informatiker','9999','weiblich');
Insert into ANGESTELLTE (A_NR,A_NAME,A_GEBURTSDATUM,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT,A_GESCHLECHT) values ('4','Alexander Boxhorn',to_date('27.07.82','DD.MM.RR'),'Logistiker','1375','m\E4nnlich');

/

--------------------------------------------------------
--  Inserts in Table GESCHLECHTER
--------------------------------------------------------
Insert into DBST47.GESCHLECHTER (G_NAME,G_CODE) values ('Alexandra','1');
Insert into DBST47.GESCHLECHTER (G_NAME,G_CODE) values ('Fabian','2');

/

--------------------------------------------------------
--  DDL for Function GETAGE
--------------------------------------------------------
  CREATE OR REPLACE FUNCTION "GETAGE" 
  (birthdate Date)
RETURN VARCHAR2
IS
BEGIN
  RETURN Trunc((months_between(sysdate, birthdate) /12),0);
END;

/

--------------------------------------------------------
--  DDL for Function GETAGE
--------------------------------------------------------
  CREATE OR REPLACE FUNCTION "GETAGE" 
  (birthdate VARCHAR)
RETURN VARCHAR2
IS
BEGIN
  -- TODO: SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
  -- TODO: SELECT TO_DATE('2012-06-05', 'YYYY-MM-DD') FROM dual;
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
  CREATE OR REPLACE FUNCTION "GETGENDER" 
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
  CREATE OR REPLACE FUNCTION "GETGENDERCODE" 
  (gender VARCHAR2, firstname VARCHAR2)
RETURN NUMBER
IS
gendercode NUMBER;
gendercodetmp NUMBER;
BEGIN
  IF gender = 'm\E4nnlich' THEN gendercode := 1; 
  ELSIF gender = 'weiblich' THEN gendercode := 2;
  ELSE gendercode := 0;
  END IF;
  SELECT G_CODE INTO gendercodetmp FROM GESCHLECHTER WHERE G_NAME = firstname;
  IF gendercodetmp = NULL THEN INSERT INTO GESCHLECHTER (G_NAME, G_CODE) VALUES (firstname,gendercode);
  END IF;
  RETURN gendercode;
END;

/

--------------------------------------------------------
--  DDL for Function GETGENDERCODEFROMNAME
--------------------------------------------------------
  CREATE OR REPLACE FUNCTION "GETGENDERCODEFROMNAME" 
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
--  DDL for Function GETJOBCODE
--------------------------------------------------------
  CREATE OR REPLACE FUNCTION "GETJOBCODE" 
  (jobname VARCHAR2)
RETURN NUMBER
IS
jobcode NUMBER;
BEGIN
  SELECT B_CODE INTO jobcode FROM BERUFE WHERE B_TYPE = jobname;
  IF jobcode = NULL THEN 
	SELECT max(B_CODE) INTO jobcode FROM BERUFE; 
	jobcode := jobcode + 1; 
	INSERT INTO BERUFE (B_CODE, B_TYPE) VALUES (jobcode,jobname); 
  END IF;
  RETURN jobcode;
END;

/

--------------------------------------------------------
--  DDL for Function GETMONEY
--------------------------------------------------------
  CREATE OR REPLACE FUNCTION "GETMONEY" 
  (monthmoney NUMBER)
RETURN NUMBER
IS
BEGIN
  RETURN (monthmoney * 12);
END;

/

--------------------------------------------------------
--  DDL for Procedure TRANSFORMATION_ANGESTELLTE
--------------------------------------------------------
  CREATE OR REPLACE PROCEDURE "TRANSFORMATION_ANGESTELLTE" 
IS
a_nr NUMBER;
p_nr NUMBER;
p_name VARCHAR2(30);
p_vorname VARCHAR2(30);
p_age DATE;
p_geschlecht VARCHAR2(10);
p_job VARCHAR(50);
p_money NUMBER;
CURSOR CANGST IS
	SELECT A_Nr, A_Name, A_Geburtsdatum, A_Geschlecht,A_BERUFSBEZEICHNUNG,A_MONATSGEHALT
	FROM Angestellte;
BEGIN
  OPEN CANGST;
  LOOP 
	FETCH CANGST INTO a_nr, p_name, p_age, p_geschlecht, p_job, p_money;
	EXIT WHEN CANGST%NOTFOUND;
	p_nr := pnr_sequence.nextval
  	SELECT GETFIRSTNAME(p_name) INTO p_vorname FROM DUAL;
  	INSERT INTO PERSONAL(p_nr,p_name,p_vorname,p_alter,p_geschlecht) VALUES (p_nr,GETLASTNAME(p_name),p_vorname,GETAGE(p_age),GETGENDERCODE(p_geschlecht,p_vorname),GETJOBCODE(p_job),GETMONEY(p_money));
	INSERT INTO ZUORDNUNG (Z_NR, Z_TABLE_OLD, Z_KEY_OLD) VALUES (p_nr, 'Angestellte', a_nr);
  END LOOP; 
  CLOSE CANGST;
END;

/

--------------------------------------------------------
--  DDL for Procedure TRANSFORMATION_ARBEITER
--------------------------------------------------------
  CREATE OR REPLACE PROCEDURE "TRANSFORMATION_ARBEITER" 
IS
p_nr NUMBER;
p_name VARCHAR2(30);
p_vorname VARCHAR2(30);
p_age DATE;
p_geschlecht VARCHAR2(10);
p_job VARCHAR(50);
p_money NUMBER;
CURSOR CANGST IS
	SELECT A_Name, A_Vorname, A_Geburtsmonat, A_Stundenlohn
	FROM Arbeiter;
BEGIN
  OPEN CARB;
  LOOP 
	FETCH CARB INTO p_name, p_vorname, p_age, p_money;
	EXIT WHEN CANGST%NOTFOUND;
	p_nr := pnr_sequence.nextval
  	
  	INSERT INTO PERSONAL(p_nr,p_name,p_vorname,p_alter,p_geschlecht) VALUES (p_nr,p_name,p_vorname,GETAGE(p_age),GETGENDERCODE(p_geschlecht,p_vorname),GETJOBCODE(p_job),GETMONEY(p_money));
	-- TODO: CONCAT(CONCAT(p_name,','),p_vorname) --> arb_nr erstellen
	INSERT INTO ZUORDNUNG (Z_NR, Z_TABLE_OLD, Z_KEY_OLD) VALUES (p_nr, 'Arbeiter', arb_nr);
  END LOOP; 
  CLOSE CANGST;
END;

/