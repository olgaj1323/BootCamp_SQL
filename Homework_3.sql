/*The system should also be able to track Rooms. 
Rooms should have a status and an associated tavern.
there should be able to track Rooms Stays wich will contain a sale, guest, room, the dtae it was stayed in and the rate.*/
DROP TABLE IF EXISTS ROOM_STAY;
DROP TABLE IF EXISTS ROOMS;

CREATE TABLE ROOMS 
(Room_id INT PRIMARY KEY IDENTITY(1,1),
Status_Room_id TINYINT,
Rate FLOAT,
Tavern_id INT FOREIGN KEY REFERENCES TAVERNS(Taver_id)); 

CREATE TABLE ROOM_STAY
(Order_id INT PRIMARY KEY,
Guest_id INT FOREIGN KEY REFERENCES GUESTS(Guest_id),
Room_id INT FOREIGN KEY REFERENCES ROOMS(Room_id),
Date_Stayed DATE,
Total_price INT);

CREATE TABLE STATUS_ROOMS
(Status_Room_id INT,
Status_Description VARCHAR (100));

INSERT INTO ROOMS (Status_Room_id, Rate, Tavern_id)
VALUES
(1,80,3),
(0,125,2),
(1,150,1),
(0,200,3),
(1,100,4),
(0,100,1),
(0,150,2),
(1,130,1);
INSERT INTO STATUS_ROOMS (Status_Room_id,Status_Description)
VALUES
(1,'Vacant'),
(0,'Occupied');

--2. Write a query that returns guests with a birthday before 2000. 

SELECT Guest_id, Name_Guest, Birthday FROM GUESTS 
WHERE (SELECT YEAR(birthday))<2000;

--3. Write a query to return rooms that cost more than 100 gold a night
SELECT Room_id, Rate FROM ROOMS
WHERE Rate>10;

--4. Write a query that returns UNIQUE guest names. 
SELECT DISTINCT Guest_id, Name_Guest FROM GUESTS;

--5.Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]
SELECT Name_Guest FROM GUESTS
ORDER BY Name_Guest ASC;

--6. Write a query that returns the top 10 highest price sales
SELECT TOP 10 Rate, Room_id FROM  ROOMS;

--7. Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS

--8. Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)


--9.Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements
SELECT CONCAT('INSERT INTO', Table_Name, '(', column_Name,')') AS queryPiece
FROM INFORMATION_SQUEMA_COLUMNS
WHERE Table_Name = 'ROLES'
UNION ALL
SELECT 'VALUES ('
UNION ALL
SELECT CONCAT(Column_Name,')',',')) 
FROM INFORMATION_SQUEMA_COLUMNS
WHERE Table_Name = 'STATUS'




