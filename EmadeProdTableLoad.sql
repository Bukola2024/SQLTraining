--Developer - Bukola Popoola, 02/05/2025
--loading csv files into Prod
drop table if exists Encounters

use EmadeProd

--create table to insert data 
create table Encounters
(
Id varchar (4000)null,
[START] varchar (4000)null,	
[STOP] Varchar (4000)null,	
PATIENT	varchar (4000) null,
ORGANIZATION varchar (4000) null,
[PROVIDER] varchar (4000) null,
PAYER varchar (4000) null,
[ENCOUNTERCLASS]	varchar (4000) null,
[CODE] varchar (4000) null,
[DESCRIPTION] varchar (4000) null,
[BASE_ENCOUNTER_COST] varchar (4000) null,
TOTAL_CLAIM_COST varchar (4000) null,
PAYER_COVERAGE varchar (4000) null,
REASONCODE varchar (4000) null,
REASONDESCRIPTION varchar (4000) null
)

--bulk insert
bulk insert Encounters
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Encounters.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Encounters

--create table to insert data 
create table Observations
( 
[DATE] Varchar (8000)null,	
PATIENT	varchar (8000) null,
ENCOUNTER varchar (8000) null,
[CATEGORY]	varchar (8000) null,
[Code]	varchar (8000) null,
[DESCRIPTION] varchar (8000) null,
[Value]	varchar (8000) null,
[Units]	varchar (8000) null,
[Type] varchar (8000) null
)

--bulk insert
bulk insert Observations
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\Observations.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Observations

--create table to insert data 
create table CarePlans
(
Id varchar (200) null, 
[START] varchar (100)null,	
[STOP] Varchar (100)null,	
PATIENT	varchar (200) null,
ENCOUNTER varchar (200) null,
CODE varchar (200) null,
[DESCRIPTION]	varchar (200) null, 
REASONCODE	varchar (200) null,
REASONDESCRIPTION varchar(500) null
)
 --bulk insert
 bulk insert CarePlans
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\careplans.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From CarePlans


--create table to insert data 
create table Allergies
( 
[START] varchar (100)null,	
[STOP] Varchar (100)null,	
PATIENT	varchar (200) null,
ENCOUNTER varchar (200) null,
CODE varchar (200) null,
[SYSTEM] varchar (100) null,
[DESCRIPTION]	varchar (200) null,
[TYPE] varchar (200) null,
[CATEGORY] varchar (200) null,
[REACTION1] varchar (200) null,
[DESCRIPTION1] varchar (200) null,
[SEVERITY1] varchar (200) null,
[REACTION2] varchar (200) null,
[DESCRIPTION2] varchar (200) null,
SEVERITY2	varchar (200) null,
)

--bulk insert
 bulk insert Allergies
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\Allergies.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Allergies

--create table to insert data
create table Claims
( 
Id varchar (8000)null,
[PATIENTId] varchar (8000)null,	
[PROVIDERId] Varchar (8000)null,	
PRIMARYPATIENTId	varchar (8000) null,
SECONDARYPATIENTId varchar (8000) null,
DEPARTMENTId varchar (8000) null,
[PATIENTDEPARTMENTId] varchar (8000) null,
[DIAGNOSIS1]	varchar (8000) null,
[DIAGNOSIS2] varchar (8000) null,
[DIAGNOSIS3] varchar (8000) null,
[DIAGNOSIS4] varchar (8000) null,
[DIAGNOSIS5] varchar (8000) null,
[DIAGNOSIS6] varchar (8000) null,
[DIAGNOSIS7] varchar (8000) null,
[DIAGNOSIS8] varchar (8000) null,
REFERRINGPROVIDERId	varchar (8000) null,
APPOINTMENTId	varchar (8000) null,
CURRENTILLNESSDATE	varchar (8000) null,
SERVICEDATE	varchar (8000) null,
SUPERVISINGPROVIDERId	varchar (8000) null,
STATUS1	varchar (8000) null,
STATUS2	varchar (8000) null,
STATUSP	varchar (8000) null,
OUTSTANDING1	varchar (8000) null,
OUTSTANDING2	varchar (8000) null,
OUTSTANDINGP	varchar (8000) null,
LASTBILLEDDATE1	varchar (8000) null,
LASTBILLEDDATE2	varchar (8000) null,
LASTBILLEDDATEP	varchar (8000) null,
HEALTHCARECLAIMTYPE1	varchar (8000) null,
HEALTHCARECLAIMTYPE2	varchar (8000) null,
)


--bulk insert
 bulk insert Claims
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\Claims.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Claims

--create table to insert data
create table Claims_transactions
( 
Id varchar (8000)null,
[CLAIMID] varchar (8000)null,	
[CHARGEID] Varchar (8000)null,	
PATIENTID	varchar (8000) null,
[TYPE] varchar (8000) null,
AMOUNT varchar (8000) null,
[METHOD] varchar (8000) null,
[FROMDATE]	varchar (8000) null,
[TODATE] varchar (8000) null,
[PLACEOFSERVICE] varchar (8000) null,
[PROCEDURECODE] varchar (8000) null,
[MODIFIER1] varchar (8000) null,
[MODIFIER2] varchar (8000) null,
[DIAGNOSISREF1] varchar (8000) null,
[DIAGNOSISREF2] varchar (8000) null,
DIAGNOSISREF3	varchar (8000) null,
DIAGNOSISREF4	varchar (8000) null,
UNITS	varchar (8000) null,
DEPARTMENTID	varchar (8000) null,
NOTES	varchar (8000) null,
UNITAMOUNT	varchar (8000) null,
TRANSFEROUTID varchar (8000) null,
TRANSFERTYPE	varchar (8000) null,
PAYMENTS	varchar (8000) null,
ADJUSTMENTS	varchar (8000) null,
TRANSFERS	varchar (8000) null,
OUTSTANDING	varchar (8000) null,
APPOINTMENTID	varchar (8000) null,
LINENOTE	varchar (8000) null,
PATIENTINSURANCEID	varchar (8000) null,
FEESCHEDULEID	varchar (8000) null,
PROVIDERID	varchar (8000) null,
SUPERVISINGPROVIDERID	varchar (8000) null,
)

--bulk insert
 bulk insert Claims_transactions
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\Claims_transactions.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Claims_transactions

--create table to insert data 
create table Conditions
( 
[START] varchar (4000)null,	
[STOP] Varchar (4000)null,	
PATIENT	varchar (4000) null,
ENCOUNTER varchar (4000) null,
[SYSTEM] varchar (4000) null,
CODE varchar (4000) null,
[DESCRIPTION]	varchar (4000) null
)

--bulk insert
bulk insert Conditions
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\Conditions.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Conditions

--create table to insert data 
create table Devices
( 
[START] varchar (4000)null,	
[STOP] Varchar (4000)null,	
PATIENT	varchar (4000) null,
ENCOUNTER varchar (4000) null,
CODE varchar (4000) null,
[DESCRIPTION]	varchar (4000) null,
[UDI] varchar (4000) null,
)

--bulk insert
bulk insert Devices
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\Devices.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Devices

--create table to insert data 
create table Imaging_studies
(
Id varchar (400)null,
[DATE] varchar (400)null,		
PATIENT	varchar (400) null,
ENCOUNTER varchar (400) null,
[SERIES_UID] varchar (400) null,
BODYSITE_CODE varchar (400) null,
[BODYSITE_DESCRIPTION]	varchar (400) null,
[MODALITY_CODE] varchar (400) null,
[MODALITY_DESCRIPTION] varchar (400) null,
[INSTANCE_UID] varchar (400) null,
SOP_CODE varchar (400) null,
SOP_DESCRIPTION varchar (400) null,
PROCEDURE_CODE varchar (400) null
)

--bulk insert
bulk insert Imaging_studies
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Imaging_studies.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Imaging_studies


--create table to insert data 
create table Immunizations
( 
[DATE] Varchar (1600)null,	
PATIENT	varchar (1600) null,
ENCOUNTER varchar (1600) null,
[Code]	varchar (1600) null,
[DESCRIPTION] varchar (1600) null,
BASE_COST varchar (1600) null
)

--bulk insert
bulk insert Immunizations
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Immunizations.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)


Select * 
From Immunizations


--create table to insert data 
create table Medications
(
[START] varchar (6000)null,	
[STOP] Varchar (6000)null,	
PATIENT	varchar (6000) null,
PAYER varchar (6000) null,
[ENCOUNTER]	varchar (6000) null,
[CODE] varchar (6000) null,
[DESCRIPTION] varchar (6000) null,
[BASE_COST] varchar (6000) null,
PAYER_COVERAGE varchar (6000) null,
DISPENSES varchar (6000) null,
TOTALCOST varchar (6000) null,
REASONCODE varchar (6000) null,
REASONDESCRIPTION varchar (6000) null
)

--bulk insert
bulk insert Medications
 from 'C:\Users\bukky\Documents\ETL Training\Inbound\Medications.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Medications

--create table to insert data 
create table Organizations
( 
[Id] Varchar (300)null,
[NAME] Varchar (300)null,	
[ADDRESS]	varchar (300) null,
CITY varchar (300) null,
[STATE]	varchar (300) null,
[ZIP]	varchar (300) null,
[LAT] varchar (300) null,
[LON]	varchar (300) null,
[PHONE]	varchar (300) null,
[REVENUE]	varchar (300) null,
[UTILIZATION] varchar (300) null
)

--bulk insert
bulk insert Organizations
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Organizations.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Organizations


--create table to insert data 
create table Patients
(
Id varchar (120)null,
[BIRTHDATE] varchar (120)null,	
[DEATHDATE] varchar (120)null,	
[SSN] Varchar (120)null,	
DRIVERS	varchar (120) null,
PASSPORT varchar (120) null,
[PREFIX]	varchar (120) null,
[FIRST] varchar (120) null,
[MIDDLE] varchar (120) null,
[LAST] varchar (120) null,
SUFFIX varchar (120) null,
MAIDEN varchar (120) null,
MARITAL varchar (120) null,
RACE varchar (120) null,
ETHNICITY varchar (120) null,
GENDER varchar (120) null,
BIRTHPLACE varchar (120) null,
[ADDRESS] varchar (120) null,
CITY varchar (120) null,
[STATE] varchar (120) null,
COUNTY varchar (120) null,
FIPS varchar (120) null,
ZIP varchar (120) null,
LAT varchar (120) null,
LON varchar (120) null,
HEALTHCARE_EXPENSES varchar (120) null,
HEALTHCARE_COVERAGE varchar (120) null,
INCOME varchar (120) null,
)

--bulk insert
bulk insert Patients
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Patients.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Patients


--create table to insert data 
create table Payer_transitions
( 
[PATIENT] Varchar (300)null,
[MEMBERID] Varchar (300)null,
[START_DATE] Varchar (300)null,
[END_DATE] varchar (300) null,
PAYER varchar (300) null,
[SECONDARY_PAYER]	varchar (300) null,
[PLAN_OWNERSHIP]	varchar (300) null,
[OWNER_NAME] varchar (300) null,
)

--bulk insert
bulk insert Payer_transitions
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Payer_transitions.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Payer_transitions


--create table to insert data 
create table Payers
(
Id varchar (120)null,
[NAME] varchar (120)null,	
[OWNERSHIP] varchar (120)null,	
[ADDRESS] Varchar (120)null,	
CITY	varchar (120) null,
STATE_HEADQUARTERED varchar (120) null,
[ZIP]	varchar (120) null,
[PHONE] varchar (120) null,
[AMOUNT_COVERED] varchar (120) null,
[AMOUNT_UNCOVERED] varchar (120) null,
REVENUE varchar (120) null,
COVERED_ENCOUNTERS varchar (120) null,
UNCOVERED_ENCOUNTERS varchar (120) null,
COVERED_MEDICATIONS varchar (120) null,
UNCOVERED_MEDICATIONS varchar (120) null,
COVERED_PROCEDURES varchar (120) null,
UNCOVERED_PROCEDURES varchar (120) null,
[COVERED_IMMUNIZATIONS] varchar (120) null,
UNCOVERED_IMMUNIZATIONS varchar (120) null,
[UNIQUE_CUSTOMERS] varchar (120) null,
QOLS_AVG varchar (120) null,
MEMBER_MONTHS varchar (120) null
)

--bulk insert
bulk insert Payers
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Payers.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Payers


--create table to insert data 
create table Procedures
(
[START] varchar (6000)null,	
[STOP] Varchar (6000)null,	
PATIENT	varchar (6000) null,
[ENCOUNTER]	varchar (6000) null,
[SYSTEM] varchar (6000) null,
[CODE] varchar (6000) null,
[DESCRIPTION] varchar (6000) null,
[BASE_COST] varchar (6000) null,
REASONCODE varchar (6000) null,
REASONDESCRIPTION varchar (6000) null
)

--bulk insert
bulk insert Procedures
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Procedures.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Procedures


--create table to insert data 
create table Providers
(
Id varchar (300)null,
[ORGANIZATION] varchar (300)null,
[NAME] varchar (300)null,
[GENDER] Varchar (300)null,	
SPECIALITY	varchar (300) null,
[ADDRESS]	varchar (300) null,
[CITY] varchar (300) null,
[STATE] varchar (300) null,
[ZIP] varchar (300) null,
[LAT] varchar (300) null,
[LON] varchar (300) null,
ENCOUNTERS varchar (300) null,
[PROCEDURES] varchar (300) null
)

--bulk insert
bulk insert Providers
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Providers.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Providers


--create table to insert data 
create table Supplies
(
[DATE] varchar (3000)null,
[PATIENT] varchar (3000)null,
[ENCOUNTER] Varchar (3000)null,	
CODE	varchar (3000) null,
[DESCRIPTION]	varchar (3000) null,
[QUANTITY] varchar (3000) null
)

--bulk insert
bulk insert Supplies
 from 'C:\Users\bukky\Documents\ETL Training\Hospital Project\Supplies.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

Select * 
From Supplies






