Use EmadeDev

-- =============================================
-- Developer:	Bukola Popoola
-- Create date: 01/25/2025
-- Description:	Initial Process To PullAllergyData
--01/25/25: Adding Parameter @Category to The Stored Procedure Using the Category field
-- =============================================
CREATE OR ALTER PROCEDURE spPullAllergyData 
	-- Add the parameters for the stored procedure here
	(@Category VARCHAR(50), 
	@Startyear DATE)
--Set @Startyear = LEFT(Start,4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [START],
year (Start) as Startyear
      ,[STOP]
      ,[PATIENT]
      ,[ENCOUNTER]
      ,[CODE]
      ,[SYSTEM]
      ,[DESCRIPTION]
      ,[TYPE]
      ,[CATEGORY]
      ,[REACTION1]
      ,[DESCRIPTION1]
      ,[SEVERITY1]
      ,[REACTION2]
      ,[DESCRIPTION2]
      ,[SEVERITY2]
  FROM [EmadeDev].[dbo].[Allergies]
WHERE Category = @Category
AND LEFT(Start,4) = @Startyear
END
GO

Execute [dbo].[spPullAllergyData] @Category = 'food', @Startyear = '1990'
Execute [dbo].[spPullAllergyData] 'food', '1990'