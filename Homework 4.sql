--1. Write a query to return users who have admin roles

SELECT NameU, NameR 
FROM USERS U JOIN ROLES R
ON U.Role_id=R.Role_id
WHERE NameR='Manager';

--2. Write a query to return users who have admin roles and information about their taverns
SELECT NameU, NameR, Taver_id,NameT, Location_id
FROM USERS U JOIN ROLES R
ON U.Role_id=R.Role_id
JOIN TAVERNS T 
ON
U.User_id=T.User_id
WHERE NameR='Manager';

--3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels
SELECT Guest_id,Name_Guest, class_Name, Levels
FROM LEVELS L JOIN CLASSES C
ON C.Class_id=L.Class_id
JOIN GUESTS G
ON G.Guest_id=L.Guest_id
ORDER BY Name_Guest ASC;

--4. Write a query that returns the top 10 sales in terms of sales price and what the services were

SELECT TOP 10 SS.Service_id, NameService, Price
FROM SALES_SERVICE SS JOIN SERVICES 
ON SS.Service_id=SERVICES.Service_id;

--5. Write a query that returns guests with 2 or more classes
SELECT g.Guest_id, Name_Guest, COUNT (class_id) as counter_classes
FROM GUESTS g join LEVELS l
ON g.Guest_id= l.Guest_id
GROUP BY g.Guest_id, Name_Guest 
HAVING COUNT(class_id) >=2;


--6. Write a query that returns guests with 2 or more classes with levels higher than 5
SELECT g.Guest_id, Name_Guest, count (class_id)as Counter_classes, MAX(Levels) as Highest_Level
FROM GUESTS g RIGHT JOIN LEVELS l
ON g.Guest_id= l.Guest_id
GROUP BY g.Guest_id, Name_Guest
HAVING COUNT(class_id) >=2 and MAX(Levels)>5


--7. Write a query that returns guests with ONLY their highest level class
SELECT g.Guest_id,Name_Guest, MAX(Levels) as Highest_Level
FROM GUESTS g RIGHT JOIN LEVELS l
ON g.Guest_id= l.Guest_id
GROUP BY Name_Guest, g.Guest_id;

--8. Write a query that returns guests that stay within a date range. Please remember that guests can 
--stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)

SELECT Name_Guest, Arrival_Date, Departur_Date 
FROM GUESTS G JOIN  ROOM_STAY
ON G.Guest_id= ROOM_STAY.Guest_id
WHERE Arrival_Date  BETWEEN '6/13/2019' AND '8/22/2019'
OR Departur_Date BETWEEN '6/13/2019' AND '8/22/2019'

--9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.

SELECT 
CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES
 WHERE TABLE_NAME = 'Taverns'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
(
	CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
	Then CONCAT
		('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') 
	Else '' 
	END)
, 
	CASE WHEN (refConst.UNIQUE_CONSTRAINT_NAME IS  NULL) AND keys.CONSTRAINT_NAME IS NOT NULL
	Then 
		(' PRIMARY KEY IDENTITY (1,1)') 
	Else '' 
	END
,
	CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
	Then 
		(CONCAT(' FOREIGN KEY REFERENCES ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
	Else ''
		--(CONCAT(' PRIMARY KEY ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
	END
, 
',') as queryPiece FROM 
INFORMATION_SCHEMA.COLUMNS as cols
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys ON 
(keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refConst ON 
(refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
LEFT JOIN 
(SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as constKeys 
ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
 WHERE cols.TABLE_NAME = 'Taverns'
UNION ALL
SELECT ')'; 

