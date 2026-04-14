-- (GROUP BY) FIND THE TOTAL SCORE FOR EACH COUNTRY IN THE CUSTOMERS TABLE.
/*Use MyDatabase
select
	country,
	SUM(score) as total_score
from customers
group by country;*/
 
GO

-- (GROUP BY) FIND THE TOTAL SCORE AND TOTAL CUSTOMERS FOR EACH COUNTRY IN THE CUSTOMERS TABLE.
/*select
	country,
	SUM(score) as total_score,
	COUNT(*) as total_customers
from customers
group by country;*/

GO

-- (WHERE / GROUP BY / HAVING) FIND THE AVERAGE SCORE FOR EACH COUNTRY IN THE CUSTOMERS TABLE, CONSIDERING ONLY CUSTOMERS WITH SCORE NOT EQUAL TO 0, BUT ONLY INCLUDE COUNTRIES WITH AN AVERAGE SCORE GREATER THAN 430.
/*select 
	country,
	avg(score) as avg_score
from customers
where score != 0
group by country
having avg(score) > 430*/

GO

-- (ORDER BY) RETRIEVE THE TOP 3 CUSTOMERS WITH HIGHEST SOCRES
/*select TOP 3 *
from customers
order by score desc*/

GO

-- (TOP) RETRIEVE THE TOP 2 MOST RECENT ORDERS
/*select TOP 2 *
from orders
order by order_date desc*/

GO

