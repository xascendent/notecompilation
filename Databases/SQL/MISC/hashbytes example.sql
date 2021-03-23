create table dbo.test (
    PortalId INT,
    StateId INT,    
    [testHash]  AS (HASHBYTES('SHA2_256',
    (((((((((((((((UPPER(LTRIM(RTRIM(ISNULL(CONVERT([NVARCHAR],[PortalId],(0)),'~'))))
    +
    UPPER(LTRIM(RTRIM(ISNULL(CONVERT([NVARCHAR],[StateId],(0)),'~')))))+UPPER(LTRIM(RTRIM(ISNULL([HospitalName],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([Address1],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([Address2],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([City],'~')))))+UPPER(LTRIM(RTRIM(ISNULL(CONVERT([NVARCHAR],[CountyId],(0)),'~')))))+UPPER(LTRIM(RTRIM(ISNULL([Zip],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([Comment],'~')))))+UPPER(LTRIM(RTRIM(ISNULL(CONVERT([NVARCHAR],[Active],(0)),'~')))))+UPPER(LTRIM(RTRIM(ISNULL(CONVERT([NVARCHAR],[SiteTypeId],(0)),'~')))))+UPPER(LTRIM(RTRIM(ISNULL([ContactName],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([ContactTitle],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([ContactEmail],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([ContactPhone],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([ContactExt],'~')))))+UPPER(LTRIM(RTRIM(ISNULL([StateRegionName],'~')))))),
)