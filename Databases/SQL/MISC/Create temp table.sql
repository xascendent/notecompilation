        /***********************************************************************************************************\
	Temp Table Cleanup
\***********************************************************************************************************/
IF OBJECT_ID('tempdb..#STArTUserInfo') IS NOT NULL
    DROP TABLE tempdb.#STArTUserInfo;

    CREATE TABLE #STArTUserInfo
(
    UserObjectGuid NVARCHAR(100),
	SamAccountName NVARCHAR(2000),
    SiteAcronym NVARCHAR(10),
    SiteId INT,
    RoleName NVARCHAR(MAX),
    SiteUserAutoGenId BIGINT
);