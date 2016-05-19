--------------------------------------------------------
--  DDL for Type ADRESSE_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "ADRESSE_T" AS OBJECT(
Strasse  VARCHAR2(30),
HNR INTEGER,
PLZ INTEGER,
Ort VARCHAR2(20)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type KONTENLISTE
--------------------------------------------------------
  CREATE OR REPLACE TYPE "KONTENLISTE" as table of REF Konto_t;

/
--------------------------------------------------------
--  DDL for Type KONTO_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "KONTO_T" AS OBJECT(
KNR INTEGER,
Kontostand  NUMBER(10,2),
Typ INTEGER(1)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type PERSON_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "PERSON_T" AS OBJECT(
Kd_NR INTEGER,
Nachname  VARCHAR2(20),
Vorname   VARCHAR2(20),
Adresse REF  Adresse_t,
Status  INTEGER(1),
Konten  Kontenliste) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type ZWEIGSTELLE_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "ZWEIGSTELLE_T" AS OBJECT(
ZName VARCHAR2(20),
Adresse REF Adresse_t,
Leiter   Integer,
Konten  Kontenliste) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Table ADRESSEN
--------------------------------------------------------
  CREATE TABLE "ADRESSEN" OF "ADRESSE_T" 
 
--------------------------------------------------------
--  DDL for Table KONTEN
--------------------------------------------------------
  CREATE TABLE "KONTEN" OF "KONTO_T" 

--------------------------------------------------------
--  DDL for Table KUNDEN
--------------------------------------------------------
  CREATE TABLE "KUNDEN" OF "PERSON_T" 
  NESTED TABLE "KONTEN" STORE AS "KONTEN_KD"
 
--------------------------------------------------------
--  DDL for Table ZWEIGSTELLEN
--------------------------------------------------------
  CREATE TABLE "ZWEIGSTELLEN" OF "ZWEIGSTELLE_T" 
  NESTED TABLE "KONTEN" STORE AS "KONTEN_ZWEIGST"

--------------------------------------------------------
--  Inserts in Table ADRESSEN
--------------------------------------------------------
Insert into ADRESSEN (STRASSE,HNR,PLZ,ORT) values ('Simseestr.','3','80800','Musterhausen');
Insert into ADRESSEN (STRASSE,HNR,PLZ,ORT) values ('Hochstr.','1','80000','Münchhausen');
Insert into ADRESSEN (STRASSE,HNR,PLZ,ORT) values ('Eschenweg','12','80335','München');
Insert into ADRESSEN (STRASSE,HNR,PLZ,ORT) values ('Münchnerstr.','33','80801','München');
Insert into ADRESSEN (STRASSE,HNR,PLZ,ORT) values ('Schellingstr.','42','53620','Hasenbüttel');

--------------------------------------------------------
--  Inserts in Table KONTEN
--------------------------------------------------------
Insert into KONTEN (KNR,KONTOSTAND,TYP) values ('120768','234,56','0');
Insert into KONTEN (KNR,KONTOSTAND,TYP) values ('348973','12567,56','1');
Insert into KONTEN (KNR,KONTOSTAND,TYP) values ('678453','-456,78','1');
Insert into KONTEN (KNR,KONTOSTAND,TYP) values ('987654','789,65','1');
Insert into KONTEN (KNR,KONTOSTAND,TYP) values ('745363','-23,67','0');

--------------------------------------------------------
--  Inserts in Table KUNDEN
--------------------------------------------------------
Insert into KUNDEN values (PERSON_T('2345','Fach','Hans',(SELECT REF(adr) FROM Adressen adr WHERE adr.STRASSE = 'Münchnerstr.'),'0',Kontenliste()));
Insert into TABLE (SELECT KONTEN From KUNDEN WHERE KD_NR = '2345')(SELECT REF(k) FROM KONTEN k WHERE k.KNR = '120768' OR k.KNR = '348973');
Insert into KUNDEN values (PERSON_T('7654','Meier','Bernd',(SELECT REF(adr) FROM Adressen adr WHERE adr.STRASSE = 'Eschenweg'),'1',Kontenliste((SELECT REF(k) FROM Konten k WHERE k.KNR = '987654'))));
Insert into KUNDEN values (PERSON_T('8764','Wiesner','Jan',(SELECT REF(adr) FROM Adressen adr WHERE adr.STRASSE = 'Münchnerstr.'),'0',Kontenliste()));
Insert into TABLE (SELECT KONTEN From KUNDEN WHERE KD_NR = '2345')(SELECT REF(k) FROM Konten k WHERE k.KNR = '348973' OR k.KNR = '678453' OR k.KNR = '745363');

--------------------------------------------------------
--  Inserts in Table ZWEIGSTELLEN
--------------------------------------------------------
Insert into ZWEIGSTELLEN values ('Bachdorf',(SELECT REF(adr) FROM ADRESSEN adr WHERE adr.strasse = 'Hochstr.'),'1768',Kontenliste());
Insert into TABLE (SELECT KONTEN From ZWEIGSTELLEN WHERE ZNAME = 'Bachdorf')(SELECT REF(k) FROM KONTEN k WHERE k.KNR = '120768' OR k.KNR = '348973' OR k.KNR = '678453');
Insert into ZWEIGSTELLEN values ('Riedering',(SELECT REF(adr) FROM ADRESSEN adr WHERE adr.strasse = 'Simseestr.'),'9823',Kontenliste());
Insert into TABLE (SELECT KONTEN From ZWEIGSTELLEN WHERE ZNAME = 'Riedering')(SELECT REF(k) FROM KONTEN k WHERE k.KNR = '745363' OR k.KNR = '987654');
