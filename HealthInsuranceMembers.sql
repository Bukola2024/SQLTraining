--create table to insert data 
drop table if exists HealthInsuranceMembers
Use EmadeDev
create table HealthInsuranceMembers
(
member_id varchar (200) null, 
[member_first_name] varchar (100)null,	
[member_last_name] Varchar (100)null,	
address_id varchar (200) null,
[gender] varchar (200) null,
member_dob varchar (200) null,
claim_id varchar (200) null, 
coverage_id	varchar (200) null
)
 --bulk insert
 bulk insert HealthInsuranceMembers
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\HealthInsuranceMembers.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From HealthInsuranceMembers
