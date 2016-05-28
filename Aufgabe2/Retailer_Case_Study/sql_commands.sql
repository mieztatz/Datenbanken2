--------------------------------------------------------
--  DDL for Type CONTACT_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "CONTACT_T" AS OBJECT(
Street  VARCHAR2(30),
No INTEGER,
Code VARCHAR2(5),
City VARCHAR2(20),
Phone VARCHAR2(12),
Fax VARCHAR2(12)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type COMP_TYPE_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "COMP_TYPE_T" AS OBJECT(
Typ_Desc VARCHAR2(30)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type COMP_TYPE1_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "COMP_TYPE1_T" UNDER COMP_TYPE_T(
Area  VARCHAR2(5)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type COMPANYTYPE1
--------------------------------------------------------
  CREATE OR REPLACE TYPE "COMPANYTYPE1" as table of Comp_Type1_t;

/
--------------------------------------------------------
--  DDL for Type COMP_TYPE2_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "COMP_TYPE2_T" UNDER COMP_TYPE_T(
Market  VARCHAR2(10)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type COMPANYTYPE2
--------------------------------------------------------
  CREATE OR REPLACE TYPE "COMPANYTYPE2" as table of Comp_Type2_t;

/
-----------------------------------------------------
--  DDL for Type SHAREHOLDER_T
-----------------------------------------------------
CREATE OR REPLACE TYPE "Shareholder_T" AS OBJECT(
Sholder_ID  INTEGER,
Sholder_Name VARCHAR2(30),
Sholder_Contact REF Contact_T)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type OWN_SHARES_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "OWN_SHARES_T" AS OBJECT(
Sholder_ID INTEGER, -- entweder weitere NESTED TABLE von SHAREHOLDER_T oder FOREIGN KEY Beziehung
Share_Amount INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type SHAREHOLDERS
--------------------------------------------------------
  CREATE OR REPLACE TYPE "SHAREHOLDERS" as table of Own_Shares_t;

/
--------------------------------------------------------
--  DDL for Type DIRECTOR_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "DIRECTOR_T" AS OBJECT(
Bonus VARCHAR2(6) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type DIRECTORS
--------------------------------------------------------
  CREATE OR REPLACE TYPE "DIRECTORS" as table of Director_t;

--------------------------------------------------------
--  DDL for Type MANAGER_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MANAGER_T" AS OBJECT(
Manag_Type VARCHAR2(30),
Yearly_Salary VARCHAR2(10) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type MANAGER
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MANAGER" as table of Manager_t;

/
--------------------------------------------------------
--  DDL for Type MANAGEMENT_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "OWN_SHARES_T" AS OBJECT(
Manag_ID INTEGER,
Manag_Name VARCHAR2(30),
Manag_Contact REF Contact_T,
Manag_Typ_Director DIRECTORS,
Manag_Typ_Manager MANAGERS) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type MANAGEMENT
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MANAGEMENT" as table of Management_t

/
--------------------------------------------------------
--  DDL for Type COMPANY_T
--------------------------------------------------------
CREATE OR REPLACE TYPE "COMPANY_T" AS OBJECT(
Comp_ID  INTEGER,
Comp_Name VARCHAR2(20),
Comp_Contact REF Contact_T,
Comp_Typ1 COMPANYTYPE1, -- wie kann sichergestellt werden, dass die Firma nur einen der beiden Typen als NESTED TABLE beinhaltet? 
Comp_Typ2 COMPANYTYPE2,
Comp_Sholders SHAREHOlDERS,
Comp_Manag MANAGEMENT) NOT FINAL;







