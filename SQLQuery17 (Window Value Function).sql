--Window Value Function



--1. LEAD()
--The LEAD() function is used to access data from the next row in the result set, without the need for a self-join. It can be used with the OVER() clause to access data from the next row within a partition.
SELECT
    orderID,
    orderDate,
    productID,
    Sales,
    LEAD(Sales) OVER (ORDER BY Sales) as NextSales,
    LEAD(Sales,2,0) OVER (ORDER BY Sales) as NextSalesWithOutDefault
FROM sales.Orders
/*In this query, we are using the LEAD() window function to access data from the next row in the result set, without the need for a self-join.
The ORDER BY clause specifies the order in which the data will be accessed within each partition, based on the Sales column.
The result will include the orderID, orderDate, productID, Sales, and the Sales value from the next row within the partition of productID.
*/




--2. LAG()
--The LAG() function is used to access data from the previous row in the result set, without the need for a self-join. It can be used with the OVER() clause to access data from the previous row within a partition.
SELECT
    orderID,
    orderDate,
    productID,
    Sales,
    LAG(Sales) OVER (ORDER BY Sales) as PreviousSales,
    LAG(Sales,2,0) OVER (ORDER BY Sales) as PreviousSalesWithOutDefault
FROM sales.Orders
/*In this query, we are using the LAG() window function to access data from the previous row in the result set, without the need for a self-join.
The ORDER BY clause specifies the order in which the data will be accessed within each partition, based on the Sales column.
The result will include the orderID, orderDate, productID, Sales, and the Sales value from the previous row within the partition of productID.
*/



--Analyze the Month-over-Month performance by finding the percentage change in sales for each month compared to the previous month. 
--This can be done using the LAG() function to access the sales value from the previous month and calculate the percentage change.
Select
    *,
    TotalSales - PreviousMonthSales as SalesDifference,
    Round(CAST((TotalSales - PreviousMonthSales) AS FLOAT) / PreviousMonthSales * 100, 2) as SalesPercentageDifference
from (Select
    MONTH(orderDate) as Month,
    LEAD(Sum(Sales)) over(Order by MONTH(orderDate)) as NextMonthSales,
    Sum(Sales) as TotalSales,
    LAG(Sum(Sales)) OVER (ORDER BY MONTH(orderDate)) as PreviousMonthSales
from sales.Orders
GROUP by MONTH(orderDate)) t
/*In this query, we are using the LEAD() and LAG() window functions to access data from the next and previous rows in the result set, without the need for a self-join.
The ORDER BY clause specifies the order in which the data will be accessed within each partition, based on the MONTH(orderDate) column.
The result will include the Month, TotalSales, NextMonthSales, PreviousMonthSales, SalesDifference, and SalesPercentageDifference for each month in the result set.
*/