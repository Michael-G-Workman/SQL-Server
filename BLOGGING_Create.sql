/*
=========================================================================================================

Blogging DB

By Michael G. Workman

This script will create the Blogging database to be used for the Blogging ASP.NET Core 2.2 MVC Web Application
included in this github for Abion Technology, which will use database first Entity Framework ORM.

AZURE NOTE: Normally a sql server database cannot be created with a SQL script in Azure, in the case of
using this script with an Azure DB, remove the create database statement. Azure SQL Server databases
can only be created in the online Portal.

This example is freely distributable under terms of MIT open source license

=========================================================================================================
*/

CREATE DATABASE [Blogging];
GO

USE [Blogging];
GO

CREATE TABLE [Blog] (
    [BlogId] int NOT NULL IDENTITY,
    [Url] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Blog] PRIMARY KEY ([BlogId])
);
GO


CREATE TABLE [Post] (
    [PostId] int NOT NULL IDENTITY,
    [BlogId] int NOT NULL,
    [Content] nvarchar(max),
    [Title] nvarchar(max),
    CONSTRAINT [PK_Post] PRIMARY KEY ([PostId]),
    CONSTRAINT [FK_Post_Blog_BlogId] FOREIGN KEY ([BlogId]) REFERENCES [Blog] ([BlogId]) ON DELETE CASCADE
);
GO

INSERT INTO [Blogging].[dbo].[Blog] (Url) VALUES
('http://blogs.msdn.com/dotnet'),
('http://blogs.msdn.com/webdev'),
('http://blogs.msdn.com/visualstudio')
GO
