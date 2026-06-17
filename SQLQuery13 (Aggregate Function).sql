-- Aggregate Function: COUNT

select
    count(*) as total_employees  -- this will count all the rows in the Employees table
from sales.Orders



-- Aggregate Function: SUM
select
    sum(Sales) as total_sales  -- this will sum up all the values in the Sales column of the Orders table
from sales.Orders



-- Aggregate Function: AVG
select
    avg(Sales) as average_sales  -- this will calculate the average of the values in the Sales column of the Orders table
from sales.Orders



-- Aggregate Function: MIN
select  
    min(Sales) as minimum_sales  -- this will find the minimum value in the Sales column of the Orders table
from sales.Orders


-- Aggregate Function: MAX
select
    max(Sales) as maximum_sales  -- this will find the maximum value in the Sales column of the Orders table
from sales.Orders



select
    count(*) as total_orders,  -- this will count the total number of orders
    sum(Sales) as total_sales,  -- this will sum up all the sales
    avg(Sales) as average_sales,  -- this will calculate the average of the sales
    min(Sales) as minimum_sales,  -- this will find the minimum sale
    max(Sales) as maximum_sales   -- this will find the maximum sale
from sales.Orders