Select @@servername
--How To Create a Database
Create Database SqlTraining
Go
--How To Use a Database
Use SqlTraining
--How To Create a Table
Create Table Employee
(EmployeeId Int,
FirstName Varchar (50) Null,
LastName Varchar (50) Null
Gender Varchar (50) Null,
Country Varchar (50) Null,
Continent Varchar (50) Null)

Create Table Employee
(EmployeeInt,
FirstName Varchar (50) Null,
LastName Varchar (50) Null
Gender Varchar (50) Null,
Country Varchar (50) Null,
Continent Varchar (50) Null)

--How To Load Data To a Table
Insert into Employee
(EmployeeId, FirstName, LastName, Gender, Country, Continent)
Values
(1, 'Smith', 'Jones', 'Male', 'USA', 'NorthAmerica'),
(2, 'Mary', 'Adams', 'Female', 'Nigeria', 'Africa'), 
(3, 'Jacky', 'Chan', 'Male', 'China', 'Asia'), 
(4, 'Debby', 'Hills', 'Female', 'USA', 'NorthAmerica'), 
(5, 'Charles', 'Ron', 'Male', 'Britain', 'Europe')

--How To Check Data in a Table
Select *
From Employee

--How To Check Data in a Table

--How Many Employee Do We Have or Show The Total Number of Employee
Select Count (*) as 'Total Number of Employee'
From Employee

--Show Average Number of EmployeeId
Select AVG(EmployeeId) as 'AVG Number of Employee'
Select AVG(EmployeeId) as 'AVG Number of Employee'


--Show The Highest Number of Employee
Select MAX(EmployeeId) as ' Highest Number of Employee'
Select MIN(EmployeeId) as 'AVG Number of Employee'


