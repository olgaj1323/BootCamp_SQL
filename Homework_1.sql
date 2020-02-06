CREATE TABLE Taverns 
(Taver_id INT IDENTITY (1,1),
 NameT VARCHAR (100),
 Location INT,
 User_id INT);

CREATE TABLE Users 
(user_id INT IDENTITY (1,1),
 NameU VARCHAR (100),
 Role_id INT);
 
CREATE TABLE Roles 
(Role_id INT IDENTITY (1,1),
 NameR VARCHAR (100),
 Description_Role VARCHAR (250));
 
CREATE TABLE LOCATION 
(Location_id INT IDENTITY (1,1),
 NameL VARCHAR (100));
 
CREATE TABLE BASEMENT_RATS 
(Rat_id INT IDENTITY (1,1),
 NameRat VARCHAR (100),
 Tavern_id INT);
 
 CREATE TABLE LOCATION 
(Location_id INT IDENTITY (1,1),
 NameL VARCHAR (100));
