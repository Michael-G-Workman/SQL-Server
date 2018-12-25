/*
=========================================================================================================

CV DB

By Michael G. Workman

This script will create the CV database to be used with the CV mvc web application
for Abion Technology, CV meaning Curriculum Vitae

This example is freely distributable under terms of MIT open source license

=========================================================================================================
*/

CREATE DATABASE [CVDB];
GO

USE [CVDB]
GO

CREATE TABLE [CVDB].[dbo].[ContactCategories] (
	[ID] uniqueidentifier NOT NULL,
	[category] NVARCHAR(100) NOT NULL,
	[sortorder] INT NOT NULL,
	CONSTRAINT [PK_contactcategories] PRIMARY KEY ([ID])
)
GO

ALTER TABLE [CVDB].[dbo].[ContactCategories] ADD CONSTRAINT [DF_contactcategories_ID] DEFAULT (newid()) FOR [ID]
GO

CREATE TABLE [CVDB].[dbo].[EmailContacts] (
	[ID] uniqueidentifier NOT NULL,
	[ContactName] NVARCHAR(150) NOT NULL,
	[ContactEmail] NVARCHAR(100) NOT NULL,
	[ContactPhone] NVARCHAR(20) NOT NULL,
	[ContactCategories_ID] uniqueidentifier NOT NULL,
	[WebMessage] NVARCHAR(MAX) NOT NULL,
	[EmailDate] DATETIME NOT NULL,
	CONSTRAINT [PK_emailcontacts] PRIMARY KEY ([ID])
)
GO

ALTER TABLE [CVDB].[dbo].[EmailContacts] ADD CONSTRAINT [DF_emailcontacts_ID] DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [CVDB].[dbo].[EmailContacts] ADD CONSTRAINT [DF_emailcontacts_EMAILDATE] DEFAULT (getdate()) FOR [EmailDate]
GO

INSERT INTO [CVDB].[dbo].[ContactCategories] (category, sortorder)
SELECT '.NET Software Engineer', 1 UNION ALL
SELECT '.NET Software Architect', 2 UNION ALL
SELECT 'Azure Engineer', 3 UNION ALL
SELECT 'Azure Architect', 4 UNION ALL
SELECT 'SQL Developer', 5 UNION ALL
SELECT 'Resume Request', 6 UNION ALL
SELECT 'Other', 7
