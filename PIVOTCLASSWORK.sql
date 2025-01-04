Use EmadeDev

Select *
From 
(
Select year,pct_female_students
From university_year
group by year,pct_female_students
)Source_table
Pivot(count([year])
For year in([2011],[2012],[2013],[2014],[2015],[2016])) as Target_table

Select *
From [dbo].[Allergies]

--Show record count for each table in Allergies category

Select *
From Allergies_Food

Select *
From Allergies_Medication

Select *
From Allergies_Environment

Select *
From 
(
Select [category],[system],[description]
From Allergies
group by category,system,description
)Source_table
Pivot(count([category])
For category in([environment],[food],[medication])) as Target_table

