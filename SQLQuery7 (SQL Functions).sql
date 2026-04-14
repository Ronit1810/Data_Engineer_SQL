--Single Row Functions
--String Functions

--Manipulation of data
--1. CONCAT
-- Concatenates first name and country into one column.
SELECT 
    first_name,
    country,
    CONCAT(first_name, ' from ', country) AS full_info
FROM customers;


--2. LOWER and UPPER
-- Converts the first name to lowercase and the country to uppercase.
SELECT
    LOWER(first_name) AS lower_first_name,
    UPPER(country) AS upper_country
FROM customers;