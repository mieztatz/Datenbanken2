--------------------------------------------------------
--  DDL for Type PHONENUMBERLIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "PHONENUMBERLIST" as table of VARCHAR2(12);

/
--------------------------------------------------------
--  DDL for Type CONTACT_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "CONTACT_T" AS OBJECT(
Street  VARCHAR2(30),
HNUMBER INTEGER,
Code VARCHAR2(5),
City VARCHAR2(20),
Phone_Numbers PHONENUMBERLIST,
Fax VARCHAR2(12)) NOT FINAL;

/
-----------------------------------------------------
--  DDL for Type SHAREHOLDER_T
-----------------------------------------------------
CREATE OR REPLACE TYPE "SHAREHOLDER_T" AS OBJECT(
Sholder_ID  INTEGER,
Sholder_Name VARCHAR2(30),
Sholder_Contact REF Contact_T) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type OWN_SHARES_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "OWN_SHARES_T" AS OBJECT(
Sholder_ID REF Shareholder_t,
Share_Amount INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type SHAREHOLDERLIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "SHAREHOLDERLIST" as table of Own_Shares_t;

/
--------------------------------------------------------
--  DDL for Type DIRECTORS
--------------------------------------------------------
  CREATE OR REPLACE TYPE "DIRECTORS" as table of INTEGER;

/
--------------------------------------------------------
--  DDL for Type MANAGER_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MANAGER_T" AS OBJECT(
Manag_Type VARCHAR2(30),
Yearly_Salary VARCHAR2(10)) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type MANAGERLIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MANAGERLIST" as table of Manager_t;

/
--------------------------------------------------------
--  DDL for Type MANAGEMENT_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MANAGEMENT_T" AS OBJECT(
Manag_ID INTEGER,
Manag_Name VARCHAR2(30),
Manag_Contact REF Contact_T,
Manag_Typ_Director DIRECTORS,
Manag_Typ_Manager MANAGERLIST) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type MANAGEMENTLIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MANAGEMENTLIST" as table of Management_t;

/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "EMPLOYEE_T" AS OBJECT(
Emp_ID VARCHAR2(5),
Emp_Name VARCHAR2(30),
Emp_Contact REF Contact_T) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_FULLTIME_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "EMPLOYEE_FULLTIME_T" UNDER "EMPLOYEE_T"(
  Annual_Wage INTEGER,
  Emp_Bonus INTEGER) NOT FINAL;
  
/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_PARTTIME_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "EMPLOYEE_PARTTIME_T" UNDER "EMPLOYEE_T"(
  Weekly_Wage INTEGER) NOT FINAL;
  
/
--------------------------------------------------------
--  DDL for Type EMPLOYEE_CASUAL_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "EMPLOYEE_CASUAL_T" UNDER "EMPLOYEE_T"(
  Hourly_Wage INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type EMPLOYEELIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "EMPLOYEELIST" as table of Employee_t;

/
--------------------------------------------------------
--  DDL for Type DEPARTMENT_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "DEPARTMENT_T" AS OBJECT(
Dept_ID INTEGER,
Dept_Name VARCHAR2(20),
Dept_Head VARCHAR2(25),
Dept_Employees EMPLOYEELIST) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type DEPARTMENTS
--------------------------------------------------------
  CREATE OR REPLACE TYPE "DEPARTMENTLIST" as table of Department_t;

/
--------------------------------------------------------
--  DDL for Type TRANSACTION_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "TRANSACTION_T" AS OBJECT(
Trans_ID INTEGER,
Trans_Date DATE,
Store_Contact REF Contact_T,
Quantity INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type TRANSACTIONLIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "TRANSACTIONLIST" as table of REF Transaction_t;
  
/
--------------------------------------------------------
--  DDL for Type ITEM_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "ITEM_T" AS OBJECT(
Item_ID VARCHAR2(5),
Item_Name VARCHAR2(20),
Item_Desc VARCHAR2(20),
Item_Cost VARCHAR2(4),
Item_Price VARCHAR2(5),
Item_Trans TRANSACTIONLIST) NOT FINAL; 

/
--------------------------------------------------------
--  DDL for Type ITEMLIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "ITEMLIST" as table of REF Item_t;
  
/
--------------------------------------------------------
--  DDL for Type AVAILABLE_IN_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "AVAILABLE_IN_T" AS OBJECT(
Item_ID REF Item_t,
Item_Stock INTEGER) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type AVAILABLELIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "AVAILABLELIST" as table of Available_In_t;
  
/
--------------------------------------------------------
--  DDL for Type STORE_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "STORE_T" AS OBJECT(
Store_ID VARCHAR2(5),
Store_Location VARCHAR2(20),
Store_Contact REF Contact_T,
Store_Manage VARCHAR2(30),
Store_Depts DEPARTMENTLIST,
Store_Items AVAILABLELIST) NOT FINAL;

/
--------------------------------------------------------
--  DDL for Type STORELIST
--------------------------------------------------------
  CREATE OR REPLACE TYPE "STORELIST" as table of Store_t;

/
--------------------------------------------------------
--  DDL for Type CUSTOMER_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "CUSTOMER_T" AS OBJECT(
Cust_ID VARCHAR2(5),
Cust_Name VARCHAR2(20),
Cust_Contact REF Contact_t,
Cust_Gender INTEGER(1),
Cust_DOB DATE,
Cust_Bonus_Points INTEGER,
Cust_Trans TRANSACTIONLIST) NOT FINAL; 
  
/
--------------------------------------------------------
--  DDL for Type MAKER_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "MAKER_T" AS OBJECT(
Maker_ID VARCHAR2(5),
Maker_Name VARCHAR2(20),
Maker_Contact REF Contact_T,
Items ITEMLIST) NOT FINAL;  
  
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
--  DDL for Type COMP_TYPE2_T
--------------------------------------------------------
  CREATE OR REPLACE TYPE "COMP_TYPE2_T" UNDER COMP_TYPE_T(
Market  VARCHAR2(10)) NOT FINAL;
  
/
--------------------------------------------------------
--  DDL for Type COMPANY_T
--------------------------------------------------------
CREATE OR REPLACE TYPE "COMPANY_T" AS OBJECT(
Comp_ID  INTEGER,
Comp_Name VARCHAR2(20),
Comp_Contact REF Contact_T,
Comp_Type COMP_TYPE_T,
Comp_Sholders SHAREHOLDERLIST,
Comp_Manag MANAGEMENTLIST,
Comp_Stores STORELIST) NOT FINAL;


--------------------------------------------------------
--  DDL for Table CONTACT
--------------------------------------------------------
  CREATE TABLE "CONTACT" OF "CONTACT_T" 
  NESTED TABLE "PHONE_NUMBERS" STORE AS "PHONE";
 
--------------------------------------------------------
--  DDL for Table SHAREHOLDERS
--------------------------------------------------------
  CREATE TABLE "SHAREHOLDERS" OF "SHAREHOLDER_T"; 
  






