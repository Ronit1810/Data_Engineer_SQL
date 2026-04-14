-- Comparison Operators
GO
-- = operator
/*
select * from dbo.customers where country = 'USA';
*/

GO

-- <>  =! operator
/*
select * from dbo.customers where country != 'USA';
*/

GO

-- > operator
/*
select * from dbo.customers where score > 500;
*/

GO

-- >= operator
/*
select * from dbo.customers where score >= 500;
*/

GO

-- < operator
/*
select * from dbo.customers where id < 3;
*/

GO

-- <= operator
/*
select * from dbo.customers where id <= 3;
*/

GO



--Logical Operators  
GO
-- AND operator
/*
select * from dbo.customers where country = 'Germany' AND score < 500;
*/

GO

-- OR operator
/*
select * from dbo.customers where country = 'Germany' OR score < 500;
*/

GO 

-- NOT operator
/*
select * from dbo.customers where NOT country = 'Germany'
*/

GO



--RANGE Operators
GO
-- BETWEEN operator
/*
select * from dbo.customers where score BETWEEN 100 AND 500;
*/

GO



--Membership Operators
GO
-- IN operator
/*
select * from dbo.customers where country IN ('USA', 'Germany');
*/

GO

--NOT IN operator
/*
select * from dbo.customers where country NOT IN ('USA', 'Germany');
*/

GO


--Search Operators
GO
--LIKE operator
/*
select * from dbo.customers where first_name LIKE 'M%';
select * from dbo.customers where first_name LIKE '%r%';
select * from dbo.customers where first_name LIKE '__r%';

*/







select * from customers