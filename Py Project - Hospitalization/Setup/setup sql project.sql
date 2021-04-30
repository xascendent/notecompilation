Note: for email templates see EmailTempalte_<>.htm in the setup docs

New DB Project Hospitalizations
1- VS 2019 new project: SQL Server Database Project 
2- we need to create the project in our hospitalizations DB Git location
NOTE: MAKE SURE you switch to development in git (under swtich/Checkout)
3- I like the . in the names helps in namespaces.  Lets call our project Heal.Hospitalizations.Warehouse  (database is implied)
4- commit the empty project to github (just to make sure it works and check github the development branch)
TEST NOTE: you cannot make the tests UNTIL you add something to the project you can test.


-------------------------------------------------
Create our Hospitalizations Project 
-Rules. 
    Each schema will get it's own folder after you make it in the security folder (which we will also create)

steps:
1- create a security folder
2- right click add new item, goto security and select schema add this code:
CREATE SCHEMA [data]
	AUTHORIZATION [dbo];
3- repeat for reference, stg, raw
4- Make a folder for each schema above
5- add a new folder call development NO SCHEMA 
6- under each folder other than raw / development create a tables folder
7- under each folder other than reference create a folder called stored procedures
8- commit
9- under stg / tables / add a new table called Hospitalizations
code:
    CREATE TABLE [stg].[Hospitalizations]
(
	HospitalizationId BIGINT IDENTITY(1,1) CONSTRAINT PK_stg_hospitalizations PRIMARY KEY,
	Record_id NVARCHAR(2000),
	Adate DATE,
	Ddate DATE,
	Primary_dx NVARCHAR(MAX),
	LoadDate DATETIME CONSTRAINT DF_stg_Hospitalizations_LoadDate DEFAULT(GETDATE())
)

10- under data / tables / add a new table called Hospitalizations
code:
CREATE TABLE [data].[Hospitalizations]
(
	HospitalizationId BIGINT IDENTITY(1,1) CONSTRAINT PK_data_hospitalizations PRIMARY KEY,
	Record_id NVARCHAR(2000),
	Adate DATE,
	Ddate DATE,
	Primary_dx NVARCHAR(MAX),
	Code_Description NVARCHAR(MAX),
	LoadDate DATETIME CONSTRAINT DF_data_Hospitalizations_LoadDate DEFAULT(GETDATE())
)

11- under data / tables add a new table called Hospitalizations_CodesNotFound
code:
CREATE TABLE [data].[Hospitalizations_CodesNotFound]
(
	Hospitalization_CodesNotFoundId BIGINT IDENTITY(1,1) CONSTRAINT PK_data_Hospitalizations_CodesNotFound PRIMARY KEY,
	Record_id NVARCHAR(2000),	
	Primary_dx NVARCHAR(MAX),	
	LoadDate DATETIME CONSTRAINT DF_data_Hospitalizations_CodesNotFound_LoadDate DEFAULT(GETDATE())
)

12- Lets commit
13- build and publish to make sure it's working (you will need to create a new publish file) and connect to our local docker instance.
NOTE you will not have a DB to connect to so change to default and under the database name just call it Heal_Hospitalizations
14- publish
15- goto azure studio and check to see if the db is there

NEXT - Lets add our Email template for notifications

16- Under reference / tables / create EmailTemplates
code:
CREATE TABLE [reference].[EmailTemplates]
(
	EmailTemplateId INT IDENTITY(1,1) CONSTRAINT PK_reference_EmailTemplate PRIMARY KEY,
	SubjectLine NVARCHAR(2000),
	Body NVARCHAR(MAX),
	EmailDescription NVARCHAR(MAX),	
	LoadDate DATETIME CONSTRAINT DF_reference_EmailTemplates_LoadDate DEFAULT(GETDATE())
)

17- open notepad++ and create a new html doc 
<html>
<head>
</head>
<body>
<h4 style="background: #ff0075; position: absolute; top: -20px; left: 2px; width: 100%; height:30px">
<div>Heal Hospitalization Import Error.</div></h4>
<br/>
<h3>Hello,</h3>

<p>The application failed to import the followng file: [FILENAME]<p>
<br/>
<p>[INFO]</p>
<br/>
<h4>System Notification</h4>
</body>
</html>

NEXT - Lets create a Raw sproc that will insert data into our database when we want

18- Under raw / stored procedures / add a new sproc called raw.Post_Load_EmailTemplates
code:
CREATE PROCEDURE [raw].[Post_Load_EmailTemplates]
	@rebuild BIT = 1
AS
	/*
		Reload all template data
	*/

	IF(@rebuild = 1)
	BEGIN

	/*

	Load Order
	1- truncate email templates no FK is used at this time
	2- load templates

	*/

	-- step 1

	TRUNCATE TABLE reference.EmailTemplates;

	--step 2

	INSERT INTO reference.EmailTemplates (SubjectLine, Body, EmailDescription)
	VALUES (N'=?UTF-8?B?4pig?= Heal Import Error',N'<html>
<head>
</head>
<body>
<h4 style="background: #ff0075; position: absolute; top: -20px; left: 2px; width: 100%; height:30px">
<div>Heal Hospitalization Import Error.</div></h4>
<br/>
<h3>Hello,</h3>

<p>The application failed to import the followng file: [FILENAME]<p>
<br/>
<p>[INFO]</p>
<br/>
<h4>System Notification</h4>
</body>
</html>', 
N'Error importing file'
);

	END

RETURN 0


--NEXT Lets Create a Post Load Event 
19- create a new folder call post deployment scripts
20- Right click on the post deployment scripts folder add new item and goto user scripts and select Post-Deployment Script and call it: Script.LoadRawData.sql
21- add this code:
declare @rebuildAllRawData BIT = 1;

IF(@rebuildAllRawData = 1)
BEGIN
--load raw sprocs
exec [raw].Post_Load_EmailTemplates @rebuildAllRawData;
END

--drop sprocs after load
DROP PROCEDURE [raw].Post_Load_EmailTemplates

--drop raw schema since it's not longer used
DROP SCHEMA [raw]

22- build and publish if good then commit 

--Lets add one more template to our email 
add this to our raw sproc as a new insert.
--Unable to find ICD mapping
	INSERT INTO reference.EmailTemplates (SubjectLine, Body, EmailDescription)
	VALUES (N'=?UTF-8?B?4pig?= Heal Import Error',N'
<html>
<head>
</head>
<body>
<h4 style="background: #7b6be8; position: absolute; top: -20px; left: 2px; width: 100%; height:30px">
<div>Heal Hospitalization Unable to find ICD10 Code Error.</div></h4>
<br/>
<h3>Hello,</h3>

<p>The application failed to find ICD10 Codes the followng file: [FILENAME]<p>
<br/>
<p>[INFO]</p>
<br/>
<h4>System Notification</h4>
</body>
</html>',
N'Unable to map codes'
);

23- republish and see if the new values are inserted

24- Noticed that we need a shortCode for our email to use in our sendemail sproc we will create lets add it now.  Open the emailTemplates table and add after email description:
EmailShortCode NVARCHAR(200),

25- Add the new code to our raw sproc add the codes:
'IMPORTERROR' to the Import Error and
'MAPPINGISSUE' to the other email

26- lets add 	EmailShortCode NVARCHAR(200) UNIQUE, to our EmailShortCode  and in our raw sproc add this to the headers:
N'=?UTF-8?B?4pig?= Heal Import Error - [ENVIRONMENT]',  --the env tag

24- build email sproc under stg / stored procedures create stg.SendEmail
Now I have a template I ALWAYS use for sprocs.. Its in the setup folder called SQL template.sql use this template as the base

CODE:
CREATE PROCEDURE [stg].[SendEmail]
	@EmailShortCode NVARCHAR(200),
    @FileName NVARCHAR(200) = '',
    @Info NVARCHAR(2000) = '',
    @Environment NVARCHAR(200) = 'NOT SET',
    @EmailSendMailProfile NVARCHAR(200) = 'localhostDevEmail',
    @EmailUserList NVARCHAR(MAX) = ''
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
exec [stg].[SendEmail] 'IMPORTERROR', 'test.csv', 'something went wrong', 'local dev','localhostDevEmail', 'johnbrumett@gmail.com'  -- we will create a unit test for this

* Example Call STATS:
 SET STATISTICS IO ON 
 GO
 SET STATISTICS TIME ON 
 GO 
	exec [stg].[SendEmail] 'IMPORTERROR', 'test.csv', 'something went wrong', 'local dev','localhostDevEmail', 'johnbrumett@gmail.com' 
 SET STATISTICS IO OFF 
 GO
 SET STATISTICS TIME OFF 
 GO 


* Main Calling SPROC : 
* JIRA Ticket Numbers:
***************************************************************************************************************
Parameter explanations
***************************************************************************************************************
* @EmailShortCode  (Required)     := Code to pass to send user emails

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


        /***********************************************************************************************************\
	Temp Table Cleanup.
\***********************************************************************************************************/

        /***********************************************************************************************************\
	GATE CHECK
\***********************************************************************************************************/	


        /***********************************************************************************************************\
	DECLARES
\***********************************************************************************************************/
DECLARE @TemplateBody NVARCHAR(MAX),
@TemplateSubject NVARCHAR(2000)

        /***********************************************************************************************************\
	SETUP
\***********************************************************************************************************/
SELECT @TemplateBody = Body, @TemplateSubject = SubjectLine FROM [reference].[EmailTemplates]
WHERE EmailShortCode = @EmailShortCode;

        /***********************************************************************************************************\
	EVENT
\***********************************************************************************************************/


        /***********************************************************************************************************\
	Main 
\***********************************************************************************************************/
SELECT @TemplateBody = REPLACE(@TemplateBody, '[FILENAME]', @FileName);
SELECT @TemplateBody = REPLACE(@TemplateBody, '[INFO]', @Info);
SELECT @TemplateSubject = REPLACE(@TemplateSubject, '[ENVIRONMENT]', @Environment);

        /***********************************************************************************************************\
	Send Email
\***********************************************************************************************************/

EXEC msdb.dbo.sp_send_dbmail 
@profile_name = @EmailSendMailProfile,
@blind_copy_recipients = @EmailUserList,
@subject = @TemplateSubject,
@body = @TemplateBody,
@body_format = 'HTML',
@reply_to = 'noreply@hotmail.com'


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


	
RETURN 0



25- publish and commit 

26- lets test the emailer open up azure studio and copy our example call and run it 


------------------------------------------------------------------------
LETS SETUP A TEST! since we have our first sproc
------------------------------------------------------------------------
1- click the SendEmail Sproc and right click -> Create Unit Test 
	New Project name: Heal.Hospitalizations.Warehouse.UnitTests
	Create new class: StgTests_SendEmail_ExpectedPassResults  -- follow the naming <if role>_<schema>Tests_<SPROC or FUNCTION name>_Expected<Pass or Fail>Results.cs otherwise naming gets hard

2- Create a new folder in the UnitTest call stg and a stored procedures under that 

3- Move our new test under that folder 

4- We have two templates to test so go back to the sproc and click the create unit test this time we dont create a project. let the project as above
and in the output class change to StgTest_SendEmail_ExpectedPassResult.cs and OK

5- Go to our tests and we now have two test both name stg_sendEmailTest1 and stg_sendEmailTest lets fix that change the names to:
	SendEmail_IMPORTERROR and SendEmail_MAPPINGISSUE  just click on the Rename after selecting the test in the dropdown 

6- we have no post or pre stuff to do here so just mod the values in the select add:
       @EmailShortCode = 'MAPPINGISSUE',
       @FileName = 'testing framework',
       @Info = 'testing framework info',
       @Environment = 'sql unit tests',
       @EmailSendMailProfile = 'localhostDevEmail',
       @EmailUserList = 'johnbrumett@gmail.com';

and
       @EmailShortCode = 'IMPORTERROR',
       @FileName = 'testing framework',
       @Info = 'testing framework info',
       @Environment = 'sql unit tests',
       @EmailSendMailProfile = 'localhostDevEmail',
       @EmailUserList = 'johnbrumett@gmail.com';

leave the inconclusive tests for now.. commit 

7- click the tests and bring up the test explorer adn run all  
IF ERROR the database config is most likely wrong in the unit tests.. Click on app.config 
I was missing the Initial Catalog and added it and password info.

8- Check our email to see if we got our response 

9- now lets delete the inconclusive test and add data checksum and click the properities to configure . Select our connection (you might have to add one) and retrieve and click OK
in our case zero is the good status do the same for the other test 

10- rerun the tests and we should be green. if so commit 

