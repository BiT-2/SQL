use Group9_Project;

--DDL to create the Database Table

CREATE TABLE dbo.Manufacturer
    (
    ManuID int NOT NULL PRIMARY KEY ,
    ManuName varchar(40) NOT NULL,
    ManuBrand varchar(40) NOT NULL
    );
   
CREATE TABLE dbo.ProductCategory
    (
    ProductCatID int NOT NULL PRIMARY KEY ,
    ProductCatName varchar(40) NOT NULL,
    ProductType varchar(40) NOT NULL
    );

CREATE TABLE dbo.Supplier
    (
    SupplierID int NOT NULL PRIMARY KEY,
    ManuID int NOT NULL,
    SupplierName varchar(40) NOT NULL
    );
    
CREATE TABLE dbo.Product
    (
    ProductID int NOT NULL PRIMARY KEY,
    ProductCatID int NOT NULL,
    ProductName varchar(40) NOT NULL,
    ProductPrice float NOT NULL,
    Color varchar(40) NOT NULL,
    Size varchar(40) NOT NULL,
    Weight float NOT NULL
    );
    
CREATE TABLE dbo.LoyaltyType
    (
    LoyaltyTypeID int NOT NULL PRIMARY KEY,
    Tier varchar(40) NOT NULL,
    TierDescription varchar(40) NOT NULL,
    PointsPerDollar int NOT NULL,
    TierStart int NOT NULL
    );

CREATE TABLE dbo.Manager
    (
    ManagerID int NOT NULL PRIMARY KEY,
    EmployeeID int NOT NULL
    );

CREATE TABLE dbo.Salary
    (
    SalaryID int NOT NULL PRIMARY KEY ,
    SalaryGrade varchar(40) NOT NULL,
    Salary int NOT NULL
    );
    
CREATE TABLE dbo.Discount
    (
    DiscountID int NOT NULL PRIMARY KEY,
    DiscountDescription varchar(40) NOT NULL,
    StartDate date NOT NULL,
    EndDate date NOT NULL
    );
    
CREATE TABLE dbo.CustomerLoyalty
    (
    CustLoyaltyID int NOT NULL PRIMARY KEY,
    LoyaltyTypeID int NOT NULL,
    ActivePoints int NOT NULL,
    TotalPointsEarned int NOT NULL,
    TotalPointsRedeemed int NOT NULL
    );
    
CREATE TABLE dbo.Store
    (
    StoreID int NOT NULL PRIMARY KEY,
    ManagerID int NOT NULL,
    StoreName varchar(40) NOT NULL,
    StreetAddress varchar(80) NOT NULL,
    ZipCode varchar(10) NOT NULL,
    City varchar(80) NOT NULL,
    State varchar(80) NOT NULL,
    Country varchar(80) NOT NULL,
    PhoneNumber varchar(10) NOT NULL
    );
    
CREATE TABLE dbo.Employee
    (
    EmployeeID int NOT NULL PRIMARY KEY,
    SalaryID int NOT NULL,
    EmployeeFirstName varchar(40) NOT NULL,
    EmployeeLastName varchar(40) NOT NULL,
    DateOfBirth date NOT NULL,
    Gender varchar(1) NOT NULL,
    DateOfJoining date NOT NULL,
    PhoneNumber varchar(10) NOT NULL,
    StreetAddress varchar(80) NOT NULL,
    ZipCode varchar(10) NOT NULL,
    City varchar(80) NOT NULL,
    State varchar(80) NOT NULL,
    Country varchar(80) NOT NULL
    );
    
CREATE TABLE dbo.Customer
    (
    CustomerID int NOT NULL PRIMARY KEY,
    CustLoyaltyID int NOT NULL,
    CustomerFirstName varchar(40) NOT NULL,
    CustomerLastName varchar(40) NOT NULL,
    Gender varchar(1) NOT NULL,
    Age int NOT NULL,
    DateOfBirth date NOT NULL,
    PhoneNumber varchar(10) NOT NULL,
    StreetAddress varchar(80) NOT NULL,
    ZipCode varchar(10) NOT NULL,
    City varchar(80) NOT NULL,
    State varchar(80) NOT NULL,
    Country varchar(80) NOT NULL
    );
    
CREATE TABLE dbo.Transactions
    (
    TransactionID int NOT NULL PRIMARY KEY,
    EmployeeID int NOT NULL,
    ProductID int NOT NULL,
    CustLoyaltyID int NOT NULL,
    StoreID int NOT NULL,
    CustomerID int NOT NULL,
    SupplierID int NOT NULL,
    DiscountID int NOT NULL,
    Price float NOT NULL,
    Quantity int NOT NULL,
    Date date NOT NULL,
    Time time NOT NULL
    );

   --DDL to Add Foreign Key Constraints
ALTER TABLE dbo.Product ADD FOREIGN KEY (ProductCatID) REFERENCES dbo.ProductCategory(ProductCatID);

ALTER TABLE dbo.Supplier ADD FOREIGN KEY (ManuID) REFERENCES dbo.Manufacturer(ManuID);

ALTER TABLE dbo.CustomerLoyalty ADD FOREIGN KEY (LoyaltyTypeID) REFERENCES dbo.LoyaltyType(LoyaltyTypeID);

ALTER TABLE dbo.Employee ADD FOREIGN KEY (SalaryID) REFERENCES dbo.Salary(SalaryID);

ALTER TABLE dbo.Manager ADD FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID);

ALTER TABLE dbo.Store ADD FOREIGN KEY (ManagerID) REFERENCES dbo.Manager(ManagerID);

ALTER TABLE dbo.Customer ADD FOREIGN KEY (CustLoyaltyID) REFERENCES dbo.CustomerLoyalty(CustLoyaltyID);

ALTER TABLE dbo.Transactions ADD FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID);

ALTER TABLE dbo.Transactions ADD FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID);

ALTER TABLE dbo.Transactions ADD FOREIGN KEY (CustLoyaltyID) REFERENCES dbo.CustomerLoyalty(CustLoyaltyID);

ALTER TABLE dbo.Transactions ADD FOREIGN KEY (StoreID) REFERENCES dbo.Store(StoreID);

ALTER TABLE dbo.Transactions ADD FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID);

ALTER TABLE dbo.Transactions ADD FOREIGN KEY (SupplierID) REFERENCES dbo.Supplier(SupplierID);

ALTER TABLE dbo.Transactions ADD FOREIGN KEY (DiscountID) REFERENCES dbo.Discount(DiscountID);

--DML Queries to populate the tables

-- Insert Into ProductCategory

INSERT INTO dbo.ProductCategory VALUES (1,'Kids Apparels','Dungaree');
INSERT INTO dbo.ProductCategory VALUES (2,'Kids Apparels','Caps');
INSERT INTO dbo.ProductCategory VALUES (3,'Kids Apparels','Shorts');
INSERT INTO dbo.ProductCategory VALUES (4,'Kids Apparels','Socks');
INSERT INTO dbo.ProductCategory VALUES (5,'Kids Apparels','Frocks');
INSERT INTO dbo.ProductCategory VALUES (6,'Mens Apparel','Shirts');
INSERT INTO dbo.ProductCategory VALUES (7,'Mens Apparel','Trousers');
INSERT INTO dbo.ProductCategory VALUES (8,'Mens Apparel','Jeans');
INSERT INTO dbo.ProductCategory VALUES (9,'Mens Apparel','Suits');
INSERT INTO dbo.ProductCategory VALUES (10,'Mens Apparel','Shoes');
INSERT INTO dbo.ProductCategory VALUES (11,'Womens Apparel','Skirts');
INSERT INTO dbo.ProductCategory VALUES (12,'Womens Apparel','Scarves');
INSERT INTO dbo.ProductCategory VALUES (13,'Womens Apparel','Jeans');
INSERT INTO dbo.ProductCategory VALUES (14,'Womens Apparel','T-shirt');
INSERT INTO dbo.ProductCategory VALUES (15,'Womens Apparel','Stilletos');

--LoyaltyType : Bronze, Silver, Gold+, Platinum+, Platinum+, Diamond+ 
INSERT INTO dbo.LoyaltyType VALUES (1,'Bronze','Lowest tier','10',0);
INSERT INTO dbo.LoyaltyType VALUES (2,'Bronze+','First tier upgrade','20',100);
INSERT INTO dbo.LoyaltyType VALUES (3,'Silver','Second lowest tier','40',500);
INSERT INTO dbo.LoyaltyType VALUES (4,'Silver+','Second tier upgrade','50',2500);
INSERT INTO dbo.LoyaltyType VALUES (5,'Gold','Mid-range tier','90',5000);
INSERT INTO dbo.LoyaltyType VALUES (6,'Gold+','Third tier upgrade','100',10000);
INSERT INTO dbo.LoyaltyType VALUES (7,'Platinum','Premium tier','140',20000);
INSERT INTO dbo.LoyaltyType VALUES (8,'Platinum+','Fourth tier upgrade','150',30000);
INSERT INTO dbo.LoyaltyType VALUES (9,'Diamond','Highest tier','250',50000);
INSERT INTO dbo.LoyaltyType VALUES (10,'Diamond+','Fifth tier upgrade','300',100000);


--Salary Table
INSERT INTO dbo.Salary VALUES(1, 'A', 1000);
INSERT INTO dbo.Salary VALUES(2, 'B', 2000);
INSERT INTO dbo.Salary VALUES(3, 'C', 4000);
INSERT INTO dbo.Salary VALUES(4, 'D', 8000);
INSERT INTO dbo.Salary VALUES(5, 'E', 16000);
INSERT INTO dbo.Salary VALUES(6, 'F', 20000);
INSERT INTO dbo.Salary VALUES(7, 'G', 30000);
INSERT INTO dbo.Salary VALUES(8, 'H', 35000);
INSERT INTO dbo.Salary VALUES(9, 'I', 40000);
INSERT INTO dbo.Salary VALUES(10, 'J', 50000);

--Product
INSERT INTO dbo.Product VALUES(1,10,'Gucci',300,'Red',10,11);
INSERT INTO dbo.Product VALUES(2,9,'Armani',500,'Black',40,11);
INSERT INTO dbo.Product VALUES(3,9,'Zara',400,'Blue',42,12);
INSERT INTO dbo.Product VALUES(4,6,'J.Crew',70,'White',10,11);
INSERT INTO dbo.Product VALUES(5,8,'Levis',100,'Black',34,8);
INSERT INTO dbo.Product VALUES(6,3,'Nike',40,'Blue',30,10);
INSERT INTO dbo.Product VALUES(7,12,'Polo',60,'Pink',10,11);
INSERT INTO dbo.Product VALUES(8,14,'Calvin Klein',300,'Yellow',8,10);
INSERT INTO dbo.Product VALUES(9,10,'Adidas',200,'Black',12,11);
INSERT INTO dbo.Product VALUES(10,8,'Polo',250,'Blue',32,12);

-- Insert Into CustomerLoyalty
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(1,3,400,700);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(2,8,24000,41300);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(3,5,4500,9500);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(4,10,87000,149000);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(5,2,300,400);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(6,9,54000,98000);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(7,4,3400,7200);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(8,8,32000,38000);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(9,1,30,80);
INSERT INTO dbo.CustomerLoyalty(CustLoyaltyID, LoyaltyTypeID, ActivePoints, TotalPointsEarned) VALUES(10,7,14000,23000);


UPDATE dbo.CustomerLoyalty SET TotalPointsRedeemed = TotalPointsEarned - ActivePoints

--Insert Into Salary Table
INSERT INTO dbo.Salary VALUES(1, 'A', 1000);
INSERT INTO dbo.Salary VALUES(2, 'B', 2000);
INSERT INTO dbo.Salary VALUES(3, 'C', 4000);
INSERT INTO dbo.Salary VALUES(4, 'D', 8000);
INSERT INTO dbo.Salary VALUES(5, 'E', 16000);
INSERT INTO dbo.Salary VALUES(6, 'F', 20000);
INSERT INTO dbo.Salary VALUES(7, 'G', 30000);
INSERT INTO dbo.Salary VALUES(8, 'H', 35000);
INSERT INTO dbo.Salary VALUES(9, 'I', 40000);
INSERT INTO dbo.Salary VALUES(10, 'J', 50000);

--Insert Into Product Table
INSERT INTO dbo.Product VALUES(1,10,'Gucci',300,'Red',10,11);
INSERT INTO dbo.Product VALUES(2,9,'Armani',500,'Black',40,11);
INSERT INTO dbo.Product VALUES(3,9,'Zara',400,'Blue',42,12);
INSERT INTO dbo.Product VALUES(4,6,'J.Crew',70,'White',10,11);
INSERT INTO dbo.Product VALUES(5,8,'Levis',100,'Black',34,8);
INSERT INTO dbo.Product VALUES(6,3,'Nike',40,'Blue',30,10);
INSERT INTO dbo.Product VALUES(7,12,'Polo',60,'Pink',10,11);
INSERT INTO dbo.Product VALUES(8,14,'Calvin Klein',300,'Yellow',8,10);
INSERT INTO dbo.Product VALUES(9,10,'Adidas',200,'Black',12,11);
INSERT INTO dbo.Product VALUES(10,8,'Polo',250,'Blue',32,12);

--Insert Into Customer Table
INSERT INTO dbo.Customer VALUES(1,3,'Joe','Martin','M',29,'1990-08-13','2076541987','1420 11th Ave NE', 98105,'Seattle','Washington','USA');
INSERT INTO dbo.Customer VALUES(2,1,'Richard','Knobbe','M',30,'1989-05-22','3086533987','2324 Howe Ave NE', 90111,'Spokane','Washington','USA');
INSERT INTO dbo.Customer VALUES(3,5,'Mellisa','Birch','F',32,'1987-03-23','4576532986','456 15th Ave NW', 58348,'Erie','Pennsylvania','USA');
INSERT INTO dbo.Customer VALUES(4,4,'Tina','Spenser','F',30,'1989-08-17','8986532987','143 23rd Ave', 45635,'Atlanta','Georgia','USA');
INSERT INTO dbo.Customer VALUES(5,7,'Mellisa','Birch','F',32,'1987-03-23','4576532986','324 15th Ave NW', 58348,'Erie','Pennsylvania','USA');
INSERT INTO dbo.Customer VALUES(6,2,'Blake','Dent','M',34,'1985-07-22','5456555586','1234 45th Ave NE', 67656,'New Orleans','Louisiana','USA');
INSERT INTO dbo.Customer VALUES(7,9,'April','Kaminski','F',36,'1983-08-11','434523586','5658 14th Ave SE', 78776,'Davis','California','USA');
INSERT INTO dbo.Customer VALUES(8,8,'Michael','Connley','M',33,'1986-06-26','6768987676','899 2nd Ave NW', 89765,'Charlotte ','North Carolina','USA');
INSERT INTO dbo.Customer VALUES(9,6,'Tara','Mahon','F',31,'1988-03-22','2344650586','565 80th Ave SW', 89554,'Philadelphia','Pennsylvania','USA');
INSERT INTO dbo.Customer VALUES(10,4,'Zachary','Knight','M',32,'1987-07-29','7865453421','55th Ave NW', 786565,'Atlanta','Georgia','USA');


--Insert Into Discount Table
INSERT INTO dbo.Discount VALUES(0, 0, '2019-01-01', '2019-12-31');
INSERT INTO dbo.Discount VALUES(1, 1, '2019-01-01', '2019-06-30');
INSERT INTO dbo.Discount VALUES(2, 2, '2019-07-01', '2019-12-31');
INSERT INTO dbo.Discount VALUES(3, 5, '2019-07-01', '2019-07-14');
INSERT INTO dbo.Discount VALUES(4, 7, '2019-04-01', '2019-04-30');
INSERT INTO dbo.Discount VALUES(5, 10, '2019-02-01', '2019-02-28');
INSERT INTO dbo.Discount VALUES(6, 15, '2019-08-01', '2019-08-30');
INSERT INTO dbo.Discount VALUES(7, 20, '2019-03-01', '2019-03-31');
INSERT INTO dbo.Discount VALUES(8, 25, '2019-11-01', '2019-12-31');
INSERT INTO dbo.Discount VALUES(9, 30, '2019-11-15', '2019-11-30');
INSERT INTO dbo.Discount VALUES(10, 50, '2019-12-24', '2019-12-31');

--Insert Into Employee Table
INSERT INTO dbo.Employee VALUES(1,1,'Jim','Halpert','1970-08-27','M','2003-05-10','2098761543','1320 7th Ave NW', 87650, 'Portland', 'Oregon','USA')
INSERT INTO dbo.Employee VALUES(2,5,'James','Harden','1980-01-02','M','2000-02-03','206123563','1020 19th Ave NE', 90111, 'Spokane', 'Washington','USA')
INSERT INTO dbo.Employee VALUES(3,2,'Andy','Holmes','1984-05-17','M','2004-04-04','4154553267','6556 4th Ave NW', 98089, 'San Jose', 'California','USA')
INSERT INTO dbo.Employee VALUES(4,7,'Sarah','Joseph','1985-03-01','F','2003-12-12','205567897','4434 Holmes Street', 58348, 'Erie', 'Pennsylvania','USA')
INSERT INTO dbo.Employee VALUES(5,4,'Natalie','Lopez','1982-1-13','F','2000-02-02','4056768767','4544 12th Ave NW', 89888, 'Everett', 'Washington','USA')
INSERT INTO dbo.Employee VALUES(6,5,'Patrick','Harvey','1969-05-23','M','1999-03-04','2058741523','3433 14th Ave NW', 34330, 'Irvine', 'California','USA')
INSERT INTO dbo.Employee VALUES(7,3,'Pam','Bezley','1976-02-15','M','2000-03-12','313761543','1223 1st Ave SW', 62110, 'Cedar Point', 'Iowa','USA')
INSERT INTO dbo.Employee VALUES(8,9,'Alex','Trek','1977-04-11','F','2003-05-10','2098761543','1123 7th Ave SE', 32450, 'Pittsburgh', 'Pennsylvania','USA')
INSERT INTO dbo.Employee VALUES(9,10,'Macy','Jones','1983-06-06','F','2005-03-14','76589098','1320 7th Ave NW', 87650, 'Portland', 'Oregon','USA')
INSERT INTO dbo.Employee VALUES(10,5,'Jim','Halpert','1973-03-07','M','2000-03-03','2095456323','2243 11th Ave SE', 67656, 'New Orleans', 'Louisiana','USA')

--Insert Into Manager Table

INSERT INTO dbo.Manager VALUES(1,1);
INSERT INTO dbo.Manager VALUES(2,6);
INSERT INTO dbo.Manager VALUES(3,8);
INSERT INTO dbo.Manager VALUES(4,5);

--Insert Into Store Table
INSERT INTO dbo.Store VALUES(1,1,'Lovely Boutique','9087 43rd Ave NE','43098','Chicago','Illinois','USA', '2098761029');
INSERT INTO dbo.Store VALUES(2,2,'Bella House of Fashion','345 17th Ave NW','78756','Carmel','California','USA', '4135654567');
INSERT INTO dbo.Store VALUES(3,3,'Blush Boutique','8992 7th Ave NE','78786','Boulder','Colorado','USA', '6768767829');
INSERT INTO dbo.Store VALUES(4,4,'Fashion Bonanza','323 2nd Ave NW','67567','Brighton','Colorado','USA', '8988989029');
INSERT INTO dbo.Store VALUES(5,4,'Juneberry Botique','1340 4th Street','89009','Honolulu','Hawaii','USA', '2098761029');
INSERT INTO dbo.Store VALUES(6,3,'Insta Fashion','2002 11th Street NE','78209','Corydon','Indiana','USA', '4548976029');
INSERT INTO dbo.Store VALUES(7,2,'Juneberry Botique','1340 4th Street','89009','Honolulu','Hawaii','USA', '2098761029');
INSERT INTO dbo.Store VALUES(8,2,'Dress Up Botique','2089 1st Street','43565','Auburn','Maine','USA', '7789771219');
INSERT INTO dbo.Store VALUES(9,1,'Dreams Come True Botique','455 5th Ave','5463','Bowie','Maryland','USA', '3565761449');
INSERT INTO dbo.Store VALUES(10,3,'Polka Dots','1543 10 Street NE','78545','Ann Arbor','Michigan','USA', '7675621332');


--Insert Into Manufacturer Table
INSERT INTO dbo.Manufacturer VALUES(1,'Van Heusen','Izod');
INSERT INTO dbo.Manufacturer VALUES(2,'Van Heusen','Zodiac');
INSERT INTO dbo.Manufacturer VALUES(3,'Gap','Old Navy');
INSERT INTO dbo.Manufacturer VALUES(4,'Polo','Ralph Lauren');
INSERT INTO dbo.Manufacturer VALUES(5,'Calvin Klein','Calvin Klein Collection');
INSERT INTO dbo.Manufacturer VALUES(6,'Columbia','Sorel');
INSERT INTO dbo.Manufacturer VALUES(7,'Nordstorm','Rack');
INSERT INTO dbo.Manufacturer VALUES(8,'Armani','Prive');
INSERT INTO dbo.Manufacturer VALUES(9,'Levis','Dockers');
INSERT INTO dbo.Manufacturer VALUES(10,'Abercrombie & Fitch','Hollister');



--Insert Into Supplier Table
INSERT INTO dbo.Supplier VALUES(1,4,'Gorgon Exports')
INSERT INTO dbo.Supplier VALUES(2,3,'Superb Enterprise')
INSERT INTO dbo.Supplier VALUES(3,2,'All Star Exports')
INSERT INTO dbo.Supplier VALUES(4,1,'Elevated Exports')
INSERT INTO dbo.Supplier VALUES(5,6,'Shipping Exports Corporation')
INSERT INTO dbo.Supplier VALUES(6,8,'Imex System Solutions')
INSERT INTO dbo.Supplier VALUES(7,9,'Independent Exports')
INSERT INTO dbo.Supplier VALUES(8,7,'Products In Motion Export')
INSERT INTO dbo.Supplier VALUES(9,10,'Point A to B Enterprise')
INSERT INTO dbo.Supplier VALUES(10,5,'Efficient Senders')

--Procedure to autopopulate Transactions Table

ALTER PROCEDURE Transaction_Update AS
	BEGIN
		DELETE FROM dbo.Transactions;
		DECLARE @count1 int = 1;
		WHILE @count1 <= 50000
			BEGIN
				INSERT INTO dbo.Transactions VALUES(
				@count1,
				RAND()*(11-1)+1, --EmployeeID
				RAND()*(11-1)+1, --ProductID
				RAND()*(11-1)+1, --CustLoyaltyID
				RAND()*(11-1)+1, --StoreID
				RAND()*(11-1)+1, --CustomerID
				RAND()*(11-1)+1, --SupplierID
				RAND()*(11-1)+1,--DiscountID
				RAND()*(1000-20)+20,
				RAND()*(101-1)+1,
				DATEADD(day, ROUND(DATEDIFF(day, '2019-01-01', '2019-12-31') * 
				RAND(CHECKSUM(NEWID())), 0),DATEADD(second, CHECKSUM(NEWID()) % 48000, 
				'2019-01-01')))
			SET @count1 += 1;
			END
	END

EXEC Transaction_Update


--DQL to display entered data

select * from Customer;
select * from dbo.CustomerLoyalty;
select * from dbo.Discount;
select * from dbo.Employee;
select * from dbo.LoyaltyType;
select * from dbo.Product;
select * from dbo.ProductCategory;
select * from dbo.Salary;
select * from dbo.Store;
select * from dbo.Supplier;
select * from dbo.Manager;
select * from dbo.Manufacturer;
select * from dbo.Transactions


-- Query to display information of all Constraints in the database

SELECT RC.CONSTRAINT_NAME FK_Name
, KF.TABLE_SCHEMA FK_Schema
, KF.TABLE_NAME FK_Table
, KF.COLUMN_NAME FK_Column
, RC.UNIQUE_CONSTRAINT_NAME PK_Name
, KP.TABLE_SCHEMA PK_Schema
, KP.TABLE_NAME PK_Table
, KP.COLUMN_NAME PK_Column
, RC.MATCH_OPTION MatchOption
, RC.UPDATE_RULE UpdateRule
, RC.DELETE_RULE DeleteRule
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KF ON RC.CONSTRAINT_NAME = KF.CONSTRAINT_NAME
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KP ON RC.UNIQUE_CONSTRAINT_NAME = KP.CONSTRAINT_NAME



--Procedure to autopopulate the DiscountID field in transactions table based on highest discount offered on the day of purchase
Create Procedure Procedure_Test AS
	BEGIN
		ALTER TABLE dbo.Transactions DROP CONSTRAINT FK_Transaction_Discount1;
		UPDATE dbo.Transactions SET DiscountID = CASE
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 10) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 10) THEN 10
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 9) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 9) THEN 9
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 8) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 8) THEN 8
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 7) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 7) THEN 7
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 6) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 6) THEN 6
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 5) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 5) THEN 5
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 4) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 4) THEN 4
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 3) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 3) THEN 3
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 2) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 2) THEN 2
			WHEN Date BETWEEN (SELECT StartDate from dbo.Discount WHERE DiscountID = 1) AND (SELECT EndDate from dbo.Discount WHERE DiscountID = 1) THEN 1	
			ELSE 0
		END ;
		ALTER TABLE dbo.Transactions WITH NOCHECK
		ADD CONSTRAINT FK_Transaction_Discount1
		FOREIGN KEY (DiscountID) REFERENCES dbo.Discount(DiscountID);
	END
	
	EXEC Procedure_Test
	
	
	-- View to display the Final Price after discounts have been applied to each product
	CREATE VIEW Product_Transactions AS
	SELECT
	T.TransactionID,
	P.ProductName,
	D.DiscountDescription,
	T.Quantity,
	DateName( month , DateAdd( month , Datepart (MONTH,T.Date) , -1 ) ) as Month,
	((100-D.DiscountDescription)*T.Price*T.Quantity)/100 as FinalPrice,
	T.Price as NonDiscountedPrice
	FROM
	dbo.Discount D, dbo.Transactions T, dbo.Product P
	WHERE
	D.DiscountID = T.DiscountID
	and T.ProductID = P.ProductID;
	

	Create View EmployeeSales As
	select E.EmployeeID, E.EmployeeFirstName, E.EmployeeLastName, (Quantity) As TotalProductsSold, CAST(T.Date as Date) as TDate
	from dbo.Transactions T, dbo.Employee E
	where T.EmployeeID = E.EmployeeID

	--View that displays the total quantity of products sold by each employee
	
	Create View EmployeeSales1 As
	select E.EmployeeID, E.EmployeeFirstName, E.EmployeeLastName, SUM(Quantity) As TotalProductsSold, CAST(T.Date as Date)
	from dbo.Transactions T, dbo.Employee E
	where T.EmployeeID = E.EmployeeID
	GROUP BY E.EmployeeID,E.EmployeeFirstName, E.EmployeeLastName
	
	
	-- View that displays the Employee of the month based on highest sales by an employee each month
	
	Create View EmployeeOfTheMonth As
	Select Res.EmployeeID, Res.EmployeeFirstName, Res.EmployeeLastName, Res.TotalProductsSold,Res.MonthNumber
	FROM (
		select E.EmployeeID, E.EmployeeFirstName, E.EmployeeLastName, SUM(Quantity) As TotalProductsSold, Month(T.Date) As MonthNumber,
		ROW_NUMBER() OVER (PARTITION BY MONTH(T.Date)
							ORDER BY SUM(Quantity) DESC) As Rnk
		from dbo.Transactions T, dbo.Employee E
		where T.EmployeeID = E.EmployeeID
		GROUP BY E.EmployeeID,E.EmployeeFirstName, E.EmployeeLastName,Month(T.Date)) as Res
	WHERE Res.Rnk = 1
	

	
	

	