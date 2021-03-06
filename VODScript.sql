 
GO
/****** Object:  ForeignKey [FK_ARCHIVE_COMMUNITY]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] DROP CONSTRAINT [FK_ARCHIVE_COMMUNITY]
GO
/****** Object:  ForeignKey [FK_ARCHIVE_DISTRICT]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] DROP CONSTRAINT [FK_ARCHIVE_DISTRICT]
GO
/****** Object:  ForeignKey [FK_ARCHIVE_ROADS]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] DROP CONSTRAINT [FK_ARCHIVE_ROADS]
GO
/****** Object:  ForeignKey [AUDIT_INFO_FK]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO]'))
ALTER TABLE [dbo].[AUDIT_INFO] DROP CONSTRAINT [AUDIT_INFO_FK]
GO
/****** Object:  ForeignKey [FK_COMMUNITY_DISTRICT]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_COMMUNITY_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[COMMUNITY]'))
ALTER TABLE [dbo].[COMMUNITY] DROP CONSTRAINT [FK_COMMUNITY_DISTRICT]
GO
/****** Object:  ForeignKey [FK_USERS_GROUP]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USERS_GROUP]') AND parent_object_id = OBJECT_ID(N'[dbo].[USERS]'))
ALTER TABLE [dbo].[USERS] DROP CONSTRAINT [FK_USERS_GROUP]
GO
/****** Object:  ForeignKey [VOD_GROUP_FK]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP] DROP CONSTRAINT [VOD_GROUP_FK]
GO
/****** Object:  ForeignKey [VOD_GROUP_FK2]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP] DROP CONSTRAINT [VOD_GROUP_FK2]
GO
/****** Object:  ForeignKey [FK_VOD_VIDEOS_COMMUNITY]    Script Date: 08/07/2014 18:40:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] DROP CONSTRAINT [FK_VOD_VIDEOS_COMMUNITY]
GO
/****** Object:  ForeignKey [FK_VOD_VIDEOS_DISTRICT]    Script Date: 08/07/2014 18:40:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] DROP CONSTRAINT [FK_VOD_VIDEOS_DISTRICT]
GO
/****** Object:  ForeignKey [FK_VOD_VIDEOS_ROADS]    Script Date: 08/07/2014 18:40:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] DROP CONSTRAINT [FK_VOD_VIDEOS_ROADS]
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchKeyword]    Script Date: 08/07/2014 18:40:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SearchKeyword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SearchKeyword]
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchKeyword_06_08_14]    Script Date: 08/07/2014 18:40:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SearchKeyword_06_08_14]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SearchKeyword_06_08_14]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateVideoGroup]    Script Date: 08/07/2014 18:40:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateVideoGroup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_UpdateVideoGroup]
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchKeyword_Exact]    Script Date: 08/07/2014 18:40:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SearchKeyword_Exact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SearchKeyword_Exact]
GO
/****** Object:  View [dbo].[VW_ARCHIVES_WITH_TAGS]    Script Date: 08/07/2014 18:40:18 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_ARCHIVES_WITH_TAGS]'))
DROP VIEW [dbo].[VW_ARCHIVES_WITH_TAGS]
GO
/****** Object:  View [dbo].[VW_ARCHIVES_WITH_TAGS_ARB]    Script Date: 08/07/2014 18:40:18 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_ARCHIVES_WITH_TAGS_ARB]'))
DROP VIEW [dbo].[VW_ARCHIVES_WITH_TAGS_ARB]
GO
/****** Object:  View [dbo].[VW_VIDEOS_WITH_TAGS]    Script Date: 08/07/2014 18:40:18 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_VIDEOS_WITH_TAGS]'))
DROP VIEW [dbo].[VW_VIDEOS_WITH_TAGS]
GO
/****** Object:  View [dbo].[VW_VIDEOS_WITH_TAGS_ARB]    Script Date: 08/07/2014 18:40:18 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_VIDEOS_WITH_TAGS_ARB]'))
DROP VIEW [dbo].[VW_VIDEOS_WITH_TAGS_ARB]
GO
/****** Object:  Table [dbo].[VOD_GROUP]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP] DROP CONSTRAINT [VOD_GROUP_FK]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP] DROP CONSTRAINT [VOD_GROUP_FK2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]') AND type in (N'U'))
DROP TABLE [dbo].[VOD_GROUP]
GO
/****** Object:  Table [dbo].[VOD_VIDEOS]    Script Date: 08/07/2014 18:40:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] DROP CONSTRAINT [FK_VOD_VIDEOS_COMMUNITY]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] DROP CONSTRAINT [FK_VOD_VIDEOS_DISTRICT]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] DROP CONSTRAINT [FK_VOD_VIDEOS_ROADS]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VOD_VIDEOS_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VOD_VIDEOS] DROP CONSTRAINT [DF_VOD_VIDEOS_DATE_CREATED]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]') AND type in (N'U'))
DROP TABLE [dbo].[VOD_VIDEOS]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserDetails]    Script Date: 08/07/2014 18:40:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetUserDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetUserDetails]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUserGroup]    Script Date: 08/07/2014 18:40:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateUserGroup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_UpdateUserGroup]
GO
/****** Object:  Table [dbo].[ARCHIVE]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] DROP CONSTRAINT [FK_ARCHIVE_COMMUNITY]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] DROP CONSTRAINT [FK_ARCHIVE_DISTRICT]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] DROP CONSTRAINT [FK_ARCHIVE_ROADS]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARCHIVE]') AND type in (N'U'))
DROP TABLE [dbo].[ARCHIVE]
GO
/****** Object:  Table [dbo].[AUDIT_INFO]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO]'))
ALTER TABLE [dbo].[AUDIT_INFO] DROP CONSTRAINT [AUDIT_INFO_FK]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO]') AND type in (N'U'))
DROP TABLE [dbo].[AUDIT_INFO]
GO
/****** Object:  Table [dbo].[COMMUNITY]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_COMMUNITY_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[COMMUNITY]'))
ALTER TABLE [dbo].[COMMUNITY] DROP CONSTRAINT [FK_COMMUNITY_DISTRICT]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_COMMUNITY_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMMUNITY] DROP CONSTRAINT [DF_COMMUNITY_DATE_CREATED]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_COMMUNITY_DATE_UPDATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMMUNITY] DROP CONSTRAINT [DF_COMMUNITY_DATE_UPDATED]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMMUNITY]') AND type in (N'U'))
DROP TABLE [dbo].[COMMUNITY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USERS_GROUP]') AND parent_object_id = OBJECT_ID(N'[dbo].[USERS]'))
ALTER TABLE [dbo].[USERS] DROP CONSTRAINT [FK_USERS_GROUP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USERS]') AND type in (N'U'))
DROP TABLE [dbo].[USERS]
GO
/****** Object:  Table [dbo].[ARCHIVE_GROUP]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARCHIVE_GROUP]') AND type in (N'U'))
DROP TABLE [dbo].[ARCHIVE_GROUP]
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchText]    Script Date: 08/07/2014 18:40:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SearchText]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SearchText]
GO
/****** Object:  View [dbo].[VideoStatus]    Script Date: 08/07/2014 18:40:18 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VideoStatus]'))
DROP VIEW [dbo].[VideoStatus]
GO
/****** Object:  Table [dbo].[VOD_CONFIG]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VOD_CONFIG]') AND type in (N'U'))
DROP TABLE [dbo].[VOD_CONFIG]
GO
/****** Object:  Table [dbo].[ADS_DETAILS]    Script Date: 08/07/2014 18:40:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADS_DETAILS]') AND type in (N'U'))
DROP TABLE [dbo].[ADS_DETAILS]
GO
/****** Object:  Table [dbo].[DB_DETAILS]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_DETAILS]') AND type in (N'U'))
DROP TABLE [dbo].[DB_DETAILS]
GO
/****** Object:  Table [dbo].[DISTRICT]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DISTRICT_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DISTRICT] DROP CONSTRAINT [DF_DISTRICT_DATE_CREATED]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DISTRICT_DATE_UPDATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DISTRICT] DROP CONSTRAINT [DF_DISTRICT_DATE_UPDATED]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DISTRICT]') AND type in (N'U'))
DROP TABLE [dbo].[DISTRICT]
GO
/****** Object:  Table [dbo].[EMAIL_SERVER_DETAILS]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_EMAIL_SERVER_DETAILS_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMAIL_SERVER_DETAILS] DROP CONSTRAINT [DF_EMAIL_SERVER_DETAILS_DATE_CREATED]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMAIL_SERVER_DETAILS]') AND type in (N'U'))
DROP TABLE [dbo].[EMAIL_SERVER_DETAILS]
GO
/****** Object:  Table [dbo].[GROUPS]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GROUPS]') AND type in (N'U'))
DROP TABLE [dbo].[GROUPS]
GO
/****** Object:  Table [dbo].[ROADS]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ROADS_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ROADS] DROP CONSTRAINT [DF_ROADS_DATE_CREATED]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ROADS_DATE_UPDATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ROADS] DROP CONSTRAINT [DF_ROADS_DATE_UPDATED]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ROADS]') AND type in (N'U'))
DROP TABLE [dbo].[ROADS]
GO
/****** Object:  View [dbo].[SearchFilterTags]    Script Date: 08/07/2014 18:40:18 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SearchFilterTags]'))
DROP VIEW [dbo].[SearchFilterTags]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 08/07/2014 18:40:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SplitString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[SplitString]
GO
/****** Object:  Table [dbo].[StreamingServer_Details]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StreamingServer_Details_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StreamingServer_Details] DROP CONSTRAINT [DF_StreamingServer_Details_DATE_CREATED]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StreamingServer_Details]') AND type in (N'U'))
DROP TABLE [dbo].[StreamingServer_Details]
GO
/****** Object:  Table [dbo].[SUPER_ADMIN]    Script Date: 08/07/2014 18:40:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SUPER_ADMIN]') AND type in (N'U'))
DROP TABLE [dbo].[SUPER_ADMIN]
GO
/****** Object:  Table [dbo].[SUPER_ADMIN]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SUPER_ADMIN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SUPER_ADMIN](
	[CONFIG_ID] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [nvarchar](15) NOT NULL,
	[PASSWORD] [nvarchar](15) NOT NULL,
	[EMAIL] [nvarchar](25) NOT NULL,
	[DATE_CREATED] [date] NOT NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [SUPER_ADMIN_PK] PRIMARY KEY CLUSTERED 
(
	[CONFIG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StreamingServer_Details]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StreamingServer_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StreamingServer_Details](
	[StrServer_ID] [int] IDENTITY(1,1) NOT NULL,
	[SERVER_ID] [nvarchar](25) NOT NULL,
	[PORT] [int] NULL,
	[USERID] [nvarchar](20) NOT NULL,
	[PASSWORD] [nvarchar](20) NOT NULL,
	[DATE_CREATED] [date] NOT NULL CONSTRAINT [DF_StreamingServer_Details_DATE_CREATED]  DEFAULT (getdate()),
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [PK_StreamingServer_Details] PRIMARY KEY CLUSTERED 
(
	[StrServer_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 08/07/2014 18:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SplitString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N' Create FUNCTION [dbo].[SplitString] (
      @InputString                  VARCHAR(8000),
      @Delimiter                    VARCHAR(50)
)

RETURNS @Items TABLE (
      SplitValue                          VARCHAR(8000)
)

AS
BEGIN
      IF @Delimiter = '' ''
      BEGIN
            SET @Delimiter = '',''
            SET @InputString = REPLACE(@InputString, '' '', @Delimiter)
      END

      IF (@Delimiter IS NULL OR @Delimiter = '''')
            SET @Delimiter = '',''

--INSERT INTO @Items VALUES (@Delimiter) -- Diagnostic
--INSERT INTO @Items VALUES (@InputString) -- Diagnostic

      DECLARE @Item                 VARCHAR(8000)
      DECLARE @ItemList       VARCHAR(8000)
      DECLARE @DelimIndex     INT

      SET @ItemList = @InputString
      SET @DelimIndex = CHARINDEX(@Delimiter, @ItemList, 0)
      WHILE (@DelimIndex != 0)
      BEGIN
            SET @Item = SUBSTRING(@ItemList, 0, @DelimIndex)
            INSERT INTO @Items VALUES (@Item)

            -- Set @ItemList = @ItemList minus one less item
            SET @ItemList = SUBSTRING(@ItemList, @DelimIndex+1, LEN(@ItemList)-@DelimIndex)
            SET @DelimIndex = CHARINDEX(@Delimiter, @ItemList, 0)
      END -- End WHILE

      IF @Item IS NOT NULL -- At least one delimiter was encountered in @InputString
      BEGIN
            SET @Item = @ItemList
            INSERT INTO @Items VALUES (@Item)
      END

      -- No delimiters were encountered in @InputString, so just return @InputString
      ELSE INSERT INTO @Items VALUES (@InputString)

      RETURN

END -- End Function
' 
END
GO
/****** Object:  View [dbo].[SearchFilterTags]    Script Date: 08/07/2014 18:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SearchFilterTags]'))
EXEC dbo.sp_executesql @statement = N' 

CREATE VIEW [dbo].[SearchFilterTags]
as
Select ''1'' As SearchTagCode,''All'' As SEARCHTAGNAME ,N''جميع'' AS SEARCHTAGNAME_ARB
UNION
Select ''2'' As StatusCode,''Community'' As SEARCHTAGNAME,N''المجتمع'' AS SEARCHTAGNAME_ARB
UNION
Select ''3'' As StatusCode,''District'' As SEARCHTAGNAME,N''منطقة'' AS SEARCHTAGNAME_ARB
UNION
Select ''4'' As StatusCode,''Road'' As SEARCHTAGNAME,N''الطريق'' AS SEARCHTAGNAME_ARB

 
'
GO
/****** Object:  Table [dbo].[ROADS]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ROADS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ROADS](
	[ROAD_NO] [int] NOT NULL,
	[NAME_ENG] [nvarchar](50) NULL,
	[NAME_ARB] [nvarchar](50) NULL,
	[DATE_CREATED] [date] NULL CONSTRAINT [DF_ROADS_DATE_CREATED]  DEFAULT (getdate()),
	[DATE_UPDATED] [date] NULL CONSTRAINT [DF_ROADS_DATE_UPDATED]  DEFAULT (getdate()),
 CONSTRAINT [ROADS_PK] PRIMARY KEY CLUSTERED 
(
	[ROAD_NO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GROUPS]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GROUPS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GROUPS](
	[GROUP_ID] [int] IDENTITY(1,1) NOT NULL,
	[GROUP_NAME] [nvarchar](30) NULL,
	[DESCRIPTION] [nvarchar](50) NOT NULL,
	[DATE_CREATED] [date] NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [GROUPS_PK] PRIMARY KEY CLUSTERED 
(
	[GROUP_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMAIL_SERVER_DETAILS]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMAIL_SERVER_DETAILS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMAIL_SERVER_DETAILS](
	[CONFIG_ID] [int] IDENTITY(1,1) NOT NULL,
	[SERVER_ID] [varchar](25) NOT NULL,
	[PORT] [int] NOT NULL,
	[REPLY_TO_EMAIL] [varchar](30) NOT NULL,
	[SENDER_NAME] [varchar](20) NULL,
	[EMAIL_TYPE] [varchar](5) NOT NULL,
	[TLS_Enabled] [bit] NULL,
	[USERNAME] [varchar](25) NOT NULL,
	[PASSWORD] [varchar](25) NOT NULL,
	[DATE_CREATED] [date] NOT NULL CONSTRAINT [DF_EMAIL_SERVER_DETAILS_DATE_CREATED]  DEFAULT (getdate()),
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [PK_EMAIL_SERVER_DETAILS] PRIMARY KEY CLUSTERED 
(
	[CONFIG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISTRICT]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DISTRICT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DISTRICT](
	[DISTRICT_NO] [int] NOT NULL,
	[NAME_ENG] [nvarchar](50) NULL,
	[NAME_ARB] [nvarchar](50) NULL,
	[DATE_CREATED] [date] NULL CONSTRAINT [DF_DISTRICT_DATE_CREATED]  DEFAULT (getdate()),
	[DATE_UPDATED] [date] NULL CONSTRAINT [DF_DISTRICT_DATE_UPDATED]  DEFAULT (getdate()),
 CONSTRAINT [DISTRICT_PK] PRIMARY KEY CLUSTERED 
(
	[DISTRICT_NO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_DETAILS]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_DETAILS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_DETAILS](
	[CONFIG_ID] [int] IDENTITY(1,1) NOT NULL,
	[IP] [nchar](25) NOT NULL,
	[PORT] [int] NOT NULL,
	[NAME] [nvarchar](25) NOT NULL,
	[USERID] [nvarchar](15) NOT NULL,
	[PASSWORD] [nvarchar](15) NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL,
	[DATE_UPDATED] [datetime] NULL,
 CONSTRAINT [DB_DETAILS_PK] PRIMARY KEY CLUSTERED 
(
	[CONFIG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ADS_DETAILS]    Script Date: 08/07/2014 18:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADS_DETAILS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ADS_DETAILS](
	[CONFIG_ID] [int] IDENTITY(1,1) NOT NULL,
	[IP] [nvarchar](25) NULL,
	[USERID] [nvarchar](15) NULL,
	[PASSWORD] [nvarchar](15) NULL,
	[DATE_CREATED] [date] NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [ADS_DETAILS_PK] PRIMARY KEY CLUSTERED 
(
	[CONFIG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VOD_CONFIG]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VOD_CONFIG]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VOD_CONFIG](
	[CONFIG_ID] [int] IDENTITY(1,1) NOT NULL,
	[SOURCE_FOLDER] [nvarchar](150) NOT NULL,
	[TARGET_FOLDER] [nvarchar](150) NOT NULL,
	[ARCHIVE_FOLDER] [nvarchar](150) NOT NULL,
	[BACKUP_FOLDER] [nvarchar](150) NOT NULL,
	[SCHEDULER_FLAG] [char](1) NOT NULL,
	[SCHEDULER_HOURS_INTERVAL] [numeric](5, 2) NOT NULL,
	[SIMULT_CONVERSIONS] [int] NULL,
	[DATE_CREATED] [date] NOT NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [VOD_CONFIG_PK] PRIMARY KEY CLUSTERED 
(
	[CONFIG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VideoStatus]    Script Date: 08/07/2014 18:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VideoStatus]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW   [dbo].[VideoStatus]
as
Select ''D'' As StatusCode,''Converted'' As StatusName ,N''تحويلها'' AS STATUSNAME_ARB
UNION
Select ''U'' As StatusCode,''Pending'' As StatusName,N''في انتظار'' AS STATUSNAME_ARB
UNION
Select ''P'' As StatusCode,''Processing'' As StatusName,N''المعالجة'' AS STATUSNAME_ARB


'
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchText]    Script Date: 08/07/2014 18:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SearchText]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[usp_SearchText] 
(@SearchKey nvarchar(100),@SearchOn nvarchar(20),@IsArabic bit)
AS
BEGIN

DECLARE @query NVARCHAR(MAX);

IF(@SearchOn=''Road'')
BEGIN
SET @query = ''SELECT NAME_ENG AS SearchedWord from ROADS WHERE 1=1 ''
SET @query = @query + '' AND NAME_ENG like ''''%''+ @SearchKey +''%''''''  
exec sp_executesql @query
Print @query; 
END

IF(@SearchOn=''District'')
BEGIN
SET @query = ''SELECT NAME_ENG AS SearchedWord from DISTRICT WHERE 1=1 ''
SET @query = @query + '' AND NAME_ENG like ''''%''+ @SearchKey +''%''''''  
exec sp_executesql @query
Print @query; 
END


IF(@SearchOn=''Community'')
BEGIN
SET @query = ''SELECT NAME_ENG AS  SearchedWord from COMMUNITY WHERE 1=1 ''
SET @query = @query + '' AND NAME_ENG like ''''%''+ @SearchKey +''%''''''  
exec sp_executesql @query
Print @query; 
END

IF(@SearchOn=''All'')
BEGIN
SET @query = ''SELECT NAME_ENG AS SearchedWord from ROADS WHERE 1=1 ''
SET @query = @query + '' AND NAME_ENG like ''''%''+ @SearchKey +''%'''''' 

SET @query =@query +'' UNION ''+  '' SELECT NAME_ENG AS SearchedWord from DISTRICT WHERE 1=1 ''
SET @query = @query + '' AND NAME_ENG like ''''%''+ @SearchKey +''%''''''  

SET @query = @query +'' UNION ''+  '' SELECT NAME_ENG AS SearchedWord from COMMUNITY WHERE 1=1 ''
SET @query = @query + '' AND NAME_ENG like ''''%''+ @SearchKey +''%''''''
 
exec sp_executesql @query

END




 

              
End


 ' 
END
GO
/****** Object:  Table [dbo].[ARCHIVE_GROUP]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARCHIVE_GROUP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ARCHIVE_GROUP](
	[ARCHIVE_GROUPID] [int] NOT NULL,
	[ARCHIVE_ID] [int] NULL,
	[FILE_NAME] [nvarchar](60) NOT NULL,
	[GROUP_ID] [int] NULL,
	[DATE_CREATED] [date] NOT NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [ARCHIVE_GROUP_PK] PRIMARY KEY CLUSTERED 
(
	[ARCHIVE_GROUPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USERS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USERS](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](25) NOT NULL,
	[DOMAIN] [nvarchar](20) NOT NULL,
	[FULL_NAME] [nvarchar](30) NOT NULL,
	[GROUP_ID] [int] NULL,
	[DATE_CREATED] [date] NOT NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [USERS_PK] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[COMMUNITY]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMMUNITY]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[COMMUNITY](
	[COM_DIST_ID] [int] IDENTITY(1,1) NOT NULL,
	[COMMUNITY_NO] [int] NOT NULL,
	[NAME_ENG] [nvarchar](50) NULL,
	[NAME_ARB] [nvarchar](50) NULL,
	[DISTRICT_NO] [int] NOT NULL,
	[DATE_CREATED] [date] NULL CONSTRAINT [DF_COMMUNITY_DATE_CREATED]  DEFAULT (getdate()),
	[DATE_UPDATED] [date] NULL CONSTRAINT [DF_COMMUNITY_DATE_UPDATED]  DEFAULT (getdate()),
 CONSTRAINT [PK_COMMUNITY_1] PRIMARY KEY CLUSTERED 
(
	[COM_DIST_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AUDIT_INFO]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AUDIT_INFO](
	[ACTIVITY_ID] [int] NOT NULL,
	[ACTIVITY] [nvarchar](60) NULL,
	[USER_ID] [int] NULL,
	[LOG_TIME] [date] NULL,
 CONSTRAINT [AUDIT_INFO_PK] PRIMARY KEY CLUSTERED 
(
	[ACTIVITY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ARCHIVE]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARCHIVE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ARCHIVE](
	[ARCH_ID] [int] NOT NULL,
	[FILE_NAME] [nvarchar](60) NOT NULL,
	[COMMUNITY_TAG] [int] NULL,
	[DISTRICT_TAG] [int] NULL,
	[ROAD_TAG] [int] NULL,
	[DATE_CREATED] [date] NOT NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [ARCHIVE_PK] PRIMARY KEY CLUSTERED 
(
	[ARCH_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUserGroup]    Script Date: 08/07/2014 18:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateUserGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[usp_UpdateUserGroup](@GroupId int ,@Users varchar(100))
AS
Begin 

BEGIN TRY
declare @userlist table(RowId INT IDENTITY(1,1),UserId int) 
  
   
--Decalre a variable to remember the position of the current delimiter
DECLARE @N INT 

--Decalre a variable to remember the number of rows in the table
DECLARE @Count INT

--Populate the TABLE variable using some logicd
insert into @userlist(UserId)  SELECT SplitValue as UserId FROM dbo.[SplitString] (@Users,'';'') where SplitValue<>'''' 
 select * from @userList;
   
--Initialize the looper variable
SET @N = 1

--Determine the number of rows in the Table
SELECT @Count=max(RowId) from @userlist
--Loop through until all row processing is done
WHILE @N <= @Count

BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE  -- This will revert to original level when proc ends
 BEGIN TRANSACTION   -- Start the transaction
    --Load current value from the Table
   if Exists(select * from USERS where USER_ID=(select UserId from @UserList where RowId=@N))
   BEGIN
   --select ''UserId Exists''+ Cast(UserId as Varchar) from @UserList where RowId=@N
   UPDATE USERS SET GROUP_ID=@GroupId where USER_ID=(select UserId from @UserList where RowId=@N)   
   END
         --select @N;
         SET @N = @N + 1;
   
COMMIT
  
--Select Cast(@GroupId as varchar)+''  ''+ @Users

END
  
END TRY
BEGIN CATCH
  -- Whoops, there was an error
  IF @@TRANCOUNT > 0
     ROLLBACK 
  -- Raise an error with the details of the exception
  DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int,@ErrorNumber int
  SELECT @ErrMsg = ERROR_MESSAGE(),
         @ErrSeverity = ERROR_SEVERITY() , @ErrorNumber= ERROR_NUMBER() 
         RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH
END
   
   
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserDetails]    Script Date: 08/07/2014 18:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetUserDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[usp_GetUserDetails]
AS
BEGIN
select U.USER_ID as UserId,U.NAME AS USERName,U.DOMAIN,U.FULL_NAME AS FULLNAME,IsNULL(U.GROUP_ID,0) AS GROUPID,G.GROUP_NAME AS GROUPNAME FROM USERS U
LEFT JOIN 
GROUPS G ON u.Group_Id = G.group_ID
END' 
END
GO
/****** Object:  Table [dbo].[VOD_VIDEOS]    Script Date: 08/07/2014 18:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VOD_VIDEOS](
	[VOD_ID] [int] IDENTITY(1,1) NOT NULL,
	[FILE_NAME] [nvarchar](60) NOT NULL,
	[STATUS] [char](1) NOT NULL,
	[COMMUNITY_TAG] [int] NULL,
	[DISTRICT_TAG] [int] NULL,
	[ROAD_TAG] [int] NULL,
	[DATE_CREATED] [date] NOT NULL CONSTRAINT [DF_VOD_VIDEOS_DATE_CREATED]  DEFAULT (getdate()),
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [VOD_VIDEOS_PK] PRIMARY KEY CLUSTERED 
(
	[VOD_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VOD_GROUP]    Script Date: 08/07/2014 18:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VOD_GROUP](
	[VOD_GRP_ID] [int] IDENTITY(1,1) NOT NULL,
	[VOD_ID] [int] NULL,
	[GROUP_ID] [int] NULL,
	[DATE_CREATED] [date] NULL,
	[DATE_UPDATED] [date] NULL,
 CONSTRAINT [VOD_GROUP_PK] PRIMARY KEY CLUSTERED 
(
	[VOD_GRP_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[VW_VIDEOS_WITH_TAGS_ARB]    Script Date: 08/07/2014 18:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_VIDEOS_WITH_TAGS_ARB]'))
EXEC dbo.sp_executesql @statement = N'
 


CREATE VIEW [dbo].[VW_VIDEOS_WITH_TAGS_ARB]
AS
Select VOD_ID AS VIDEOID, FILE_NAME AS VIDEONAME,VD.STATUS AS STATUSCODE, VS.STATUSNAME_ARB AS STATUS,
COMMUNITY_TAG,
CM.NAME_ARB AS COMMUNITY,
DISTRICT_TAG,
DT.NAME_ARB AS DISTRICT,
ROAD_TAG,
RD.NAME_ARB AS ROAD
FROM VOD_VIDEOS VD
JOIN VideoStatus VS ON VD.STATUS=VS.StatusCode
LEFT JOIN COMMUNITY CM ON VD.COMMUNITY_TAG=CM.COM_DIST_ID
LEFT JOIN DISTRICT DT ON VD.DISTRICT_TAG=DT.DISTRICT_NO
LEFT JOIN ROADS RD ON VD.ROAD_TAG=RD.ROAD_NO

'
GO
/****** Object:  View [dbo].[VW_VIDEOS_WITH_TAGS]    Script Date: 08/07/2014 18:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_VIDEOS_WITH_TAGS]'))
EXEC dbo.sp_executesql @statement = N'

 

CREATE VIEW [dbo].[VW_VIDEOS_WITH_TAGS]
AS
Select distinct VOD_ID AS VIDEOID, FILE_NAME AS VIDEONAME,VD.STATUS AS STATUSCODE, VS.STATUSNAME AS STATUS,
COMMUNITY_TAG,
CM.NAME_ENG AS COMMUNITY,
DISTRICT_TAG,
DT.NAME_ENG AS DISTRICT,
ROAD_TAG,
RD.NAME_ENG AS ROAD
FROM VOD_VIDEOS VD
INNER JOIN VideoStatus VS ON VD.STATUS=VS.StatusCode
LEFT JOIN COMMUNITY CM ON VD.COMMUNITY_TAG=CM.COM_DIST_ID
LEFT JOIN DISTRICT DT ON VD.DISTRICT_TAG=DT.DISTRICT_NO
LEFT JOIN ROADS RD ON VD.ROAD_TAG=RD.ROAD_NO





'
GO
/****** Object:  View [dbo].[VW_ARCHIVES_WITH_TAGS_ARB]    Script Date: 08/07/2014 18:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_ARCHIVES_WITH_TAGS_ARB]'))
EXEC dbo.sp_executesql @statement = N' 


CREATE VIEW [dbo].[VW_ARCHIVES_WITH_TAGS_ARB]
AS
Select ARCH_ID AS ARCHIVEID, FILE_NAME AS VIDEONAME,
COMMUNITY_TAG,
CM.NAME_ARB AS COMMUNITY,
DISTRICT_TAG,
DT.NAME_ARB AS DISTRICT,
ROAD_TAG,
RD.NAME_ARB AS ROAD,AR.DATE_CREATED
FROM ARCHIVE AR
LEFT JOIN COMMUNITY CM ON AR.COMMUNITY_TAG=CM.COM_DIST_ID
LEFT JOIN DISTRICT DT ON AR.DISTRICT_TAG=DT.DISTRICT_NO
LEFT JOIN ROADS RD ON AR.ROAD_TAG=RD.ROAD_NO

'
GO
/****** Object:  View [dbo].[VW_ARCHIVES_WITH_TAGS]    Script Date: 08/07/2014 18:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_ARCHIVES_WITH_TAGS]'))
EXEC dbo.sp_executesql @statement = N'


 
CREATE VIEW [dbo].[VW_ARCHIVES_WITH_TAGS]
AS
Select ARCH_ID AS ARCHIVEID, FILE_NAME AS VIDEONAME,
COMMUNITY_TAG,
CM.NAME_ENG AS COMMUNITY,
DISTRICT_TAG,
DT.NAME_ENG AS DISTRICT,
ROAD_TAG,
RD.NAME_ENG AS ROAD,AR.DATE_CREATED 
FROM  ARCHIVE AR 
LEFT JOIN COMMUNITY CM ON AR.COMMUNITY_TAG=CM.COM_DIST_ID
LEFT JOIN DISTRICT DT ON AR.DISTRICT_TAG=DT.DISTRICT_NO
LEFT JOIN ROADS RD ON AR.ROAD_TAG=RD.ROAD_NO







'
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchKeyword_Exact]    Script Date: 08/07/2014 18:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

/****** Object:  StoredProcedure [dbo].[usp_UpdateVideoGroup]    Script Date: 08/07/2014 18:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateVideoGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[usp_UpdateVideoGroup](@GroupId int ,@Videos varchar(100))
AS
Begin 

BEGIN TRY
declare @VideosList table(RowId INT IDENTITY(1,1),VideoId int) 
  
   
--Decalre a variable to remember the position of the current delimiter
DECLARE @N INT 

--Decalre a variable to remember the number of rows in the table
DECLARE @Count INT

--Populate the TABLE variable using some logicd
insert into @VideosList(VideoId)  SELECT SplitValue as VideoId FROM dbo.[SplitString] (@Videos,'';'') where SplitValue<>'''' 
 --select * from @VideosList;
   
--Initialize the looper variable
SET @N = 1

--Determine the number of rows in the Table
SELECT @Count=max(RowId) from @VideosList
--Loop through until all row processing is done
WHILE @N <= @Count

BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE  -- This will revert to original level when proc ends
 BEGIN TRANSACTION   -- Start the transaction
    --Load current value from the Table
    Declare @VideoId int;
    select @VideoId=VideoId from @VideosList where RowId=@N
   if Exists(select * from [VOD_GROUP] where VOD_ID=@VideoId AND GROUP_ID=@GroupId)
   BEGIN
   --select ''VideoId Exists''+ Cast(VideoId as Varchar) from @VideosList where RowId=@N
   UPDATE [VOD_GROUP] SET GROUP_ID=@GroupId where VOD_ID=@VideoId   
   END
   ELSE
   BEGIN
   INSERT INTO VOD_GROUP(VOD_ID,GROUP_ID,DATE_CREATED)VALUES(@VideoId,@GroupId,GETDATE())         
   END
         --select @N;
         SET @N = @N + 1;
   
COMMIT
  
--Select Cast(@GroupId as varchar)+''  ''+ @Videos

END
  
END TRY
BEGIN CATCH
  -- Whoops, there was an error
  IF @@TRANCOUNT > 0
     ROLLBACK 
  -- Raise an error with the details of the exception
  DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int,@ErrorNumber int
  SELECT @ErrMsg = ERROR_MESSAGE(),
         @ErrSeverity = ERROR_SEVERITY() , @ErrorNumber= ERROR_NUMBER() 
         RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH
END
   
   
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchKeyword_06_08_14]    Script Date: 08/07/2014 18:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SearchKeyword_06_08_14]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N' 
CREATE procedure [dbo].[usp_SearchKeyword_06_08_14]
(@SearchKey nvarchar(100),@SearchOn nvarchar(20),@IsArabic bit)
AS
BEGIN

if(@IsArabic=1)
BEGIN
SELECT VIDEOID ,VIDEONAME , Case 
                        WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS_ARB 
                          WHERE COMMUNITY like ''%''+CAst(@SearchKey as varchar)+''%'' OR
 DISTRICT like ''%''+CAst(@SearchKey as varchar)+''%'' OR
 ROAD like ''%''+CAst(@SearchKey as varchar)+''%'' 
 END
 ELSE
 BEGIN
 
 SELECT VIDEOID ,VIDEONAME , Case WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS
                           WHERE COMMUNITY like ''%''+CAst(@SearchKey as nvarchar)+''%'' OR
 DISTRICT like ''%''+CAst(@SearchKey as nvarchar)+''%'' OR
 ROAD like ''%''+CAst(@SearchKey as nvarchar)+''%'' 
                           
 END
 
                          


--Select VOD_ID as VideoId,FILE_NAME as VideoName,COMMUNITY_TAG_ENG+'' , ''+DISTRICT_TAG_ENG+'' , ''+ROAD_TAG_ENG AS TAG from VOD_VIDEOS 
--where COMMUNITY_TAG_ENG like ''%''+CAst(@SearchKey as varchar)+''%'' OR
-- DISTRICT_TAG_ENG like ''%''+CAst(@SearchKey as varchar)+''%'' OR
-- ROAD_TAG_ENG like ''%''+CAst(@SearchKey as varchar)+''%'' 

              
End


 ' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchKeyword]    Script Date: 08/07/2014 18:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SearchKeyword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N' 
CREATE procedure [dbo].[usp_SearchKeyword]  
(@SearchKey nvarchar(100),@SearchOn int,@IsArabic bit)
AS
BEGIN


--select * from SearchFilterTags

----1	All	 
----2	Community 
----3	District	 
----4	Road	 
if(@SearchOn=1)
BEGIN   --START OF ALL
if(@IsArabic=1) --START OF ARABIC
BEGIN
SELECT VIDEOID ,VIDEONAME , Case 
                        WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS_ARB 
                          WHERE COMMUNITY like ''%''+CAst(@SearchKey as varchar)+''%'' OR
 DISTRICT like ''%''+CAst(@SearchKey as varchar)+''%'' OR
 ROAD like ''%''+CAst(@SearchKey as varchar)+''%'' 
 END --END OF ARABIC
 ELSE
 BEGIN -- START OF ENGLISH
 
 SELECT VIDEOID ,VIDEONAME , Case WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS
                           WHERE COMMUNITY like ''%''+CAst(@SearchKey as nvarchar)+''%'' OR
 DISTRICT like ''%''+CAst(@SearchKey as nvarchar)+''%'' OR
 ROAD like ''%''+CAst(@SearchKey as nvarchar)+''%'' 
                           
 END --END OF ENGLLISH
 END --end of all 
 ELSE IF (@SearchOn=2) -- SEARCH ON COMMUNITY TAGS
 BEGIN
 
 if(@IsArabic=1)
BEGIN
SELECT VIDEOID ,VIDEONAME , Case 
                        WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS_ARB 
                          WHERE COMMUNITY like ''%''+CAst(@SearchKey as varchar)+''%''  
  END
 ELSE
 BEGIN
 
 SELECT VIDEOID ,VIDEONAME , Case WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS
                           WHERE COMMUNITY like ''%''+CAst(@SearchKey as nvarchar)+''%'' 
                            
 END
 
 
 
 END
                          

ELSE IF (@SearchOn=3) -- SEARCH ON DISTRICT TAGS
 BEGIN
 
 if(@IsArabic=1)
BEGIN
SELECT VIDEOID ,VIDEONAME , Case 
                        WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS_ARB 
                          WHERE DISTRICT like ''%''+CAst(@SearchKey as varchar)+''%'' 
 END
 ELSE
 BEGIN
 
 SELECT VIDEOID ,VIDEONAME , Case WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS
                           WHERE DISTRICT like ''%''+CAst(@SearchKey as nvarchar)+''%''  
                           
 END
  
 END
       
       ELSE IF (@SearchOn=4) -- SEARCH ON ROADS TAGS
 BEGIN
 
 if(@IsArabic=1)
BEGIN
SELECT VIDEOID ,VIDEONAME , Case 
                        WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS_ARB 
                          WHERE  ROAD like ''%''+CAst(@SearchKey as varchar)+''%'' 
 END
 ELSE
 BEGIN
 
 SELECT VIDEOID ,VIDEONAME , Case WHEN (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) 
                        LIKE ''%,''  THEN LEFT((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) , LEN((ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')))-1) 
                         ELSE  (ISNULL(COMMUNITY+'' , '','''')+ISNULL(DISTRICT+'','','''')+ISNULL(ROAD,'''')) END AS TAG  
                          FROM VW_VIDEOS_WITH_TAGS
                           WHERE ROAD like ''%''+CAst(@SearchKey as nvarchar)+''%'' 
                           
 END
 
 
 
 END
       
--Select VOD_ID as VideoId,FILE_NAME as VideoName,COMMUNITY_TAG_ENG+'' , ''+DISTRICT_TAG_ENG+'' , ''+ROAD_TAG_ENG AS TAG from VOD_VIDEOS 
--where COMMUNITY_TAG_ENG like ''%''+CAst(@SearchKey as varchar)+''%'' OR
-- DISTRICT_TAG_ENG like ''%''+CAst(@SearchKey as varchar)+''%'' OR
-- ROAD_TAG_ENG like ''%''+CAst(@SearchKey as varchar)+''%'' 

              
End


 ' 
END
GO
/****** Object:  ForeignKey [FK_ARCHIVE_COMMUNITY]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE]  WITH CHECK ADD  CONSTRAINT [FK_ARCHIVE_COMMUNITY] FOREIGN KEY([COMMUNITY_TAG])
REFERENCES [dbo].[COMMUNITY] ([COM_DIST_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] CHECK CONSTRAINT [FK_ARCHIVE_COMMUNITY]
GO
/****** Object:  ForeignKey [FK_ARCHIVE_DISTRICT]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE]  WITH CHECK ADD  CONSTRAINT [FK_ARCHIVE_DISTRICT] FOREIGN KEY([DISTRICT_TAG])
REFERENCES [dbo].[DISTRICT] ([DISTRICT_NO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] CHECK CONSTRAINT [FK_ARCHIVE_DISTRICT]
GO
/****** Object:  ForeignKey [FK_ARCHIVE_ROADS]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE]  WITH CHECK ADD  CONSTRAINT [FK_ARCHIVE_ROADS] FOREIGN KEY([ROAD_TAG])
REFERENCES [dbo].[ROADS] ([ROAD_NO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARCHIVE_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARCHIVE]'))
ALTER TABLE [dbo].[ARCHIVE] CHECK CONSTRAINT [FK_ARCHIVE_ROADS]
GO
/****** Object:  ForeignKey [AUDIT_INFO_FK]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO]'))
ALTER TABLE [dbo].[AUDIT_INFO]  WITH CHECK ADD  CONSTRAINT [AUDIT_INFO_FK] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USERS] ([USER_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT_INFO]'))
ALTER TABLE [dbo].[AUDIT_INFO] CHECK CONSTRAINT [AUDIT_INFO_FK]
GO
/****** Object:  ForeignKey [FK_COMMUNITY_DISTRICT]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_COMMUNITY_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[COMMUNITY]'))
ALTER TABLE [dbo].[COMMUNITY]  WITH CHECK ADD  CONSTRAINT [FK_COMMUNITY_DISTRICT] FOREIGN KEY([DISTRICT_NO])
REFERENCES [dbo].[DISTRICT] ([DISTRICT_NO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_COMMUNITY_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[COMMUNITY]'))
ALTER TABLE [dbo].[COMMUNITY] CHECK CONSTRAINT [FK_COMMUNITY_DISTRICT]
GO
/****** Object:  ForeignKey [FK_USERS_GROUP]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USERS_GROUP]') AND parent_object_id = OBJECT_ID(N'[dbo].[USERS]'))
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD  CONSTRAINT [FK_USERS_GROUP] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[GROUPS] ([GROUP_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USERS_GROUP]') AND parent_object_id = OBJECT_ID(N'[dbo].[USERS]'))
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_GROUP]
GO
/****** Object:  ForeignKey [VOD_GROUP_FK]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP]  WITH CHECK ADD  CONSTRAINT [VOD_GROUP_FK] FOREIGN KEY([VOD_ID])
REFERENCES [dbo].[VOD_VIDEOS] ([VOD_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP] CHECK CONSTRAINT [VOD_GROUP_FK]
GO
/****** Object:  ForeignKey [VOD_GROUP_FK2]    Script Date: 08/07/2014 18:40:16 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP]  WITH CHECK ADD  CONSTRAINT [VOD_GROUP_FK2] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[GROUPS] ([GROUP_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[VOD_GROUP_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_GROUP]'))
ALTER TABLE [dbo].[VOD_GROUP] CHECK CONSTRAINT [VOD_GROUP_FK2]
GO
/****** Object:  ForeignKey [FK_VOD_VIDEOS_COMMUNITY]    Script Date: 08/07/2014 18:40:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS]  WITH CHECK ADD  CONSTRAINT [FK_VOD_VIDEOS_COMMUNITY] FOREIGN KEY([COMMUNITY_TAG])
REFERENCES [dbo].[COMMUNITY] ([COM_DIST_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_COMMUNITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] CHECK CONSTRAINT [FK_VOD_VIDEOS_COMMUNITY]
GO
/****** Object:  ForeignKey [FK_VOD_VIDEOS_DISTRICT]    Script Date: 08/07/2014 18:40:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS]  WITH CHECK ADD  CONSTRAINT [FK_VOD_VIDEOS_DISTRICT] FOREIGN KEY([DISTRICT_TAG])
REFERENCES [dbo].[DISTRICT] ([DISTRICT_NO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_DISTRICT]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] CHECK CONSTRAINT [FK_VOD_VIDEOS_DISTRICT]
GO
/****** Object:  ForeignKey [FK_VOD_VIDEOS_ROADS]    Script Date: 08/07/2014 18:40:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS]  WITH CHECK ADD  CONSTRAINT [FK_VOD_VIDEOS_ROADS] FOREIGN KEY([ROAD_TAG])
REFERENCES [dbo].[ROADS] ([ROAD_NO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VOD_VIDEOS_ROADS]') AND parent_object_id = OBJECT_ID(N'[dbo].[VOD_VIDEOS]'))
ALTER TABLE [dbo].[VOD_VIDEOS] CHECK CONSTRAINT [FK_VOD_VIDEOS_ROADS]
GO
