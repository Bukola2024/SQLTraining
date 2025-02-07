USE [EmadeDev]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spEncountersData]
		@Encounterclass = NULL

SELECT	'Return Value' = @return_value

GO
