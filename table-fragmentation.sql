

-- Find the average fragmentation percentage of all indexes  
SELECT a.index_id, name, avg_fragmentation_in_percent  
FROM sys.dm_db_index_physical_stats (DB_ID(N'databaseName'), 
      OBJECT_ID(N'dbo.[tableName]'), NULL, NULL, NULL) AS a  
    JOIN sys.indexes AS b 
      ON a.object_id = b.object_id AND a.index_id = b.index_id;   
GO  


--ALTER INDEX [IDX_U_tableName_primary_index] ON dbo.[tableName]
--REBUILD with (ONLINE = ON, FILLFACTOR = 80, SORT_IN_TEMPDB = ON,
--              STATISTICS_NORECOMPUTE = ON);

