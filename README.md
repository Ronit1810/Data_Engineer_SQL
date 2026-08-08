# SQL Queries Folder

This folder contains a collection of SQL practice scripts covering core SQL topics, including DDL, DML, joins, functions, operators, set operations, aggregation, window functions, and formatting.

> Most files are written in T-SQL style and use sample tables such as `customers`, `orders`, `Sales.Customers`, `Sales.Orders`, and `Sales.Employees`.

> Notion doc: https://app.notion.com/p/SQL-1-d4ab691ce5c2822287e4813abc818a94?source=copy_link

## Folder structure

- `README.md` - this file
- `SQLQuery1.sql` - GROUP BY, HAVING, ORDER BY, TOP
- `SQLQuery2 (DDL).sql` - DDL examples: CREATE, ALTER, DROP
- `SQLQuery3 (DML).sql` - DML examples: INSERT, UPDATE, DELETE, TRUNCATE
- `SQLQuery4 (Operators).sql` - comparison, logical, range, membership, and search operators
- `SQLQuery5 (Joins).sql` - INNER, LEFT, RIGHT, FULL, CROSS joins and anti-joins
- `SQLQuery6 (SET).sql` - SET operators: UNION, UNION ALL, EXCEPT, INTERSECT
- `SQLQuery7 (SQL Functions - string function).sql` - string and text manipulation functions
- `SQLQuery8 (SQL Function - numeric).sql` - numeric functions such as `ROUND` and `ABS`
- `SQLQuery9 (SQL Function - Date&time).sql` - date and time functions, grouping, and aggregation
- `SQLQuery10 (SQL Function - Format&Casting, Cal, validate).sql` - formatting, casting, date math, and validation functions
- `SQLQuery11 (SQL Function - Null).sql` - NULL handling functions: `ISNULL`, `COALESCE`, `NULLIF`
- `SQLQuery12 (SQL Case Satement).sql` - `CASE` expressions for conditional logic
- `SQLQuery13 (Aggregate Function).sql` - aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `SQLQuery14 (Window Basics).sql` - window functions, partitions, running totals, and ranking

## File summaries

### `SQLQuery1.sql`

Focuses on grouping and aggregation examples:

- `GROUP BY` with `SUM`, `COUNT`, and `AVG`
- `HAVING` to filter grouped results
- `ORDER BY` and `TOP` for result ranking
- sample logic for customer scores and country summaries

### `SQLQuery2 (DDL).sql`

Contains DDL operations:

- `CREATE TABLE`
- `ALTER TABLE` to add or drop columns
- `DROP TABLE`
- includes a simple `SELECT * FROM customers` query for verification

### `SQLQuery3 (DML).sql`

Demonstrates DML usage:

- `INSERT INTO` with hard-coded values
- `INSERT ... SELECT` to copy data between tables
- `UPDATE` for modifying row values
- `DELETE` and `TRUNCATE` examples
- ends with sample `SELECT` statements for verification

### `SQLQuery4 (Operators).sql`

Shows a range of SQL operators:

- comparison operators: `=`, `!=`, `>`, `>=`, `<`, `<=`
- logical operators: `AND`, `OR`, `NOT`
- range operator: `BETWEEN`
- membership operators: `IN`, `NOT IN`
- search operator: `LIKE`

### `SQLQuery5 (Joins).sql`

Explains join patterns and anti-join logic:

- `INNER JOIN` for matching rows
- `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`
- anti-join examples using `IS NULL`
- `CROSS JOIN` for Cartesian products
- sample queries with `customers` and `orders`

### `SQLQuery6 (SET).sql`

Covers set operations and result combination:

- `UNION` and `UNION ALL`
- `EXCEPT` (difference)
- `INTERSECT`
- guidance on matching columns and avoiding `SELECT *` mismatches

### `SQLQuery7 (SQL Functions - string function).sql`

Contains string function examples:

- `CONCAT`, `LOWER`, `UPPER`, `TRIM`, `REPLACE`
- `LEN` for string length
- substring extraction using `LEFT`, `RIGHT`, and `SUBSTRING`

### `SQLQuery8 (SQL Function - numeric).sql`

Demonstrates numeric functions:

- `ROUND` for decimal rounding
- `ABS` for absolute values

### `SQLQuery9 (SQL Function - Date&time).sql`

Uses date/time functions with `Sales.Orders`:

- `DAY`, `MONTH`, `YEAR`
- `DATEPART`, `DATENAME`
- `DATETRUNC` for truncating timestamps
- `EOMONTH`
- grouping by date periods such as month

### `SQLQuery10 (SQL Function - Format&Casting, Cal, validate).sql`

Includes formatting and conversion examples:

- `FORMAT` date values into strings
- `CAST` between types like `VARCHAR`, `DATE`, and `TIME`
- `DATEADD` for adding/subtracting date parts
- `DATEDIFF` for intervals between dates
- `ISDATE` for validity checks

### `SQLQuery11 (SQL Function - Null).sql`

Shows null-handling functions:

- `ISNULL` to replace `NULL`
- `COALESCE` to choose the first non-null value
- `NULLIF` to return `NULL` when values match
- uses `AVG(...) OVER ()` to compare aggregate behavior with nulls

### `SQLQuery12 (SQL Case Satement).sql`

Demonstrates `CASE` expressions:

- categorize sales values into labels such as `High`, `Medium`, and `Low`
- convert gender codes to readable text
- convert country values into short codes

### `SQLQuery13 (Aggregate Function).sql`

Presents aggregate calculations:

- `COUNT(*)`, `SUM(...)`, `AVG(...)`, `MIN(...)`, `MAX(...)`
- combined aggregate summary in one query

### `SQLQuery14 (Window Basics).sql`

Introduces window functions and ranking:

- `SUM(...) OVER (PARTITION BY ...)` for partition totals
- running totals with `ORDER BY` in window clauses
- grand totals using `SUM(...) OVER ()`
- `RANK()` for ranking rows by sales
- window frame example: `ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING`

## How to use

1. Open the SQL file in your SQL editor.
2. Review the commented examples.
3. Uncomment one query at a time and run it against a compatible sample database.
4. Adjust table names and schemas to match your environment if needed.

## Notes

- This folder is intended for practice and learning.
- Some files reference sample schemas such as `Sales.Customers`, `Sales.Orders`, and `Sales.Employees`.
- Modify the table and schema names before running the queries if your database structure differs.
