
-- =============================================
-- Developer:	Bukola
-- Create date: 02/06/25
-- Description:	Create Stored Procedure on Observation Table
-- =============================================
CREATE or ALTER PROCEDURE spObservations
	-- Add the parameters for the stored procedure here
	@Category varchar(8000)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From Observations
	where Category = @Category
END
GO

spObservations laboratory
spObservations survey
spObservations 'vital-signs'
spObservations 'social-history'