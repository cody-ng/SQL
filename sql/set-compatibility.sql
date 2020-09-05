



--ALTER DATABASE [vit-db-1]  
----SET COMPATIBILITY_LEVEL = 130;
--SET COMPATIBILITY_LEVEL = 110;
--GO  

--declare @dbname nvarchar(max) = 'vit-db-schemacheck'
--declare @dbname nvarchar(max) = 'vit-db-1'
--declare @dbname nvarchar(max) = 'vit-db-1-dev'
declare @old_compatibility_level int
--declare @dbname nvarchar(max)
DECLARE @dbname sysname
select @dbname=db_name()


SELECT @old_compatibility_level=compatibility_level  FROM sys.databases WHERE name = @dbname;

-- SELECT compatibility_level  FROM sys.databases WHERE name = db_name();

--EXECUTE( 'ALTER DATABASE [' + @dbname + '] SET COMPATIBILITY_LEVEL = 140' )
EXECUTE( 'ALTER DATABASE [' + @dbname + '] SET COMPATIBILITY_LEVEL = 130' )
--EXECUTE( 'ALTER DATABASE [' + @dbname + '] SET COMPATIBILITY_LEVEL = 110' )

SELECT compatibility_level  FROM sys.databases WHERE name = @dbname;

--EXECUTE( 'ALTER DATABASE [' + @dbname + '] SET COMPATIBILITY_LEVEL = ' + @old_compatibility_level  )
--SELECT compatibility_level  FROM sys.databases WHERE name = @dbname;
