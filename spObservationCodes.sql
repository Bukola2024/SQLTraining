USE [EmadeDev]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spObservations]
		@Category = NULL

SELECT	'Return Value' = @return_value

GO
