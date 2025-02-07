
-- =============================================
-- Developer:	Bukola Popoola
-- Create date: 02/06/2025
-- Description:	Initial Process To Create Stored Procedure on Encounters Table
--02/06/25: Adding Parameter @Encounterclass to The Stored Procedure Using the Encounterclass field
-- =============================================
CREATE or ALTER PROCEDURE spEncountersData
	-- Add the parameters for the stored procedure here
	@Encounterclass varchar(4000)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From Encounters
	Where Encounterclass = @Encounterclass
END
GO

Exec spEncountersData ambulatory
Exec spEncountersData wellness
Exec spEncountersData urgentcare
Exec spEncountersData emergency
Exec spEncountersData inpatient
Exec spEncountersData outpatient
Exec spEncountersData home
Exec spEncountersData virtual

