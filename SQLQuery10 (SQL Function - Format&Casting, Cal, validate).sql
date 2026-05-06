--Formatting
--Syntax: FORMAT(value, format_string)
select
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'yyyy-MM-dd') AS FormattedCreationTime, -- formats the date as '2024-06-01'
    FORMAT(CreationTime, 'MM/dd/yyyy') AS FormattedCreationTime2, -- formats the date as '06/01/2024'
    FORMAT(CreationTime, 'MMMM dd, yyyy') AS FormattedCreationTime3, -- formats the date as 'June 01, 2024'
    FORMAT(CreationTime, 'dd') AS dd, -- day of the month with leading zero
    FORMAT(CreationTime, 'ddd') AS ddd, -- abbreviated weekday name(Mon, Tue, Wed, etc.)
    FORMAT(CreationTime, 'dddd') AS dddd, -- full weekday name(Monday, Tuesday, Wednesday, etc.)
    FORMAT(CreationTime, 'MM') AS mm, -- month with leading zero
    FORMAT(CreationTime, 'MMM') AS mmm, -- abbreviated month name(Jan, Feb, Mar, etc.)
    FORMAT(CreationTime, 'MMMM') AS mmmm, -- full month name(January, February, March, etc.)
    FORMAT(CreationTime, 'yyyy') AS yyyy -- year with century
from sales.Orders

--Task: Format CreationTime as Day wed Jan Q1 2024 12:30:45 PM
SELECT
    OrderID,
    CreationTime,
    'Day ' + FORMAT(CreationTime, 'ddd MMM') + ' Q' + DATENAME(QUARTER, CreationTime) + ' ' + 
    FORMAT(CreationTime, 'yyyy') + ' ' + FORMAT(CreationTime, 'hh:mm:ss tt') AS FormattedCreationTime
from sales.Orders



-- Casting
-- Syntax: CAST(expression AS data_type)
SELECT
    OrderID,
    CreationTime,
    CAST(OrderID AS VARCHAR(10)) AS OrderIDString, -- casts the integer OrderID to a string with a specified length
    CAST(CreationTime AS DATE) AS CreationDate, -- casts the datetime to date, removing the time part
    CAST(CreationTime AS TIME) AS CreationTimeOnly, -- casts the datetime to time, removing the date part
    CAST(CreationTime AS VARCHAR(20)) AS CreationTimeString -- casts the datetime to a string with a specified length
from sales.Orders





--DateAdd()
--Syntax: DATEADD(part, number, date)
SELECT
    OrderID,
    CreationTime,
    DATEADD(DAY, 7, CreationTime) AS CreationTimePlus7Days, -- adds 7 days to the CreationTime
    DATEADD(MONTH, 1, CreationTime) AS CreationTimePlus1Month, -- adds 1 month to the CreationTime
    DATEADD(YEAR, 1, CreationTime) AS CreationTimePlus1Year, -- adds 1 year to the CreationTime
    DATEADD(DAY, -7, CreationTime) AS CreationTimeMinus7Days, -- subtracts 7 days from the CreationTime
    DATEADD(MONTH, -1, CreationTime) AS CreationTimeMinus1Month, -- subtracts 1 month from the CreationTime
    DATEADD(YEAR, -1, CreationTime) AS CreationTimeMinus1Year -- subtracts 1 year from the CreationTime
from sales.Orders




--DateDiff()
--Syntax: DATEDIFF(part, start_date, end_date)
SELECT
    OrderID,
    CreationTime,
    GeTDATE() AS CurrentDateTime,
    DATEDIFF(DAY, CreationTime, GETDATE()) AS DaysSinceCreation, -- calculates the number of days between CreationTime and the current date
    DATEDIFF(MONTH, CreationTime, GETDATE()) AS MonthsSinceCreation, -- calculates the number of months between CreationTime and the current date
    DATEDIFF(YEAR, CreationTime, GETDATE()) AS YearsSinceCreation -- calculates the number of years between CreationTime and the current date
from sales.Orders




--IsDate()
--Syntax: ISDATE(expression)
SELECT
    OrderID,
    CreationTime,
    ISDATE('2024-06-01') AS IsValidDate1, -- checks if the string '2024-06-01' is a valid date, should return 1
    ISDATE('InvalidDate') AS IsValidDate2 -- checks if the string 'InvalidDate' is a valid date, should return 0
from sales.Orders