--INSERT QUERY
/*
INSERT INTO dbo.customers (id, first_name, country, score) values (7, 'Sam', 'USA', 85), (8, 'Anna', null, 600)
*/

GO

-- Insert data from Customers table to Persons table
/*
Select 
	id,
	first_name,
	null,
	'Unknown'
from dbo.customers

--Now we will insert the data from the above select statement to the Persons table

insert into dbo.persons (id, person_name, birth_date, phone)
	Select 
	id,
	first_name,
	null,
	'Unknown'
from dbo.customers
*/

GO

--UPDATE QUERY
/*
update customers SET
	country = 'UK'
Where id = 8;
*/

Go

--Delete Query
/*
Delete from customers where score = 0;
Delete from customers where id > 5;
*/

GO

--TRUNCATE Query
/*
Truncate table persons;
*/


select * from dbo.customers;
select * from persons;
