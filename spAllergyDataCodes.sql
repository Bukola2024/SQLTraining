USE [EmadeDev]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spPullAllergyData]
		@Category = NULL,
		@Startyear = NULL

SELECT	'Return Value' = @return_value

GO
