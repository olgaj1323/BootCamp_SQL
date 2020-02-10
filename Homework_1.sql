DROP TABLE IF EXISTS TAVERNS;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS ROLES;
DROP TABLE IF EXISTS LOCATION;
DROP TABLE IF EXISTS BASEMENT_RATS;
DROP TABLE IF EXISTS SUPPLIES;
DROP TABLE IF EXISTS INVENTORY;   
DROP TABLE IF EXISTS INVOICE; 
DROP TABLE IF EXISTS SERVICES;
DROP TABLE IF EXISTS STATUS;
DROP TABLE IF EXISTS SALES; 

CREATE TABLE TAVERNS 
(Taver_id INT IDENTITY (1,1),
 NameT VARCHAR (100),
 Location_id INT,
 User_id INT);

ALTER TABLE TAVERNS ADD PRIMARY KEY (Taver_id);

CREATE TABLE USERS 
(User_id INT IDENTITY (1,1),
 NameU VARCHAR (100),
 Role_id INT);

ALTER TABLE USERS ADD PRIMARY KEY (User_id);
	 
CREATE TABLE ROLES
(Role_id INT PRIMARY KEY IDENTITY (1,1),
 NameR VARCHAR (100),
 Description_Role VARCHAR (250));

ALTER TABLE USERS ADD FOREIGN KEY (Role_id) REFERENCES ROLES (Role_id); 
 
CREATE TABLE LOCATION 
(Location_id INT PRIMARY KEY IDENTITY (1,1),
 NameL VARCHAR (100));
 
CREATE TABLE BASEMENT_RATS 
(Rat_id INT PRIMARY KEY IDENTITY (1,1),
 NameRat VARCHAR (100),
 Tavern_id INT FOREIGN KEY REFERENCES TAVERNS (Taver_id));
 
CREATE TABLE SUPPLIES
(Supply_id INT PRIMARY KEY IDENTITY (1,1),
 NameSupply VARCHAR (100),
 Unit VARCHAR(100));
       
CREATE TABLE INVENTORY 
(Tavern_id INT FOREIGN KEY REFERENCES TAVERNS (Taver_id),
 Supply_id INT FOREIGN KEY REFERENCES SUPPLIES(Supply_id),
 Counts INT,
 Date_updated DATE);              

CREATE TABLE INVOICE 
(Receipt_Number INT PRIMARY KEY IDENTITY (1,1),
 Tavern_id INT FOREIGN KEY REFERENCES TAVERNS (Taver_id),
 Supply_id INT FOREIGN KEY REFERENCES SUPPLIES(Supply_id),
 Amount_Received INT,
 Date_Received DATE);
                             
CREATE TABLE SERVICES 
(Service_id INT PRIMARY KEY IDENTITY(1,1),
 NameService VARCHAR(250)); 
                      
CREATE TABLE STATUS 
(Status_id INT PRIMARY KEY IDENTITY(1,1),
Service_id INT FOREIGN KEY REFERENCES SERVICES(Service_id),
Service_Status VARCHAR(250));           
  
CREATE TABLE SALES 
(Service_id INT,
 Guest_Name VARCHAR(250),
 Price FLOAT,
 Date_Purchased DATE);

 -------------------------------------------
 																					

																								
INSERT INTO ROLES (NameR, Description_Role)
VALUES
		('Bartender','mixes and serves drinks at a bar'),
		('Waitress','Serve customers at their tables in a restaurant'),
		('Security','protect tavern against intruders or damage'),
		('Manager','responsible for controlling or administering tavern'),
		('Cook','Prepare meals');
																								
INSERT INTO LOCATION (NameL)
VALUES
		('Belmar'),
		('Spring Lake'),
		('Sea Girt'),
		('Bradley Beach'),
		('Red Bank');	
		
	INSERT INTO TAVERNS (NameT, Location_id, User_id)
VALUES 
		('Moes Tavern',2,1),
		('Tommys Taver',3,2),
		('Archor Tavern',4,1),
		('Pauls Tavern',5,5),
		('LPO House',6,2);																							
	
INSERT INTO USERS (NameU, Role_id)
VALUES
		('Carl',1),
		('Katherine',3),
		('Kavinia',2),
		('Mike',4),
		('Erin',2);																							
 
INSERT INTO BASEMENT_RATS (NameRat, Tavern_id)
VALUES																								
		('CC',1),
		('AA',3),
		('KK',1),
		('MM',4),
		('PP',2);
																								
INSERT INTO SUPPLIES (NameSupply, Unit)
VALUES																								
		('Wings','Bags'),
		('Strong Ale','ounce'),
		('IPA','Pack'),
		('Lager','Boxes');
																								
INSERT INTO INVENTORY (Tavern_id, Supply_id, Counts, Date_updated)              
VALUES
		(1,2,50,'1/1/2020'),
		(3,2,15,'1/1/2020'),
		(2,1,20,'1/1/2020'),
		(2,2,2,'1/1/2020');
																								
INSERT INTO INVOICE (Tavern_id, Supply_id, Amount_Received, Date_Received)
VALUES
		(5,2,12,'1/31/2020'),
		(1,3,5,'1/31/2020'),
		(4,3,8,'1/31/2020'),
		(2,4,6,'1/31/2020');
	
INSERT INTO SERVICES (NameService)
VALUES
		('Pool'),
		('Weapon sharpening'),
		('Special Events'),
		('Beer Tour'),
		('Darts');
                    
INSERT INTO STATUS (Service_id, Service_Status)     
VALUES
		(1,'Active'),
		(1,'Inactive'),
		(3,'Active'),
		(5,'Active'),
		(4,'Inactive');
  
INSERT INTO SALES (Service_id, Guest_Name, Price, Date_Purchased)
VALUES
		(1,'Peter',20.00, '2/6/2020'),
		(2,'Sam',150.36, '1/25/2020'),
		(3,'Nancy',1520.36, '2/5/2019'),
		(5,'Jorge', 45.00, '1/28/2020'),
		(5,'ALisa',45.00,'12/23/2019');
