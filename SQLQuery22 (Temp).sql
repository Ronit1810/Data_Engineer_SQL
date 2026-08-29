--Temporary Table (Temp)

--Create new Temp Table which will be stored in System Database -> tempdb -> dbo.#Order
SELECT *
INTO #Order
FROM Sales.Orders


--We can see all the data of Sales.Order in dbo.#Order
SELECT * FROM #Order


--Deleting few records from temp table it will not affect main table(Sales.Order)
DELETE FROM #Order WHERE BillAddress IS NULL


--Now we can see few records are deleted from temp table
SELECT * FROM #Order


--If you want the result to stored or want the result later as well, we can use CTAS to store in table
SELECT * 
INTO Sales.Order_Test
FROM #Order
--And Now even if your session ends, the results will be stored in Sales.Order_Test table but the temp will be cleared


SELECT * FROM Sales.Order_Test