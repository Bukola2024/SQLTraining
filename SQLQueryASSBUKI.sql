Use SqlTraining

Select *
From Employee

--create table to insert data 
Create table Assignment1
(
FIRST_NAME Varchar(50) null, 
LAST_NAME Varchar(50) null,	
COUNTRY Varchar(50) null,
CONTINENT Varchar(50) null
)

--How to  Load Data to a Table
Insert Into Assignment1
(FIRST_NAME, LAST_NAME, COUNTRY, CONTINENT)  
VALUES
('Adam', 'Cooper', 'USA', 'North America'),
('John',  'Smith', 'USA', 'North America'),
('Mark',  'Allan', 'UK', 'Europe'),
('Steve',  'Brown', 'Canada', 'North America')
 
--How to Drop a Column
Alter Table Assignment1
Drop Column Continent

 Select *
 From Assignment1

 --Data Flow Logic
 Use SqlTraining
 Select *
 From Assignment1

--Using CASE Statement
--Produce a Report Showing Continent where USA = North America, Canada = North America, UK = Europe

Select
FIRST_NAME,
LAST_NAME,
COUNTRY,
CONTINENT  =
CASE
WHEN COUNTRY = 'USA' THEN 'NORTH AMERICA'
WHEN COUNTRY = 'CANADA' THEN 'NORTH AMERICA'
WHEN COUNTRY = 'UK' THEN 'EUROPE'
END
From Assignment1


--create table to insert data
--How To Create Table
Create table Assignment2
(
FIRST_NAME Varchar(50) null, 
LAST_NAME Varchar(50) null,	
EMPLOYEES Varchar(50) null,
SIZEOFCOMPANY Varchar(50) null
)

--How to  Load Data to a Table
Insert Into Assignment2
(FIRST_NAME, LAST_NAME, EMPLOYEES, SIZEOFCOMPANY)  
VALUES
('Adam', 'Cooper', 55, 'Large'),
('John',  'Smith', 4, 'Small'),
('Mark',  'Allan', 23, 'Medium'),
('Sally',  'Jones', 10, 'Medium'),
('Steve',  'Brown', 15, 'Medium')
 

 Alter Table Assignment2
Drop Column SizeofCompany

 Select *
 From Assignment2

 --Data Flow Logic
 Use SqlTraining
 Select *
 From Assignment2

--Using CASE Statement
--Produce a Report Showing Size of Company for Employees is 55 = Large, Number is 4 = Small, Numbers below 55 and higher than 10 = Medium

Select
FIRST_NAME,
LAST_NAME,
EMPLOYEES,
SIZEOFCOPANY  =
CASE
WHEN EMPLOYEES = 55 THEN 'LARGE'
WHEN EMPLOYEES = 4 THEN 'SMALL'
WHEN EMPLOYEES  < 55 AND EMPLOYEES >= 10 THEN 'MEDIUM'
When EMPLOYEES < 1THEN 'NO EMPLOYEE'
END
From Assignment2

Create table Assignment3
(
FIRST_NAME Varchar(50) null, 
LAST_NAME Varchar(50) null,	
EMPLOYEES Varchar(50) null,
SIZEOFCOMPANY Varchar(50) null
)

--How to  Load Data to a Table
Insert Into Assignment3
(FIRST_NAME, LAST_NAME, EMPLOYEES, SIZEOFCOMPANY)  
VALUES
('Adam', 'Cooper', 55, 'Large'),
('John',  'Smith', 4, 'Small'),
('Mark',  'Allan', 23, 'Medium'),
('Sally',  'Jones', 10, 'Medium'),
('Steve',  'Brown', 15, 'Medium')
 

 Select *
 From Assignment3

 --Data Flow Logic
 Use SqlTraining
 Select *
 From Assignment3

--Using CASE Statement
--Produce a Report Showing Size of Company for Employees is 55 = Large, Number is 4 = Small, Numbers below 55 and higher than 10 = Medium, and Number below 1 = No Employee

Select
FIRST_NAME,
LAST_NAME,
EMPLOYEES,
SIZEOFCOPANY  =
CASE
WHEN EMPLOYEES = 55 THEN 'LARGE'
WHEN EMPLOYEES = 4 THEN 'SMALL'
WHEN EMPLOYEES  < 55 AND EMPLOYEES > 10 THEN 'MEDIUM'
When EMPLOYEES < 1 THEN 'NO EMPLOYEE'
END
From Assignment3

--create table to insert data 
Create table Assignment4
(
ID INT null, 
NAME Varchar(50) null,	
SCORE INT null,
GRADE Varchar(50) null
)

Alter Table Assignment4
Drop Column Grade

--How to  Load Data to a Table
Insert Into Assignment4
(ID, NAME, SCORE)  
VALUES
(1, 'Simisola', 60),
(2, 'Ivan', 80),
(3, 'Metodija', 52),
(4, 'Callum', 98),
(5, 'Leia', 84),
(6, 'Aparecida', 82),
(7, 'Ursula', 69),
(8, 'Ramazan', 78),
(9, 'Corona', 87),
(10, 'Alise', 57),
(11, 'Galadriel', 89),
(12,  'Merel', 99),
 (13, 'Cherice', 55),
 (14, 'Nithya', 81),
 (15, 'Elsad', 71),
 (16, 'Liisi', 90),
 (17, 'Johanna', 90),
 (18, 'Anfisa', 90),
 (19, 'Ryosuke', 97),
 (20, 'Sakchai', 61),
 (21, 'Elbert', 63),
 (22, 'Katelyn', 51)


 Select *
 From Assignment4

 --Data Flow Logic
--Using CASE Statement
/**Produce a Report Showing the breakdown for each grade, When score is 94 or higher, the row will have the value of A. 
If  score is  94 gets an  A, 
If  score is  90 gets an  A- ,
If  score is  87 gets an  B+  ,
If  score is  83 gets an  B  ,
If  score is  80 gets an  B- ,
If  score is  77 gets an  C+ ,
If  score is  73 gets an  C , 
If  score is  70 gets an  C- ,
If  score is  67 gets an  D+ ,
If  score is  60 gets an  D,
if students get none of these scores, you should assign an FGive each student a grade, which we will add in a new column named grade. 
You can show the grades from highest to lowest
**/
--Result1

Select
ID,
NAME,
SCORE,
GRADE  =
CASE
WHEN SCORE >= 94 THEN 'A'
WHEN SCORE < 94 AND SCORE >= 90 THEN 'A-'
WHEN SCORE < 90 AND SCORE >= 87 THEN 'B+'
WHEN SCORE < 87 AND SCORE >= 83 THEN 'B'
WHEN SCORE < 83 AND SCORE >= 80 THEN 'B-'
WHEN SCORE < 80 AND SCORE >= 77 THEN 'C+'
WHEN SCORE < 77 AND SCORE >= 73 THEN 'C'
WHEN SCORE < 73 AND SCORE >= 70 THEN 'C-'
WHEN SCORE < 70 AND SCORE >= 67 THEN 'D+'
WHEN SCORE < 67 AND SCORE >= 60 THEN 'D'
--WHEN SCORE < 90 AND SCORE >= 87 THEN 'B+'
WHEN SCORE < 60 THEN 'F'
END
From Assignment4
Order by SCORE DESC

--Result2

Create table Assignment4a
( 
RESULT Varchar(50) null,	
NUMBER_OF_STUDENTS INT null
)

--How to  Load Data to a Table
Insert Into Assignment4a
(RESULT, NUMBER_OF_STUDENTS)  
VALUES
('Passed', 18),
('Failed', 4)

Select *
 From Assignment4a

--Using CASE Statement
--Produce a Report Showing how many students passed or failed. 
/**If a student scores 60 or higher, that student passed but 
if they scored lower than 60, they have failed
**/
Select
--RESULT,
--NUMBER_OF_STUDENTS,
RESULT  =
CASE
WHEN NUMBER_OF_STUDENTS >= 60 THEN 'PASSED'
--WHEN NUMBER_OF_STUDENTS < 60 AND NUMBER_OF_STUDENTS >= 0 THEN 'FAILED'
ELSE 'FAILED'
END
,NUMBER_OF_STUDENTS
From Assignment4a
 
 --AfricaTemperature
/**
Assignment 2
**/

DROP TABLE IF EXISTS AfricaTemperature;

CREATE TABLE AfricaTemperature
(
    [RecordedDate] DATE NOT NULL,
    [DegreeInFahrenheit] DECIMAL(4, 2) NULL
);

INSERT INTO AfricaTemperature
(
    [RecordedDate],
    [DegreeInFahrenheit]
)
VALUES
('01-01-2023', '32.60'),
('01-02-2023', '31.20'),
('01-03-2023', '42.00'),
('01-04-2023', '44.60'),
('01-05-2023', '39.40'),
('01-06-2023', '31.70'),
('01-07-2023', NULL),
('01-08-2023', '21.20'),
('01-09-2023', '19.15'),
('01-10-2023', '07.90');


/**
Business requirements:
DegreeInFahrenheit is more than 40.00' , show as Hot
If DegreeInFahrenheit is below 32:00, show as 'It''s too cold outside!'
 If DegreeInFahrenheit is not available, show as  'Why didn''t you record this?'
  Otherwise, shows as Sounds about right'
  **/


Select *
FROM AfricaTemperature

--To Show The Result in a New Column:
Select 
RecordedDate,	
DegreeInFahrenheit, 
Weather=
CASE
WHEN DegreeInFahrenheit>40 THEN 'Hot'
WHEN DegreeInFahrenheit<32 THEN 'It"s too cold outside'
When DegreeInFahrenheit IS NULL THEN 'Why didn"t you record this?'
ELSE 'Sounds about right'
END
FROM AfricaTemperature

Select
Count(Case when DegreeinFahrenheit>40 Then 'Hot'

--Create View
Create View vwEmadeconsultingemployee as
Select *
FROM[dbo].[Emadeconsultingemployee]

Select *
FROM vwEmadeconsultingemployee

Select Name, Occupation, 
Iif(OCCUPATION='HR','GOOD', 'BAD'),
Iif(OCCUPATION='ENGINEER', 'BETTER','WORSE')
FROM vwEmadeconsultingemployee

--EXAMPLE OF INNER JOIN 
--A = 1,2,3,4,5
--B = 4,5
--EXAMPLE OF RIGHT JOIN 
--A = 1,2,3,4,5
--B = 4,5, 6,7,8
--EXAMPLE OF LEFT JOIN 
--A = 1,2,3,4,5
--B = 4,5, 9, 10, 11
Messages addressed to "meeting group chat" will also appear in the meeting group chat in Team Chat

Select *
From TableA as A Right Join TableB as B
On A.ID=B.ID