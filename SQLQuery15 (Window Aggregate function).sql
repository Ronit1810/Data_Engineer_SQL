-- Window Aggregate Function

--COUNT()
--Count() function is used to count the number of rows in a partition or window. It can be used with the OVER() clause to calculate the count of rows for each partition or window.
SELECT
    orderID,
    orderDate,
    productID,
    count(*) OVER (PARTITION BY productID) as TotalOrders,
    count(*) over () AS GrandTotalOrders
FROM sales.Orders
/*
In this query, we are using the COUNT() window function to calculate both the total number of orders for each product and the grand total number of orders for all products.
The PARTITION BY clause groups the data by productID, so the total number of orders will be calculated for each product separately.
The second COUNT() function without a PARTITION BY clause calculates the grand total number of orders for all products.
The result will include the orderID, orderDate, productID, total number of orders for that product, and the grand total number of orders for all products.
*/


--Check whether the table order contain duplicate rows or not using COUNT() function
SELECT
    orderID,
    count(*) OVER (PARTITION BY orderID) as DuplicateCount
FROM sales.OrdersArchive
/*
In this query, we are using the COUNT() window function to check for duplicate rows in the OrdersArchive table based on the orderID.
The PARTITION BY clause groups the data by orderID, so the count of rows will be calculated for each orderID separately.
If the DuplicateCount is greater than 1, it indicates that there are duplicate rows for that orderID in the OrdersArchive table.
The result will include the orderID and the count of duplicate rows for that orderID.
*/


--Finding duplicate rows in the table order using COUNT() function
select *
from (SELECT
    orderID,
    count(*) OVER (PARTITION BY orderID) as DuplicateCount
FROM sales.OrdersArchive) t
where DuplicateCount > 1





--SUM()
--The SUM() function is used to calculate the sum of a numeric column in a partition or window. It can be used with the OVER() clause to calculate the sum for each partition or window.

SELECT
    orderID,
    orderDate,
    productID,
    sales,
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
    sales,
    sum(Sales) over() as GrandTotalSales,
    ROUND(CAST(sales as FLOAT) / sum(Sales) over() * 100, 3) as PercentageOfGrandTotalSales
FROM sales.Orders
--We changed sales data type to float because when an integer is divided by another integer, the result will be an integer. To get a decimal result, we need to cast one of the integers to a float.
/*
In this query, we are using the SUM() window function to calculate the grand total sales for all products and the percentage of each order's sales relative to the grand total sales.
The SUM() function without a PARTITION BY clause calculates the grand total sales for all products.
The percentage of each order's sales is calculated by dividing the sales for that order by the grand total sales and multiplying by 100. The result is rounded to three decimal places.
The result will include the orderID, orderDate, productID, sales, grand total sales for all products, and the percentage of each order's sales relative to the grand total sales.
*/




--AVG()
--The AVG() function is used to calculate the average of a numeric column in a partition or window. It can be used with the OVER() clause to calculate the average for each partition or window.    
select
    orderID,
    orderDate,
    productID,
    sales,
    avg((Coalesce(Sales, 0))) OVER (PARTITION BY productID) as AverageSales 
from sales.Orders
/*In this query, we are using the AVG() window function to calculate the average sales for each product.
The PARTITION BY clause groups the data by productID, so the average sales will be calculated for each product separately.
The COALESCE() function is used to handle any NULL values in the Sales column by replacing them with 0 before calculating the average.
The result will include the orderID, orderDate, productID, sales, and the average sales for that product.
*/


--Find all the orders where sales are greater than the average sales for all products using AVG() function
select
    *
from (select 
    orderID,
    orderDate,
    productID,
    sales,
    avg((Coalesce(Sales, 0))) OVER () as AverageSales
from sales.Orders) t
where Sales > AverageSales
/*In this query, we are using the AVG() window function to calculate the average sales for all products and then filtering the results to find all orders where the sales are greater than the average sales.
The AVG() function without a PARTITION BY clause calculates the average sales for all products.
The result will include all columns from the Orders table for orders where the sales are greater than the average sales for all products.
*/




--MIN() and MAX()
--The MIN() and MAX() functions are used to calculate the minimum and maximum values of a numeric column in a partition or window. They can be used with the OVER() clause to calculate the minimum and maximum values for each partition or window.
select
    orderID,
    orderDate,
    productID,
    sales,
    min(Sales) OVER (PARTITION BY productID) as MinimumSales,
    max(Sales) OVER (PARTITION BY productID) as MaximumSales
from sales.Orders
/*In this query, we are using the MIN() and MAX() window functions to calculate the minimum and maximum sales for each product.
The PARTITION BY clause groups the data by productID, so the minimum and maximum sales will be calculated for each product separately.
The result will include the orderID, orderDate, productID, sales, minimum sales for that product, and maximum sales for that product.
*/


select
    orderID,
    orderDate,
    productID,
    sales,
    min(COALESCE(Sales, 0)) OVER (PARTITION BY productID) as MinimumSales, --handle NULL values in the Sales
    max(COALESCE(Sales, 0)) OVER (PARTITION BY productID) as MaximumSales
from sales.Orders
/*In this query, we are using the MIN() and MAX() window functions to calculate the minimum and maximum sales for each product, while also handling any NULL values in the Sales column by replacing them with 0 using the COALESCE() function.
The PARTITION BY clause groups the data by productID, so the minimum and maximum sales will be calculated for each product separately.
The result will include the orderID, orderDate, productID, sales, minimum sales for that product, and maximum sales for that product, with NULL values in the Sales column treated as 0.
*/


SELECT * from (select 
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    Max(Salary) OVER () as MaximumSalary
from sales.Employees) t
where Salary = MaximumSalary
/*In this query, we are using the MAX() window function to calculate the maximum salary for all employees and then filtering the results to find all employees with that maximum salary.
The MAX() function without a PARTITION BY clause calculates the maximum salary for all employees.
The result will include all columns from the Employees table for employees with the maximum salary.
*/










--USE CASE :
--Running Total and Rolling Total
select 
    OrderID,
    OrderDate,
    ProductID, 
    Sales,
    AVG(Sales) over(partition by productID ORDER BY OrderDate) as RunningAverage, --Running Average
    AVG(Sales) over(partition by productID ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as RollingAverage --Rolling Average
from sales.Orders
/*In this query, we are using the AVG() window function to calculate both the running average and rolling average of sales for each product.
The PARTITION BY clause groups the data by productID, so the averages will be calculated for each product separately.
The ORDER BY clause specifies the order of the rows within each partition based on the OrderDate.
The RunningAverage is calculated by taking the average of all sales for each product up to the current row, while the RollingAverage is calculated by taking the average of the current row and the two preceding rows for each product.
The result will include the orderID, orderDate, productID, sales, running average of sales for that product, and rolling average of sales for that product.
*/  