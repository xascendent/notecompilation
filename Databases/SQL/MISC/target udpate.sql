 --ADD ABC 
 UPDATE [target]
 SET [target].Provider_Included_in_ABC = [source].IncludeInABC
 FROM #SASproviders [target]
 INNER JOIN [list].[ProviderABC] [source]
 ON [target].ProviderID = [source].ProviderID;