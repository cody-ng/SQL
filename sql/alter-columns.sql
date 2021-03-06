
--------------------------------------------
-- drop table stuff
--------------------------------------------
--ALTER TABLE [dbo].[TableABC] drop constraint DF_TableABC_ColumnXYZ

--ALTER TABLE [dbo].[TableABC] drop constraint FK_TableABC_UserId

--ALTER TABLE [dbo].[TableABC] drop column [ColumnABC]

--DROP TABLE IF EXISTS [dbo].[TableABC]


--------------------------------------------
-- drop index
--------------------------------------------
--DROP INDEX [IDX_TableABC] ON [dbo].[TableABC]


--------------------------------------------
-- add table stuff
--------------------------------------------
--ALTER TABLE [TableABC] add [TimeZoneName] [nvarchar](100) NULL

--ALTER TABLE [TableABC] add [UserId] [bigint] NULL
--    CONSTRAINT [FK_TableABC_Id] 
--    FOREIGN KEY REFERENCES [dbo].[Users] ([UserId])

--ALTER TABLE [TableABC] add [IsClosed] [bit] NOT NULL CONSTRAINT [DF_TableABC_IsClosed] DEFAULT (0)

--CREATE TABLE TableABC
--(
--    Id BIGINT IDENTITY(1,1) NOT NULL,
--    Name NVARCHAR(255) NOT NULL,
    
--    CONSTRAINT [PK_TableABC] PRIMARY KEY CLUSTERED 
--    (
--	    [UserAccountId] ASC
--    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO



--------------------------------------------
-- add index
--------------------------------------------
--CREATE UNIQUE NONCLUSTERED INDEX [IDX_U_TableABC] 
--ON [dbo].[TableABC]
--(
--	[UserId] ASC,
--)
--INCLUDE(abc)
--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


--------------------------------------------
-- rename table column
--------------------------------------------
--EXEC sp_rename 'TableABC', 'TableXYZ'	
--EXEC sp_rename 'TableABC.UserId', 'PersonId', 'COLUMN'; 

