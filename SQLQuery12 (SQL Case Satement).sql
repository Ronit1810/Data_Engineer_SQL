-- Case Statement in SQL

/*Create report showing total sales for each of the following categories:
    High (sales over 50), Medium (sales over 20), and Low (sales 20 or less)
    Sort Categories from High to Low 
*/


SELECT 
    SalesCategory,
    SUM(Sales) as TotalSales
from (
SELECT 
    orderID,
    Sales,
    CASE
        when Sales > 50 then 'High'
        when Sales > 20 then 'Medium'
        else 'Low'
    END as SalesCategory
from Sales.Orders)t
group by SalesCategory
order by TotalSales desc;




SELECT 
    EmployeeID,
    firstName,
    lastName,
    GENDER,
    CASE
        when Gender = 'M' then 'Male'
        when Gender = 'F' then 'Female'
        else 'Other'
    END as GenderDescription
from Sales.Employees



SELECT
    customerID,
    firstName,
    lastName,
    country,
    CASE
        when Country = 'USA' then 'US'  --this is one way to write the query
        when Country = 'UK' then 'UK'
        when Country = 'Germany' then 'GE'
        else 'Other'
    END as CountryCode
from Sales.Customers


SELECT
    customerID,
    firstName,
    lastName,
    country,
    CASE Country  --this is another way to write the same query as above
        when 'USA' then 'US'
        when 'UK' then 'UK'
        when 'Germany' then 'GE'
        else 'Other'
    END as CountryCode
from Sales.Customers

EXEC sp_help 'Sales.Customers';