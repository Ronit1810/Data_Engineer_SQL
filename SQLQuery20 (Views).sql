
--Find the running total of sales per month

--METHOD 01 - USING CTE(Common Table Expression)
WITH CTE_Summary_Sales AS (
    SELECT
        DATETRUNC(MONTH, OrderDate) AS Order_Month,
        SUM(Sales) AS Total_Sales,
        COUNT(OrderID) AS Total_Order,
        COUNT(Quantity) AS Total_Quantity
    FROM Sales.Orders
    GROUP BY DATETRUNC(MONTH, OrderDate)
)
SELECT
    *,
    SUM(Total_Sales) OVER(ORDER BY Order_Month) AS Running_Total
FROM CTE_Summary_Sales;











--VIEWS

--METHOD 01 - USING View

--STEP 1: Create a View
GO

CREATE VIEW Sales.vw_Summary_Sales AS  --Here in name of view we mention Sales.vw, this Sales is a schema. If we don't mention any schema name it take default dbo Schema.
        SELECT
        DATETRUNC(MONTH, OrderDate) AS Order_Month,
        SUM(Sales) AS Total_Sales,
        COUNT(OrderID) AS Total_Order,
        COUNT(Quantity) AS Total_Quantity
    FROM Sales.Orders
    GROUP BY DATETRUNC(MONTH, OrderDate) ;

--STEP 2: Query the View
GO

SELECT
    *,
    SUM(Total_Sales) OVER(ORDER BY Order_Month) AS Running_Total
FROM Sales.vw_Summary_Sales;













--TASK: Provide View that combine details from order, product, customer, and employee


--Single Query
SELECT
    o.OrderID,
    o.OrderDate,
    o.Quantity,
    o.Sales,
    c.Country AS Customer_Country,
    COALESCE(c.FirstName, '') + ' ' + COALESCE(c.LastName, '') AS Customer_Name,
    p.Product,
    p.Category,
    p.Price,
    COALESCE(e.FirstName, '') + ' ' + COALESCE(e.LastName, '') AS Employee_Name,
    e.Department
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID




--Using View (we'll use view to see the same result as view table)
GO
-- this will create a view with above logic
CREATE VIEW Sales.vw_Order_Detail AS
SELECT
    o.OrderID,
    o.OrderDate,
    o.Quantity,
    o.Sales,
    c.Country AS Customer_Country,
    COALESCE(c.FirstName, '') + ' ' + COALESCE(c.LastName, '') AS Customer_Name,
    p.Product,
    p.Category,
    p.Price,
    COALESCE(e.FirstName, '') + ' ' + COALESCE(e.LastName, '') AS Employee_Name,
    e.Department
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID

--Querying Newly created view 
GO

SELECT * FROM Sales.vw_Order_Detail