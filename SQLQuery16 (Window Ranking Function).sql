--Window Ranking Function

--1. ROW_NUMBER()
--The ROW_NUMBER() function is used to assign a unique sequential integer to rows within a partition of a result set. It can be used with the OVER() clause to assign a unique number to each row within a partition.
SELECT
    orderID,
    orderDate,
    productID,
    Sales,
    ROW_NUMBER() OVER (ORDER BY Sales) as RowNumwithoutPartition
FROM sales.Orders
/*In this query, we are using the ROW_NUMBER() window function to assign a unique sequential integer to each row within a partition of the result set.
The PARTITION BY clause groups the data by productID, so the row numbers will be assigned for each product separately.
The ORDER BY clause specifies the order in which the row numbers will be assigned within each partition, based on the orderDate.
The result will include the orderID, orderDate, productID, and the unique row number assigned to each row within the partition of productID.
*/




--2. RANK()
--The RANK() function is used to assign a unique rank to rows within a partition of a result set. It can be used with the OVER() clause to assign a unique rank to each row within a partition.
SELECT
    orderID,
    orderDate,
    productID,
    Sales,
    RANK() OVER (ORDER BY Sales) as RankNum
FROM sales.Orders
/*In this query, we are using the RANK() window function to assign a unique rank to each row within a partition of the result set.
The ORDER BY clause specifies the order in which the ranks will be assigned within each partition, based on the Sales column.
The result will include the orderID, orderDate, productID, Sales, and the unique rank assigned to each row within the partition of productID.
*/




--3. DENSE_RANK()
--The DENSE_RANK() function is used to assign a unique rank to rows within a partition of a result set, without gaps in the ranking values. It can be used with the OVER() clause to assign a unique rank to each row within a partition.
SELECT
    orderID,
    orderDate,
    productID,
    Sales,
    DENSE_RANK() OVER (ORDER BY Sales) as DenseRankNum
FROM sales.Orders
/*In this query, we are using the DENSE_RANK() window function to assign a unique rank to each row within a partition of the result set, without gaps in the ranking values.
The ORDER BY clause specifies the order in which the ranks will be assigned within each partition, based on the Sales column.
The result will include the orderID, orderDate, productID, Sales, and the unique dense rank assigned to each row within the partition of productID.
*/





--USE CASE
--Find Top highest sales for each product
SELECT 
    *
FROM (Select
    orderID,
    orderDate,
    productID,
    Sales,
    ROW_NUMBER() OVER (PARTITION BY productID ORDER BY Sales) as RowNum
from sales.Orders) t
where RowNum = 1

/*In this query, we are using the ROW_NUMBER() window function to assign a unique sequential integer to each row within a partition of the result set.
The PARTITION BY clause groups the data by productID, so the row numbers will be assigned for each product separately.
The ORDER BY clause specifies the order in which the row numbers will be assigned within each partition, based on the Sales column.
The result will include the orderID, orderDate, productID, Sales, and the unique row number assigned to each row within the partition of productID.
*/