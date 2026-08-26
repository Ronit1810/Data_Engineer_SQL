--CTE (Common Table Expression)

--1. None - Recursive CTE

--STEP 1: Find The total sales per customer

With CTE_TotalSales AS (
    SELECT
        CustomerID,
        SUM(Sales) AS Total_Sales
    FROM Sales.Orders
    GROUP BY CustomerID)

--STEP 2: Find the last order date for each customer

, CTE_Last_Order AS (
    SELECT
        CustomerID,
        MAX(OrderDate) As Last_order
    FROM Sales.Orders
    GROUP BY CustomerID
)

--STEP 3: Rank Customer Based on Total Sales per Customer

, CTE_Rank_Sales AS (
    SELECT
        CustomerID,
        RANK() OVER(ORDER BY Total_Sales) AS Rank_sales
    FROM CTE_TotalSales
)

--STEP 4: Segment Customer Based on their total sales

, CTE_Segment_Sales AS (
    SELECT 
        CustomerID,
        CASE
            WHEN Total_Sales > 100 THEN 'HIGH'
            WHEN Total_Sales > 80 THEN 'MEDIUM'
            ELSE 'LOW'
        END AS Customer_Segment
    FROM CTE_TotalSales
)

--MAIN QUERY

SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    TS.Total_Sales,
    LO.Last_order,
    RS.Rank_sales,
    SS.Customer_Segment
FROM Sales.Customers AS C
LEFT JOIN CTE_TotalSales AS TS  -- CTE !
ON C.CustomerID = TS.CustomerID

LEFT JOIN CTE_Last_Order AS LO  -- CTE 2
ON C.CustomerID = LO.CustomerID

LEFT JOIN CTE_Rank_Sales AS RS  --CTE 3
ON C.CustomerID = RS.CustomerID

LEFT JOIN CTE_Segment_Sales AS SS --CTE 4
ON C.CustomerID = SS.CustomerID

ORDER BY Rank_sales DESC;











--2. Recursive CTE

--Generate a sequence of number from 1 to 20

WITH CTE_Series AS (
    --Anchor Query
    SELECT
    1 AS Number

    UNION ALL --Help to join the table

    --Recursive Query
    SELECT
        Number + 1
    FROM CTE_Series
    WHERE Number < 20
)
--Main Query
SELECT *
FROM CTE_Series
OPTION (MAXRECURSION 15) --Help to manage the recursion




--EXAMPLE: Show the employee hierarchy by displaying each employee's level within the org.

WITH CTE_Hierarchy AS (
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        ManagerID,
        1 AS Level
    FROM Sales.Employees
    WHERE ManagerID IS Null

    UNION ALL

    SELECT
        C.EmployeeID,
        C.FirstName,
        C.LastName,
        C.ManagerID,
        Level + 1        
    FROM Sales.Employees AS C
    INNER JOIN CTE_Hierarchy AS H
    ON C.ManagerID = H.EmployeeID
)
SELECT *,
    CASE Level
        WHEN 1 THEN 'Lead'
        WHEN 2 THEN 'SE'
        ELSE 'ASE'
    END AS Profile
FROM CTE_Hierarchy