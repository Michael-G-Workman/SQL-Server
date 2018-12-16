/*
=========================================================================================================

SQL Challenge #1

By Michael G. Workman

Before doing this challenge, run the script AUTHORS_Create.sql to create the authors database,
after creating the table, the challenge is to create TSQL which will answer the order amount
totals for each period along with a running total of all orders up to and including that current
period and all periods before, without using a looping cursor, and also including periods with 0.00
in sales

This example is freely distributable under terms of MIT open source license

=========================================================================================================
*/

-- SOLUTION

USE [AuthorsDB]
GO

-- create temp table to hold the periods
CREATE TABLE #Periods
(
	Period int NOT NULL
)

-- populate the Periods table with numbers up until the max period in SQLTest table, dynamically
DECLARE @Period int;
DECLARE @Limit int;
SELECT @Period = 1;

-- create temp table with 1 row for each period, up to 32 periods
SELECT @Limit = MAX(Period) FROM SQLTest;
SET NOCOUNT ON
WHILE @Period <= @Limit
BEGIN
    INSERT INTO #Periods VALUES (@Period);
    SELECT @Period = @Period + 1;
END;
SET NOCOUNT OFF

-- get the running total from the SQLTest table for each period, 
-- including periods not included in SQLTest, which have Amount = 0.00
SELECT periods.Period AS Period,
	   CASE 
	   WHEN ((SELECT COUNT(sqltest.Period) FROM SQLTest sqltest WHERE sqltest.Period = periods.Period) = 0)
		THEN 0.00
	   WHEN ((SELECT COUNT(sqltest.Period) FROM SQLTest sqltest WHERE sqltest.Period = periods.Period) = 1)
	    THEN (SELECT sqltest.Amount FROM SQLTest sqltest WHERE sqltest.Period = periods.Period)
	   END
	   AS Amount,
	   (SELECT SUM(sqltest.Amount) FROM SQLTest sqltest WHERE sqltest.Period <= periods.Period) AS RunningTotal
FROM #Periods periods;
	 
-- delete temp table	   
DROP TABLE #Periods;
GO

