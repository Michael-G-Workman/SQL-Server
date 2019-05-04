--===========================================================
--
-- GeoSpatial
--
-- (c) Michael G. Workman
--
-- An example TSQL Script showing examples of GeoSpatial
-- calculations using the GEOGRAPHY type column, and also
-- measuring the distance between Coconuts Bar and Grill
-- and Ron Jon Surf Shop in Cocoa Beach, Florida in miles
-- and kilometers
--
-- Freely distributable under terms of MIT open source license
--=============================================================
 
USE [FoodPantryDB]
GO

-- check to see if table exist, 
-- if it does, drop it before running script
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = 'GeoTest')
BEGIN
  DROP TABLE GeoTest;
END

-- geography type testing
CREATE TABLE [FoodPantryDB].[dbo].[GeoTest] (
[ID] uniqueidentifier NOT NULL,
[Location] nvarchar(100) NULL,
[Latitude] float NULL,
[Longitude] float NULL,
[GeoPoint] geography NULL
CONSTRAINT [PK_GeoTest] PRIMARY KEY ([ID])
)
GO

-- have the GUID primary key auto generated with each new record
ALTER TABLE [FoodPantryDB].[dbo].[GeoTest] ADD CONSTRAINT [DF_geotest_ID] DEFAULT (newid()) FOR [ID]
GO

-- insert latitude, longitude, and geopoint for Ron Jon Surf Shop
INSERT [FoodPantryDB].[dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Ron Jon Surf Shop',
28.3543972,
-80.605348,
geography::STGeomFromText('POINT (-80.605348 28.3543972)',4326))
GO

-- insert latitude, longitude, and geopoint for Starbucks Cocoa Beach
INSERT [FoodPantryDB].[dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Starbucks',
28.3572519,
-80.610383,
geography::STGeomFromText('POINT (-80.610383 28.3572519)',4326))
GO

-- insert latitude, longitude, and geopoint for Coconuts Bar and Grill
INSERT [FoodPantryDB].[dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Coconuts',
28.3182401,
-80.6104571,
geography::STGeomFromText('POINT (-80.6104571 28.3182401)',4326))
GO

-- show records for GeoTest table
SELECT *
FROM [FoodPantryDB].[dbo].[GeoTest];
GO

-- create a var to store the geopoint for Coconuts Bar and Grill
DECLARE @Coconuts geography;
SELECT @Coconuts = [GeoPoint] FROM [GeoTest] WHERE Location = 'Coconuts';

-- get distance in miles
SELECT [GeoPoint].STDistance(@Coconuts)/1609.344 AS DistanceMiles
FROM [GeoTest]
WHERE Location = 'Ron Jon Surf Shop';

-- get distance in kilometers
SELECT [GeoPoint].STDistance(@Coconuts)/1000 AS DistanceKilometers
FROM [GeoTest]
WHERE Location = 'Ron Jon Surf Shop';
GO
