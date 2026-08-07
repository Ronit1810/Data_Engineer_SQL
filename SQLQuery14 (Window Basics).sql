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




SELECT
    orderID,
    orderDate,
    productID,
    sum(Sales) OVER (PARTITION BY productID ORDER BY sales DESC) as RunningTotalSales
FROM sales.Orders
/*
In this query, we are using the SUM() window function to calculate the running total sales for each product, ordered by the sales amount.
The PARTITION BY clause groups the data by productID, so the running total sales will be calculated for each product separately.
The ORDER BY clause within the window function ensures that the running total is calculated in the order of the sales amount.
The result will include the orderID, orderDate, productID, and the running total sales for that product, ordered by the sales amount.
*/  

select * from sales.Orders


--Find the total sales for each product and order status combination, Additionally provide details such as orderid,orderdate.
Select 
    orderID,
    orderDate,
    productID,
    OrderStatus,
    Sales,
    sum(Sales) OVER (PARTITION BY productID , OrderStatus) as RunningTotalSales
from sales.Orders
/*
In this query, we are using the SUM() window function to calculate the running total sales for each product and order status combination.
The PARTITION BY clause groups the data by productID and OrderStatus, so the running total sales will be calculated for each combination separately.
The result will include the orderID, orderDate, productID, OrderStatus, and the running total sales for that product and order status combination.
*/



select 
    orderID,
    orderDate,
    productID,
    OrderStatus,
    Sales,
    Rank() OVER (ORDER BY Sales DESC) as SalesRank
from sales.Orders
/*
In this query, we are using the RANK() window function to assign a rank to each order based on the sales amount.
The ORDER BY clause within the window function orders the rows by the Sales column in descending order, so the highest sales amount will receive a rank of 1.
The result will include the orderID, orderDate, productID, OrderStatus, Sales, and the rank of each order based on the sales amount.
*/  





select 
    orderID,
    orderDate,
    productID,
    OrderStatus,
    Sales,
    Rank() OVER (PARTITION BY productID ORDER BY Sales DESC) as SalesRank,
    Sum(Sales) OVER (PARTITION BY productID ORDER BY Sales DESC) as totalSales,
    Sum(Sales) OVER (PARTITION BY productID ORDER BY Sales DESC ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) as totalSalesof3
from sales.Orders
/*
In this query, we are using the RANK() window function to assign a rank to each order based on the sales amount, partitioned by productID.
The ORDER BY clause within the window function orders the rows by the Sales column in descending order, so the highest sales amount for each product will receive a rank of 1.
We are also using the SUM() window function to calculate the total sales for each product, as well as the total sales for the current row and the next two following rows, partitioned by productID.
The result will include the orderID, orderDate, productID, OrderStatus, Sales, the rank of each order based on the sales amount, the total sales for each product, and the total sales for the current row and the next two following rows for each product.
*/