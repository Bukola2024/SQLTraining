Use EmadeDev

--create table to insert data 
create table EmadeDevOrganizations
( 
[Id] Varchar (20)null,
[NAME] Varchar (20)null,	
[EMAIL]	varchar (20) null,
CITY varchar (20) null,
[STATE]	varchar (20) null,
[ZIP]	varchar (20) null,
[PHONE]	varchar (300) null,
[CONTRIBUTION]	varchar (300) null,
)

Select *
FROM EmadeDevOrganizations


INSERT into EmadeDevOrganizations
 (Id, Name, EMAIL, CITY, STATE, PHONE, CONTRIBUTION)
 VALUES
 (1, 'Jude', 'jude@gmail.com', 'Rocklin', 'Cali', 217, 50),
 (2, 'Jake', 'jake@hotmail.com', 'Roseville', 'Cali', 215, 30),
 (3, 'Jane', 'jane@gmail.com', 'Sacramento', 'Cali', 117, 50),
 (4, 'John', 'john@gmail.com', 'Rocklin', 'Cali', 423, 50),
 (5, 'Juliet', 'julie@gmail.com', 'Sacramento', 'Cali', 916, 50)

 Select*
 FROM EmadeDevOrganizations

 DELETE 
 FROM EmadeDevOrganizations
 WHERE CITY = 'SACRAMENTO'

 SELECT *
 FROM EmadeDevOrganizations

  UPDATE EmadeDevOrganizations
 SET CITY = 'OROVILLE'
 WHERE CITY = 'ROCKLIN'

 SELECT *
 FROM EmadeDevOrganizations

 SELECT *
 FROM AmazonProductsData

 SELECT Distinct *
 FROM AmazonProductsData

 SELECT *
 FROM AmazonProduct2Data

 SELECT *
 FROM AmazonProduct4Data