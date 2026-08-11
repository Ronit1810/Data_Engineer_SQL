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




--4. NTILE()
--The NTILE() function is used to divide the result set into a specified number of groups, and assigns a unique group number to each row within the partition. It can be used with the OVER() clause to assign a unique group number to each row within a partition.
SELECT
    orderID,
    orderDate,
    productID,
    Sales,
    NTILE(1) OVER (ORDER BY Sales) as OnetileNum,
    NTILE(2) OVER (ORDER BY Sales) as TwotileNum,
    NTILE(3) OVER (ORDER BY Sales) as ThreetileNum,
    NTILE(4) OVER (ORDER BY Sales) as FourtileNum
FROM sales.Orders
/*In this query, we are using the NTILE() window function to divide the result set into a specified number of groups, and assigns a unique group number to each row within the partition.
The ORDER BY clause specifies the order in which the group numbers will be assigned within each partition, based on the Sales column.
The result will include the orderID, orderDate, productID, Sales, and the unique group number assigned to each row within the partition of productID.
*/


--USE CASE
--Segment all order into 3 categories: High Sales, Medium Sales, Low Sales
select 
    *,
    CASE When SalesCategoryBuckets = 1 THEN 'High Sales'
          When SalesCategoryBuckets = 2 THEN 'Medium Sales'
          When SalesCategoryBuckets = 3 THEN 'Low Sales'
    END as SalesSegment
FROM (
    SELECT
        orderID,
        orderDate,
        productID,
        Sales,
        NTILE(3) OVER (ORDER BY Sales DESC) as SalesCategoryBuckets
    FROM sales.Orders
) t
/*In this query, we are using the NTILE() window function to divide the result set into 3 groups, and assigns a unique group number to each row within the partition.
The ORDER BY clause specifies the order in which the group numbers will be assigned within each partition, based on the Sales column in descending order.
The result will include the orderID, orderDate, productID, Sales, and the unique group number assigned to each row within the partition of productID, along with a SalesSegment column that categorizes the sales into High, Medium, and Low segments based on the assigned group number.
*/





--5. PERCENT_RANK()
--The PERCENT_RANK() function is used to calculate the relative rank of a row within a partition of a result set, expressed as a percentage. It can be used with the OVER() clause to calculate the relative rank of each row within a partition.
SELECT *,
    CONCAT(PercentRankNum * 100, '%') as PercentRank
FROM (
    SELECT
        Product,
        Price,
        PERCENT_RANK() OVER (ORDER BY Price desc) as PercentRankNum
    from sales.Products
) t
where PercentRankNum <= 0.4
/*In this query, we are using the PERCENT_RANK() window function to calculate the relative rank of each row within a partition of the result set, expressed as a percentage.
The ORDER BY clause specifies the order in which the relative ranks will be calculated within each partition, based on the Price column in descending order.
The result will include the Product, Price, and the relative rank expressed as a percentage for each row within the partition of productID, and filters the result to include only those rows with a relative rank less than or equal to 0.4 (i.e., the top 40% of products based on price).
*/




---6. CUME_DIST()
--The CUME_DIST() function is used to calculate the cumulative distribution of a value within a partition of a result set. It can be used with the OVER() clause to calculate the cumulative distribution of each row within a partition.
SELECT *,
    CONCAT(CumeDistNum * 100, '%') as CumeDist
FROM (
    SELECT
        Product,
        Price,
        CUME_DIST() OVER (ORDER BY Price desc) as CumeDistNum
    from sales.Products
) t
where CumeDistNum <= 0.4
/*In this query, we are using the CUME_DIST() window function to calculate the cumulative distribution of each row within a partition of the result set.
The ORDER BY clause specifies the order in which the cumulative distributions will be calculated within each partition, based on the Price column in descending order.
The result will include the Product, Price, and the cumulative distribution expressed as a percentage for each row within the partition of productID, and filters the result to include only those rows with a cumulative distribution less than or equal to 0.4 (i.e., the top 40% of products based on price).
*/