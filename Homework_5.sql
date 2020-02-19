--1.Write a query to return a “report” of all users and their roles






--2.Write a query to return all classes and the count of guests that hold those classes

SELECT Class_Name, COUNT(Guest_id)
FROM LEVELS L JOIN CLASSES C
ON C.Class_id=L.Class_id
JOIN GUESTS G
ON G.Guest_id=L.Guest_id
ORDER BY Class_Name;

--3.	Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels. Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)

SELECT Guest_id,Name_Guest, class_Name, Levels,(
CASE
WHEN Levels BETWEEN 1 AND 5 THEN 'Beginner'
WHEN Levels BETWEEN 1 AND 5 THEN 'Intermediate'
WHEN Levels BETWEEN 1 AND 5 THEN 'Expert') AS Level-Description
FROM LEVELS L JOIN CLASSES C
ON C.Class_id=L.Class_id
JOIN GUESTS G
ON G.Guest_id=L.Guest_id
ORDER BY Name_Guest ASC;

--4.	Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
IF OBJECT_ID (dbo.get_Group’, N'FN') IS NOT NULL  
    DROP FUNCTION get_Group;  
GO  
CREATE FUNCTION dbo.get_Group(@level int)  
RETURNS varchar(100)
AS   
BEGIN 
   RETURN
    CASE
    WHEN @level BETWEEN 1 AND 5 THEN 'Beginner'
    WHEN @level BETWEEN 6 AND 10 THEN 'Intermediater'
    WHEN @level >10 THEN 'Expert'
  END
END

--5.Write a function that returns a report of all open rooms (not used) on a particular day (input) and which tavern they belong to 







6.	Modify the same function from 5 to instead return a report of prices in a range (min and max prices) - Return Rooms and their taverns based on price inputs







7.	Write a command that uses the result from 6 to Create a Room in another tavern that undercuts (is less than) the cheapest room by a penny - thereby making the new room the cheapest one
