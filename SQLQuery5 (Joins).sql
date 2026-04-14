--INNER JOIN
GO
--Get the customer name and order date for all customers who have placed an order
/*
select 
	c.first_name,
	o.order_date
from customers as c
inner join orders as o
on c.id = o.customer_id;
*/

GO

--Get all customers and their orders, including customers who have not placed any orders (LEFT JOIN)
/*
select 
	c.id,
	c.first_name,
	o.order_date,
	o.order_id
from customers as c    --Table A(Customers)
left join orders as o   --Table B(Orders)
on c.id = o.customer_id;
*/

GO

--Get all orders and their customers, including orders that do not have a matching customer (RIGHT JOIN)
/*
select 
	c.id,
	c.first_name,
	o.order_date,
	o.order_id
from customers as c    --Table A(Customers)
right join orders as o   --Table B(Orders)
on c.id = o.customer_id;
*/

GO

--get all customers and all orders, even if there is no match between them (FULL JOIN)
/*
select 
	c.id,
	c.first_name,
	o.order_date,
	o.order_id
from customers as c    --Table A(Customers)
full join orders as o   --Table B(Orders)
on c.id = o.customer_id;
*/

GO

--Left Anti Joins
GO
-- Get all customer who haven't placed any orders (LEFT JOIN with NULL check)
/*
select * 
from customers as c
left join orders as o
on c.id = o.customer_id
where o.order_id is null;
*/

GO
--Right Anti Joins
GO
--Get all orders that do not have a matching customer (RIGHT JOIN with NULL check)
/*
select *
from customers as c
right join orders as o
on c.id = o.customer_id
where c.id is null;
*/

GO

--Full Anti Joins
GO
--Find al customers without orders without coustomer information (FULL JOIN with NULL check)
/*
select *
from customers as c
full join orders as o
on c.id = o.customer_id
where c.id is null OR o.order_id is null;
*/


GO

--Cross Join
GO
--Get all combinations of customers and orders (CROSS JOIN)
/*
select *
from customers as c
cross join orders as o;
*/






















select * from dbo.customers;
select * from dbo.orders;