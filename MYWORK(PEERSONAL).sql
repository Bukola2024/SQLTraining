use SqlTraining

--CRUD (Create, Read, Update, Delete)
-- How to create a Table

Create Table Pat
(PetID INT Null,
 PetName VARCHAR(30) Null,
 PetColor VARCHAR(30) Null
 )

 -- How to read the data

 Select *
 FROM Pat

  -- How to update or Modify data or add data in a  table

 INSERT into Pat
 (PetID, PetName, PetColor)
 VALUES
 (1, 'Jack', 'Black'),
 (2, 'Smith', 'White'),
 (3, 'Bingo', 'Black'),
 (4, 'Star', 'Brown'),
 (5, 'Moon', 'Black')

  Select*
 FROM Pat

 -- How to Update records

 UPDATE Pat
 SET PetName = 'Sunday'
 WHERE PetName = 'Moon'

 SELECT *
 FROM Pat

 -- How to delete records from a table

 DELETE 
 FROM Pat
 WHERE PetName = 'Jack'

 Select *
 From Pat

 --Stored Procedure - a code that can be re-used.
 -- A code that can be used to hide information or code for security purposes.
 --To improve performance

 --Syntax
 -- =============================================
-- Developer:		Bukola Popoola
-- Create date: 10/12/2024
-- Description:	This code is created to pull pet information
-- Version: v1.0
-- =============================================

Create Procedure sp_PatInfo
AS
SELECT *
FROM Pat

-- How to execute a stored procedure

Exec sp_PatInfo

-- Parametarized stored procedure

Select * 
From Nobel

-- Parametarized stored procedure

Select * 
From Nobel

Create Procedure spNobelByYear
(
-- Add parameters
@YearAwarded VARCHAR(50)
)
AS
SELECT *
FROM Nobel
WHERE YearAwarded =@YearAwarded

Exec spNobelByYear '1963'


--Assignment on SQL JOIN

--Assignment is to learn about SQL joins regarding our healthcare project. 
--I will discuss further in depth in our next session: 

--Hospital project questions and answers 1-10

--QUESTION 1: Write a query that does the following: Lists out number of patients in descending order,Does not include city Quincy,
--			  Must have at least 2 patients from that city
SELECT DISTINCT 
	CITY, 
	COUNT(ID) AS P
FROM PATIENTSDATA
WHERE CITY <> 'QUINCY'
GROUP BY CITY
HAVING COUNT(ID) > 1
ORDER BY CITY DESC


--QUESTION 2: find out the patients with the highest number of visits
WITH VISITS AS
		(
	SELECT DISTINCT 
		B.CITY,
		A.PATIENT,
		B.ID,
		COUNT(B.ID) AS NUMBEROFVISITS
	FROM ENCOUNTERSDATA A
		JOIN PATIENTSDATA B 
		ON A.PATIENT=B.ID
	GROUP BY B.CITY,A.PATIENT,B.ID
		)

SELECT *
FROM VISITS
WHERE NUMBEROFVISITS =
	(
	SELECT 
	MAX(NUMBEROFVISITS) AS MAXVISITS
	FROM VISITS
	);

--QUESTION 3: To find out the Top 10 patients with the most visits to the hospital
WITH VISITS AS
		(
	SELECT  
		B.CITY,
		A.PATIENT,
		B.ID,
		COUNT(B.ID) AS NUMBEROFVISITS
	FROM ENCOUNTERSDATA A
		JOIN PATIENTSDATA B 
		ON A.PATIENT=B.ID
	GROUP BY 
		B.CITY,
		A.PATIENT,
		B.ID
		)

SELECT 
	TOP 10 *
FROM VISITS
ORDER BY NUMBEROFVISITS DESC;

⁠-- QUESTION 4: To find out the number of times patients from each city visited the hospital
SELECT DISTINCT
	B.CITY,
	A.PATIENT,
	B.ID,
	COUNT(B.ID) AS NUMBEROFVISITS
FROM ENCOUNTERSDATA A
	JOIN PATIENTSDATA B 
	ON A.PATIENT=B.ID
GROUP BY 
	B.CITY,
	A.PATIENT,
	B.ID
ORDER BY NUMBEROFVISITS DESC;

--QUESTION 5: ⁠To find out the cities with up to 50 counts of emergency cases.
SELECT DISTINCT
	B.CITY,
	A.ENCOUNTERCLASS,
	COUNT(ENCOUNTERCLASS) AS COUNTSOFEMERGENCYCASES
FROM ENCOUNTERSDATA A
	JOIN PATIENTSDATA B 
	ON A.PATIENT=B.ID
WHERE ENCOUNTERCLASS = 'EMERGENCY'
GROUP BY 
B.CITY,
A.ENCOUNTERCLASS
HAVING COUNT(ENCOUNTERCLASS) >= 50
ORDER BY COUNTSOFEMERGENCYCASES DESC
;⁠

--QUESTION 6: ⁠Now to find out the number of patients from Boston who came in 2020
SELECT 
	B.CITY,
	COUNT(A.PATIENT) AS NUMBEROFPATIENTS
FROM ENCOUNTERSDATA A
	JOIN PATIENTSDATA B 
	ON A.PATIENT=B.ID
WHERE B.CITY = 'BOSTON' 
	AND START LIKE '2020%'
GROUP BY 
B.CITY;

-- QUESTION 7: To find out the top recurring conditions.
WITH RECCURRINGCONDITIONS AS
	(
	SELECT DISTINCT 
		A.DESCRIPTION,
		COUNT(*) AS NUMBEROFRECURRENCE
	FROM CONDITIONSDATA A
		JOIN PATIENTSDATA B 
		ON A.PATIENT=B.ID
	GROUP BY A.DESCRIPTION
	)
SELECT 
	TOP 5 DESCRIPTION,
	NUMBEROFRECURRENCE
FROM RECCURRINGCONDITIONS
ORDER BY NUMBEROFRECURRENCE DESC;


--QUESTION 8: To find out the month with the highest number of ambulatory cases since 2010
SELECT 
	TOP 1 NUMBEROFAMBULATORYCASES,
	YEAR,
	MONTH
FROM
	(
	SELECT DISTINCT
		DATEPART(YEAR, A.START) AS YEAR,
		DATEPART(MONTH, A.START) AS MONTH,
		COUNT(A.ENCOUNTERCLASS) AS NUMBEROFAMBULATORYCASES
	FROM ENCOUNTERSDATA A
		JOIN PATIENTSDATA B 
		ON A.PATIENT=B.ID
	WHERE ENCOUNTERCLASS = 'AMBULATORY'
	GROUP BY 
		DATEPART(YEAR, A.START), 
		DATEPART(MONTH, A.START)
	HAVING DATEPART(YEAR, A.START) >= 2010
	) X
 ORDER BY NUMBEROFAMBULATORYCASES DESC

--QUESTION 9: ⁠To find out the month with the highest number of emergency cases since 2010.

SELECT 
	TOP 1 NUMBEROFEMERGENCYCASES,
	YEAR,
	MONTH
FROM
	(
	SELECT DISTINCT
		DATEPART(YEAR, A.START) AS YEAR,
		DATEPART(MONTH, A.START) AS MONTH,
		COUNT(A.ENCOUNTERCLASS) AS NUMBEROFEMERGENCYCASES
	FROM ENCOUNTERSDATA A
		JOIN PATIENTSDATA B 
		ON A.PATIENT=B.ID
	WHERE ENCOUNTERCLASS = 'EMERGENCY'
	GROUP BY 
		DATEPART(YEAR, A.START), 
		DATEPART(MONTH, A.START)
	HAVING DATEPART(YEAR, A.START) >= 2010
	) X
ORDER BY NUMBEROFEMERGENCYCASES DESC

  --QUESTION 10: ⁠Now to find out the top 15 years with the most immunizations.
SELECT 
	TOP 15 NUMBEROFIMMUNIZATIONS,
	YEAR
FROM
	(
	SELECT DISTINCT
		DATEPART(YEAR, A.DATE) AS YEAR,
		COUNT(A.ENCOUNTER) AS NUMBEROFIMMUNIZATIONS
	FROM IMMUNIZATIONSDATA A
		JOIN PATIENTSDATA B 
		ON A.PATIENT=B.ID
	GROUP BY 
		DATEPART(YEAR, A.DATE) )X
ORDER BY NUMBEROFIMMUNIZATIONS DESC;


--SQL JOIN ASSIGNMENT
--SQL Join Assignment:
--table.

--BEST_CUSTOMERS TABLE

--1:Creating a BEST_BUY CUSTOMERS  table
CREATE TABLE BEST_BUY_CUSTOMERS
( 
  CUSTOMER_ID INT NOT NULL,
 FIRST_NAME VARCHAR(50) NULL,
 LAST_NAME VARCHAR(50) NULL,
 AGE INT NOT NULL,
COUNTRY VARCHAR(50) NULL
);


--2:LOAD DATA TO THE BEST_BUY_CUSTOMERS TABLE
INSERT INTO BEST_BUY_CUSTOMERS
(CUSTOMER_ID, FIRST_NAME, LAST_NAME, AGE, COUNTRY)
VALUES (1, 'John', 'Doe', 31, 'USA'),
(2, 'Robert', 'Luna', 22, 'USA'),
(3, 'David', 'Robinson', 22, 'UK'),
(4, 'John', 'Reinhardt', 25, 'UK'),
(5, 'Betty', 'Doe', 28, 'UAE')

 
--2:Creating an ORDER table

CREATE TABLE BEST_BUY_ORDERS
(
   ORDER_ID INT NOT NULL,
   ITEM VARCHAR(50) NULL,
   AMOUNT MONEY,
   CUSTOMER_ID INT NOT NULL
);


--2:LOAD DATA TO THE ( 1, 'Keyboard', 400,4), TABLE
INSERT INTO BEST_BUY_ORDERS
(ORDER_ID, ITEM, AMOUNT, CUSTOMER_ID)
VALUES ( 1, 'Keyboard', 400,4),
( 2, 'Mouse', 300,4),
( 3, 'Monitor', 12000,3),
( 4, 'Keyboard', 400,1),
( 5, 'Mousepad', 250,2)


--2:Creating a BEST_BUY_PRODUCTS table

CREATE TABLE BEST_BUY_PRODUCTS
(
   PRODUCT_ID INT NOT NULL,
   PRODUCT_NUMBER VARCHAR(50) NULL,
   AMOUNT MONEY,
   CUSTOMER_ID INT NOT NULL
);


--2:LOAD DATA TO THE ( 1, 'Keyboard', 400,4), TABLE
INSERT INTO BEST_BUY_PRODUCTS
(PRODUCT_ID, PRODUCT_NUMBER, AMOUNT, CUSTOMER_ID)
VALUES ( 1, 'Keyboard', 400,5),
( 2, 'Headphone', 300,4),
( 3, 'Laptop', 12000,3),
( 4, 'Pen', 400,1),
( 5, 'Mousepad', 250,2)

--Please produce report by answering the questions below:

/**
1: Write a query that shows customer who bought item Mouse

2: SHOW ME THE CUSTOMER INFO AND THE ITEM THAT THEY ORDER, THE PRODUCT BUT ONLY SHOW THE PRODUCT FOR PEN

---------------------------------------------------------------------------------------------


