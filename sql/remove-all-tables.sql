

/***************************************************************************************************/
/******                Remove all existing FK constraints before dropping tables              ******/
/***************************************************************************************************/

DECLARE @drop   NVARCHAR(MAX) = N'';
SELECT @drop += N'
ALTER TABLE ' + QUOTENAME(cs.name) + '.' + QUOTENAME(ct.name) 
    + ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + ';'
FROM sys.foreign_keys AS fk
INNER JOIN sys.tables AS ct
  ON fk.parent_object_id = ct.[object_id]
INNER JOIN sys.schemas AS cs 
  ON ct.[schema_id] = cs.[schema_id];

EXEC sp_executesql @drop
go

/***************************************************************************************************/
/******                Remove all existing check constraints before dropping tables           ******/
/***************************************************************************************************/

DECLARE @drop   NVARCHAR(MAX) = N'';
SELECT @drop += N'
ALTER TABLE ' + QUOTENAME(cs.name) + '.' + QUOTENAME(ct.name) 
    + ' DROP CONSTRAINT ' + QUOTENAME(cc.name) + ';'
FROM sys.check_constraints AS cc
INNER JOIN sys.tables AS ct
  ON cc.parent_object_id = ct.[object_id]
INNER JOIN sys.schemas AS cs 
  ON ct.[schema_id] = cs.[schema_id];

EXEC sp_executesql @drop
go


/***************************************************************************************************/
/******                Remove all tables                                                      ******/
/***************************************************************************************************/
DECLARE @drop   NVARCHAR(MAX) = N'';

SELECT @drop += N'ALTER TABLE ' + QUOTENAME(cs.name) + '.' + QUOTENAME(ct.name) + ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + ';'
FROM sys.foreign_keys AS fk
INNER JOIN sys.tables AS ct
    ON fk.parent_object_id = ct.[object_id]
INNER JOIN sys.schemas AS cs
    ON ct.[schema_id] = cs.[schema_id];

EXEC sp_executesql @drop


Declare @ObjName NVARCHAR(500), @ObjType NVARCHAR(50)
Declare cur Cursor For Select [name], [type] From sys.objects where type IN ('P', 'FN', 'V', 'TF', 'U') and is_ms_shipped = 0
Open cur 
Fetch Next From cur Into @ObjName,@ObjType
While @@fetch_status = 0 
Begin 
        SET @drop = CASE @ObjType
                WHEN 'FN' THEN 'drop function '
                WHEN 'TF' THEN 'drop function '
                WHEN 'P' THEN 'drop procedure ' 
                WHEN 'V' THEN 'drop view '
                WHEN 'U' THEN 'drop table '
        END + @ObjName

        EXEC(@drop) 

        FETCH Next From cur Into @ObjName, @ObjType
End
Close cur 
Deallocate cur 

/***************************************************************************************************/
/******                Remove all user-defined types                                          ******/
/***************************************************************************************************/
declare @stmt nvarchar(max)

select  @stmt = isnull( @stmt + '', '') + 'drop type ' + quotename(schema_name(schema_id)) + '.' + quotename(name) + CHAR(13) 
from sys.types
where is_user_defined = 1
 
--print @stmt
exec sp_executesql @stmt
