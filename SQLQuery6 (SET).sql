SELECT * from Sales.Customers;
SELECT * FROM Sales.Employees;
--SELECT * FROM Sales.Orders;
--SELECT * FROM Sales.OrdersArchive;

GO

--UNION operator
GO
--Combines the result set of two or more SELECT statements (only distinct values)
SELECT 
    FirstName,
    LastName
from Sales.Customers
UNION   
SELECT
    FirstName,
    LastName
From Sales.Employees;

GO

--UNION ALL operator
GO
--Combines the result set of two or more SELECT statements (all values)
SELECT 
    FirstName,
    LastName
FROM Sales.Customers
UNION ALL
SELECT
    FirstName,
    LastName
FROM Sales.Employees;

GO

SELECT 'Customers' AS RecordType, COUNT(*) AS TotalRecords
FROM Sales.Customers
UNION ALL
SELECT 'Employees' AS RecordType, COUNT(*) AS TotalRecords
FROM Sales.Employees;

GO

--EXCEPT (minus) operator
GO
--Returns distinct values from the left query that are not in the right query
SELECT 
    FirstName,
    LastName
FROM Sales.Customers
EXCEPT
SELECT
    FirstName,
    LastName
FROM Sales.Employees;

GO

--INTERSECT operator
GO
--Returns distinct values that are in both queries
SELECT 
    FirstName,
    LastName   
FROM Sales.Customers
INTERSECT
SELECT
    FirstName,
    LastName
FROM Sales.Employees;

GO

--Order data are stored in two tables: Sales.Orders and Sales.OrdersArchive
--UNION ALL to combine data from both tables without duplicates

SELECT 'Orders' AS Source
        ,[OrderID]
        ,[ProductID]
        ,[CustomerID]
        ,[SalesPersonID]
        ,[OrderDate]
        ,[ShipDate]
        ,[OrderStatus]
        ,[ShipAddress]
        ,[BillAddress]
        ,[Quantity]
        ,[Sales]
        ,[CreationTime]
from Sales.Orders
UNION
SELECT 'OrdersArchive' AS Source
        ,[OrderID]
        ,[ProductID]
        ,[CustomerID]
        ,[SalesPersonID]
        ,[OrderDate]
        ,[ShipDate]
        ,[OrderStatus]
        ,[ShipAddress]
        ,[BillAddress]
        ,[Quantity]
        ,[Sales]
        ,[CreationTime]
from Sales.OrdersArchive;

--while using SET operators always use the column names instead of SELECT * to avoid errors due to different column names or data types in the tables being combined.