DECLARE @jsonMessage NVARCHAR(MAX);

SET @jsonMessage = '{
	"users": {
		"userId": "fflintstone",
		"userName": "Fred Flintstone",
		"email": "fred@slaterockandgravel.com",
		"groupingDataAdmin": true,
		"userAdmin": false,
		"allProviderManagementSites": false,
        "active": true,
		"providerManagementSites": [
			"CHOP",
			"UDCC",
			"CINC"
		]
	}
}';

SELECT *
FROM OPENJSON ( @jsonMessage, '$.users' )  
WITH (   
      userId varchar(MAX)  '$.userId' ,
	userName varchar(MAX)  '$.userName',
	email varchar(MAX)  '$.email',
	groupingDataAdmin  varchar(MAX)  '$.groupingDataAdmin',
	userAdmin VARCHAR(max) '$.userAdmin',
	allProviderManagementSites VARCHAR(max) '$.allProviderManagementSites'
 ); 

 SELECT * FROM OPENJSON( @jsonMessage, '$.users.providerManagementSites')
 WITH (
 sites VARCHAR(max) '$'
 );

