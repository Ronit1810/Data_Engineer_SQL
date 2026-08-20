--Subquery in From() Clause


--Find the Products that have price higher than the average price of all products
SELECT  
    *
FROM --Subquery
    (SELECT
        *,
        AVG(Price) over() As AveragePrice
    FROM Sales.Products) t
WHERE Price > AveragePrice
/*
Subquery as a Table (t): The inner query acts like a derived table (inline view).
Window Function: AVG(Price) OVER() is different from a plain AVG(Price) because it doesn’t collapse rows; instead, it adds the average alongside each row.
Filtering Logic: The WHERE clause compares each product’s price against the computed average.
Result: You get only the "above-average priced products.
*/




-- Rank Customer based on their total amount of sales.
SELECT
    *,
    RANK() OVER(ORDER BY TotalSale DESC) as RankSales
FROM
    (SELECT
        CustomerID,
        SUM(Sales) As TotalSale
    FROM Sales.Orders
    GROUP BY CustomerID) As Subquery
/*
Subquery: Used to calculate total sales per customer before ranking.
RANK() Function: Ideal for competition-style ranking where ties are allowed but gaps remain.
DESC Ordering: Ensures the highest sales get rank 1.
Result: A ranked list of customers based on their total sales.
*/





--Subquery in SELECT Clause

--Show the productID, Product name, price and the total number of orders

SELECT 
    ProductID,
    Product,
    Price,
    (SELECT COUNT(*) FROM Sales.Orders) AS TotalSales --Subquery
FROM Sales.Products








--Subquery in JOIN Clause

--Show all customer details and find the total orders of each customer

SELECT 
    c.*,
    o.Total_Order
FROM Sales.Customers AS c
LEFT JOIN
    (SELECT
        CustomerID,
        COUNT(*) AS Total_Order
    FROM Sales.Orders
GROUP BY CustomerID) AS o --Subquery
ON c.CustomerID = o.CustomerID






--Subquery in WHERE Clause

--Find the product that have a price higher than the average price of all product

SELECT * 
FROM Sales.Products
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)