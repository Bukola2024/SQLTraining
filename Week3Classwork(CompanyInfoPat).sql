--How To Create a Database
Create Database CompanyInfo
Go

--How To Use a Database
Use CompanyInfo

--How To Create a Table
Create Table Pet
(
PetId INT NULL,
PetName VARCHAR(50) NULL,
PetColor VARCHAR(50) NULL,
PetAge INT NULL,
PetStatus VARCHAR (50) NULL,
PetBreed  VARCHAR (50) NULL,
PetGender  VARCHAR (50) NULL
)


--How To Load Data To a Table
Insert Into Pet
(PetId, PetName, PetColor, PetAge, PetStatus, PetBreed, PetGender)
Values
(1,'Jack', 'Brown', 25, 'Alive', 'German Shepherd', 'Male'),
(2,'Tom', 'Blue', 30, 'Dead', 'German Shepherd', 'Female'),
(3,'Jerry', 'Brown', 35, 'Alive', 'African Shepherd', 'Male'),
(4,'Bingo', 'Black', 40, 'Alive', 'German Shepherd', 'Female'),
(5,'Kit', 'Brown', 45, 'Alive', 'Asian Shepherd', 'Male'),
(6,'Don', 'Black', 50, 'Alive', 'German Shepherd', 'Male'),
(7,'Lillie', 'Brown', 55, 'Dead', 'USA Shepherd', 'Female'),
(8,'Shawn', 'White', 60, 'Alive', 'Asian Shepherd', 'Male'),
(9,'Billy', 'Brown', 65, 'Alive', 'German Shepherd', 'Male'),
(10,'Dell', 'White', 70, 'Alive', 'USA Shepherd', 'Male')


--How To Check Data in a Table
Select *
From Pet

--Produce a Report Showing Pets that are below age 50
Select *
From Pet
Where PetAge<50

--Produce a Report Showing Pets that are Female
Select *
From Pet
Where PetGender='Female'

--Produce a Report Showing Pets that are Alive
Select *
From Pet
Where PetStatus='Alive'

--Produce a Report Showing Pets the Oldest Pet from the Table
--Using Outer Query (Outside, External or Main Query
Select *
From Pet
Where PetAge=
(