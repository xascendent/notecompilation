 CREATE PROCEDURE [SCHEMA].[NAME]
 	@SamAccountName VARCHAR(2000) -- I like to pass in the user making the call to the sproc for logging
AS
SET NOCOUNT ON;
/**************************************************************************************************************
* NOTES: 
* Program:		
* Directory:	
* Author(s):	John Brumett
* Project:		
* Purpose: 		
* Start Date:	
* Last Revised:	
* Reviewed by:  
* Review date:  
* Example Call: 
exec [SCHEMA].[NAME]
'jbrumett'

* Example Call STATS:
 SET STATISTICS IO ON 
 GO
 SET STATISTICS TIME ON 
 GO 
	exec [SCHEMA].[NAME] 'jbrumett'
 SET STATISTICS IO OFF 
 GO
 SET STATISTICS TIME OFF 
 GO 


* Main Calling SPROC : 
* JIRA Ticket Numbers:
***************************************************************************************************************
Parameter explanations
***************************************************************************************************************
* @SamAccountName  (Required)     := User Id that is calling the SPROC this field is logged 
* @blah	   (NOT Required)     := Incoming Medication Id used to update the record


***************************************************************************************************************
Sproc description
***************************************************************************************************************


* More info can be found here : WIKI Address
***************************************************************************************************************
Modifications post review: A revision block must be completed for each set of changes made post QC
***************************************************************************************************************
* Author:		
* Date:				
* Changes made:
* Reviewed by:
* Review date:
**************************************************************************************************************
***************************************************************************************************************
Description of changes
***************************************************************************************************************
* (DESC to changes to the sproc.  Be sure to include a date / reviewer info to the section of the sproc that was changed)

*/

BEGIN
    BEGIN TRY
        /***********************************************************************************************************\
	Debug
\***********************************************************************************************************/
-- used to run everything below you just take the sproc inputs and add them here so you don't have to exec the sproc 
-- when troubleshooting

        /***********************************************************************************************************\
	Temp Table Cleanup.
\***********************************************************************************************************/
-- example:
-- IF OBJECT_ID('tempdb..#yourtemptablename') IS NOT NULL 
--    DROP TABLE tempdb.#yourtemptablename;

        /***********************************************************************************************************\
	GATE CHECK
\***********************************************************************************************************/	
-- Functions to check validation go here
-- always Throw Error  example:  ;THROW 50001, N'Unable to do something', 1; --fail to calling app in catch


        /***********************************************************************************************************\
	DECLARES
\***********************************************************************************************************/
-- all local declare states including temp tables

        /***********************************************************************************************************\
	SETUP
\***********************************************************************************************************/
-- setup for the declares above or any other prep work

        /***********************************************************************************************************\
	EVENT
\***********************************************************************************************************/
-- Sproc logger tables


        /***********************************************************************************************************\
	Main 
\***********************************************************************************************************/
-- do all your big stuff here

        /***********************************************************************************************************\
	Create Result set table.
\***********************************************************************************************************/
-- return to calling app here	

        /***********************************************************************************************************\
	Temp Table Cleanup.
\***********************************************************************************************************/

        RETURN 0; --NO ERRORS ON RUN
    END TRY
    BEGIN CATCH

        /***********************************************************************************************************\
	AppExceptions Handling.
\***********************************************************************************************************/
-- do exception things like roll backs

        /***********************************************************************************************************\
	Temp Table Cleanup
\***********************************************************************************************************/

        /***********************************************************************************************************\
	Thorw Error To EF or calling framework
\***********************************************************************************************************/
        DECLARE @JSONErrorMessage NVARCHAR(MAX);

        SET @JSONErrorMessage
            = N'{
"customMessage":"' + CAST(ERROR_MESSAGE() AS NVARCHAR(MAX)) + N'",
"severity":"' + CAST(ERROR_SEVERITY() AS NVARCHAR(200)) + N'",
"errorNumber":"' + CAST(ERROR_NUMBER() AS NVARCHAR(200)) + N'",
"state":"' + CAST(ERROR_STATE() AS NVARCHAR(32)) + N'",
"storedProcedure":"'
              + CAST((QUOTENAME(OBJECT_SCHEMA_NAME(@@ProcId)) + '.' + QUOTENAME(OBJECT_NAME(@@ProcId))) AS NVARCHAR(2000))
              + N'"
}'    ;

        /***********************************************************************************************************\
	EVENT
\***********************************************************************************************************/
-- Sproc logger tables
            
        /***********************************************************************************************************\
	Temp Table Cleanup
\***********************************************************************************************************/

        THROW 50101, @JSONErrorMessage, 1; --fail return error to calling app
    END CATCH;
END;

