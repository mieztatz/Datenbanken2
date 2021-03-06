1. Möglichkeit
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
Insert into KUNDEN values (PERSON_T('2345','Fach','Hans',(SELECT REF(adr) FROM ADRESSEN adr WHERE adr.STRASSE = 'Münchnerstr.'),'0',Kontenliste()));
Insert into TABLE (SELECT KONTEN FROM KUNDEN WHERE KD_NR = '2345')(SELECT REF(k) FROM KONTEN k WHERE k.KNR = '120768' OR k.KNR = '348973');
Insert into KUNDEN values (PERSON_T('7654','Meier','Bernd',(SELECT REF(adr) FROM ADRESSEN adr WHERE adr.STRASSE = 'Eschenweg'),'1',Kontenliste((SELECT REF(k) FROM KONTEN k WHERE k.KNR = '987654'))));
Insert into KUNDEN values (PERSON_T('8764','Wiesner','Jan',(SELECT REF(adr) FROM ADRESSEN adr WHERE adr.STRASSE = 'Schellingstr.'),'0',Kontenliste()));
Insert into TABLE (SELECT KONTEN FROM KUNDEN WHERE KD_NR = '2345')(SELECT REF(k) FROM KONTEN k WHERE k.KNR = '348973' OR k.KNR = '678453' OR k.KNR = '745363');

--------------------------------------------------------
--  Inserts in Table ZWEIGSTELLEN
--------------------------------------------------------
Insert into ZWEIGSTELLEN values ('Bachdorf',(SELECT REF(adr) FROM ADRESSEN adr WHERE adr.strasse = 'Hochstr.'),'1768',Kontenliste());
Insert into TABLE (SELECT KONTEN FROM ZWEIGSTELLEN WHERE ZNAME = 'Bachdorf')(SELECT REF(k) FROM KONTEN k WHERE k.KNR = '120768' OR k.KNR = '348973' OR k.KNR = '678453');
Insert into ZWEIGSTELLEN values ('Riedering',(SELECT REF(adr) FROM ADRESSEN adr WHERE adr.strasse = 'Simseestr.'),'9823',Kontenliste());
Insert into TABLE (SELECT KONTEN FROM ZWEIGSTELLEN WHERE ZNAME = 'Riedering')(SELECT REF(k) FROM KONTEN k WHERE k.KNR = '745363' OR k.KNR = '987654');

-------------------------------------------------------------------------------------------------
--  SELECT Statement gibt "alle Kontonummern mit Konostand, Art und Adresse der Zweigstelle" aus
-------------------------------------------------------------------------------------------------
SELECT z.ZNAME AS Zweigstellenname, DEREF(z.ADRESSE).STRASSE AS Strasse, DEREF(z.ADRESSE).HNR AS Hausnummer, DEREF(z.ADRESSE).PLZ AS PLZ, DEREF(z.ADRESSE).ORT AS ORT, DEREF(k.COLUMN_VALUE).KNR AS Kontonummer, DEREF(k.COLUMN_VALUE).KONTOSTAND AS Kontonstand, DEREF(k.COLUMN_VALUE).TYP AS Typ FROM ZWEIGSTELLEN z, TABLE(z.KONTEN) k;

--> Result
ZWEIGSTELLENNAME     STRASSE                        HAUSNUMMER        PLZ ORT                  KONTONUMMER KONTONSTAND        TYP
-------------------- ------------------------------ ---------- ---------- -------------------- ----------- ----------- ----------
Bachdorf             Hochstr.                                1      80000 Münchhausen               120768      234,56          0 
Bachdorf             Hochstr.                                1      80000 Münchhausen               348973    12567,56          1 
Bachdorf             Hochstr.                                1      80000 Münchhausen               678453     -456,78          1 
Riedering            Simseestr.                              3      80800 Musterhausen              987654      789,65          1 
Riedering            Simseestr.                              3      80800 Musterhausen              745363      -23,67          0 

---------------------------------------------------------------------------------
--  SELECT Statement gibt "alle Kontonummern mit Adresse aller Kontoinhaber" aus
---------------------------------------------------------------------------------
SELECT kd.VORNAME AS Vorname, kd.NACHNAME AS Nachname, DEREF(k.COLUMN_VALUE).KNR AS Kontonummer, DEREF(kd.ADRESSE).STRASSE AS Strasse, DEREF(kd.ADRESSE).HNR AS Hausnummer, DEREF(kd.ADRESSE).PLZ AS PLZ, DEREF(kd.ADRESSE).Ort AS ORT FROM KUNDEN kd, TABLE(kd.KONTEN) k;

--> Result
VORNAME              NACHNAME             KONTONUMMER STRASSE                        HAUSNUMMER        PLZ ORT                
-------------------- -------------------- ----------- ------------------------------ ---------- ---------- --------------------
Bernd                Meier                     987654 Eschenweg                              12      80335 München              
Hans                 Fach                      348973 Münchnerstr.                           33      80801 München              
Hans                 Fach                      120768 Münchnerstr.                           33      80801 München              
Jan                  Wiesner                   745363 Schellingstr.                          42      53620 Hasenbüttel          
Jan                  Wiesner                   348973 Schellingstr.                          42      53620 Hasenbüttel          
Jan                  Wiesner                   678453 Schellingstr.                          42      53620 Hasenbüttel  


--------------------------------------------------------
--  SELFJOIN
--------------------------------------------------------
select kd1.vorname as VORNAME, kd1.nachname as NACHNAME, kd2.vorname, kd2.nachname, deref(k1.COLUMN_VALUE).KNR FROM Kunden kd1, kunden kd2, TABLE(kd1.konten) k1, TABLE(kd2.konten) k2 WHERE deref(k1.COLUMN_VALUE).KNR = deref(k2.COLUMN_VALUE).KNR AND kd1.nachname <> kd2.nachname;


2. Möglichkeit
--------------------------------------------------------
--  DDL for Type ADRESSE_T2
--------------------------------------------------------
CREATE OR REPLACE TYPE "ADRESSE_T2" AS OBJECT(
Strasse  VARCHAR2(30),
HNR INTEGER,
PLZ INTEGER,
Ort VARCHAR2(20)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type PERSON_T2
--------------------------------------------------------
  CREATE OR REPLACE TYPE "PERSON_T2" AS OBJECT(
Kd_NR INTEGER,
Nachname  VARCHAR2(20),
Vorname   VARCHAR2(20),
Adresse REF  Adresse_t2,
Status  INTEGER(1)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type KUNDENLISTE2
--------------------------------------------------------
  CREATE OR REPLACE TYPE "KUNDENLISTE2" as table of REF PERSON_t2;
  
/
--------------------------------------------------------
--  DDL for Type KONTO_T2
--------------------------------------------------------
  CREATE OR REPLACE TYPE "KONTO_T2" AS OBJECT(
KNR INTEGER,
Kontostand  NUMBER(10,2),
Typ INTEGER(1),
Kunden2 Kundenliste2) NOT FINAL;
  
/
--------------------------------------------------------
--  DDL for Type KONTENLISTE2
--------------------------------------------------------
  CREATE OR REPLACE TYPE "KONTENLISTE2" as table of Konto_t2;
  
/
--------------------------------------------------------
--  DDL for Type ZWEIGSTELLE_T2
--------------------------------------------------------
  CREATE OR REPLACE TYPE "ZWEIGSTELLE_T2" AS OBJECT(
ZName VARCHAR2(20),
Adresse2 REF Adresse_t2,
Leiter   Integer,
Konten2  Kontenliste2) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Table ADRESSEN2
--------------------------------------------------------
  CREATE TABLE "ADRESSEN2" OF "ADRESSE_T2" 
 
--------------------------------------------------------
--  DDL for Table KUNDEN2
--------------------------------------------------------
  CREATE TABLE "KUNDEN2" OF "PERSON_T2" 
 
--------------------------------------------------------
--  DDL for Table ZWEIGSTELLEN
--------------------------------------------------------
  CREATE TABLE "ZWEIGSTELLEN2" OF "ZWEIGSTELLE_T2" 
  NESTED TABLE "KONTEN2" STORE AS "KONTEN_ZWEIGST2" (NESTED TABLE "KUNDEN2" STORE AS "KUNDEN_ZWEIGST2");
  
--------------------------------------------------------
--  Inserts in Table ADRESSEN2
--------------------------------------------------------
Insert into ADRESSEN2 (STRASSE,HNR,PLZ,ORT) values ('Simseestr.','3','80800','Musterhausen');
Insert into ADRESSEN2 (STRASSE,HNR,PLZ,ORT) values ('Hochstr.','1','80000','Münchhausen');
Insert into ADRESSEN2 (STRASSE,HNR,PLZ,ORT) values ('Eschenweg','12','80335','München');
Insert into ADRESSEN2 (STRASSE,HNR,PLZ,ORT) values ('Münchnerstr.','33','80801','München');
Insert into ADRESSEN2 (STRASSE,HNR,PLZ,ORT) values ('Schellingstr.','42','53620','Hasenbüttel');

--------------------------------------------------------
--  Inserts in Table KUNDEN2
--------------------------------------------------------
Insert into KUNDEN2 values ('2345','Fach','Hans',(SELECT REF(adr) FROM ADRESSEN2 adr WHERE adr.STRASSE = 'Münchnerstr.'),'0');
Insert into KUNDEN2 values ('7654','Meier','Bernd',(SELECT REF(adr) FROM ADRESSEN2 adr WHERE adr.STRASSE = 'Eschenweg'),'1');
Insert into KUNDEN2 values ('8764','Wiesner','Jan',(SELECT REF(adr) FROM ADRESSEN2 adr WHERE adr.STRASSE = 'Schellingstr.'),'0');

--------------------------------------------------------
--  Inserts in Table ZWEIGSTELLEN
--------------------------------------------------------
Insert into ZWEIGSTELLEN2 values ('Bachdorf',(SELECT REF(adr) FROM ADRESSEN2 adr WHERE adr.STRASSE = 'Hochstr.'),'1768',Kontenliste2(KONTO_T2('120768','234,56','0',Kundenliste2()),KONTO_T2('348973','12567,56','1',Kundenliste2()),KONTO_T2('678453','-456,78','1',Kundenliste2())));
--> Bemerkung: INSERT into table (SELECT z.KONTEN2 FROM ZWEIGSTELLEN2 z WHERE z.ZNAME ='BACHDORF') values('678453','-456,78','1',Kundenliste2()); //Einfügen in die Nested Table Konten
Insert into ZWEIGSTELLEN2 values ('Riedering',(SELECT REF(adr) FROM ADRESSEN2 adr WHERE adr.STRASSE = 'Simseestr.'),'9823',Kontenliste2(KONTO_T2('987654','789,65','1',Kundenliste2((SELECT REF(kd) FROM KUNDEN2 kd WHERE kd.KD_NR = '8764'))),KONTO_T2('745363','-23,67','0',Kundenliste2((SELECT REF(kd) FROM KUNDEN2 kd WHERE kd.KD_NR = '7654')))));

-- befüllen der jeweiligen NESTED TABLE Kundenliste2
Insert into TABLE (SELECT k.KUNDEN2 FROM ZWEIGSTELLEN2 z, TABLE(z.KONTEN2) k WHERE z.ZNAME = 'Bachdorf' AND k.KNR = '120768')(SELECT REF(kd) FROM KUNDEN2 kd WHERE kd.KD_NR = '2345');
Insert into TABLE (SELECT k.KUNDEN2 FROM ZWEIGSTELLEN2 z, TABLE(z.KONTEN2) k WHERE z.ZNAME = 'Bachdorf' AND k.KNR = '348973')(SELECT REF(kd) FROM KUNDEN2 kd WHERE kd.KD_NR = '2345' OR kd.KD_NR = '8764');
Insert into TABLE (SELECT k.KUNDEN2 FROM ZWEIGSTELLEN2 z, TABLE(z.KONTEN2) k WHERE z.ZNAME = 'Bachdorf' AND k.KNR = '678453')(SELECT REF(kd) FROM KUNDEN2 kd WHERE kd.KD_NR = '8764');

-- Alternatvie wenn SELECT nicht direkt in Kundenliste2()
--> Insert into TABLE (SELECT k.KUNDEN2 FROM ZWEIGSTELLEN2 z, TABLE(z.KONTEN2) k WHERE z.ZNAME = 'Riedering' AND k.KNR = '987654')(SELECT REF(kd) FROM KUNDEN2 kd WHERE kd.KD_NR = '7654');
--> Insert into TABLE (SELECT k.KUNDEN2 FROM ZWEIGSTELLEN2 z, TABLE(z.KONTEN2) k WHERE z.ZNAME = 'Riedering' AND k.KNR = '745363')(SELECT REF(kd) FROM KUNDEN2 kd WHERE kd.KD_NR = '8764');

-------------------------------------------------------------------------------------------------
--  SELECT Statement gibt "alle Kontonummern mit Konostand, Art und Adresse der Zweigstelle" aus
-------------------------------------------------------------------------------------------------
SELECT z.ZNAME AS Filiale, DEREF(z.ADRESSE2).STRASSE AS Strasse, DEREF(z.ADRESSE2).HNR AS Hausnummer, DEREF(z.ADRESSE2).PLZ AS PLZ, DEREF(z.ADRESSE2).ORT AS Ort ,k.KNR AS Kontonummer, k.KONTOSTAND AS Kontostand, k.TYP AS Typ FROM ZWEIGSTELLEN2 z, TABLE(z.KONTEN2) k;

--> Result:
FILIALE              STRASSE                        HAUSNUMMER        PLZ ORT                  KONTONUMMER KONTOSTAND        TYP
-------------------- ------------------------------ ---------- ---------- -------------------- ----------- ---------- ----------
Bachdorf             Hochstr.                                1      80000 Münchhausen               120768     234,56          0 
Bachdorf             Hochstr.                                1      80000 Münchhausen               348973   12567,56          1 
Bachdorf             Hochstr.                                1      80000 Münchhausen               678453    -456,78          1 
Riedering            Simseestr.                              3      80800 Musterhausen              987654     789,65          1 
Riedering            Simseestr.                              3      80800 Musterhausen              745363     -23,67          0 

---------------------------------------------------------------------------------
--  SELECT Statement gibt "alle Kontonummern mit Adresse aller Kontoinhaber" aus
---------------------------------------------------------------------------------
SELECT DEREF(kd.COLUMN_VALUE).VORNAME AS Vorname, DEREF(kd.COLUMN_VALUE).NACHNAME AS Nachname, DEREF(DEREF(kd.COLUMN_VALUE).ADRESSE).STRASSE AS Strasse, DEREF(DEREF(kd.COLUMN_VALUE).ADRESSE).HNR AS Hausnummer, DEREF(DEREF(kd.COLUMN_VALUE).ADRESSE).PLZ AS PLZ, DEREF(DEREF(kd.COLUMN_VALUE).ADRESSE).ORT AS Ort, k.KNR AS Kontonummer, k.Kontostand AS Kontostand FROM ZWEIGSTELLEN2 z, TABLE(z.KONTEN2) k, TABLE(k.KUNDEN2) kd;

--> Result:
VORNAME              NACHNAME             STRASSE                        HAUSNUMMER        PLZ ORT                  KONTONUMMER KONTOSTAND
-------------------- -------------------- ------------------------------ ---------- ---------- -------------------- ----------- ----------
Hans                 Fach                 Münchnerstr.                           33      80801 München                   120768     234,56 
Hans                 Fach                 Münchnerstr.                           33      80801 München                   348973   12567,56 
Jan                  Wiesner              Schellingstr.                          42      53620 Hasenbüttel               348973   12567,56 
Jan                  Wiesner              Schellingstr.                          42      53620 Hasenbüttel               678453    -456,78 
Jan                  Wiesner              Schellingstr.                          42      53620 Hasenbüttel               987654     789,65 
Bernd                Meier                Eschenweg                              12      80335 München                   745363     -23,67 