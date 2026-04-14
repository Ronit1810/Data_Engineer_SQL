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