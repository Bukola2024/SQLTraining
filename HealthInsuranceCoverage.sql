--create table to insert data 
drop table if exists HealthInsuranceCoverage
Use EmadeDev
create table HealthInsuranceCoverage
(
coverage_id varchar (200) null, 
[member_id] varchar (100)null,	
[coverage_name] Varchar (100)null,	
effective_date varchar (200) null,
[term_date] varchar (200) null
)
 --bulk insert
 bulk insert HealthInsuranceCoverage
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\HealthInsuranceCoverage.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From HealthInsuranceCoverage
