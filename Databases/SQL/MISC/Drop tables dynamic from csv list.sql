
DECLARE @dsql NVARCHAR(MAX)
SELECT @dsql = STUFF((SELECT  s.name + '.' + t.name + ',' 
            FROM sys.tables t
			INNER JOIN
			sys.schemas s
			ON
			s.schema_id = t.schema_id
            WHERE s.name = 'onboard'            
        FOR XML PATH('')), 1, 0, '')		


SET @dsql = 'DROP TABLE ' + @dsql

set @dsql =  SUBSTRING(@dsql, 1, (LEN(@dsql) - 1))

EXEC sp_executesql @dsql
