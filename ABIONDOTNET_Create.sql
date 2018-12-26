/*
=========================================================================================================

AbionDotNet DB

By Michael G. Workman

This script will create the AbionDotNet database to be used with the abion.net mvc web application
for Abion Technology.

AZURE NOTE: Normally a sql server database cannot be created with a SQL script in Azure, in the case of
using this script with an Azure DB, remove the create database statement. Azure SQL Server databases
can only be created in the online Portal.

This example is freely distributable under terms of MIT open source license

=========================================================================================================
*/

CREATE DATABASE [AbionDotNetDB];
GO

USE [AbionDotNetDB]
GO

CREATE TABLE [dbo].[ContactCategories] (
	[ID] uniqueidentifier NOT NULL,
	[category] NVARCHAR(100) NOT NULL,
	[sortorder] INT NOT NULL,
	CONSTRAINT [PK_contactcategories] PRIMARY KEY ([ID])
)
GO

ALTER TABLE [AbionDotNetDB].[dbo].[ContactCategories] ADD CONSTRAINT [DF_contactcategories_ID] DEFAULT (newid()) FOR [ID]
GO

CREATE TABLE [dbo].[EmailContacts] (
	[ID] uniqueidentifier NOT NULL,
	[ContactName] NVARCHAR(150) NOT NULL,
	[ContactEmail] NVARCHAR(100) NOT NULL,
	[ContactCategories_ID] uniqueidentifier NOT NULL,
	[WebMessage] NVARCHAR(MAX) NOT NULL,
	[EmailDate] DATETIME NOT NULL,
	CONSTRAINT [PK_emailcontacts] PRIMARY KEY ([ID])
)
GO

ALTER TABLE [AbionDotNetDB].[dbo].[EmailContacts] ADD CONSTRAINT [DF_emailcontacts_ID] DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [AbionDotNetDB].[dbo].[EmailContacts] ADD CONSTRAINT [DF_emailcontacts_EMAILDATE] DEFAULT (getdate()) FOR [EmailDate]
GO

INSERT INTO [AbionDotNetDB].[dbo].[ContactCategories] (category, sortorder)
SELECT 'Website', 1 UNION ALL
SELECT 'Web Application', 2 UNION ALL
SELECT 'Azure Cloud', 3 UNION ALL
SELECT 'Mobile App', 4 UNION ALL
SELECT 'Social Media', 5 UNION ALL
SELECT 'Web Advertising', 6 UNION ALL
SELECT 'Other', 7
