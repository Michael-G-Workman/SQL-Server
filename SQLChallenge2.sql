/*
=========================================================================================================

SQL Challenge #2

By Michael G. Workman

Before doing this challenge, run the script BOOKS_Create.sql to create the authors database,
after creating the table, the challenge is to create TSQL which will answer the order amount
totals for store, with a column for each store, then a second record set with a 
total item sold by store column for each store.

This example is freely distributable under terms of MIT open source license

=========================================================================================================
*/

-- SOLUTION

USE [AuthorsDB]
GO

----------------------
-- first record set --
----------------------

-- temp table for the columns
CREATE TABLE #Columns (
	stor_id varchar(200),
	qty int
)

-- populate temp table with sales data
INSERT INTO #Columns
SELECT 'Store' + CAST(stor_id  AS varchar(200)) AS stor_id, qty FROM sales;

-- dynamically create a columns variable containing the store numbers
DECLARE @columns varchar(max)
SELECT @columns = COALESCE(@columns + ',[' + cast(stor_id as varchar) + ']',
'[' + cast(stor_id as varchar)+ ']')
FROM #Columns
GROUP BY stor_id;

-- build pivot query string
DECLARE @query varchar(max);
SET @query = 'SELECT *
FROM #Columns
PIVOT
(
  SUM(Qty)
  FOR [stor_id] IN ('+@columns+')
)
AS salesqty';

-- execute pivot query
EXECUTE(@query);

-- drop temp table
DROP TABLE #Columns;
GO


-----------------------
-- second record set --
-----------------------

SELECT sales1.stor_id, 
sales1.ord_num, 
sales1.ord_date, 
sales1.qty, 
(SELECT SUM(sales2.qty) FROM sales sales2 WHERE sales2.stor_id = sales1.stor_id) AS [TotalItemSoldByStore]
FROM sales sales1
ORDER BY sales1.stor_id ASC;
GO

