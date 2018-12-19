/*
=========================================================================================================

BOOKS Create

By Michael G. Workman

This script will create the Authors database to be used for the SQL Challenges including in this
github for Abion Technoloy, also, this script is used to create the database for the
Books ASP.NET MVC 5 Web Application with database first Entity Framework ORM.

This example is freely distributable under terms of MIT open source license

=========================================================================================================
*/

CREATE DATABASE [AuthorsDB];
GO

USE [AuthorsDB]
GO

CREATE TABLE [dbo].[Authors] (
	[ID] uniqueidentifier NOT NULL,
	[au_id] VARCHAR(25) NOT NULL ,
	[au_lname] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[au_fname] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[phone] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[address] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contract] [bit] NOT NULL, 
	CONSTRAINT [PK_authors] PRIMARY KEY ([ID])
)
GO

ALTER TABLE [AuthorsDB].[dbo].[Authors] ADD CONSTRAINT [DF_authors_ID] DEFAULT (newid()) FOR [ID]
GO

INSERT INTO Authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract)
SELECT '238-95-7766','Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94705','1' UNION ALL
SELECT '267-41-2394','O''Leary','Michael','408 286-2428','22 Cleveland Av. #14','San Jose','CA','95128','1' UNION ALL
SELECT '274-80-9391','Straight','Dean','415 834-2919','5420 College Av.','Oakland','CA','94609','1' UNION ALL
SELECT '341-22-1782','Smith','Meander','913 843-0462','10 Mississippi Dr.','Lawrence','KS','66044','0' UNION ALL
SELECT '409-56-7008','Bennet','Abraham','415 658-9932','6223 Bateman St.','Berkeley','CA','94705','1' UNION ALL
SELECT '427-17-2319','Dull','Ann','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301','1' UNION ALL
SELECT '472-27-2349','Gringlesby','Burt','707 938-6445','PO Box 792','Covelo','CA','95428','1' UNION ALL
SELECT '486-29-1786','Locksley','Charlene','415 585-4620','18 Broadway Av.','San Francisco','CA','94130','1' UNION ALL
SELECT '527-72-3246','Greene','Morningstar','615 297-2723','22 Graybar House Rd.','Nashville','TN','37215','0' UNION ALL
SELECT '648-92-1872','Blotchet-Halls','Reginald','503 745-6402','55 Hillsdale Bl.','Corvallis','OR','97330','1' UNION ALL
SELECT '672-71-3249','Yokomoto','Akiko','415 935-4228','3 Silver Ct.','Walnut Creek','CA','94595','1' UNION ALL
SELECT '712-45-1867','del Castillo','Innes','615 996-8275','2286 Cram Pl. #86','Ann Arbor','MI','48105','1' UNION ALL
SELECT '722-51-5454','DeFrance','Michel','219 547-9982','3 Balding Pl.','Gary','IN','46403','1' UNION ALL
SELECT '724-08-9931','Stringer','Dirk','415 843-2991','5420 Telegraph Av.','Oakland','CA','94609','0' UNION ALL
SELECT '724-80-9391','MacFeather','Stearns','415 354-7128','44 Upland Hts.','Oakland','CA','94612','1' UNION ALL
SELECT '756-30-7391','Karsen','Livia','415 534-9219','5720 McAuley St.','Oakland','CA','94609','1' UNION ALL
SELECT '807-91-6654','Panteley','Sylvia','301 946-8853','1956 Arlington Pl.','Rockville','MD','20853','1' UNION ALL
SELECT '846-92-7186','Hunter','Sheryl','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301','1' UNION ALL
SELECT '893-72-1158','McBadden','Heather','707 448-4982','301 Putnam','Vacaville','CA','95688','0' UNION ALL
SELECT '899-46-2035','Ringer','Anne','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152','1' UNION ALL
SELECT '998-72-3567','Ringer','Albert','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152','1'

CREATE TABLE [dbo].[Titles] (
	[ID] uniqueidentifier NOT NULL,
	[title_id] VARCHAR(25) NOT NULL ,
	[title] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[type] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[pub_id] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[price] [money] NULL ,
	[advance] [money] NULL ,
	[royalty] [int] NULL ,
	[ytd_sales] [int] NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pubdate] [datetime] NOT NULL,
	CONSTRAINT [PK_titles] PRIMARY KEY ([ID])
)
GO

ALTER TABLE [AuthorsDB].[dbo].[Titles] ADD CONSTRAINT [DF_titles_ID] DEFAULT (newid()) FOR [ID]
GO

INSERT INTO Titles (title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate)
SELECT 'BU2075','You Can Combat Computer Stress!','business    ','0736',2.99,10125.00,'24','18722','The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','Jun 30 1991 12:00AM' UNION ALL
SELECT 'BU7832','Straight Talk About Computers','business    ','1389',19.99,5000.00,'10','4095','Annotated analysis of what computers can do for you: a no-hype guide for the critical user.','Jun 22 1991 12:00AM' UNION ALL
SELECT 'MC2222','Silicon Valley Gastronomic Treats','mod_cook    ','0877',19.99,0.00,'12','2032','Favorite recipes for quick, easy, and elegant meals.','Jun  9 1991 12:00AM' UNION ALL
SELECT 'MC3021','The Gourmet Microwave','mod_cook    ','0877',2.99,15000.00,'24','22246','Traditional French gourmet recipes adapted for modern microwave cooking.','Jun 18 1991 12:00AM' UNION ALL
SELECT 'PC1035','But Is It User Friendly?','popular_comp','1389',22.95,7000.00,'16','8780','A survey of software for the naive user, focusing on the ''friendliness'' of each.','Jun 30 1991 12:00AM' UNION ALL
SELECT 'PC8888','Secrets of Silicon Valley','popular_comp','1389',20.00,8000.00,'10','4095','Muckraking reporting on the world''s largest computer hardware and software manufacturers.','Jun 12 1994 12:00AM' UNION ALL
SELECT 'PS1372','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology  ','0877',21.59,7000.00,'10','375','A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.','Oct 21 1991 12:00AM' UNION ALL
SELECT 'PS2091','Is Anger the Enemy?','psychology  ','0736',10.95,2275.00,'12','2045','Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.','Jun 15 1991 12:00AM' UNION ALL
SELECT 'PS2106','Life Without Fear','psychology  ','0736',7.00,6000.00,'10','111','New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample m','Oct  5 1991 12:00AM' UNION ALL
SELECT 'PS3333','Prolonged Data Deprivation: Four Case Studies','psychology  ','0736',19.99,2000.00,'10','4072','What happens when the data runs dry?  Searching evaluations of information-shortage effects.','Jun 12 1991 12:00AM' UNION ALL
SELECT 'PS7777','Emotional Security: A New Algorithm','psychology  ','0736',7.99,4000.00,'10','3336','Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids em','Jun 12 1991 12:00AM' UNION ALL
SELECT 'TC3218','Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook   ','0877',20.95,7000.00,'10','375','Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.','Oct 21 1991 12:00AM' UNION ALL
SELECT 'TC4203','Fifty Years in Buckingham Palace Kitchens','trad_cook   ','0877',11.95,4000.00,'14','15096','More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','Jun 12 1991 12:00AM' UNION ALL
SELECT 'TC7777','Sushi, Anyone?','trad_cook   ','0877',14.99,8000.00,'10','4095','Detailed instructions on how to make authentic Japanese sushi in your spare time.','Jun 12 1991 12:00AM'

CREATE TABLE [dbo].[TitleAuthor] (
	[ID] uniqueidentifier NOT NULL,
	[au_id] VARCHAR(25) NOT NULL ,
	[title_id] VARCHAR(25) NOT NULL ,
	[au_ord] [tinyint] NULL ,
	[royaltyper] [int] NULL,
	CONSTRAINT [PK_titleauthor] PRIMARY KEY ([ID])
)
GO

ALTER TABLE [AuthorsDB].[dbo].[TitleAuthor] ADD CONSTRAINT [DF_titleauthor_ID] DEFAULT (newid()) FOR [ID]
GO

INSERT INTO TitleAuthor (au_id, title_id, au_ord, royaltyper)
SELECT '172-32-1176','PS3333','1','100' UNION ALL
SELECT '213-46-8915','BU1032','2','40' UNION ALL
SELECT '213-46-8915','BU2075','1','100' UNION ALL
SELECT '238-95-7766','PC1035','1','100' UNION ALL
SELECT '267-41-2394','BU1111','2','40' UNION ALL
SELECT '267-41-2394','TC7777','2','30' UNION ALL
SELECT '274-80-9391','BU7832','1','100' UNION ALL
SELECT '409-56-7008','BU1032','1','60' UNION ALL
SELECT '427-17-2319','PC8888','1','50' UNION ALL
SELECT '472-27-2349','TC7777','3','30' UNION ALL
SELECT '486-29-1786','PC9999','1','100' UNION ALL
SELECT '486-29-1786','PS7777','1','100' UNION ALL
SELECT '648-92-1872','TC4203','1','100' UNION ALL
SELECT '672-71-3249','TC7777','1','40' UNION ALL
SELECT '712-45-1867','MC2222','1','100' UNION ALL
SELECT '722-51-5454','MC3021','1','75' UNION ALL
SELECT '724-80-9391','BU1111','1','60' UNION ALL
SELECT '724-80-9391','PS1372','2','25' UNION ALL
SELECT '756-30-7391','PS1372','1','75' UNION ALL
SELECT '807-91-6654','TC3218','1','100' UNION ALL
SELECT '846-92-7186','PC8888','2','50' UNION ALL
SELECT '899-46-2035','MC3021','2','25' UNION ALL
SELECT '899-46-2035','PS2091','2','50' UNION ALL
SELECT '998-72-3567','PS2091','1','50' UNION ALL
SELECT '998-72-3567','PS2106','1','100'

CREATE TABLE SQLTest (
[ID] uniqueidentifier NOT NULL,
Period		int,
Amount		money,
CONSTRAINT [PK_SQLTest] PRIMARY KEY ([ID]))

ALTER TABLE [AuthorsDB].[dbo].[SQLTest] ADD CONSTRAINT [DF_SQLTest_ID] DEFAULT (newid()) FOR [ID]
GO

INSERT INTO SQLTest (Period, Amount)
SELECT 1,500.00 UNION ALL
SELECT 6,300.00 UNION ALL
SELECT 9,20.00 UNION ALL
SELECT 13,200.00 UNION ALL
SELECT 17,800.00 UNION ALL
SELECT 22,750.00 UNION ALL
SELECT 23,50.00 UNION ALL
SELECT 24,550.00 UNION ALL
SELECT 31,100.00

CREATE TABLE [dbo].[Sales] (
	[ID] uniqueidentifier NOT NULL,
	[stor_id] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ord_num] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ord_date] [datetime] NOT NULL ,
	[qty] [int] NOT NULL,
	CONSTRAINT [PK_sales] PRIMARY KEY ([ID])
)

ALTER TABLE [AuthorsDB].[dbo].[Sales] ADD CONSTRAINT [DF_sales_ID] DEFAULT (newid()) FOR [ID]
GO

INSERT INTO Sales (stor_id, ord_num, ord_date, qty)
SELECT 7067, 'D4482', '09/14/1994', 10 UNION ALL
SELECT 7067, 'P2121', '06/15/1992', 40 UNION ALL
SELECT 7067, 'P2121', '06/15/1992', 20 UNION ALL
SELECT 7067, 'P2121', '06/15/1992', 20 UNION ALL
SELECT 7131, 'N914008', '09/14/1994', 20 UNION ALL
SELECT 7131, 'N914014', '09/14/1994', 25 UNION ALL
SELECT 7131, 'P3087a', '05/29/1993', 20 UNION ALL
SELECT 7131, 'P3087a', '05/29/1993', 25 UNION ALL
SELECT 7131, 'P3087a', '05/29/1993', 15 UNION ALL
SELECT 7131, 'P3087a', '05/29/1993', 25 UNION ALL
SELECT 7896, 'QQ2299', '010/28/1993', 15 UNION ALL
SELECT 7896, 'TQ456', '012/12/1993', 10 UNION ALL
SELECT 7896, 'X999', '02/21/1993', 35 UNION ALL
SELECT 8042, '423LL922', '09/14/1994', 15 UNION ALL
SELECT 8042, '423LL930', '09/14/1994', 10 UNION ALL
SELECT 8042, 'P723', '03/11/1993', 25 UNION ALL
SELECT 8042, 'QA879.1', '05/22/1993', 30

