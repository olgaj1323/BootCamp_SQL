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



SELECT Guest_id, Name_Guest, Birthday FROM GUESTS 
WHERE (SELECT YEAR(birthday))<2000;

SELECT Room_id, Rate FROM ROOMS
WHERE Rate>10;

SELECT DISTINCT Guest_id, Name_Guest FROM GUESTS;

SELECT Name_Guest FROM GUESTS
ORDER BY Name_Guest ASC;


SELECT TOP 10 Rate, Room_id FROM  ROOMS;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
