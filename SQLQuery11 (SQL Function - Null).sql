--Null Function
--Syntax: NULLIF ( value , replace_with )
Select
    CustomerID,
    score,
    ISNULL(score, 0) AS ScoreOrNull -- returns NULL if score is 0, otherwise returns the score value
from sales.Customers


--Coalesce Function
--Syntax: COALESCE ( value, replace_with, or_replace_with, ... )
Select
    CustomerID,
    score,
    COALESCE(score, 0) AS ScoreOrNull, -- returns the first non-null value among score and 0, effectively replacing NULL with 0
    AVG(score) OVER () AS AverageScore, -- calculates the average score across all customers, ignoring NULL values
    AVG(COALESCE(score, 0)) OVER () AS AverageScoreWithNulls -- calculates the average score treating NULLs as 0, which may lower the average if there are many NULL values
from sales.Customers


--NullIf Function
--Syntax: NULLIF ( value , replace_with )
Select
    CustomerID,
    score,
    NULLIF(score, 500) AS ScoreOrNull -- returns NULL if score is 500, otherwise returns the score value   
from sales.Customers