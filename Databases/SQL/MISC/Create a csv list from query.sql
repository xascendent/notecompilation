SELECT  STUFF((SELECT  ' , ' + s.name + '.' + t.name 
            FROM sys.tables t
			INNER JOIN
			sys.schemas s
			ON
			s.schema_id = t.schema_id
            WHERE s.name = 'onboard'            
        FOR XML PATH('')), 1, 1, '') AS listStr