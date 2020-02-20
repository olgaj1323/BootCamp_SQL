--1.Write a query to return a “report” of all users and their roles
SELECT user_id, NameU, NameR
FROM USERS JOIN ROLES
ON USERS.Role_id = ROLES.Role_id

--2.Write a query to return all classes and the count of guests that hold those classes

SELECT Class_Name, COUNT(G.Guest_id)
FROM LEVELS L JOIN CLASSES C
ON C.Class_id=L.Class_id
JOIN GUESTS G
ON G.Guest_id=L.Guest_id
GROUP BY Class_Name;

--3.	Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels. Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)

SELECT g.Guest_id,Name_Guest, class_Name, Levels,
CASE
WHEN Levels BETWEEN 1 AND 5 THEN 'Beginner'
WHEN Levels BETWEEN 6 AND 10 THEN 'Intermediate'
WHEN Levels >10 THEN 'Expert' 
END AS Level_Description
FROM LEVELS L JOIN CLASSES C
ON C.Class_id=L.Class_id
JOIN GUESTS G
ON G.Guest_id=L.Guest_id
ORDER BY Name_Guest ASC;
GO
--4.	Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
IF OBJECT_ID (N'get_Group', N'FN') IS NOT NULL  
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
GO
--Testing the function

SELECT dbo.get_Group(17);

--5.Write a function that returns a report of all open rooms (not used) on a particular day (input) and which 
--tavern they belong to 
GO
IF OBJECT_ID (N'Vacancy', N'FN') IS NOT NULL  
    DROP FUNCTION dbo.Vacancy; 
GO
CREATE FUNCTION dbo.Vacancy (@Date1 DATE)
RETURNS TABLE
AS
return(
SELECT * FROM (SELECT ROOMS.Room_id, Tavern_id,
IIF(
    @Date1>=Arrival_Date AND @Date1<=Departur_Date,
     '1','0') as Vacancy
FROM ROOM_STAY RS JOIN ROOMS
ON RS.Room_id=ROOMS.Room_id) AS Inner_Table
WHERE Vacancy = '0'
);

GO

SELECT * FROM Vacancy('8/06/2019')
GO
--6.Modify the same function from 5 to instead return a report of prices in a range (min and max prices) 
-- Return Rooms and their taverns based on price inputs

IF OBJECT_ID (N'Price_Range', N'FN') IS NOT NULL  
    DROP FUNCTION dbo.Price_Range; 
GO
CREATE FUNCTION dbo.Price_Range (@Min_Price FLOAT, @Max_Price FLOAT)
RETURNS TABLE
AS
return(
SELECT ROOMS.Room_id, Tavern_id, Rate 
FROM  ROOMS
WHERE Rate>=@Min_Price AND Rate<=@Max_Price

)
GO

SELECT * FROM Price_Range(50,140)

--7.	Write a command that uses the result from 6 to Create a Room in another tavern that undercuts (is less than) 
--the cheapest room by a penny - thereby making the new room the cheapest one

GO
CREATE PROCEDURE Guests.getGuest
@LastName nvarchar(50),
@FirstName nvarchar(50)
AS
/* This can also be an update/create/delete etc */
SET NOCOUNT ON; 
SELECT FirstName, LastName, Department
FROM 
HumanResources.vEmployeeDepartmentHistory
WHERE FirstName = @FirstName 
AND LastName = @LastName
AND EndDate IS NULL;
GO
