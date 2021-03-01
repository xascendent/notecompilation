DECLARE @jsonmessage NVARCHAR(MAX)
    = N'{
	"upsertADusers": [{
		"ObjectGuid": "df227088-fccb-4003-beb8-87a0bcf370ea",
		"SamAccountName": "tlacy",
		"Mail": "Terry.Lacy@hsc.utah.edu",
		"GivenName": "Terry",
		"Sn": "Lacy"
	}, {
		"ObjectGuid": "0b1dd6ec-6a4b-40f0-9891-2cfe99ffa5df",
		"SamAccountName": "jbrumett",
		"Mail": "john.brumett@hsc.utah.edu",
		"GivenName": "John",
		"Sn": "Brumett"
	}, {
		"ObjectGuid": "e7e9331e-19b2-4b98-8668-0a6384eea115",
		"SamAccountName": "mmaheshwary",
		"Mail": "Mayank.Maheshwary@hsc.utah.edu",
		"GivenName": "Mayank",
		"Sn": "Maheshwary"
	},  {
		"ObjectGuid": "348ecb78-b8d3-4211-ac0c-f17267bf1cea",
		"SamAccountName": "bhulsey",
		"Mail": "Brent.Hulsey@hsc.utah.edu",
		"GivenName": "Brent",
		"Sn": "Hulsey"
	},{
		"ObjectGuid": "da21d277-bf68-4ea1-8ade-6bc253ce5372",
		"SamAccountName": "joess",
		"Mail": "joseph.ess@hsc.utah.edu",
		"GivenName": "Joseph",
		"Sn": "Ess"
	}]
}';


IF OBJECT_ID('tempdb..#GROUPERSITESFORUSER') IS NOT NULL
    DROP TABLE tempdb.#GROUPERSITESFORUSER;
IF OBJECT_ID('tempdb..#NORMALIZEDGROUPERUSER') IS NOT NULL
    DROP TABLE tempdb.#NORMALIZEDGROUPERUSER;

CREATE TABLE #GROUPERSITESFORUSER
(
    [key] BIGINT,
    [value] NVARCHAR(MAX)
);

CREATE TABLE #NORMALIZEDGROUPERUSER
(
    id BIGINT IDENTITY(1, 1),
    ObjectGuid NVARCHAR(MAX),
    SamAccountName NVARCHAR(2000),
    Mail NVARCHAR(2000),
    GivenName NVARCHAR(MAX),
    Sn NVARCHAR(MAX)
);




INSERT INTO #GROUPERSITESFORUSER
(
    [key],
    value
)
SELECT [Key],
       [Value]
FROM OPENJSON(@jsonmessage, '$.upsertADusers');




DECLARE @ipos BIGINT = 0,
        @imax BIGINT =
        (
            SELECT COUNT(*) FROM #GROUPERSITESFORUSER
        ),
        @jsonUser NVARCHAR(MAX);

WHILE (@ipos < @imax)
BEGIN
    SELECT @jsonUser = [value]
    FROM #GROUPERSITESFORUSER
    WHERE [key] = @ipos;

    INSERT INTO #NORMALIZEDGROUPERUSER
    (
        ObjectGuid,
        SamAccountName,
        Mail,
        GivenName,
        Sn
    )
    SELECT ObjectGuid,
           SamAccountName,
           Mail,
           GivenName,
           Sn
    FROM
        OPENJSON(@jsonUser, '$')
        WITH
        (
            ObjectGuid VARCHAR(MAX) '$.ObjectGuid',
            SamAccountName VARCHAR(MAX) '$.SamAccountName',
            Mail VARCHAR(MAX) '$.Mail',
            GivenName VARCHAR(MAX) '$.GivenName',
            Sn VARCHAR(MAX) '$.Sn'
        );
    SET @ipos = @ipos + 1;
END;


-----------------MERGE TIME
MERGE INTO management.Users AS TARGET
USING
(
    SELECT ObjectGuid,
           SamAccountName,
           Mail,
           GivenName,
           Sn
    FROM #NORMALIZEDGROUPERUSER
) AS SOURCE
ON TARGET.ObjectGuid = SOURCE.ObjectGuid
WHEN MATCHED THEN
    UPDATE SET TARGET.SamAccountName = SOURCE.SamAccountName,
               TARGET.UserEmail = SOURCE.Mail,
               TARGET.UserName = COALESCE(SOURCE.GivenName, '') + COALESCE(SOURCE.Sn, ''),
			   TARGET.Active = 1
WHEN NOT MATCHED BY TARGET THEN
    INSERT
    (
        ObjectGuid,
        SamAccountName,
        UserEmail,
        UserName
    )
    VALUES
    (ObjectGuid, SamAccountName, Mail, COALESCE(SOURCE.GivenName, '') + COALESCE(SOURCE.Sn, ''))
WHEN NOT MATCHED BY SOURCE THEN
    UPDATE SET TARGET.Active = 0;


IF OBJECT_ID('tempdb..#GROUPERSITESFORUSER') IS NOT NULL
    DROP TABLE tempdb.#GROUPERSITESFORUSER;
IF OBJECT_ID('tempdb..#NORMALIZEDGROUPERUSER') IS NOT NULL
    DROP TABLE tempdb.#NORMALIZEDGROUPERUSER;