--Window Functions Basics
--Window functions allow you to perform calculations across a set of table rows that are somehow related to the current row.


--Find the total sales for each product, Additionally provide details such as orderid,orderdate.
SELECT 
    orderID,
    orderDate,
    productID,
    sum(Sales) OVER (PARTITION BY productID) as TotalSales
FROM sales.Orders
/* 
In this query, we are using the SUM() window function to calculate the total sales for each product.
The PARTITION BY clause groups the data by productID, so the total sales will be calculated for each product separately.
The result will include the orderID, orderDate, productID, and the total sales for that product.
*/



SELECT
    orderID,
    orderDate,
    productID,
    sum(Sales) OVER (PARTITION BY productID ORDER BY orderDate) as RunningTotalSales
FROM sales.Orders
/*
In this query, we are using the SUM() window function to calculate the running total sales for each product.
The PARTITION BY clause groups the data by productID, so the running total sales will be calculated for each product separately.
The ORDER BY clause within the window function ensures that the running total is calculated in the order of orderDate.
The result will include the orderID, orderDate, productID, and the running total sales for that product.
*/




SELECT
    orderID,
    orderDate,
    productID,
    sum(Sales) OVER (PARTITION BY productID) as TotalSales,
    sum(Sales) OVER () as GrandTotalSales
FROM sales.Orders
/*
In this query, we are using the SUM() window function to calculate both the total sales for
each product and the grand total sales for all products.
The PARTITION BY clause groups the data by productID, so the total sales will be calculated for each product separately.
The second SUM() function without a PARTITION BY clause calculates the grand total sales for all products.
The result will include the orderID, orderDate, productID, total sales for that product, and the grand total sales for all products.
*/