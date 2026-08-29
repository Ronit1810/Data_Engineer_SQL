-- Store Procedure

-- Write a query to find the total count of customer and the avg Score for only USA customer
--Normal SQL Query
SELECT
    COUNT(*) AS Total_Customer,
    AVG(Score) AS Avg_Score
FROM Sales.Customers
WHERE Country = 'USA'

GO

--Instant we can use Store Procedure
CREATE OR ALTER PROCEDURE Customer_Summary AS
BEGIN
    SELECT
        COUNT(*) AS Total_Customer,
        AVG(Score) AS Avg_Score
    FROM Sales.Customers
    WHERE Country = 'USA'
END;
-- Execute sp
EXEC Customer_Summary;









GO
--Now we can parameterize this Store Procedure(SP) to make it dynamic so that we don't need to write or create same SP multiple time
--Parameters
CREATE OR ALTER PROCEDURE Customer_Summary @Country NVARCHAR(50) = 'USA'
AS
BEGIN
    SELECT
        COUNT(*) AS Total_Customer,
        AVG(Score) AS Avg_Score
    FROM Sales.Customers
    WHERE Country = @Country;



    SELECT
        COUNT(OrderID) AS Total_Order,
        AVG(Sales) AS Avg_Sales
    FROM Sales.Orders AS o
    INNER JOIN Sales.Customers AS c
    ON o.CustomerID = o.CustomerID
    WHERE Country = @Country
END;

EXEC Customer_Summary;
EXEC Customer_Summary @Country = 'Germany'














GO
--Now we want to store values in variable we can also use variable in SP
--Variables
/*
    Expected Result:
    Total Customers From Germany : 2
    Average Score From Germany : 324
*/


CREATE OR ALTER PROCEDURE Customer_Summary @Country NVARCHAR(50) = 'USA'
AS
BEGIN


--Declaring variables
    DECLARE @Total_Customer INT, @Avg_Score FLOAT, @Total_Order INT, @Avg_Sales FLOAT

    SELECT
        @Total_Customer = COUNT(*),
        @Avg_Score = AVG(Score)
    FROM Sales.Customers
    WHERE Country = @Country;

    PRINT 'Total Customers From '+ @Country + ' : ' + CAST(@Total_Customer AS NVARCHAR); --we cast the value to NVARCHAR because print statement should a String
    PRINT 'Average Score From ' + @Country + ' : ' + CAST(@Avg_Score AS NVARCHAR);

    PRINT ''

    SELECT
        @Total_Order = COUNT(OrderID),
        @Avg_Sales = AVG(Sales)
    FROM Sales.Orders AS o
    INNER JOIN Sales.Customers AS c
    ON o.CustomerID = o.CustomerID
    WHERE Country = @Country 

    PRINT 'Total Order From '+ @Country + ' : ' + CAST(@Total_Order AS NVARCHAR); --we cast the value to NVARCHAR because print statement should a String
    PRINT 'Average Sales From ' + @Country + ' : ' + CAST(@Avg_Sales AS NVARCHAR);

END;

EXEC Customer_Summary;













GO
--Control Flow (IF - ELSE)

CREATE OR ALTER PROCEDURE Customer_Summary @Country NVARCHAR(50) = 'USA'
AS
BEGIN


--Declaring variables
    DECLARE @Total_Customer INT, @Avg_Score FLOAT, @Total_Order INT, @Avg_Sales FLOAT



--Prepare and Clean Data
IF EXISTS (SELECT 1 FROM Sales.Customers WHERE Score IS NULL AND Country = @Country)
BEGIN
    PRINT 'Updating O'
    UPDATE Sales.Customers
    SET Score = 0
    WHERE Score IS NULL AND Country = @Country
END

ELSE
BEGIN
    PRINT 'No NULL Value Found'
END



--Report Generating
    SELECT
        @Total_Customer = COUNT(*),
        @Avg_Score = AVG(Score)
    FROM Sales.Customers
    WHERE Country = @Country;

    PRINT 'Total Customers From '+ @Country + ' : ' + CAST(@Total_Customer AS NVARCHAR); --we cast the value to NVARCHAR because print statement should a String
    PRINT 'Average Score From ' + @Country + ' : ' + CAST(@Avg_Score AS NVARCHAR);

    PRINT ''

    SELECT
        @Total_Order = COUNT(OrderID),
        @Avg_Sales = AVG(Sales)
    FROM Sales.Orders AS o
    INNER JOIN Sales.Customers AS c
    ON o.CustomerID = o.CustomerID
    WHERE Country = @Country 

    PRINT 'Total Order From '+ @Country + ' : ' + CAST(@Total_Order AS NVARCHAR); --we cast the value to NVARCHAR because print statement should a String
    PRINT 'Average Sales From ' + @Country + ' : ' + CAST(@Avg_Sales AS NVARCHAR);

END;

EXEC Customer_Summary;
EXEC Customer_Summary @Country = 'Germany'

















GO
--Control Flow (IF - ELSE)

CREATE OR ALTER PROCEDURE Customer_Summary @Country NVARCHAR(50) = 'USA'
AS
BEGIN
    BEGIN TRY

        --===================
        --Declaring variables
        --===================
        DECLARE @Total_Customer INT, @Avg_Score FLOAT, @Total_Order INT, @Avg_Sales FLOAT


        --======================
        --Prepare and Clean Data
        --======================
        IF EXISTS (SELECT 1 FROM Sales.Customers WHERE Score IS NULL AND Country = @Country)
        BEGIN
            PRINT 'Updating O'
            UPDATE Sales.Customers
            SET Score = 0
            WHERE Score IS NULL AND Country = @Country
        END

        ELSE
        BEGIN
            PRINT 'No NULL Value Found'
        END


        --=================
        --Report Generating
        --=================
        SELECT
            @Total_Customer = COUNT(*),
            @Avg_Score = AVG(Score)
        FROM Sales.Customers
        WHERE Country = @Country;

        PRINT 'Total Customers From '+ @Country + ' : ' + CAST(@Total_Customer AS NVARCHAR); --we cast the value to NVARCHAR because print statement should a String
        PRINT 'Average Score From ' + @Country + ' : ' + CAST(@Avg_Score AS NVARCHAR);

        PRINT ''

        SELECT
            @Total_Order = COUNT(OrderID),
            @Avg_Sales = AVG(Sales)
        FROM Sales.Orders AS o
        INNER JOIN Sales.Customers AS c
        ON o.CustomerID = o.CustomerID
        WHERE Country = @Country 

        PRINT 'Total Order From '+ @Country + ' : ' + CAST(@Total_Order AS NVARCHAR); --we cast the value to NVARCHAR because print statement should a String
        PRINT 'Average Sales From ' + @Country + ' : ' + CAST(@Avg_Sales AS NVARCHAR);
    END TRY

    BEGIN CATCH
        --==============
        --ERROR HANDLING
        --==============
        PRINT 'An Error Occured'
        PRINT 'ERROR : ' + ERROR_MESSAGE()
        PRINT 'ERROR NO. :' + CAST(ERROR_NUMBER() AS NVARCHAR)
        PRINT 'ERROR LINE :' + CAST(ERROR_LINE() AS NVARCHAR)
    END CATCH

END;

EXEC Customer_Summary;
EXEC Customer_Summary @Country = 'Germany'