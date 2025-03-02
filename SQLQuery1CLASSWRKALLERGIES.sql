Use EmadeDev

select *
From Allergies

Select distinct (category)
From Allergies

Select *
From Allergies
where category = 'Medication'

Select *
From Allergies
where category = 'Environment'

select *
From Encounters

--bulk insert
bulk insert Encounters
 from 'C:\Users\bukky\Documents\ETL Training\inbound\Encounters.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Encounters

Select distinct (Encounterclass)
From Encounters

Select * 
From Patients

Select distinct (Race)
From Patients

--bulk insert
bulk insert Patients
 from 'C:\Users\bukky\Documents\ETL Training\inbound\Patients.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)
Select distinct (Race)
From Patients

Select * 
From Patients

Select *
From Patients
where RACE = 'white'

---------------------------------------------------------------------

/****
EFFICIENTLY MANAGING SLOWLY CHANGING DIMENSIONS TYPE 2 (SCD TYPE 2) USING SQL INSERT-MERGE IN MICROSOFT SQL SERVER

SLOWLY CHANGING DIMENSIONS (SCD) ARE ESSENTIAL IN DATA WAREHOUSING FOR TRACKING CHANGES IN DIMENSION DATA OVER TIME. 
SCD TYPE 2 MAINTAINS HISTORICAL DATA BY CREATING NEW RECORDS FOR EACH CHANGE, ENSURING THAT NO HISTORICAL DATA IS LOST. 
IN THIS POST, WE WILL DEMONSTRATE HOW TO EFFICIENTLY IMPLEMENT SCD TYPE 2 USING THE MERGE STATEMENT IN SQL.
UNDERSTANDING SCD TYPE 2
SCD TYPE 2 PRESERVES THE HISTORY OF CHANGES BY ADDING NEW RECORDS RATHER THAN UPDATING EXISTING ONES. EACH RECORD INCLUDES:
  SURROGATE KEY: A UNIQUE IDENTIFIER FOR EACH RECORD.
  NATURAL KEY: THE BUSINESS KEY THAT UNIQUELY IDENTIFIES THE DIMENSION.
  EFFECTIVE DATE AND END DATE: THE PERIOD DURING WHICH THE RECORD IS ACTIVE.
  CURRENT FLAG: INDICATES IF THE RECORD IS THE CURRENT VERSION.
  *****/
  --FACT TABLE:THE ACTUAL TABLE. , DIMENSION TABLE: DISPLAYS MEASUREMENT LIKE TOTAL RECORDS BY YEAR. STAR SCHEMA, SNOWFLAKES SCHEMA
  --UPSERT: MEANS INSERT AND UPDATE

DROP TABLE  IF EXISTS EMADE_SCD_EMPLOYEE
CREATE TABLE EMADE_SCD_EMPLOYEE (
    ID INT NOT NULL,
    NAME VARCHAR(100),
    SALARY DECIMAL(10, 2),
    START_DATE DATE,
    END_DATE DATE,
    IS_ACTIVE CHAR(1))

	INSERT INTO EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
VALUES 
    (1, 'JOHN DOE', 50000, '2024-01-01', NULL, 'Y'),
    (2, 'JANE SMITH', 60000, '2024-02-01', NULL, 'Y')

	DROP TABLE  IF EXISTS STG_EMADE_SCD_EMPLOYEE
	CREATE TABLE STG_EMADE_SCD_EMPLOYEE (
    ID INT NOT NULL,
    NAME VARCHAR(100),
    SALARY DECIMAL(10, 2),
    START_DATE DATE)

	INSERT INTO STG_EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE)
VALUES 
    (1, 'JOHN DOE', 55000, '2024-05-01'), -- UPDATED RECORD
    (3, 'ALICE JOHNSON', 70000, '2024-05-01'); -- NEW RECORD



	SELECT *
	FROM EMADE_SCD_EMPLOYEE
		SELECT * 
	FROM STG_EMADE_SCD_EMPLOYEE

--PERFORMING MERGE OPERATIONS
	INSERT INTO EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
SELECT ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE 
FROM (
    MERGE INTO EMADE_SCD_EMPLOYEE AS TARGET
    USING STG_EMADE_SCD_EMPLOYEE AS SOURCE
    ON TARGET.ID = SOURCE.ID AND TARGET.IS_ACTIVE = 'Y'
    WHEN MATCHED THEN
        UPDATE SET 
            TARGET.IS_ACTIVE = 'N',
            TARGET.END_DATE = GETDATE()
    WHEN NOT MATCHED THEN
        INSERT (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
        VALUES (SOURCE.ID, SOURCE.NAME, SOURCE.SALARY, GETDATE(), NULL, 'Y')
    OUTPUT $ACTION,
        SOURCE.ID,
        SOURCE.NAME,
        SOURCE.SALARY,
        GETDATE(),
        NULL,
        'Y'
) AS [CHANGES] (ACTION, ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
WHERE ACTION = 'UPDATE';

SELECT @@ROWCOUNT NUMBEROFRECORDS


--PROJECT 2
DROP TABLE IF EXISTS EMADESOURCEPRODUCTS
CREATE TABLE EMADESOURCEPRODUCTS(
    PRODUCTID		INT,
    PRODUCTNAME		VARCHAR(50),
    PRICE			DECIMAL(9,2)
)
GO
    
INSERT INTO EMADESOURCEPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(1,'TABLE',100)
INSERT INTO EMADESOURCEPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(2,'DESK',80)
INSERT INTO EMADESOURCEPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(3,'CHAIR',50)
INSERT INTO EMADESOURCEPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(4,'COMPUTER',300)
GO

DROP TABLE IF EXISTS EMADETARGETPRODUCTS    
CREATE TABLE EMADETARGETPRODUCTS(
    PRODUCTID		INT,
    PRODUCTNAME		VARCHAR(50),
    PRICE			DECIMAL(9,2)
)
GO
    
INSERT INTO EMADETARGETPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(1,'TABLE',100)
INSERT INTO EMADETARGETPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(2,'DESK',180)
INSERT INTO EMADETARGETPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(5,'BED',50)
INSERT INTO EMADETARGETPRODUCTS(PRODUCTID,PRODUCTNAME, PRICE) VALUES(6,'CUPBOARD',300)
GO
    
    
SELECT * FROM EMADESOURCEPRODUCTS
SELECT * FROM EMADETARGETPRODUCTS

--MERGE OPERATION
	INSERT INTO EMADETARGETPRODUCTS (PRODUCTID,PRODUCTNAME, PRICE)
SELECT PRODUCTID,PRODUCTNAME, PRICE 
FROM (
    MERGE INTO EMADETARGETPRODUCTS AS TARGET
    USING EMADESOURCEPRODUCTS AS SOURCE
    ON TARGET.PRODUCTID = SOURCE.PRODUCTID 
    --UPDATE RECORDS IN TARGET
	WHEN MATCHED THEN
        UPDATE SET 
            TARGET.PRICE = SOURCE.PRICE
  --INSERT OPERATIONS 
   WHEN NOT MATCHED THEN
        INSERT (PRODUCTID,PRODUCTNAME, PRICE)
        VALUES (SOURCE.PRODUCTID,SOURCE.PRODUCTNAME, SOURCE.PRICE)
	--DELETE OPERATIONS
	--WHEN NOT MATCHED BY SOURCE
	--THEN DELETE
    OUTPUT $ACTION,
        SOURCE.PRODUCTID,
        SOURCE.PRODUCTNAME,
        SOURCE.PRICE
       
) AS [CHANGES] (ACTION, PRODUCTID,PRODUCTNAME, PRICE)
WHERE ACTION = 'UPDATE';

------------------------------------------------------------------------------------------------------

USE Emadeconsulting  Dev


--ASSIGNMENT: PLACE "ENDDATE", "STARTDATE" IN TABLE AND PERFORM OPERATION FOR SCD TYPE2
--CREATE 2 TABLES: ONE IS EMADEPRODUCTLIST TARGET, THE OTHER ONE EMADEUPDATEDLIST SOURCE.

-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS TGT_EMADEPRODUCTLIST;
DROP TABLE IF EXISTS STG_EMADEPRODUCTUPDATEDLIST;

-- CREATE TARGET TABLE
CREATE TABLE TGT_EMADEPRODUCTLIST (
    PRODUCTID INT NOT NULL,
    PRODUCTNAME VARCHAR(50),
    PRICE MONEY,
    STARTDATE DATE,
    ENDDATE DATE,
    IS_ACTIVE VARCHAR(1)
);

-- INSERT INITIAL DATA INTO TARGET TABLE
INSERT INTO TGT_EMADEPRODUCTLIST (PRODUCTID, PRODUCTNAME, PRICE, STARTDATE, ENDDATE, IS_ACTIVE)
VALUES
    (101, 'TEA', 10.00, '2024-01-01', NULL, 'Y'),
    (102, 'COFFEE', 15.00, '2024-01-01', NULL, 'Y'),
    (103, 'BISCUITS', 20.00, '2024-01-01', NULL, 'Y');

-- CREATE SOURCE TABLE
CREATE TABLE STG_EMADEPRODUCTUPDATEDLIST (
    PRODUCTID INT NOT NULL,
    PRODUCTNAME VARCHAR(50),
    PRICE MONEY
);

-- INSERT UPDATED DATA INTO SOURCE TABLE
INSERT INTO STG_EMADEPRODUCTUPDATEDLIST (PRODUCTID, PRODUCTNAME, PRICE)
VALUES
    (101, 'TEA', 10.00),
    (102, 'COFFEE', 35.00),
    (104, 'CHIPS', 22.00);


SELECT * FROM TGT_EMADEPRODUCTLIST
SELECT * FROM STG_EMADEPRODUCTUPDATEDLIST


--PERFORMING MERGE OPERATIONS