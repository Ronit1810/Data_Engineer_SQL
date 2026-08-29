--CTAS (CREATE TABLE AS SELECT)

--Create a CTAS Table

SELECT 
    DATENAME(Month, OrderDate) AS Order_Month,
    COUNT(OrderID) As Total_Order
    INTO Sales.MonthlyOrder
FROM Sales.Orders
GROUP BY DATENAME(Month, OrderDate)






--Delete CTAS
DROP TABLE Sales.MonthlyOrder








--Update CTAS
/*
To refresh a CTAS (Create Table As Select) table with the latest data, the process involves two steps:
Drop the existing CTAS table.
Re-run the CTAS creation query to rebuild the table with updated data.
This workflow can be seamlessly executed using T-SQL.
*/

IF OBJECT_ID('Sales.MonthlyOrder','U') IS NOT NULL --'U' stand for user defined table (we also have 'V' Which stand for view)
    DROP TABLE Sales.MonthlyOrder
GO
SELECT 
    DATENAME(Month, OrderDate) AS Order_Month,
    COUNT(OrderID) As Total_Order
    INTO Sales.MonthlyOrder
FROM Sales.Orders
GROUP BY DATENAME(Month, OrderDate)









