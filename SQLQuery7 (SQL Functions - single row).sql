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

--3. TRIM
-- Removes leading and trailing spaces from the first name.
SELECT --used to find the records where there are leading or trailing spaces in the first name
    first_name
FROM customers
WHERE first_name != TRIM(first_name)

SELECT
    first_name,
    TRIM(first_name) AS trimmed_first_name
FROM customers;



--4. replace
-- Replace .txt with .pdf in the file_name column.
SELECT
    'report.txt' AS old_file_name, --hardcoded value for demonstration
    REPLACE('report.txt', '.txt', '.pdf') AS new_file_name;


--Calculation Functions
--LEN
-- Returns the length of the first name.
SELECT
    first_name,
    LEN(first_name) AS name_length
FROM customers;



--String Extraction Functions
--LEFT and RIGHT
-- Extracts the first 3 characters of the first name and the last 3 characters of the country.
SELECT
    first_name,
    country,
    LEFT(TRIM(first_name), 3) AS left_first_name,
    RIGHT(country, 3) AS right_country
FROM customers;


--SUBSTRING
-- Extracts a substring from the first name starting at the second character and of length 4.
SELECT
    first_name,
    SUBSTRING(TRIM(first_name), 2, 4) AS substring_first_name --(string, start_position, length)
FROM customers;
--If the length is not specified
SELECT
    first_name,
    SUBSTRING(TRIM(first_name), 2, LEN(TRIM(first_name))) AS substring_first_name --(string, start_position)
FROM customers;