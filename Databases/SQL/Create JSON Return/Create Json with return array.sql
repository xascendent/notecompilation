  DECLARE @ApplicationLoggerMessage NVARCHAR(MAX),
                @jsonRType NVARCHAR(MAX),
                @jsonTemp NVARCHAR(MAX);

        /***********************************************************************************************************\
	SETUP
\***********************************************************************************************************/
        SET @jsonRType = N'{"providerCertifications":{ "providerId": "[PROVIDER]", "siteAcronym": "[SITE]",';


        SET @jsonTemp =
        (
            SELECT certification,
                   certDateStart,
                   COALESCE(certDateEnd, '') AS certDateEnd
            FROM management.[ProviderCertifcationDates]
            WHERE providerId = @ProviderId
                  AND siteAcronym = @SiteAcronym
            ORDER BY certDateStart DESC
            FOR JSON AUTO, ROOT('certifications')  --creates root name remove if not needed
        );

            --format values for json result
        SET @jsonTemp = SUBSTRING(@jsonTemp, 2, (LEN(@jsonTemp) - 1));

        SET @jsonRType = REPLACE(@jsonRType, '[PROVIDER]', @ProviderId);

		SET @jsonRType = REPLACE(@jsonRType, '[SITE]', @SiteAcronym);

        SET @jsonRType = @jsonRType + @jsonTemp;


        SET @jsonRType = REPLACE(@jsonRType, '"1900-01-01"', 'null'); --remove 1900 nulls and convert to null

        SET @jsonRType = @jsonRType + N'}';

        SELECT @jsonRType AS result;


        --------------------example 2

        DECLARE @samAccountName VARCHAR(2000),
        @siteRoleDescription NVARCHAR(MAX),
        @objectGuid UNIQUEIDENTIFIER;

DECLARE @jsonRType NVARCHAR(MAX),
@jsonTemp NVARCHAR(MAX);

SET @jsonRType = N'{ "SamAccount": "[SAMACCOUNT]", "Role": "[SITEROLE]",';


SELECT TOP (1)
       @objectGuid = r.ObjectGuid,
       @samAccountName = u.[SamAccountName],
       @siteRoleDescription = sr.SiteRoleDescription
FROM [management].[Clms_Users] u
    INNER JOIN [management].[Clms_UsersToRoles] r
        ON u.ObjectGuid = r.ObjectGuid
    INNER JOIN [reference].[Clms_SiteRoles] sr
        ON sr.SiteRoleId = r.SiteRoleId
		ORDER BY r.ObjectGuid;

SET @jsonRType =  REPLACE(@jsonRType, '[SAMACCOUNT]', @samAccountName);
SET @jsonRType =  REPLACE(@jsonRType, '[SITEROLE]', @siteRoleDescription);

IF (@siteRoleDescription IN ( 'Administrator', 'SuperUser' ))
BEGIN
    SET @jsonTemp = 
	(
		SELECT StateName FROM [reference].[Shared_States]
		WHERE Active = 1
		ORDER BY StateName ASC
        FOR JSON AUTO, ROOT('States')
	)
END;

IF (@siteRoleDescription IN ( 'Manager', 'User' ))
BEGIN
 SET @jsonTemp = 
	(
    SELECT s.StateName
    FROM [management].[Clms_UsersToStates] us
        INNER JOIN [reference].[Shared_States] s
            ON s.StateId = us.StateId
    WHERE us.ObjectGuid = @objectGuid
	ORDER BY s.StateName ASC 
	FOR JSON AUTO, ROOT('States')
	)
END;
    --format values for json result
        SET @jsonTemp = SUBSTRING(@jsonTemp, 2, (LEN(@jsonTemp) - 1)); --remove first {
		SET @jsonTemp = SUBSTRING(@jsonTemp, 1, (LEN(@jsonTemp) - 1)); --remove last }

SET @jsonRType = @jsonRType + @jsonTemp;

SET @jsonRType = @jsonRType + N'}';

        SELECT @jsonRType AS result;


