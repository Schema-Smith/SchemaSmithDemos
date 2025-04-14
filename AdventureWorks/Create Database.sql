CREATE DATABASE AdventureWorks

ALTER DATABASE AdventureWorks
SET RECOVERY SIMPLE,
    ANSI_NULLS ON,
    ANSI_PADDING ON,
    ANSI_WARNINGS ON,
    ARITHABORT ON,
    CONCAT_NULL_YIELDS_NULL ON,
    QUOTED_IDENTIFIER ON,
    NUMERIC_ROUNDABORT OFF,
    PAGE_VERIFY CHECKSUM,
    ALLOW_SNAPSHOT_ISOLATION OFF;
GO
