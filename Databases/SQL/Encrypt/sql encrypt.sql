--USE CustomerData;
--GO
--CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'SQLShack@1';

--SELECT name KeyName, 
--    symmetric_key_id KeyID, 
--    key_length KeyLength, 
--    algorithm_desc KeyAlgorithm
--FROM sys.symmetric_keys;

--USE CustomerData;
--GO
--CREATE CERTIFICATE Certificate_test WITH SUBJECT = 'Protect my data';
--GO

--SELECT name CertName, 
--    certificate_id CertID, 
--    pvt_key_encryption_type_desc EncryptType, 
--    issuer_name Issuer
--FROM sys.certificates;

--CREATE SYMMETRIC KEY SymKey_test WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE Certificate_test;

--SELECT name KeyName, 
--    symmetric_key_id KeyID, 
--    key_length KeyLength, 
--    algorithm_desc KeyAlgorithm
--FROM sys.symmetric_keys;

--ALTER TABLE CustomerData.dbo.CustomerInfo
--ADD BankACCNumber_encrypt varbinary(MAX)

--OPEN SYMMETRIC KEY SymKey_test
--        DECRYPTION BY CERTIFICATE Certificate_test;

--                UPDATE CustomerData.dbo.CustomerInfo
--        SET BankACCNumber_encrypt = EncryptByKey (Key_GUID('SymKey_test'), BankACCNumber)
--        FROM CustomerData.dbo.CustomerInfo;
--        GO

--                CLOSE SYMMETRIC KEY SymKey_test;
--            GO

--ALTER TABLE CustomerData.dbo.CustomerInfo DROP COLUMN BankACCNumber;
--GO
--SELECT * FROM dbo.CustomerInfo


--OPEN SYMMETRIC KEY SymKey_test
--        DECRYPTION BY CERTIFICATE Certificate_test;

--                SELECT CustID, CustName,BankACCNumber_encrypt AS 'Encrypted data',
--            CONVERT(varchar, DecryptByKey(BankACCNumber_encrypt)) AS 'Decrypted Bank account number'
--            FROM CustomerData.dbo.CustomerInfo;