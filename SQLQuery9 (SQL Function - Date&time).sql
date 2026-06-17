-- Date & Time SQL Functions: DAY, MONTH, YEAR
SELECT 
    OrderID,
    CreationTime,
    DAY(CreationTime) AS OrderDay,
    MONTH(CreationTime) As OrderMonth,
    YEAR(CreationTime) AS OrderYear
from sales.Orders


SELECT
    OrderID,
    CreationTime,
    DATEPART(WEEKDAY, CreationTime) AS OrderWeekday,
    DATEPART(DAY, CreationTime) AS OrderDay,
    DATEPART(MONTH, CreationTime) AS OrderMonth,
    DATEPART(YEAR, CreationTime) AS OrderYear,
    DATEPART(HOUR, CreationTime) AS OrderHour,
    DATEPART(QUARTER, CreationTime) AS OrderQuarter
from sales.Orders


-- Date & Time SQL Function: DATENAME
SELECT
    OrderID,
    CreationTime,
    DATENAME(WEEKDAY, CreationTime) AS OrderWeekdayName,
    DATENAME(MONTH, CreationTime) AS OrderMonthName,
    DATENAME(YEAR, CreationTime) AS OrderYearName, -- it will return the year as a string(not int), which is not very useful, but it demonstrates the function
    DATENAME(DAY, CreationTime) AS OrderDayName -- it will return the year as a string(not int), which is not very useful, but it demonstrates the function
from sales.Orders


-- Date & Time SQL Function: DATETRUNC
SELECT
    OrderID,
    CreationTime,
    DATETRUNC(MINUTE, CreationTime) AS OrderCreationMinute,
    DATETRUNC(HOUR, CreationTime) AS OrderCreationHour,
    DATETRUNC(DAY, CreationTime) AS OrderCreationDay,
    DATETRUNC(MONTH, CreationTime) AS OrderCreationMonth,
    DATETRUNC(YEAR, CreationTime) AS OrderCreationYear
from sales.Orders

--Example of using date functions in Data Engineering
-- Count the number of orders created each day
SELECT
    CreationTime,
    count(*)
from sales.Orders
group by CreationTime
--using DATETRUNC to group by month instead of exact timestamp
SELECT
    DATETRUNC(MONTH, CreationTime) AS OrderCreationMonth,
    count(*) AS OrderCount
from sales.Orders
group by DATETRUNC(MONTH, CreationTime)


-- Date & Time SQL Function: EOMONTH
SELECT
    CreationTime,
    EOMONTH(CreationTime) AS EndOfMonth
from sales.Orders



SELECT
    month(OrderDate) AS OrderMonth,
    count(*) AS OrderCount
FROM sales.Orders
group by month(OrderDate)