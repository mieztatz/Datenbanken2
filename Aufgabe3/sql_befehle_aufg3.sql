--------------------------------------------------------
--  DDL for Table ANGESTELLTE
--------------------------------------------------------
  CREATE TABLE "ANGESTELLTE"(
	"A_NR" NUMBER(*,0),
	"A_NAME" VARCHAR2(50 BYTE), 
	"A_GEBURTSDATUM" DATE, 
	"A_BERUFSBEZEICHNUNG" VARCHAR2(60 BYTE), 
	"A_MONATSGEHALT" NUMBER(*,0), 
	"A_GESCHLECHT" VARCHAR2(10 BYTE), 
	PRIMARY KEY ("A_NR"));
	
--------------------------------------------------------
--  DDL for Table ARBEITER
--------------------------------------------------------
  CREATE TABLE "ARBEITER"(	
	"A_NAME" VARCHAR2(30 BYTE), 
	"A_VORNAME" VARCHAR2(30 BYTE), 
	"A_GEBURTSMONAT" VARCHAR2(5 BYTE), 
	"A_STUNDENLOHN" NUMBER(*,0), 
	PRIMARY KEY ("A_NAME", "A_VORNAME"));
  
--------------------------------------------------------
--  DDL for Table BERUFE
--------------------------------------------------------
  CREATE TABLE "BERUFE"(
	"B_CODE" NUMBER(*,0), 
	"B_TYPE" VARCHAR2(30 BYTE), 
	PRIMARY KEY ("B_CODE"));
   
--------------------------------------------------------
--  DDL for Table GESCHLECHTER
--------------------------------------------------------
  CREATE TABLE "GESCHLECHTER"(
	"G_CODE" NUMBER(*,0), 
	"G_TYPE" VARCHAR2(10 BYTE), 
	PRIMARY KEY ("G_CODE"));

--------------------------------------------------------
--  DDL for Table PERSONAL
--------------------------------------------------------
  CREATE TABLE "PERSONAL"(
	"P_NR" NUMBER(*,0), 
	"P_NAME" VARCHAR2(30 BYTE), 
	"P_VORNAME" VARCHAR2(30 BYTE), 
	"P_ALTER" NUMBER(*,0), 
	"P_GESCHLECHT" NUMBER(*,0), 
	"P_BERUFSCODE" NUMBER(*,0), 
	"P_JAHRESEINKOMMEN" NUMBER(*,0), 
	PRIMARY KEY ("P_NR"),
	FOREIGN KEY ("P_GESCHLECHT") REFERENCES "GESCHLECHTER" ("G_CODE"), 
	FOREIGN KEY ("P_BERUFSCODE") REFERENCES "BERUFE" ("B_CODE"));
 

--------------------------------------------------------
--  INSERTS for Table GESCHLECHTER
--------------------------------------------------------
Insert into GESCHLECHTER (G_CODE,G_TYPE) values ('0','unbekannt');
Insert into GESCHLECHTER (G_CODE,G_TYPE) values ('1','weiblich');
Insert into GESCHLECHTER (G_CODE,G_TYPE) values ('2','männlich');