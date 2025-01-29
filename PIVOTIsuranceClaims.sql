use EmadeDev

Select *
From InsuranceClaims

--Insert Data

--Create a PIVOT To Show The DocName To Columns
Select *
From 
(
Select
[RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
  FROM [EmadeDev].[dbo].[InsuranceClaims]

group by [RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
)Source_table
Pivot(count([DocName])
For DocName in([DocA],[DocB], [DocC], [DocD],[DocE], [DocF])) as Target_table

--Create a PIVOT To Show The Submitted To Columns
Select *
From 
(
Select
[RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
  FROM [EmadeDev].[dbo].[InsuranceClaims]

group by [RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
)Source_table
Pivot(AVG([Submitted])
For Submitted in([0], [1])) as Target_table

--Create a PIVOT To Show The EffectiveDate As Column Instead of Row
Select *
From 
(
Select
[RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
  FROM [EmadeDev].[dbo].[InsuranceClaims]

group by [RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
)Source_table
Pivot(COUNT([EffectiveDate])
For EffectiveDate in([2007-10-01],[2008-11-01])) as Target_table

Select *
From 
(
Select
[RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
  FROM [EmadeDev].[dbo].[InsuranceClaims]

group by [RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
)Source_table
Pivot(AVG([Submitted])
For EffectiveDate in([2007-10-01],[2008-11-01])) as Target_table

--Create a PIVOT To Show The PollNumber As Column Instead of Row
Select *
From 
(
Select
[RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
  FROM [EmadeDev].[dbo].[InsuranceClaims]

group by [RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
)Source_table
Pivot(COUNT([PollNumber])
For PollNumber in([Pol002],[Pol003])) as Target_table

Select *
From 
(
Select
[RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
  FROM [EmadeDev].[dbo].[InsuranceClaims]

group by [RecKey]
      ,[PolID]
      ,[PollNumber]
      ,[PollType]
      ,[EffectiveDate]
      ,[DocID]
      ,[DocName]
      ,[Submitted]
)Source_table
Pivot(AVG([Submitted])
For PollNumber in([Pol002],[Pol003])) as Target_table

