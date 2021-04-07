DECLARE @JSONMessage NVARCHAR(MAX),
        @IT_User_SamAccount NVARCHAR(MAX) = N'JOHN',
        @Nedarc_User_SamAccount NVARCHAR(MAX) = N'PATTY',
        @PortalId INT = 123;

--Set Transaction
BEGIN TRAN hospitalUpdate;

--update target
UPDATE [target]
SET [target].PortalId = [source].PortalId,
    [target].StateId = [source].StateId,
    [target].HospitalName = [source].HospitalName,
    [target].Address1 = [source].Address1,
    [target].Address2 = [source].Address2,
    [target].City = [source].City,
    [target].CountyId = [source].CountyId,
    [target].Zip = [source].Zip,
    [target].Comment = [source].Comment,
    [target].SiteTypeId = [source].SiteTypeId,
    [target].ContactName = [source].ContactName,
    [target].ContactTitle = [source].ContactTitle,
    [target].ContactEmail = [source].ContactEmail,
    [target].ContactPhone = [source].ContactPhone,
    [target].ContactExt = [source].ContactExt,
    [target].StateRegionName = [source].StateRegionName,
    [target].TraumaId = [source].TraumaId,
    [target].RecognitionId = [source].RecognitionId
FROM [management].[Shared_Hospitals] [target]
    INNER JOIN [imported].[Clms_UpdateHospitalRecords] [source]
        ON [target].PortalId = [source].PortalId;

COMMIT TRAN hospitalUpdate;