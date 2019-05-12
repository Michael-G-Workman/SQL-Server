--===========================================================
--
-- GeoSpatial
--
-- (c) Michael G. Workman
--
-- An example TSQL Script showing examples of GeoSpatial
-- calculations using the GEOGRAPHY type column, and also
-- measuring the distance between Coconuts Bar and Grill
-- and Ron Jon Surf Shop in Cocoa Beach, Florida and other
-- Central Florida locations in miles and kilometers
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
CREATE TABLE [dbo].[GeoTest] (
[ID] uniqueidentifier NOT NULL,
[Location] nvarchar(100) NULL,
[Latitude] nvarchar(50) NULL,
[Longitude] nvarchar(50) NULL,
[GeoPoint] geography NULL
CONSTRAINT [PK_GeoTest] PRIMARY KEY ([ID])
)
GO

-- have the GUID primary key auto generated with each new record
ALTER TABLE [dbo].[GeoTest] ADD CONSTRAINT [DF_geotest_ID] DEFAULT (newid()) FOR [ID]
GO

-- insert latitude, longitude, and geopoint for Ron Jon Surf Shop
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Ron Jon Surf Shop (Cocoa Beach)',
'28.3543972',
'-80.605348',
geography::STGeomFromText('POINT (-80.605348 28.3543972)',4326))
GO

-- insert latitude, longitude, and geopoint for Starbucks Cocoa Beach
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Starbucks (Cocoa Beach)',
'28.3572519',
'-80.610383',
geography::STGeomFromText('POINT (-80.610383 28.3572519)',4326))
GO

-- insert latitude, longitude, and geopoint for Coconuts Bar and Grill
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Coconuts on the Beach (Cocoa Beach)',
'28.3182401',
'-80.6104571',
geography::STGeomFromText('POINT (-80.6104571 28.3182401)',4326))
GO

-- insert latitude, longitude, and geopoint for Universal Studios
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Universal  Studios (Orlando)',
'28.476825',
'-81.469534',
geography::STGeomFromText('POINT (-81.469534 28.476825)',4326))
GO

-- insert latitude, longitude, and geopoint for Universal Orlando
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Universal Orlando',
'28.4828168',
'-81.4749842',
geography::STGeomFromText('POINT (-81.4749842 28.4828168)',4326))
GO

-- insert latitude, longitude, and geopoint for Walt Disney World Resort (Orlando)
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Walt Disney World Resort (Orlando)',
'28.3326057',
'-81.505105',
geography::STGeomFromText('POINT (-81.505105 28.3326057)',4326))
GO

-- insert latitude, longitude, and geopoint for Walt Disney World Dolphin Resort (Orlando)
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Walt Disney World Dolphin Resort (Orlando)',
'28.367321222680967',
'-81.56108146130896',
geography::STGeomFromText('POINT (-81.56108146130896 28.367321222680967)',4326))
GO

-- insert latitude, longitude, and geopoint for Ethos Vegan Kitchen (Winter Park)
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Ethos Vegan Kitchen (Winter Park)',
'28.5929318',
'-81.3529497',
geography::STGeomFromText('POINT (-81.3529497 28.5929318)',4326))
GO

-- insert latitude, longitude, and geopoint for Jonathans Pub (Cocoa Beach)
INSERT [dbo].[GeoTest] (Location, Latitude, Longitude, GeoPoint)
VALUES ('Jonathans Pub (Cocoa Beach)',
'28.32089612268097',
'-80.61123775069208',
geography::STGeomFromText('POINT (-80.61123775069208 28.32089612268097)',4326))
GO

-- show records for GeoTest table
SELECT *
FROM [dbo].[GeoTest];
GO

-- create a var to store the geopoint for Coconuts on the Beach (Cocoa Beach) Bar and Grill
DECLARE @Coconuts geography;
SELECT @Coconuts = [GeoPoint] FROM [GeoTest] WHERE Location = 'Coconuts on the Beach (Cocoa Beach)';

-- get distance in miles
SELECT [GeoPoint].STDistance(@Coconuts)/1609.344 AS DistanceMiles
FROM [GeoTest]
WHERE Location = 'Ron Jon Surf Shop (Cocoa Beach)';

-- get distance in kilometers
SELECT [GeoPoint].STDistance(@Coconuts)/1000 AS DistanceKilometers
FROM [GeoTest]
WHERE Location = 'Ron Jon Surf Shop (Cocoa Beach)';
GO

