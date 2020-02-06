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
 
CREATE TABLE SUPPLIES
(Supply_id INT IDENTITY (1,1),
 NameSupply VARCHAR (100),
 Unit VARCHAR(100));
              
CREATE TABLE INVENTORY 
(Tavern_id INT ,
 Supply_id INT,
 Counts INT,
 Date_updated DATE);              
 
CREATE TABLE INVOICE 
(Receipt_Number INT IDENTITY (1,1),
 Tavern_id INT ,
 Supply_id INT,
 Amount_Received INT,
 Date_updated DATE);
              
              
CREATE TABLE SERVICES 
(Service_id INT IDENTITY(1,1),
 NameService VARCHAR(250)); 
                    
CREATE TABLE STATUS 
(Service_id INT ,
 Tavern_id INT,
 Service_Status VARCHAR(250));           
  
CREATE TABLE SALES 
(Service_id INT,
 Guest_Name VARCHAR(250),
 Price FLOAT,
 Date_Purchased DATE);                         
