
 --Create Master Sets
MERGE INTO management.Users AS TARGET
USING
(
    SELECT ObjectGuid,
           SamAccountName,
           DistinguishedName,
           Mail,
           GivenName,
           Sn,
           Active
    FROM @adAccounts --this can also be from a table
) AS SOURCE
ON TARGET.ObjectGuid = SOURCE.ObjectGuid
WHEN MATCHED THEN
    UPDATE SET TARGET.SamAccountName = SOURCE.SamAccountName,
               TARGET.DistinguishedName = SOURCE.DistinguishedName,
               TARGET.Mail = SOURCE.Mail,
               TARGET.GivenName = SOURCE.GivenName,
               TARGET.Sn = SOURCE.Sn,
               TARGET.Active = SOURCE.Active
WHEN NOT MATCHED BY TARGET THEN
    INSERT
    (
        ObjectGuid,
        SamAccountName,
        DistinguishedName,
        Mail,
        GivenName,
        Sn
    )
    VALUES
    (ObjectGuid, SamAccountName, DistinguishedName, Mail, GivenName, Sn)
    WHEN NOT MATCHED BY SOURCE 
THEN DELETE;

--also you can add more statements to the delete so it doesn't wipe everythign out
WHEN NOT MATCHED BY SOURCE
AND TARGET.UserId IN (@UserId) 
THEN
DELETE;


--YOU CAN ALSO GET WHAT WAS MERGED

--one of three values for each row: 'INSERT', 'UPDATE', or 'DELETE' according to the action that was performed on that row
OUTPUT $action, 
DELETED.ProductID AS TargetProductID, 
DELETED.ProductName AS TargetProductName, 
DELETED.Rate AS TargetRate, 
INSERTED.ProductID AS SourceProductID, 
INSERTED.ProductName AS SourceProductName, 
INSERTED.Rate AS SourceRate; 
