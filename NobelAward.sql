--How to Create a Database
Create Database SqlTraining
Go

--How to Create NoblePrizeAward
Create Table Nobel
(Year Int Null,
Subject Varchar (50) Null,
Winner Varchar (50) Null)


--How to Load data to a Table
Insert Into Nobel
(Year, Subject, Winner)

Select *
From Nobel


--How to Load data to a Table
Insert Into Nobel
(Year, Subject, Winner)
Values
(1960, 'Chemistry', 'Willard F. Libby'),
(1961, 'Literature', 'Saint-John Perse'),
(1962, 'Medicine', 'Sir Frank Macfarlane Burnet'),
(1963, 'Medicine', 'Peter Madawar')


--Show the Year 1962- Question 1
Select Count (*) 
From Nobel



--Show the Subject of Medicine - Que 2
Select Count (*)
From Nobel
Where Subject = 'Medicine'

--Show The Lateest Year in the Noble Table - Que 3
SELECT MAX(Year) AS 'The Latest Year'
 FROM Nobel

--Adding a New Record
 Insert Into Nobel
(Year, Subject, Winner)
Values
(2024, 'Economics', 'Willard F. Libby')


--Create a View
Create View vwOldNoble as
Select *
From Nobel
Where Year < 1962

--Check the View
Select *
From vwOldNoble

 --Show The Number of Records in The Noble Table - Que 6
Select Count (*) as 'Number of Record'
From Nobel

--Show the Subject and The Winner in The Lateest

--Outer Query or Main Query or Outside Query 
Select *
From Nobel
Where Year = (
--Inner Query or Sub Query or Inside Query
		SELECT MAX(Year) AS 'The Latest Year'
		 FROM Nobel
		 )

--Another Approach to Show the Subject and The Winner in The Lateest
Select Top 1 * 
From Nobel
Order by Year Desc

--Show Record that Would Exclude Medicine
Select *
From Nobel
Where Subject not in ('Medicine')
 
 Select *
From Nobel
Where Subject != 'Medicine'

Select *
From Nobel
Where Subject<> 'Medicine'



