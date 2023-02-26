use training;

SELECT * FROM employee_tbl;

SHOW INDEXES FROM employee_tbl;

CREATE INDEX emp_idx ON employee_tbl(emp_id);
SHOW INDEXES FROM employee_tbl;
SELECT * FROM employee_tbl WHERE emp_id=6;
CREATE INDEX emp_nx ON employee_tbl(emp_name);
CREATE INDEX emp_idname ON employee_tbl(emp_id,emp_name);
SHOW INDEXES FROM employee_tbl;

SELECT * FROM employee_tbl WHERE emp_id>1 AND emp_name='Ramya';


-- DATA CONTROL LANGUAGE

GRANT SELECT ON employee_tbl TO 'root'@localhost;

GRANT SELECT,INSERT ON employee_tbl TO 'root'@localhost;

GRANT VIEW ON employee_tbl TO 'root'@localhost;

REVOKE DROP, DELETE on employee_tbl FROM 'root'@localhost;

CREATE USER 'bala'@localhost IDENTIFIED BY 'bala@123';

SHOW GRANTS FOR 'root'@localhost;
SHOW GRANTS FOR 'bala'@localhost;
GRANT SELECT,INSERT ON employee_tbl TO 'bala'@localhost;
SHOW GRANTS FOR 'bala'@localhost;

REVOKE INSERT ON employee_tbl FROM 'bala'@localhost;
SHOW GRANTS FOR 'bala'@localhost;

SELECT * FROM mysql.user;

GRANT SELECT ON * TO 'bala'@localhost;

-- STRING FUNCTIONS
SELECT * FROM transaction_tbl;

SELECT product_name, CHAR_LENGTH(product_name) as len FROM transaction_tbl;

SELECT product_name, LENGTH(product_name) as len FROM transaction_tbl;

SELECT product_name, CHARACTER_LENGTH(product_name) as len FROM transaction_tbl;


SELECT product_name, amount , concat(product_name,'-',amount) as prod_amt FROM transaction_tbl;
SELECT product_name, amount , concat(cust_id,'-',product_name,'-',amount) as prod_amt FROM transaction_tbl;

SELECT product_name, amount , concat_ws('-',trans_id,cust_id,product_name,amount) as prod_amt FROM transaction_tbl;



SELECT * FROM transaction_tbl;

SELECT cust_id, GROUP_CONCAT(product_name) as products FROM transaction_tbl GROUP BY cust_id;

SELECT cust_id, count(product_name) as no_of_products FROM transaction_tbl GROUP BY cust_id;

SELECT cust_id, sum(amount) as total_amount FROM transaction_tbl GROUP BY cust_id;

SELECT product_name, amount , SUBSTRING_INDEX(concat_ws('-',trans_id,cust_id,product_name,amount),'-',3 ) as prod_amt FROM transaction_tbl;

SELECT product_name, amount , SUBSTRING_INDEX(concat_ws('-',trans_id,cust_id,product_name,amount),'-',-2 ) as prod_amt FROM transaction_tbl;

SELECT product_name, amount , REGEXP_SUBSTR(concat_ws('-',trans_id,cust_id,product_name,amount),'[A-Za-z]+') as prod_amt FROM transaction_tbl;

SELECT product_name, amount , REGEXP_SUBSTR(concat_ws('-',trans_id,cust_id,product_name,amount),'[A-Z]+') as prod_amt FROM transaction_tbl;

SELECT product_name, amount , REGEXP_SUBSTR(concat_ws('-',trans_id,cust_id,product_name,amount),'[0-9]+',1,2) as prod_amt FROM transaction_tbl;


SELECT cust_id, product_name, amount FROM transaction_tbl;
SELECT cust_id, product_name, lower(product_name) as lname, amount FROM transaction_tbl;
SELECT cust_id, product_name, lcase(product_name) as lname, amount FROM transaction_tbl;
SELECT cust_id, product_name, upper(product_name) as uname, amount FROM transaction_tbl;
SELECT cust_id, product_name, ucase(product_name) as uname, amount FROM transaction_tbl;

SELECT product_name, replace(product_name, 'o','-') as product FROM transaction_tbl;
SELECT product_name, replace(product_name, 'Desktop','System') as product FROM transaction_tbl;
SELECT product_name, replace(product_name, 'o','-') as product FROM transaction_tbl;

SELECT product_name, amount FROM transaction_tbl;
SELECT product_name, FORMAT(amount,2) FROM transaction_tbl;
SELECT product_name, FORMAT(amount,3) FROM transaction_tbl;
SELECT FORMAT(55635.6354256,2) ;
SELECT ROUND(55635.6354256,1) ;
SELECT ROUND(55635.6354256) ;

SELECT 1000;
SELECT CAST(1000 AS CHAR);
SELECT CAST("26-02-2023" AS DATE);
SELECT CAST("2023-02-26" AS DATE);

SELECT 
    product_name, 
    CONCAT('₹ ',FORMAT(amount,0)) as Sal 
FROM 
    transaction_tbl 
ORDER BY 
    amount ASC;

-- DATE FUNCTION

SELECT curdate();
SELECT current_timestamp();
SELECT NOW();
SELECT current_time();

%a - Weekday short name - Sun,Mon...Sat
%W- Weekday full name - Sunday, Monday,..... Saturday
%b - Month short name - Jan, Feb...Dec
%M - Month full name - January, february,...December
%c - Numeric month - 1..12
%d  - day of month - 1..31   
%e - day of moth - 1..31
%D - date with suffix -- 1st , 2nd, ...31st
%y - year in 2 digit format - 23,24,25...
%Y - year in 4 digit format -- 2023,2024,205...
%H - 24 hour format - 0..23
%I - 12 hour format .. 0..12
%p - AM|PM
%i - Minutes (00.59)
%s - seconds (00.59)

CREATE TABLE Employees(
	EmployeeID int not NULL PRIMARY KEY,
	First varchar(50) NULL,
	Last varchar(50) NULL,
	Building varchar(50) NULL,
	Department varchar(50) NULL,
	Status varchar(50) NULL,
	HireDate datetime NULL,
	BenefitDental varchar(50) NULL,
	BenefitMedical varchar(50) NULL,
	BenefitRetirement nvarchar(50) NULL,
	Salary int NULL,
	JobRating int NULL
);


Insert into Employees (EmployeeID,First,Last,Building,Department,Status,HireDate,BenefitDental,BenefitMedical,BenefitRetirement,Salary,JobRating) Values
(1,'Zachary','Tate','Taft','Manufacturing','Full Time','1999-06-10','Yes','Yes','Yes',78570,1),
(2,'Robert','Wilcox','Main','Quality Assurance','Contract','1999-06-15','No','No','No',86100,4),
(3,'Teresa','Baxter','Taft','Manufacturing','Half-Time','1999-06-16','Yes','Yes','Yes',48835,5),
(4,'Suzanne','Farmer','West','Account Management','Full Time','1999-06-30','No','Yes','No',22870,3),
(5,'Leonard','Grant','South','Account Management','Half-Time','1999-07-05','Yes','Yes','Yes',31205,2),
(6,'David','Armstrong','North','Quality Control','Contract','1999-07-05','No','No','No',45030,3),
(7,'Tia','Powers','North','Facilities/Engineering','Full Time','1999-07-08','Yes','Yes','Yes',61030,3),
(8,'David','Meyers','West','Manufacturing','Hourly','1999-07-08','No','No','No',29176,3),
(9,'Mike','Walker','Watson','Manufacturing','Full Time','1999-07-09','No','Yes','No',35460,5),
(10,'Marc','Navarro','Main','Facilities/Engineering','Half-Time','1999-07-21','Yes','No','No',23380,4),
(11,'Lawrence','Pugh','South','Quality Assurance','Half-Time','1999-07-21','No','Yes','No',39530,5),
(12,'Bryan','Briggs','Main','Facilities/Engineering','Contract','1999-07-27','No','No','No',85480,5),
(13,'Corey','Patton','West','Marketing','Full Time','1999-08-04','Yes','No','No',86830,3),
(14,'Thomas','Chavez','Main','Marketing','Full Time','1999-08-05','No','No','Yes',82110,3),
(15,'Grant','Barnes','Main','Quality Assurance','Hourly','1999-08-09','No','No','No',12836,5),
(16,'Ray','Turner','West','Quality Assurance','Hourly','1999-08-17','No','No','No',17912,5),
(17,'Craig','Henry','North','Quality Assurance','Full Time','1999-09-13','No','No','Yes',70280,3),
(18,'Ronald','Lawrence','Main','Facilities/Engineering','Contract','1999-09-19','No','No','No',63340,3),
(19,'Chris','Garrison','North','IT','Full Time','1999-09-20','Yes','Yes','Yes',68520,5),
(20,'Elaine','Jefferson','Taft','Account Management','Full Time','1999-10-05','Yes','Yes','No',73740,4),
(21,'James','Dudley','South','IT','Contract','1999-10-08','No','No','No',63330,4),
(22,'Cathy','Fields','Taft','Manufacturing','Contract','1999-10-14','No','No','No',76910,1),
(23,'Cherie','Burgess','North','Manufacturing','Full Time','1999-10-19','No','No','Yes',89740,5),
(24,'Scott','Melton','West','Manufacturing','Full Time','1999-10-25','No','Yes','No',55450,5),
(25,'Rick','Gallegos','Main','Product Development','Contract','1999-10-26','No','No','No',25120,5),
(26,'Timothy','Wallace','Watson','Facilities/Engineering','Contract','1999-10-27','No','No','No',88000,5),
(27,'Raquel','Booth','West','Account Management','Hourly','1999-11-02','No','No','No',14332,5),
(28,'Eric','Jackson','North','Account Management','Full Time','1999-11-14','No','No','Yes',61420,4),
(29,'Eileen','Roberson','Main','Creative','Contract','1999-11-15','No','No','No',64470,3),
(30,'Robert','Owen','Main','Sales','Half-Time','1999-11-17','Yes','Yes','Yes',20500,3),
(31,'Erin','Harding','West','Facilities/Engineering','Full Time','1999-11-21','No','Yes','No',34780,4),
(32,'Mark','Russell','Main','IT','Full Time','1999-11-25','Yes','Yes','Yes',74530,5),
(33,'Raymond','Bradford','North','Manufacturing','Contract','1999-11-28','No','No','No',71710,5),
(34,'Kevin','Atkins','North','Manufacturing','Hourly','1999-12-08','No','No','No',8904,3),
(35,'Garret','Santos','Taft','Product Development','Full Time','1999-12-15','Yes','Yes','No',71010,5),
(36,'Chris','Preston','Main','Account Management','Full Time','1999-12-16','Yes','No','No',36890,1),
(37,'Richard','Chambers','Main','Manufacturing','Contract','1999-12-18','No','No','No',68260,5),
(38,'Florianne','Jacobs','Main','Manufacturing','Full Time','1999-12-22','Yes','Yes','Yes',40340,2),
(39,'Gregory','Wilkinson','North','Manufacturing','Contract','1999-12-23','No','No','No',72520,3),
(40,'Rhonda','Stafford','Main','Manufacturing','Full Time','2000-01-04','Yes','Yes','Yes',75120,5),
(41,'Carl','Parker','South','Manufacturing','Contract','2000-01-06','No','No','No',45050,1),
(42,'Jen','Middleton','Main','Quality Assurance','Full Time','2000-01-07','Yes','Yes','No',78950,1),
(43,'Ronald','Crawford','North','Quality Control','Full Time','2000-01-20','Yes','Yes','No',64470,5),
(44,'Diane','Andrews','North','Account Management','Hourly','2000-01-23','No','No','No',16688,3),
(45,'Brett','Conway','South','Facilities/Engineering','Contract','2000-02-02','No','No','No',30340,3),
(46,'Ryan','McCarthy','West','Sales','Contract','2000-02-11','No','No','No',72480,2),
(47,'Janene','Cruz','South','Quality Control','Half-Time','2000-02-17','Yes','No','No',46105,5),
(48,'Bobby','Mendoza','West','Facilities/Engineering','Hourly','2000-02-23','No','No','No',18500,5),
(49,'Erik','Pena','South','Manufacturing','Hourly','2000-03-02','No','No','No',37612,4),
(50,'Hsi','McCormick','West','Quality Assurance','Contract','2000-03-05','No','No','No',59050,4),
(51,'Scott','McDowell','Main','Creative','Full Time','2000-03-12','No','No','Yes',50110,1),
(52,'Kenneth','Miles','Main','Quality Assurance','Full Time','2000-03-13','Yes','No','No',79610,2),
(53,'Shannon','Thomas','Taft','Quality Control','Full Time','2000-03-15','No','No','Yes',48410,5),
(54,'Mark','Massey','West','Quality Assurance','Full Time','2000-03-16','No','No','Yes',67407,5),
(55,'Jaime','Chen','Taft','Product Development','Full Time','2000-03-17','No','No','Yes',82400,2),
(56,'Amy','Decker','South','Manufacturing','Full Time','2000-03-19','Yes','Yes','Yes',33210,4),
(57,'Duane','Pope','Main','Sales','Hourly','2000-03-19','No','No','No',21668,4),
(58,'Jessica','Chapman','North','Account Management','Half-Time','2000-03-19','Yes','Yes','No',45750,5),
(59,'Michael','Bowman','West','Account Management','Contract','2000-03-21','No','No','No',47520,1),
(60,'Christopher','Perry','West','Facilities/Engineering','Contract','2000-03-22','No','No','No',76930,1),
(61,'Mark','Moses','Main','Account Management','Full Time','2000-03-23','No','Yes','No',54580,4),
(62,'Alfred','Waters','North','Marketing','Half-Time','2000-03-29','Yes','Yes','Yes',47885,1),
(63,'Debra','Parrish','Main','Manufacturing','Full Time','2000-04-05','Yes','Yes','Yes',88240,5),
(64,'Jennifer','Barr','North','Marketing','Full Time','2000-04-20','Yes','No','No',49770,1),
(65,'Kristina','Jensen','West','Marketing','Half-Time','2000-04-25','No','No','Yes',28880,3),
(66,'Anthony','Carson','West','Manufacturing','Full Time','2000-04-26','Yes','Yes','No',22660,2),
(67,'Leslie','Doyle','Taft','Account Management','Full Time','2000-05-10','No','No','Yes',45000,4),
(68,'Debbie','Wolf','Taft','Training','Full Time','2000-05-17','No','No','Yes',72090,5),
(69,'Robert','Moore','West','Marketing','Full Time','2000-05-19','Yes','Yes','No',31260,5),
(70,'Lisa','Page','West','ADC','Full Time','2000-06-14','Yes','Yes','Yes',24550,1),
(71,'Emily','Leon','Main','Sales','Full Time','2000-06-18','No','No','Yes',23520,2),
(72,'Jill','Maxwell','Taft','Creative','Contract','2000-06-19','No','No','No',32940,5),
(73,'David','Mercado','Main','Manufacturing','Half-Time','2000-06-20','No','Yes','No',21670,2),
(74,'Ed','Gomez','South','Environmental Health/Safety','Full Time','2000-06-25','No','No','Yes',68300,5),
(75,'Thomas','Marquez','West','Marketing','Contract','2000-07-05','No','No','No',47620,5),
(76,'Brandon','Blackwell','West','Quality Control','Contract','2000-07-06','No','No','No',58250,2),
(77,'Allan','Carter','Main','Account Management','Full Time','2000-07-08','No','Yes','No',46360,5),
(78,'Tamara','McDaniel','Main','Quality Assurance','Half-Time','2000-07-09','Yes','Yes','Yes',34980,2),
(79,'Roy','Butler','Taft','Manufacturing','Full Time','2000-07-11','Yes','No','No',81400,2),
(80,'Mary','Reyes','Taft','Marketing','Contract','2000-07-12','No','No','No',31270,5),
(81,'Matthew','Dunn','North','Environmental Compliance','Full Time','2000-07-27','Yes','No','No',47850,1),
(82,'Brian D','Hoffman','North','Quality Assurance','Contract','2000-07-27','No','No','No',53310,5),
(83,'Kent','Oconnor','Taft','Training','Half-Time','2000-07-30','Yes','Yes','Yes',15240,1),
(84,'Michael','Kirby','South','Account Management','Half-Time','2000-07-30','No','No','Yes',22475,4),
(85,'Terry','Palmer','South','Quality Control','Full Time','2000-08-25','Yes','No','No',77680,3),
(86,'Michael','Solomon','North','Quality Assurance','Full Time','2000-08-27','Yes','Yes','Yes',58410,5),
(87,'Peter','Foley','Main','Environmental Health/Safety','Full Time','2000-08-31','Yes','Yes','Yes',49860,2),
(88,'Frank','Wiggins','North','Training','Full Time','2000-09-11','Yes','Yes','Yes',75150,1),
(89,'Chris','Montgomery','South','Product Development','Hourly','2000-09-14','No','No','No',38768,4),
(90,'Shaun','Winters','North','Creative','Full Time','2000-09-20','No','No','Yes',61330,1),
(91,'Todd','Francis','Main','Manufacturing','Half-Time','2000-09-20','No','No','Yes',48190,1),
(92,'Brad','Wright','Main','Manufacturing','Full Time','2000-09-24','No','No','Yes',61330,4),
(93,'Bacardi','Pittman','South','Manufacturing','Contract','2000-10-04','No','No','No',25130,5),
(94,'Kevin','Aguilar','West','Quality Assurance','Full Time','2000-10-11','No','No','Yes',39000,3),
(95,'Danny','Love','Watson','Marketing','Full Time','2000-10-18','Yes','Yes','Yes',46030,2),
(96,'Christopher','Soto','Main','Account Management','Contract','2000-10-18','No','No','No',57990,5),
(97,'Thomas','Hurst','Main','Manufacturing','Hourly','2000-10-26','No','No','No',9424,4),
(98,'Sheela','Gaines','North','Quality Assurance','Full Time','2000-11-02','Yes','Yes','Yes',69200,4),
(99,'Robert','Sullivan','North','Manufacturing','Full Time','2000-11-08','No','No','Yes',68750,1),
(100,'Diane','Chandler','Main','IT','Hourly','2000-11-19','No','No','No',39764,1),
(101,'Curtis','Sheppard','Main','Quality Control','Full Time','2000-11-20','Yes','No','No',61850,2),
(102,'Robbie','Barber','North','Manufacturing','Full Time','2000-11-22','No','Yes','No',37760,2),
(103,'Deborah','Lindsey','North','Account Management','Hourly','2000-11-30','No','No','No',37016,4),
(104,'Roger','Copeland','Watson','Creative','Contract','2000-12-02','No','No','No',86970,4),
(105,'Cassy','Pearson','Watson','Manufacturing','Contract','2000-12-10','No','No','No',27380,3),
(106,'Stephen','Silva','Main','Creative','Half-Time','2000-12-17','Yes','No','No',42905,1),
(107,'Carol','Moran','North','Manufacturing','Half-Time','2000-12-20','No','No','Yes',11065,1),
(108,'Randall','Ruiz','West','Quality Assurance','Full Time','2000-12-20','No','No','Yes',67020,1),
(109,'Christopher','Parks','Taft','Quality Control','Half-Time','2000-12-25','No','Yes','No',19825,2),
(110,'Janice','Ross','South','Marketing','Half-Time','2000-12-31','No','No','Yes',26790,2),
(111,'Teason','Anderson','Watson','Account Management','Contract','2001-01-04','No','No','No',71300,5),
(112,'Douglas','Howell','Main','Account Management','Hourly','2001-01-09','No','No','No',36052,5),
(113,'John','Jones','Taft','Marketing','Full Time','2001-01-21','No','No','Yes',51410,4),
(114,'Bryant','Vargas','Main','Account Management','Full Time','2001-01-22','No','No','Yes',65910,5),
(115,'Paul','Dennis','Main','Quality Assurance','Contract','2001-02-04','No','No','No',60800,4),
(116,'Dean','Collier','North','Quality Assurance','Full Time','2001-02-05','Yes','Yes','No',45880,5),
(117,'James','Finley','South','Manufacturing','Full Time','2001-02-11','Yes','Yes','Yes',40060,3),
(118,'Shari','Mathis','South','Product Development','Full Time','2001-02-12','Yes','No','No',39680,5),
(119,'Vicky','Payne','North','Manufacturing','Half-Time','2001-02-20','No','No','Yes',17270,5),
(120,'Michael','Santiago','North','Quality Assurance','Half-Time','2001-02-21','Yes','No','No',47350,1),
(121,'Chris','McKinney','North','Manufacturing','Full Time','2001-03-01','Yes','Yes','Yes',35820,2),
(122,'Edward','McLaughlin','West','Manufacturing','Full Time','2001-03-14','Yes','Yes','Yes',67280,3),
(123,'David','Diaz','Main','Manufacturing','Contract','2001-03-25','No','No','No',23810,4),
(124,'Pete','Caldwell','Main','Marketing','Full Time','2001-03-26','No','No','Yes',43460,5),
(125,'Lara','Larsen','Watson','Quality Control','Hourly','2001-03-28','No','No','No',32536,2),
(126,'April','Goodwin','North','Quality Control','Half-Time','2001-04-01','No','No','Yes',26185,5),
(127,'Douglas','Bryant','North','Marketing','Full Time','2001-04-02','Yes','Yes','Yes',44220,3),
(128,'Alicia','Franklin','Watson','Sales','Full Time','2001-04-05','No','No','Yes',68410,5),
(129,'Lorna','Hudson','West','Facilities/Engineering','Contract','2001-04-09','No','No','No',23560,3),
(130,'Gayla','Dean','North','Quality Assurance','Contract','2001-04-18','No','No','No',54840,4),
(131,'Steve','May','West','Facilities/Engineering','Hourly','2001-04-26','No','No','No',33056,5),
(132,'Eugene','Glover','Main','Manufacturing','Half-Time','2001-05-12','No','Yes','No',41615,1),
(133,'Gregory','Clayton','North','Facilities/Engineering','Full Time','2001-05-15','No','No','Yes',32100,1),
(134,'Ray','Baldwin','Watson','Quality Assurance','Full Time','2001-05-23','No','No','Yes',48250,3),
(135,'Richard','Campos','Main','Major Mfg Projects','Hourly','2001-05-28','No','No','Yes',61860,5),
(136,'James','Abbott','North','Quality Assurance','Full Time','2001-06-04','Yes','Yes','Yes',29260,4),
(137,'Chris','Kirk','Main','Quality Assurance','Half-Time','2001-06-09','No','Yes','No',20990,4),
(138,'Donald','Patel','Main','Manufacturing','Full Time','2001-06-13','Yes','Yes','Yes',76192,4),
(139,'Edward','Hayes','Main','Account Management','Full Time','2001-06-14','Yes','Yes','Yes',62400,4),
(140,'John','Barrett','North','Quality Control','Full Time','2001-06-27','No','No','Yes',35460,1),
(141,'Ronald','Carpenter','Watson','Quality Assurance','Hourly','2001-07-05','No','No','No',15552,4),
(142,'Kim','Green','Watson','Research/Development','Half-Time','2001-07-05','Yes','Yes','Yes',31250,2),
(143,'Icelita','Kelly','South','Sales','Full Time','2001-07-15','Yes','No','No',45450,5),
(144,'Shira','Nelson','West','Human Resources','Full Time','2001-07-17','No','No','Yes',75060,5),
(145,'Elbert','Cole','South','Manufacturing','Contract','2001-08-17','No','No','No',41840,2),
(146,'Diane','Matthews','North','Facilities/Engineering','Hourly','2001-08-19','No','No','No',30080,3),
(147,'Debra','Boyd','North','Manufacturing','Half-Time','2001-08-21','No','No','Yes',46710,3),
(148,'Lesa','Carroll','West','Environmental Compliance','Full Time','2001-09-05','No','Yes','No',56440,1),
(149,'Michael','Welch','North','Quality Control','Full Time','2001-09-05','Yes','Yes','No',71970,4),
(150,'Joseph','Pace','Main','IT','Contract','2001-09-09','No','No','No',30300,1),
(151,'John','Sexton','Main','Manufacturing','Contract','2001-09-23','No','No','No',57600,3),
(152,'Don','Guzman','Main','Quality Assurance','Contract','2001-09-28','No','No','No',77760,3),
(153,'Charles','Lee','West','Product Development','Full Time','2001-09-29','No','No','Yes',71380,2),
(154,'Michael','Campbell','West','Marketing','Full Time','2001-10-18','No','No','Yes',52490,4),
(155,'Timothy','Beasley','North','Quality Control','Full Time','2001-10-28','Yes','Yes','No',65320,5),
(156,'Kristin','Randolph','South','Major Mfg Projects','Contract','2001-10-29','No','No','Yes',69410,4),
(157,'Al','Serrano','Main','Account Management','Full Time','2001-10-29','Yes','No','No',48330,1),
(158,'Michael','Mosley','North','IT','Half-Time','2001-11-20','No','No','Yes',29005,1),
(159,'Andrew','Humphrey','West','Manufacturing','Full Time','2001-11-23','No','Yes','No',23650,1),
(160,'Richard','McLean','North','Marketing','Contract','2001-11-28','No','No','No',50200,4),
(161,'Kathleen','Browning','South','Manufacturing','Contract','2001-11-29','No','No','No',57760,3),
(162,'Jessica','Whitaker','North','Manufacturing','Full Time','2001-12-02','Yes','No','No',38870,2),
(163,'Ignacio','Huffman','North','Manufacturing','Contract','2001-12-13','No','No','No',89520,5),
(164,'Anita','Marshall','North','Manufacturing','Contract','2001-12-24','No','No','No',45420,1),
(165,'Daniel','White','Watson','Training','Full Time','2002-01-28','Yes','No','No',74840,4),
(166,'Charles','Alexander','West','Manufacturing Admin','Contract','2002-01-29','No','No','No',74500,4),
(167,'Ken','Rowe','West','Training','Contract','2002-02-10','No','No','No',76690,3),
(168,'John','Cameron','North','Account Management','Contract','2002-02-20','No','No','No',89640,4),
(169,'David','Gonzalez','Taft','Quality Control','Full Time','2002-04-17','No','No','Yes',47630,3),
(170,'Charles','Thornton','West','Environmental Compliance','Full Time','2002-06-06','No','No','Yes',33640,3),
(171,'Jimmy','Simpson','Watson','Facilities/Engineering','Half-Time','2002-06-09','Yes','Yes','Yes',35280,3),
(172,'Harlon','Vaughn','Main','Sales','Full Time','2002-06-11','Yes','Yes','Yes',71820,2),
(173,'Cinnamon','Quinn','North','Quality Control','Half-Time','2002-07-01','Yes','Yes','Yes',17205,5),
(174,'Barbara','Reynolds','West','Marketing','Full Time','2002-07-23','Yes','Yes','Yes',48990,5),
(175,'Janet','Daniels','North','Quality Control','Full Time','2002-08-08','Yes','No','No',49930,1),
(176,'Michael','Graves','North','Quality Control','Full Time','2002-08-19','Yes','Yes','Yes',63060,4),
(177,'David','Larson','North','Manufacturing','Contract','2002-08-29','No','No','No',68510,5),
(178,'Lisa','Montoya','Main','Research Center','Full Time','2002-09-12','Yes','Yes','Yes',63670,5),
(179,'Karin','Sherman','North','Facilities/Engineering','Full Time','2002-09-29','Yes','Yes','Yes',27180,4),
(180,'Gary','Pennington','Taft','Quality Control','Full Time','2002-09-30','No','No','Yes',78710,2),
(181,'Nathaniel','Nichols','North','Facilities/Engineering','Full Time','2002-10-09','No','No','Yes',28650,4),
(182,'Elena','Miranda','South','Major Mfg Projects','Full Time','2002-11-03','Yes','Yes','No',45150,1),
(183,'Thomas','Keith','Watson','Quality Control','Contract','2002-11-25','No','No','No',77136,5),
(184,'Verna','Bates','North','Manufacturing','Full Time','2002-11-28','Yes','Yes','No',66010,5),
(185,'Jenny','Leblanc','West','Research Center','Full Time','2002-12-03','Yes','No','No',40680,5),
(186,'Stephen','Warner','Taft','Quality Assurance','Contract','2002-12-12','No','No','No',46780,2),
(187,'Kimberly','Kennedy','Main','Quality Control','Contract','2002-12-29','No','No','No',28270,5),
(188,'Michael','Molina','Main','Creative','Full Time','2003-01-12','No','Yes','No',61150,4),
(189,'Daniel','Johnston','West','Marketing','Half-Time','2003-02-06','Yes','Yes','No',31110,1),
(190,'Jessica','Wilson','Main','Account Management','Full Time','2003-02-06','Yes','Yes','Yes',29130,1),
(191,'James','Tucker','South','Marketing','Half-Time','2003-02-09','Yes','No','No',15910,3),
(192,'Dominic','Jimenez','Watson','Quality Control','Contract','2003-02-09','No','No','No',25530,3),
(193,'Troy','Weeks','Main','Marketing','Half-Time','2003-03-06','Yes','Yes','No',47295,4),
(194,'Brian','Fletcher','Main','Facilities/Engineering','Full Time','2003-03-16','No','Yes','No',62790,2),
(195,'Charles','Meyer','South','Manufacturing','Full Time','2003-05-08','No','No','Yes',25310,4),
(196,'Matthew','Moody','West','Sales','Contract','2003-05-15','No','No','No',29540,3),
(197,'Kathleen','Martinez','Main','Facilities/Engineering','Full Time','2003-05-20','Yes','Yes','Yes',71950,5),
(198,'Hunyen','Curry','Main','Account Management','Half-Time','2003-05-28','Yes','No','No',12545,4),
(199,'Benjamin','Young','Main','Product Development','Full Time','2003-07-06','Yes','Yes','Yes',42480,3),
(200,'Tony','Roth','Taft','Manufacturing','Contract','2003-08-13','No','No','No',52770,2),
(201,'Elizabeth','Stewart','Main','Manufacturing','Full Time','2003-08-18','No','No','Yes',62750,3),
(202,'Paul','Harmon','North','Facilities/Engineering','Full Time','2003-09-04','Yes','Yes','No',85880,3),
(203,'Donnie','Colon','North','Manufacturing','Full Time','2003-10-20','Yes','Yes','Yes',28970,3),
(204,'Timothy','Tanner','Taft','Training','Full Time','2003-10-30','Yes','Yes','Yes',30780,4),
(205,'Michael','Vasquez','Main','Account Management','Contract','2003-10-30','No','No','No',60070,3),
(206,'Larry','Wood','Taft','Manufacturing Admin','Full Time','2003-11-02','Yes','Yes','Yes',59140,5),
(207,'Steve','Little','Main','Manufacturing','Full Time','2003-12-01','No','Yes','No',64130,1),
(208,'Ruben','Salazar','Watson','Quality Control','Contract','2003-12-18','No','No','No',49090,4),
(209,'Chris','Bauer','West','IT','Half-Time','2004-01-04','Yes','Yes','Yes',33810,5),
(210,'Philip','Mueller','Taft','Quality Control','Full Time','2004-01-29','Yes','No','No',60300,2),
(211,'Terry','Gilmore','North','Major Mfg Projects','Half-Time','2004-02-08','Yes','No','No',51800,1),
(212,'Desiree','Snow','Main','Manufacturing','Full Time','2004-02-12','No','No','Yes',69080,3),
(213,'Brian','Morton','North','Account Management','Contract','2004-02-29','No','No','No',61580,3),
(214,'Gary','Jennings','North','Account Management','Full Time','2004-04-11','Yes','Yes','No',45100,2),
(215,'Robin','Hutchinson','Watson','Creative','Full Time','2004-05-25','No','Yes','No',39740,1),
(216,'Ernest','Haynes','West','Manufacturing','Half-Time','2004-06-02','Yes','Yes','Yes',24460,1),
(217,'Cliff','Black','Watson','Quality Assurance','Full Time','2004-06-07','No','No','Yes',82490,5),
(218,'Scott','Rodriguez','North','Manufacturing','Contract','2004-06-16','No','No','No',61370,3),
(219,'Justin','Bass','North','Product Development','Contract','2004-06-23','No','No','No',31970,5),
(220,'Troy','Durham','South','Creative','Contract','2004-07-19','No','No','No',73390,2),
(221,'Victor','Bailey','Watson','Research Center','Full Time','2004-08-05','No','No','Yes',42800,5),
(222,'Danielle','Atkinson','North','Account Management','Full Time','2004-08-22','Yes','Yes','No',23560,3),
(223,'Ryan','Banks','Main','IT','Hourly','2004-09-01','No','No','No',21648,2),
(224,'Lincoln','Dickerson','North','Manufacturing','Hourly','2004-09-20','No','No','No',8892,1),
(225,'Lateef','Rush','West','Quality Assurance','Half-Time','2004-11-04','Yes','Yes','No',28525,4),
(226,'Rajean','Strickland','Main','Training','Half-Time','2004-11-11','Yes','No','No',17735,3),
(227,'Renee','Hood','North','Facilities/Engineering','Full Time','2004-11-14','No','No','Yes',87280,4),
(228,'Michael','Munoz','South','Quality Assurance','Full Time','2004-11-22','Yes','Yes','Yes',29210,5),
(229,'John','Lucas','North','Sales','Contract','2004-12-02','No','No','No',78100,3),
(230,'Troy','Davenport','North','Quality Control','Full Time','2004-12-09','No','No','Yes',48010,3),
(231,'Christopher','Glenn','South','Quality Assurance','Half-Time','2004-12-14','Yes','Yes','Yes',48740,1),
(232,'William','Clay','Watson','Manufacturing','Contract','2004-12-19','No','No','No',75420,1),
(233,'Asa','Byrd','Watson','Sales','Hourly','2004-12-26','No','No','No',11044,2),
(234,'Gary','Long','South','Account Management','Full Time','2005-01-16','Yes','Yes','No',76910,2),
(235,'Eric','Weaver','North','Manufacturing','Full Time','2005-02-03','Yes','Yes','No',54230,5),
(236,'Neill','Juarez','North','Green Building','Full Time','2005-02-20','Yes','Yes','Yes',86530,1),
(237,'Jaime','Davidson','Watson','Manufacturing','Contract','2005-03-08','No','No','No',64220,5),
(238,'Deborah','Heath','Watson','Manufacturing','Full Time','2005-04-14','No','No','Yes',30920,5),
(239,'Glenn','Hernandez','North','Manufacturing Admin','Full Time','2005-04-14','No','No','Yes',53870,2),
(240,'David','Day','Main','Manufacturing','Full Time','2005-04-21','Yes','Yes','Yes',75176,3),
(241,'Kenneth','Douglas','North','Major Mfg Projects','Hourly','2005-04-24','Yes','Yes','Yes',85130,5),
(242,'Gretchen','Becker','West','Facilities/Engineering','Full Time','2005-05-08','Yes','Yes','Yes',66890,5),
(243,'Andrew','Stevens','Taft','Quality Assurance','Contract','2005-07-14','No','No','No',64590,1),
(244,'Robert','Carrillo','North','Manufacturing','Contract','2005-07-31','No','No','No',57410,2),
(245,'Dawn','Potter','Taft','Environmental Compliance','Full Time','2005-08-07','Yes','Yes','Yes',30350,1),
(246,'John','Robinson','North','Manufacturing','Contract','2005-08-29','No','No','No',39300,2),
(247,'Michael','Morse','North','Product Development','Full Time','2005-10-30','No','Yes','No',65560,1),
(248,'Troy','Chase','Main','Training','Full Time','2005-11-06','Yes','Yes','Yes',49350,4),
(249,'Suzanne','Robbins','North','IT','Hourly','2005-11-08','No','No','No',33512,4),
(250,'Clint','Velasquez','West','Manufacturing','Full Time','2005-11-10','Yes','Yes','Yes',47340,2),
(251,'Michael','Schmidt','North','Account Management','Half-Time','2005-12-07','No','No','Yes',32900,2),
(252,'Lara','Best','Main','IT','Full Time','2006-01-30','No','No','Yes',86200,3),
(253,'Michael','Paul','West','Quality Assurance','Full Time','2006-02-09','No','No','Yes',31910,5),
(254,'John','Manning','West','Manufacturing','Contract','2006-04-02','No','No','No',71830,3),
(255,'Duane','Dominguez','North','Manufacturing','Contract','2006-05-04','No','No','No',37980,4),
(256,'Angela','Flores','Watson','Manufacturing','Full Time','2006-05-04','Yes','Yes','No',70760,1),
(257,'Gary','McClure','North','Quality Control','Full Time','2006-05-11','Yes','Yes','No',48280,4),
(258,'Frederick','Lewis','West','Quality Control','Full Time','2006-05-30','No','No','Yes',81340,2),
(259,'George','Horn','Watson','Account Management','Half-Time','2007-06-10','No','No','Yes',10630,3),
(260,'Richard','Dixon','West','Manufacturing','Full Time','2007-06-20','Yes','No','No',68710,4),
(261,'Rita','Norman','North','Sales','Contract','2007-06-21','No','No','No',54190,4),
(262,'Bruce','Norton','Main','Environmental Health/Safety','Full Time','2007-06-23','No','No','Yes',22920,3),
(263,'Karen','Logan','Main','Manufacturing','Contract','2007-06-25','No','No','No',42150,5),
(264,'Denise','Knight','West','Human Resources','Contract','2007-06-25','No','No','No',25120,2),
(265,'Colleen','Rogers','West','Quality Assurance','Full Time','2007-06-25','Yes','No','No',62965,1),
(266,'Michelle','McKenzie','Main','Environmental Compliance','Full Time','2007-07-03','No','No','Yes',49360,2),
(267,'Erik','Pratt','North','Training','Full Time','2007-07-08','Yes','Yes','Yes',60830,2),
(268,'Benning','Nunez','North','Product Development','Full Time','2007-07-10','Yes','Yes','Yes',22410,4),
(269,'William','Hensley','North','Quality Control','Half-Time','2007-07-10','Yes','Yes','No',37660,4),
(270,'Gregory','Hardin','North','Green Building','Contract','2007-07-12','No','No','No',78860,2),
(271,'Terry','Garner','Watson','Creative','Full Time','2007-07-31','Yes','Yes','Yes',80120,4),
(272,'Janine','Sharp','West','Manufacturing','Hourly','2007-08-03','No','No','No',22472,1),
(273,'Roger','Blankenship','North','Quality Assurance','Full Time','2007-08-10','Yes','Yes','Yes',78710,4),
(274,'Nobuko','Shaffer','North','Product Development','Full Time','2007-08-14','No','No','Yes',37750,5),
(275,'Shannon','Gilbert','Watson','Account Management','Full Time','2007-08-16','Yes','Yes','No',62688,3),
(276,'Randy','Pruitt','Main','Facilities/Engineering','Contract','2007-08-18','No','No','No',74740,5),
(277,'William','Clark','North','Quality Assurance','Contract','2007-08-19','No','No','No',85930,2),
(278,'John','Boyer','West','Manufacturing','Full Time','2007-08-24','No','No','Yes',73144,5),
(279,'Deborah','Kim','Watson','Environmental Health/Safety','Full Time','2007-08-27','No','Yes','No',26510,1),
(280,'Lee','Nicholson','West','Facilities/Engineering','Half-Time','2007-08-30','No','Yes','No',48415,4),
(281,'Bonnie','Stephens','Watson','Marketing','Contract','2007-08-31','No','No','No',53870,2),
(282,'Faye','Kramer','West','Quality Control','Half-Time','2007-08-31','Yes','Yes','No',13690,5),
(283,'Thomas','Allen','Main','Manufacturing','Full Time','2007-09-02','Yes','Yes','Yes',79730,2),
(284,'John','Fowler','North','IT','Full Time','2007-09-02','Yes','Yes','Yes',47060,4),
(285,'Brian','Harris','West','Manufacturing','Full Time','2007-09-04','Yes','Yes','No',76584,1),
(286,'Marie','Fernandez','North','Manufacturing','Full Time','2007-09-08','No','No','Yes',32390,2),
(287,'Dennis','Freeman','North','Account Management','Full Time','2007-09-10','Yes','Yes','Yes',63270,1),
(288,'Mark','Houston','South','Manufacturing','Full Time','2007-09-11','No','Yes','No',44920,1),
(289,'Carol','McGee','North','Manufacturing','Full Time','2007-09-16','No','No','Yes',65720,1),
(290,'Robert','French','West','Account Management','Contract','2007-09-23','No','No','No',49530,4),
(291,'Scott','Hobbs','North','Manufacturing','Full Time','2007-09-27','Yes','No','No',29420,5),
(292,'Larry','Reed','North','Marketing','Full Time','2007-09-29','Yes','Yes','Yes',81640,4),
(293,'Irv','Fleming','West','Environmental Compliance','Half-Time','2007-10-16','Yes','Yes','Yes',11025,1),
(294,'John','Wall','Main','Human Resources','Contract','2007-10-19','No','No','No',44820,4),
(295,'Angus','Kent','North','Facilities/Engineering','Contract','2007-10-21','No','No','No',84200,2),
(296,'LaReina','Marks','North','Quality Assurance','Full Time','2007-10-21','No','No','Yes',37770,5),
(297,'James','Sandoval','North','Quality Control','Hourly','2007-10-28','No','No','No',28768,3),
(298,'Paul','House','South','Manufacturing','Contract','2007-11-08','No','No','No',59330,4),
(299,'Bill','Osborne','Main','Manufacturing','Full Time','2007-11-10','Yes','Yes','Yes',60280,1),
(300,'Troy','Sanders','Taft','Manufacturing','Full Time','2007-11-12','No','No','Yes',61150,2),
(301,'Leigh','Newton','Main','Product Development','Full Time','2007-11-26','No','No','Yes',56870,1),
(302,'Alexandra','Vega','North','Quality Assurance','Full Time','2007-12-06','Yes','Yes','Yes',73560,3),
(303,'Cynthia','Harper','North','Account Management','Full Time','2007-12-07','No','No','Yes',34060,2),
(304,'Anthony','Elliott','Taft','Manufacturing','Contract','2007-12-16','No','No','No',80330,4),
(305,'David','Ware','North','Quality Control','Full Time','2007-12-18','No','No','Yes',41380,2),
(306,'Brian','Hess','North','IT','Full Time','2007-12-20','Yes','Yes','No',27560,2),
(307,'Keith','Wolfe','West','Facilities/Engineering','Full Time','2008-01-27','Yes','Yes','Yes',40920,4),
(308,'Timothy','Park','North','Creative','Hourly','2008-02-02','No','No','No',12676,2),
(309,'Dennis','Nguyen','Main','Environmental Compliance','Hourly','2008-02-03','No','No','No',20028,4),
(310,'Sheila','Simon','North','Marketing','Contract','2008-02-11','No','No','No',63850,2),
(311,'Lynn','James','West','Facilities/Engineering','Contract','2008-02-12','No','No','No',83070,3),
(312,'John','Ferguson','Main','Quality Assurance','Half-Time','2008-02-17','No','No','Yes',42740,2),
(313,'Ellen','Fox','North','Account Management','Full Time','2008-02-22','Yes','Yes','No',24340,4),
(314,'Cindy','Sloan','Main','Manufacturing','Full Time','2008-02-24','Yes','Yes','Yes',60100,1),
(315,'Sheri','Castillo','Taft','Account Management','Contract','2008-02-28','No','No','No',36230,2),
(316,'Phillip','Washington','North','Manufacturing','Full Time','2008-03-03','Yes','Yes','No',66430,2),
(317,'Diana','Price','West','Manufacturing','Full Time','2008-03-14','Yes','Yes','No',70020,3),
(318,'Bruce','Torres','South','Quality Assurance','Full Time','2008-03-15','No','No','Yes',32120,1),
(319,'Michael','Burke','Taft','Sales','Contract','2008-03-24','No','No','No',86470,4),
(320,'Leonard','Figueroa','Main','Creative','Contract','2008-04-06','No','No','No',76020,1),
(321,'Liesl','Phillips','South','Training','Full Time','2008-04-11','No','No','Yes',85300,2),
(322,'Jackie','Roberts','West','Manufacturing Admin','Full Time','2008-04-20','Yes','No','No',71400,4),
(323,'Judith','Booker','West','Facilities/Engineering','Contract','2008-04-22','No','No','No',62150,4),
(324,'Elizabeth','Reid','Main','Account Management','Full Time','2008-04-29','No','No','Yes',65880,5),
(325,'William','Sellers','Main','Marketing','Contract','2008-05-15','No','No','No',77930,5),
(326,'Richard','Hart','Watson','Quality Control','Full Time','2008-05-15','Yes','Yes','Yes',86320,4),
(327,'Steven','Todd','Watson','Training','Full Time','2008-05-21','No','Yes','No',37670,3),
(328,'Martin','Ballard','South','IT','Full Time','2008-06-06','Yes','Yes','Yes',87030,3),
(329,'Norman','Schultz','West','Manufacturing','Hourly','2008-06-08','No','No','No',14416,4),
(330,'Jessica','George','North','Quality Control','Contract','2008-06-08','No','No','No',70150,2),
(331,'Daniel','Rodgers','Main','Quality Control','Contract','2008-06-11','No','No','No',63290,5),
(332,'Kathleen','Giles','South','Quality Control','Full Time','2008-06-12','No','No','Yes',46410,2),
(333,'Karen','Pierce','Main','Manufacturing','Contract','2008-06-13','No','No','No',73990,3),
(334,'Meegan','Wheeler','West','Facilities/Engineering','Contract','2008-06-15','No','No','No',83020,4),
(335,'Richard','Brooks','West','Marketing','Half-Time','2008-06-19','No','No','Yes',47705,5),
(336,'Athanasios','Small','Main','Manufacturing','Full Time','2008-06-27','No','No','Yes',45500,3),
(337,'Nancy','Kelley','Main','Quality Control','Contract','2008-06-27','No','No','No',64263,3),
(338,'Preston','McCoy','North','Creative','Half-Time','2008-06-28','Yes','No','No',18655,4),
(339,'Regina','Gutierrez','Main','Account Management','Contract','2008-06-30','No','No','No',33120,2),
(340,'Ewan','Olsen','North','Research/Development','Contract','2008-07-07','No','No','No',60760,2),
(341,'David','Singleton','North','Quality Control','Half-Time','2008-07-09','Yes','Yes','Yes',20075,1),
(342,'Allen','Hancock','North','IT','Full Time','2008-07-11','Yes','Yes','Yes',88850,3),
(343,'Marcia','Mathews','Watson','IT','Full Time','2008-07-14','No','Yes','No',77840,2),
(344,'Lisa','Strong','West','Quality Assurance','Full Time','2008-07-14','Yes','Yes','Yes',54270,3),
(345,'Jeffrey','Charles','Taft','Quality Assurance','Full Time','2008-07-25','No','No','Yes',45110,2),
(346,'Robert','Acosta','Main','Quality Assurance','Full Time','2008-07-28','Yes','Yes','Yes',39000,5),
(347,'Nathan','Robertson','North','Product Development','Half-Time','2008-07-29','No','Yes','No',15005,4),
(348,'Suzanne','Mason','Main','Quality Assurance','Full Time','2008-08-01','No','No','Yes',66824,2),
(349,'Svetlana','Hardy','West','Product Development','Contract','2008-08-04','No','No','No',45040,5),
(350,'Jacklyn','Berry','Taft','Manufacturing','Contract','2008-08-04','No','No','No',64430,4),
(351,'Jonathan','Dawson','West','ADC','Contract','2008-08-07','No','No','No',42540,5),
(352,'Linda','Landry','North','Environmental Health/Safety','Full Time','2008-08-07','No','No','Yes',43680,5),
(353,'Douglas','Gill','North','Marketing','Full Time','2008-08-07','No','Yes','No',45180,5),
(354,'Javier','Tyler','West','Quality Assurance','Full Time','2008-08-13','No','No','Yes',43600,5),
(355,'Tim','Woodward','Main','Product Development','Contract','2008-08-14','No','No','No',26360,4),
(356,'Jeremy','McIntosh','Main','Quality Control','Half-Time','2008-08-15','No','Yes','No',27710,3),
(357,'Jeanne','Hull','West','Marketing','Full Time','2008-08-17','No','No','Yes',47610,4),
(358,'William','Oneal','West','Manufacturing','Contract','2008-08-26','No','No','No',79220,4),
(359,'Danielle','Koch','Watson','Marketing','Contract','2008-08-27','No','No','No',29000,5),
(360,'Diane','Rice','Taft','Manufacturing','Full Time','2008-08-28','Yes','Yes','Yes',24300,3),
(361,'Aria','Newman','South','Quality Control','Full Time','2008-08-31','No','Yes','No',25690,2),
(362,'Polly','Ayala','Main','Account Management','Full Time','2008-09-03','Yes','Yes','Yes',23320,4),
(363,'Douglas','Rivers','West','Account Management','Half-Time','2008-09-05','No','No','Yes',10700,4),
(364,'Yvonne','Randall','North','Marketing','Full Time','2008-09-09','No','Yes','No',86540,4),
(365,'Marilyn','Callahan','South','Manufacturing','Full Time','2008-09-10','No','No','Yes',23330,4),
(366,'Bennet','Schroeder','North','Quality Assurance','Full Time','2008-09-12','Yes','Yes','No',82700,3),
(367,'Boyd','Spencer','Main','Training','Contract','2008-09-18','No','No','No',66580,5),
(368,'Kevin','Merritt','North','Manufacturing','Contract','2008-09-18','No','No','No',63850,2),
(369,'Warren','Medina','North','Human Resources','Full Time','2008-09-26','Yes','Yes','Yes',63190,1),
(370,'Kenneth','Vazquez','North','Product Development','Full Time','2008-09-28','Yes','Yes','Yes',31840,1),
(371,'Jeffrey','Grimes','North','Quality Control','Hourly','2008-10-07','No','No','No',26944,4),
(372,'Kathleen','Flowers','Main','Facilities/Engineering','Full Time','2008-10-14','Yes','Yes','Yes',31910,5),
(373,'Annie','Shepherd','Watson','Account Management','Full Time','2008-10-16','Yes','Yes','Yes',73830,2),
(374,'Jason','Skinner','Main','IT','Full Time','2008-10-23','No','No','Yes',73030,5),
(375,'Melissa','Mills','North','Quality Control','Contract','2008-11-07','No','No','No',75550,3),
(376,'Michael','Stevenson','South','Quality Control','Contract','2008-11-16','No','No','No',78590,1),
(377,'Melyssa','Ellison','North','Quality Control','Half-Time','2008-11-21','Yes','No','No',11230,4),
(378,'David','Fischer','North','Marketing','Full Time','2008-11-26','Yes','No','No',66920,2),
(379,'Rick','Combs','Main','Manufacturing','Contract','2008-11-30','No','No','No',45770,5),
(380,'Lon','Cain','North','Account Management','Full Time','2008-11-30','Yes','No','No',63440,3),
(381,'Catherine','Hampton','Main','Manufacturing','Full Time','2008-12-02','No','No','Yes',81980,2),
(382,'Harold','Summers','North','Manufacturing','Full Time','2008-12-02','Yes','Yes','No',63070,1),
(383,'Sandra','Hubbard','Main','Quality Control','Half-Time','2008-12-05','Yes','Yes','Yes',49545,2),
(384,'Thomas','Blake','South','Quality Control','Contract','2008-12-10','No','No','No',35240,3),
(385,'George','Duncan','North','Quality Assurance','Full Time','2008-12-11','Yes','Yes','Yes',54200,4),
(386,'Brent','Rich','West','Product Development','Contract','2008-12-12','No','No','No',64090,2),
(387,'Jessica','Miller','West','Manufacturing','Half-Time','2008-12-14','Yes','Yes','No',18895,4),
(388,'Michelle','McKee','South','Manufacturing','Hourly','2008-12-16','No','No','No',30416,1),
(389,'Gay','Schneider','Main','Facilities/Engineering','Half-Time','2008-12-17','Yes','Yes','Yes',26890,3),
(390,'Erin','Lawson','Main','Account Management','Full Time','2008-12-20','No','Yes','No',69420,2),
(391,'Charles','Lowery','Main','Marketing','Contract','2008-12-21','No','No','No',74470,3),
(392,'Andrea','Cochran','North','Quality Control','Full Time','2008-12-21','Yes','Yes','Yes',24980,3),
(393,'Richelle','Morris','Main','IT','Full Time','2008-12-22','Yes','Yes','Yes',25830,5),
(394,'Charles','Robles','North','Marketing','Full Time','2008-12-28','No','No','Yes',65250,2),
(395,'Kevin','Bruce','Main','Quality Assurance','Hourly','2008-12-31','No','No','No',26484,5),
(396,'Ted','Wise','North','Product Development','Contract','2009-01-02','No','No','No',40560,5),
(397,'Diane','Gordon','South','Account Management','Contract','2009-01-05','No','No','No',76870,5),
(398,'Laura','Guerrero','Taft','IT','Half-Time','2009-01-06','Yes','No','No',47760,3),
(399,'Holly','Kemp','Watson','Manufacturing','Full Time','2009-01-19','Yes','Yes','No',71030,3),
(400,'Lynne','Wagner','Main','Product Development','Full Time','2009-02-02','Yes','Yes','Yes',72900,3),
(401,'Rena','Bush','South','Marketing','Contract','2009-02-06','No','No','No',81930,5),
(402,'William','Austin','Main','Account Management','Full Time','2009-02-11','Yes','Yes','Yes',62688,2),
(403,'Cynthia','Ortiz','West','Quality Control','Half-Time','2009-02-19','Yes','No','No',23000,4),
(404,'Kyle','Drake','South','Manufacturing','Full Time','2009-02-24','Yes','Yes','Yes',46220,2),
(405,'Max','Mendez','North','Manufacturing','Full Time','2009-03-02','No','No','Yes',67050,4),
(406,'Kevin','Shannon','North','Account Management','Full Time','2009-03-10','Yes','Yes','No',42020,5),
(407,'Lisa','Hunter','West','Account Management','Full Time','2009-03-20','Yes','Yes','Yes',50570,4),
(408,'David','Bell','South','Manufacturing','Contract','2009-03-26','No','No','No',35460,3),
(409,'Laura','Farrell','Watson','Facilities/Engineering','Full Time','2009-03-27','Yes','Yes','Yes',67890,5),
(410,'Kevin','Wade','South','Green Building','Full Time','2009-04-05','Yes','Yes','Yes',71120,4),
(411,'Mark','Nash','Main','Manufacturing','Full Time','2009-04-07','No','Yes','No',71490,5),
(412,'Marcus','Woods','Main','Quality Assurance','Full Time','2009-04-15','No','Yes','No',48490,2),
(413,'Jon','Salinas','North','Quality Control','Full Time','2009-04-16','No','No','Yes',87220,1),
(414,'Christian','Watson','West','Manufacturing','Full Time','2009-04-20','Yes','Yes','No',38940,2),
(415,'Rodney','Luna','North','IT','Full Time','2009-04-21','No','Yes','No',50990,4),
(416,'Roque','Coleman','North','Manufacturing','Full Time','2009-04-24','No','No','Yes',73072,5),
(417,'Benjamin','Walton','North','Environmental Compliance','Full Time','2009-05-01','Yes','Yes','Yes',73440,1),
(418,'John','Bond','North','Environmental Compliance','Half-Time','2009-05-04','No','Yes','No',46095,3),
(419,'Craig','Hodge','Watson','Quality Assurance','Hourly','2009-05-04','No','No','No',23692,4),
(420,'Barbara','Sweeney','North','Quality Control','Full Time','2009-05-22','No','Yes','No',64780,5),
(421,'Anthony','Henderson','South','Quality Control','Full Time','2009-05-28','Yes','Yes','No',68860,2),
(422,'Carlos','Wells','North','Account Management','Full Time','2009-06-02','Yes','Yes','Yes',44650,1),
(423,'Larry','Weber','Watson','ADC','Full Time','2009-06-03','No','Yes','No',72830,2),
(424,'Mary Jo','Johnson','South','Quality Assurance','Full Time','2009-06-04','No','No','Yes',83710,3),
(425,'Stephanie','Cox','Watson','Manufacturing','Full Time','2009-06-11','No','No','Yes',59420,4),
(426,'Juan','Bishop','North','Marketing','Half-Time','2009-06-13','Yes','Yes','Yes',31255,5),
(427,'Blane','Foster','Main','Quality Assurance','Hourly','2009-06-14','No','No','No',36788,4),
(428,'Mark','Conley','South','Manufacturing','Full Time','2009-06-28','Yes','Yes','Yes',41060,3),
(429,'Guy','Vincent','North','Manufacturing','Full Time','2009-06-28','Yes','Yes','Yes',87760,1),
(430,'Jack','Cortez','Main','Green Building','Full Time','2009-07-18','Yes','Yes','Yes',36630,4),
(431,'Chad','Tran','Main','Major Mfg Projects','Half-Time','2009-08-10','No','Yes','No',89780,4),
(432,'Chris','Frazier','Main','Manufacturing','Full Time','2009-08-13','No','No','Yes',24710,2),
(433,'Gary','Watkins','Watson','Account Management','Full Time','2009-08-14','Yes','No','No',61330,2),
(434,'Matt','Stephenson','West','Human Resources','Contract','2009-08-17','No','No','No',71700,2),
(435,'Therese','Pacheco','Main','Green Building','Contract','2009-08-24','No','No','No',35620,4),
(436,'Monica','Hicks','South','Quality Control','Contract','2009-08-29','No','No','No',32880,3),
(437,'Julian','Zimmerman','South','Quality Control','Half-Time','2009-08-30','Yes','No','No',49080,5),
(438,'Kathryn','Blackburn','West','Manufacturing','Contract','2009-09-02','No','No','No',62780,4),
(439,'Justin','McConnell','Main','Manufacturing','Contract','2009-09-03','No','No','No',63310,3),
(440,'Margarita','Roy','Main','Quality Control','Full Time','2009-09-03','No','No','Yes',73850,2),
(441,'Kim','Perez','Main','Manufacturing','Contract','2009-09-09','No','No','No',84170,2),
(442,'Carolyn','Whitehead','North','Facilities/Engineering','Full Time','2009-10-22','Yes','Yes','No',74670,5),
(443,'Ann','Valdez','Taft','Marketing','Contract','2009-10-26','No','No','No',57520,3),
(444,'Pat','Shaw','Main','Account Management','Contract','2009-10-26','No','No','No',56650,1),
(445,'Christine','Golden','Taft','Manufacturing','Full Time','2009-10-31','Yes','Yes','Yes',81010,4),
(446,'Chris','Garrett','West','Quality Control','Full Time','2009-11-05','Yes','Yes','Yes',79380,5),
(447,'Ryan','Ryan','North','Manufacturing','Contract','2009-11-06','No','No','No',40940,2),
(448,'Eric','Floyd','Taft','IT','Contract','2009-11-19','No','No','No',66710,2),
(449,'Robert','Daniel','North','Human Resources','Contract','2009-11-26','No','No','No',60060,2),
(450,'Michael','Collins','West','Manufacturing','Contract','2009-12-06','No','No','No',39680,1),
(451,'Sheryl','Bradshaw','North','Research/Development','Contract','2009-12-12','No','No','No',64720,5),
(452,'Daniel','Malone','North','Environmental Health/Safety','Full Time','2009-12-19','No','No','Yes',69060,1),
(453,'Dennis','Buchanan','North','Quality Control','Contract','2009-12-21','No','No','No',45105,1),
(454,'Michael','Noble','South','Product Development','Full Time','2009-12-27','Yes','No','No',32360,4),
(455,'Michael','Barron','West','Manufacturing','Full Time','2009-12-28','Yes','No','No',34480,3),
(456,'Steven','McClain','West','IT','Full Time','2009-12-30','Yes','No','No',80880,1),
(457,'Robert','Simmons','North','Facilities/Engineering','Half-Time','2010-01-04','Yes','No','No',38920,4),
(458,'Williams','Ward','Main','Account Management','Full Time','2010-01-15','Yes','Yes','Yes',48080,2),
(459,'Rebecca','Murray','Watson','IT','Full Time','2010-01-20','No','No','Yes',80090,2),
(460,'Timothy','Rivera','South','Quality Control','Full Time','2010-01-21','Yes','Yes','Yes',22820,5),
(461,'Brenda','Barnett','North','Human Resources','Full Time','2010-01-25','Yes','Yes','Yes',47350,5),
(462,'David','Dodson','North','Professional Training Group','Half-Time','2010-01-29','No','Yes','No',24815,1),
(463,'Denise','Rodriquez','Main','Professional Training Group','Full Time','2010-01-30','Yes','Yes','Yes',32600,5),
(464,'Francisco','Oliver','Main','Product Development','Full Time','2010-02-03','No','Yes','No',35360,5),
(465,'David','Bradley','Main','Manufacturing','Full Time','2010-02-07','Yes','Yes','Yes',69320,3),
(466,'Richard','Richards','Taft','Manufacturing','Half-Time','2010-02-08','Yes','Yes','No',15260,2),
(467,'Derrell','Espinoza','North','Account Management','Full Time','2010-02-14','No','Yes','No',46110,4),
(468,'Cam','Burton','West','Training','Full Time','2010-02-15','Yes','No','No',58290,5),
(469,'Janet','Gibson','North','Quality Control','Contract','2010-03-02','No','No','No',23340,4),
(470,'Brady','Branch','North','Quality Assurance','Contract','2010-03-03','No','No','No',43320,5),
(471,'Mark','Gray','Taft','Quality Control','Full Time','2010-03-05','Yes','Yes','Yes',44530,2),
(472,'Eric','Stanley','South','Account Management','Half-Time','2010-03-11','Yes','Yes','Yes',45565,1),
(473,'Cynthia','Marsh','North','Quality Control','Full Time','2010-03-11','Yes','Yes','Yes',82370,5),
(474,'Terry','Martin','West','Quality Control','Contract','2010-03-11','No','No','No',86040,5),
(475,'Jennifer','Orr','Taft','IT','Half-Time','2010-03-14','Yes','Yes','Yes',13435,1),
(476,'Marc','Cross','North','Professional Training Group','Hourly','2010-03-16','No','No','No',33232,4),
(477,'Curtis','Watts','West','Professional Training Group','Half-Time','2010-03-18','Yes','Yes','No',39620,5),
(478,'Brian','Walls','West','Account Management','Contract','2010-03-25','No','No','No',23020,4),
(479,'Don','Sims','West','Quality Control','Hourly','2010-03-25','No','No','No',37344,2),
(480,'Lisa','Cooper','North','Quality Assurance','Full Time','2010-03-28','No','No','Yes',29330,5),
(481,'Jonathan','Harrison','Watson','Manufacturing','Hourly','2010-03-30','No','No','No',10572,4),
(482,'Robert','Maldonado','Watson','Professional Training Group','Full Time','2010-04-06','No','No','Yes',43110,2),
(483,'Randy','Nixon','North','Creative','Hourly','2010-04-10','No','No','No',14712,5),
(484,'Karen','Richard','North','Manufacturing','Full Time','2010-04-12','Yes','Yes','Yes',61060,5),
(485,'Mary','Estes','North','Professional Training Group','Full Time','2010-04-13','Yes','Yes','Yes',40940,3),
(486,'Steven','York','North','Facilities/Engineering','Contract','2010-04-17','No','No','No',46670,3),
(487,'Jose','Cummings','Main','Product Development','Half-Time','2010-04-20','Yes','Yes','Yes',39515,5),
(488,'Alan','Craig','Main','Quality Control','Contract','2010-04-20','No','No','No',63610,5),
(489,'Chris','Holloway','North','Account Management','Contract','2010-04-24','No','No','No',85980,2),
(490,'Karen','Guerra','South','IT','Contract','2010-05-05','No','No','No',54000,3),
(491,'Robert','Klein','Main','Quality Control','Full Time','2010-05-06','Yes','Yes','Yes',69510,5),
(492,'Stephanie','Camacho','Watson','Manufacturing','Contract','2010-05-07','No','No','No',80690,3),
(493,'Robert','Holt','North','Quality Assurance','Full Time','2010-05-19','Yes','Yes','Yes',53900,5),
(494,'John','Thompson','Watson','Facilities/Engineering','Half-Time','2010-05-24','Yes','No','No',22535,3),
(495,'Anthony','Gardner','Main','Facilities/Engineering','Contract','2010-05-25','No','No','No',42940,1),
(496,'Stephen','Villarreal','South','Account Management','Full Time','2010-05-29','Yes','Yes','No',88820,2),
(497,'John','Glass','Main','Account Management','Contract','2010-05-31','No','No','No',58650,4),
(498,'Chris','Moreno','West','Quality Assurance','Full Time','2010-06-06','No','No','Yes',72060,2),
(499,'Mark','Conner','West','Manufacturing','Contract','2010-06-13','No','No','No',60040,5),
(500,'Charles','Rojas','West','Manufacturing','Contract','2010-06-21','No','No','No',78520,4),
(501,'Debra','Henson','North','Account Management','Full Time','2010-07-25','Yes','Yes','Yes',64320,5),
(502,'Jody','Lambert','West','Marketing','Half-Time','2010-08-01','No','Yes','No',38575,2),
(503,'Deon','Hale','Main','Product Development','Hourly','2010-08-23','No','No','No',15744,3),
(504,'Melissa','Christian','West','Account Management','Full Time','2010-08-29','Yes','Yes','Yes',24790,3),
(505,'Cheryl','Vance','South','Facilities/Engineering','Contract','2010-09-21','No','No','No',25790,3),
(506,'Mihaela','Kerr','North','Green Building','Full Time','2010-09-22','Yes','Yes','Yes',76440,3),
(507,'Patricia','Morgan','North','Facilities/Engineering','Contract','2010-10-28','No','No','No',79460,5),
(508,'Timothy','Petersen','South','Manufacturing','Full Time','2010-11-10','Yes','Yes','Yes',78170,5),
(509,'Claudia','Wilkerson','Main','Quality Control','Full Time','2010-12-26','No','No','Yes',34990,3),
(510,'Jerry','Townsend','Taft','Product Development','Contract','2011-01-31','No','No','No',56920,4),
(511,'Kevin','Hughes','South','Quality Assurance','Full Time','2011-02-24','No','No','Yes',23190,5),
(512,'Chad','Johns','Watson','Marketing','Full Time','2011-03-01','No','No','Yes',44150,4),
(513,'Rachel','Porter','Main','Facilities/Engineering','Full Time','2011-03-03','Yes','Yes','Yes',41490,5),
(514,'Sperry','Blair','West','Environmental Compliance','Full Time','2011-03-24','Yes','Yes','No',51180,3),
(515,'Johnson','Gallagher','West','Training','Hourly','2011-04-13','No','No','No',10636,4),
(516,'Scott','Jenkins','Main','Account Management','Full Time','2011-04-24','Yes','Yes','Yes',54190,4),
(517,'Gabriel','Chang','Main','Environmental Compliance','Half-Time','2011-05-09','No','No','Yes',28680,1),
(518,'c','c','Main','Account Management','Half-Time','2011-05-23','Yes','No','No',25245,5),
(519,'Brenda','Rhodes','Watson','Manufacturing','Full Time','2011-06-01','No','Yes','No',34690,2),
(520,'Dac Vinh','Calhoun','North','Product Development','Half-Time','2011-06-10','Yes','No','No',21220,3),
(521,'David','Adams','Main','Product Development','Full Time','2011-06-24','Yes','No','No',49260,3),
(522,'Denise','Cunningham','Main','Facilities/Engineering','Full Time','2011-06-26','No','Yes','No',77350,5),
(523,'Keith','McCall','North','Manufacturing','Full Time','2011-06-29','Yes','Yes','Yes',35600,5),
(524,'Jeffrey','West','West','Account Management','Full Time','2011-07-04','Yes','Yes','No',61148,2),
(525,'Lisa','Howard','Main','Marketing','Full Time','2011-07-05','No','No','Yes',45260,4),
(526,'Michelle','Griffith','South','Facilities/Engineering','Contract','2011-07-29','No','No','No',64390,2),
(527,'Cole','Arnold','North','Sales','Full Time','2011-07-31','No','No','Yes',22860,5),
(528,'Ricky','Erickson','North','Quality Control','Contract','2011-07-31','No','No','No',80729,3),
(529,'Robert','Shields','Main','Product Development','Contract','2011-08-01','No','No','No',45830,4),
(530,'Corey','Saunders','South','IT','Full Time','2011-08-11','No','No','Yes',63080,5),
(531,'Keith','Ramirez','North','Quality Control','Full Time','2011-08-15','No','No','Yes',33590,5),
(532,'Jonathan','Stokes','North','Green Building','Contract','2011-08-18','No','No','No',59350,5),
(533,'Todd','Scott','Taft','Account Management','Half-Time','2011-08-19','No','No','Yes',48700,3),
(534,'Anne','Gates','Watson','Product Development','Contract','2011-08-24','No','No','No',45710,3),
(535,'Nicole','Cobb','North','Account Management','Contract','2011-08-24','No','No','No',73190,1),
(536,'ReAnnon','Ray','West','Creative','Contract','2011-08-28','No','No','No',35260,2),
(537,'Eric','Boone','Taft','Major Mfg Projects','Contract','2011-08-28','No','Yes','No',71190,4),
(538,'Tammy','Bowers','South','Sales','Half-Time','2011-08-28','Yes','Yes','Yes',49405,4),
(539,'Heidi','Barker','West','Account Management','Full Time','2011-08-29','Yes','No','No',29760,2),
(540,'Koleen','Smith','Main','Manufacturing','Full Time','2011-09-03','No','No','Yes',86260,3),
(541,'Cris','Eaton','Main','Manufacturing','Full Time','2011-09-04','No','No','Yes',35300,5),
(542,'Marisa','Weiss','West','Facilities/Engineering','Contract','2011-09-07','No','No','No',50550,2),
(543,'Vicki','Swanson','Main','Facilities/Engineering','Full Time','2011-09-08','Yes','Yes','No',38730,1),
(544,'Sally','Neal','North','Account Management','Full Time','2011-09-16','Yes','No','No',72640,3),
(545,'Gerald','Steele','West','Facilities/Engineering','Full Time','2011-09-26','Yes','Yes','Yes',23280,1),
(546,'Dennis','Hanson','Watson','Manufacturing Admin','Contract','2011-09-26','No','No','No',61890,2),
(547,'Phillip','Edwards','Watson','Account Management','Half-Time','2011-09-27','Yes','Yes','Yes',11810,1),
(548,'Joanna','Herring','North','Manufacturing','Contract','2011-10-02','No','No','No',24410,3),
(549,'Patrick','Curtis','North','Product Development','Half-Time','2011-10-03','Yes','No','No',32835,2),
(550,'Donna','Shelton','Main','Manufacturing','Full Time','2011-10-05','No','No','Yes',44270,2),
(551,'Juli','Powell','North','Manufacturing','Half-Time','2011-10-06','Yes','Yes','Yes',46285,5),
(552,'Erik','Huff','Taft','Facilities/Engineering','Full Time','2011-10-14','Yes','No','No',82120,5),
(553,'Grazyna','McBride','North','Manufacturing','Full Time','2011-10-16','Yes','Yes','Yes',73450,3),
(554,'Robin','Hill','Main','Environmental Health/Safety','Hourly','2011-10-17','No','No','No',27484,4),
(555,'John','Savage','Watson','Manufacturing Admin','Full Time','2011-10-17','No','No','Yes',27250,5),
(556,'Jaquelyn','Deleon','North','Facilities/Engineering','Full Time','2011-10-24','No','Yes','No',77580,3),
(557,'Deborah','Bean','Main','Account Management','Full Time','2011-11-05','Yes','Yes','Yes',47340,2),
(558,'Melanie','Spears','West','Marketing','Full Time','2011-11-06','No','Yes','No',70480,4),
(559,'Lynette','Livingston','Taft','Sales','Contract','2011-11-06','No','No','No',74020,2),
(560,'Mark','Cook','Watson','Quality Control','Contract','2011-11-07','No','No','No',47280,1),
(561,'Cleatis','Horton','Main','Quality Assurance','Contract','2011-11-23','No','No','No',21580,3),
(562,'Dan','Everett','Main','Marketing','Half-Time','2011-11-24','No','No','Yes',20040,3),
(563,'Donald','Brown','North','Quality Control','Hourly','2011-12-03','No','No','No',33752,3),
(564,'David','Gonzales','Main','Marketing','Full Time','2011-12-04','No','Yes','No',75780,2),
(565,'Rolin','Evans','North','Product Development','Full Time','2011-12-09','Yes','Yes','Yes',63780,5),
(566,'Matt','Ingram','West','Marketing','Full Time','2011-12-10','Yes','Yes','Yes',48800,4),
(567,'Brian','Stone','North','Facilities/Engineering','Contract','2011-12-11','No','No','No',89310,5),
(568,'Chris','Bennett','Taft','IT','Full Time','2011-12-13','Yes','Yes','Yes',66840,4),
(569,'Timothy','Short','Main','Sales','Contract','2011-12-15','No','No','No',75100,4),
(570,'David','Riley','Taft','Research/Development','Full Time','2011-12-27','Yes','Yes','Yes',46680,1),
(571,'Michael','Harvey','North','Quality Control','Full Time','2012-01-01','Yes','Yes','Yes',58370,5),
(572,'Robert','Anthony','Watson','IT','Half-Time','2012-01-05','Yes','Yes','Yes',16925,1),
(573,'Marc','Myers','South','Quality Control','Contract','2012-01-05','No','No','No',41770,5),
(574,'Carey','Blevins','Taft','Marketing','Full Time','2012-01-07','Yes','Yes','Yes',57560,4),
(575,'Joan','Estrada','Main','Product Development','Full Time','2012-01-11','No','Yes','No',32640,4),
(576,'Nathaniel','Ramsey','West','Account Management','Full Time','2012-01-11','Yes','Yes','No',72700,5),
(577,'Jon','Gregory','West','Human Resources','Full Time','2012-01-12','No','No','Yes',79150,2),
(578,'Catherine','Sawyer','West','IT','Hourly','2012-01-15','No','No','No',15056,5),
(579,'Gustavo','Wiley','Main','Account Management','Contract','2012-01-16','No','No','No',39550,5),
(580,'Jenny','Cannon','West','Account Management','Contract','2012-01-22','No','No','No',57680,4),
(581,'Sandi','Beard','Watson','Quality Control','Half-Time','2012-01-22','No','No','Yes',38105,2),
(582,'Richard','Morrow','North','Account Management','Contract','2012-01-26','No','No','No',60070,2),
(583,'Ralph','Willis','Taft','Quality Control','Full Time','2012-02-01','Yes','Yes','Yes',31690,4),
(584,'Ann','Walters','West','Account Management','Half-Time','2012-02-02','Yes','Yes','No',49355,5),
(585,'Ensley','Brock','Taft','Manufacturing','Full Time','2012-02-05','No','Yes','No',39520,5),
(586,'Dale','Delgado','North','Account Management','Full Time','2012-02-19','No','Yes','No',59150,4),
(587,'Jan','Ramos','Main','Human Resources','Full Time','2012-02-23','Yes','Yes','Yes',66740,2),
(588,'Debbi','Griffin','Main','Marketing','Full Time','2012-02-28','Yes','Yes','Yes',33970,4),
(589,'Shawn','Trujillo','North','Manufacturing','Contract','2012-03-01','No','No','No',88840,5),
(590,'Jenny','Hall','South','Quality Control','Contract','2012-03-03','No','No','No',87830,2),
(591,'Rebecca','Cline','West','IT','Full Time','2012-03-04','No','No','Yes',43410,1),
(592,'Herb','Hines','Main','IT','Hourly','2012-03-04','No','No','No',9180,3),
(593,'Brian','Lyons','Taft','Manufacturing','Half-Time','2012-03-08','Yes','Yes','Yes',46645,5),
(594,'Douglas','Ayers','Main','Manufacturing','Contract','2012-03-14','No','No','No',52940,4),
(595,'Todd','Underwood','Taft','IT','Contract','2012-03-20','No','No','No',39440,4),
(596,'Robert','Peters','Main','Manufacturing','Full Time','2012-03-21','Yes','Yes','No',45480,4),
(597,'Carl','Hatfield','Main','Quality Assurance','Full Time','2012-03-21','Yes','Yes','No',63030,1),
(598,'Marc','Reese','North','Product Development','Full Time','2012-03-22','No','No','Yes',42620,3),
(599,'Chan','Moss','Main','Manufacturing','Contract','2012-03-22','No','No','No',37840,1),
(600,'Troy','Benson','Watson','Manufacturing','Contract','2012-03-25','No','No','No',28260,5),
(601,'Rebecca','McGuire','Watson','Manufacturing','Full Time','2012-03-26','Yes','Yes','Yes',59320,4),
(602,'Michael','Ashley','North','Account Management','Full Time','2012-03-29','No','Yes','No',63206,1),
(603,'Greg','Sanchez','Main','Quality Control','Full Time','2012-03-29','Yes','Yes','Yes',27130,5),
(604,'Evangeline','Hoover','Main','Quality Assurance','Full Time','2012-04-07','No','No','Yes',66440,3),
(605,'Wendy','Patrick','Main','Manufacturing','Contract','2012-04-13','No','No','No',66010,2),
(606,'Doug','Yates','North','IT','Full Time','2012-04-13','Yes','No','No',67230,4),
(607,'Jill','Christensen','Main','Sales','Hourly','2012-04-15','No','No','No',35312,3),
(608,'Matthew','Dorsey','Main','Facilities/Engineering','Full Time','2012-04-22','No','Yes','No',77820,3),
(609,'Bruce','Cohen','Taft','Green Building','Half-Time','2012-04-26','No','No','Yes',46230,2),
(610,'Gretchen','Phelps','South','Environmental Compliance','Contract','2012-04-29','No','No','No',58130,2),
(611,'Jody','Avila','Main','Quality Assurance','Hourly','2012-05-06','No','No','No',33508,4),
(612,'Douglas','Hawkins','Main','Environmental Health/Safety','Half-Time','2012-05-07','No','No','Yes',28625,1),
(613,'Letitia','Velez','North','Quality Assurance','Full Time','2012-05-12','No','No','Yes',34330,3),
(614,'Sherri','Lester','North','Quality Control','Contract','2012-05-14','No','No','No',46570,4),
(615,'Barry','Mack','Main','IT','Full Time','2012-05-16','Yes','Yes','No',77950,4),
(616,'Thomas','Bryan','South','Sales','Full Time','2012-05-24','Yes','No','No',62180,2),
(617,'David','Webster','Watson','Quality Control','Full Time','2012-05-27','No','No','Yes',70730,1),
(618,'Melissa','Flynn','Watson','Research/Development','Hourly','2012-06-03','No','No','No',19044,1),
(619,'Barney','Baker','Taft','Creative','Contract','2012-06-10','No','No','No',80050,2),
(620,'Barry','Barton','North','Professional Training Group','Full Time','2012-06-11','Yes','Yes','Yes',71730,1),
(621,'Gary','Trevino','South','Marketing','Full Time','2012-06-12','Yes','Yes','Yes',62740,4),
(622,'Taslim','King','West','Quality Assurance','Hourly','2012-06-21','No','No','No',30468,2),
(623,'Jason','Keller','North','Quality Control','Contract','2012-06-23','No','No','No',55510,3),
(624,'Terri','Sparks','North','Quality Control','Full Time','2012-06-28','Yes','Yes','Yes',46390,5),
(625,'Andrea','Carey','North','Environmental Health/Safety','Half-Time','2012-07-02','No','No','Yes',10520,4),
(626,'Fiona','Burns','Main','Manufacturing','Hourly','2012-07-04','No','No','No',28424,4),
(627,'Michael','Adkins','North','Quality Assurance','Full Time','2012-07-04','No','No','Yes',24840,1),
(628,'Jean','Warren','Taft','Facilities/Engineering','Full Time','2012-07-05','Yes','No','No',74710,2),
(629,'Jeff','Bridges','West','Manufacturing','Full Time','2012-07-08','Yes','Yes','Yes',43820,2),
(630,'Cristin','Harrell','North','Quality Assurance','Full Time','2012-07-11','No','Yes','No',80260,3),
(631,'Dana','Lang','Main','Quality Control','Full Time','2012-07-14','Yes','Yes','Yes',24200,5),
(632,'John','Gentry','North','Professional Training Group','Full Time','2012-07-15','Yes','Yes','Yes',87950,4),
(633,'Steven','Alvarez','Taft','Quality Assurance','Contract','2012-07-17','No','No','No',89450,2),
(634,'Scott','Williams','Taft','Professional Training Group','Contract','2012-07-21','No','No','No',49070,3),
(635,'Hector','Taylor','West','ADC','Half-Time','2012-07-25','Yes','Yes','No',26795,4),
(636,'Debra','McDonald','North','Facilities/Engineering','Full Time','2012-07-26','No','Yes','No',68910,5),
(637,'Debra','Gibbs','North','Manufacturing','Full Time','2012-08-02','No','Yes','No',44260,1),
(638,'Jingwen','Leach','North','Marketing','Hourly','2012-08-09','No','No','No',36844,4),
(639,'Brian','Greer','Taft','IT','Contract','2012-08-19','No','No','No',84300,1),
(640,'Tito','Holmes','Main','Marketing','Half-Time','2012-08-23','No','Yes','No',13090,4),
(641,'Kevin','Burnett','Main','Account Management','Full Time','2012-08-23','Yes','No','No',86500,1),
(642,'John','Lamb','Main','Professional Training Group','Full Time','2012-08-24','Yes','No','No',35320,3),
(643,'Traci','Brady','Main','Manufacturing','Full Time','2012-09-02','Yes','Yes','Yes',47440,3),
(644,'Norman','Hunt','Main','Quality Control','Full Time','2012-09-05','Yes','Yes','Yes',86640,3),
(645,'Ronald','Casey','Taft','Quality Control','Contract','2012-09-06','No','No','No',42990,4),
(646,'Tamara','Norris','West','Facilities/Engineering','Full Time','2012-09-21','Yes','No','No',49810,2),
(647,'Phillip','Parsons','North','Professional Training Group','Half-Time','2012-09-22','Yes','No','No',16015,3),
(648,'Scott','Lynch','Main','Account Management','Full Time','2012-10-04','Yes','Yes','Yes',24090,4),
(649,'Sumed','Williamson','Main','Manufacturing','Contract','2012-10-18','No','No','No',57110,3),
(650,'Julie','Morrison','Main','Quality Control','Full Time','2012-10-18','Yes','Yes','Yes',23030,4),
(651,'Joseph','Schwartz','Main','Quality Control','Full Time','2012-10-18','Yes','No','No',40260,5),
(652,'Randy','Romero','Main','Major Mfg Projects','Full Time','2012-10-28','Yes','Yes','Yes',89140,1),
(653,'Carol','Dalton','West','Research Center','Contract','2012-10-30','No','No','No',85510,4),
(654,'Andrew','Hansen','North','Quality Control','Half-Time','2012-11-03','No','No','Yes',13455,2),
(655,'Linda','Morales','West','Quality Control','Contract','2012-11-13','No','No','No',34680,5),
(656,'Teri','Roman','Main','Account Management','Contract','2012-11-14','No','No','No',79380,1),
(657,'Davin','Gross','Main','Product Development','Full Time','2012-11-17','No','No','Yes',32140,2),
(658,'Theo','Hamilton','Taft','Marketing','Full Time','2012-11-19','Yes','Yes','Yes',22900,1),
(659,'Jeffrey','Ortega','South','Quality Control','Contract','2012-11-25','No','No','No',26020,5),
(660,'Robert','Patterson','Main','Research Center','Contract','2012-11-26','No','No','No',66132,4),
(661,'Brandyn','Lane','Main','Quality Assurance','Contract','2012-12-03','No','No','No',46650,2),
(662,'Mark','Jordan','North','Product Development','Contract','2012-12-06','No','No','No',22320,2),
(663,'Dean','Contreras','Main','Professional Training Group','Full Time','2012-12-22','Yes','Yes','Yes',69400,5),
(664,'Donald','Perkins','West','Creative','Full Time','2012-12-29','No','No','Yes',37620,5),
(665,'Jeff','Murphy','Taft','Quality Assurance','Full Time','2013-01-05','Yes','Yes','Yes',67920,4),
(666,'Lisa','Hodges','North','IT','Full Time','2013-01-08','No','Yes','No',61470,5),
(667,'Jim','Webb','Main','Professional Training Group','Full Time','2013-01-11','No','No','Yes',77720,3),
(668,'William','William','Main','Account Management','Full Time','2013-01-11','No','Yes','No',77740,1),
(669,'Kuyler','Goodman','North','Facilities/Engineering','Half-Time','2013-01-23','Yes','Yes','No',13800,3),
(670,'Khurrum','Brewer','Main','Training','Half-Time','2013-01-25','Yes','Yes','No',30445,1),
(671,'Donald','Holland','South','Training','Hourly','2013-02-02','Yes','Yes','Yes',29070,3),
(672,'David','Graham','North','Quality Control','Contract','2013-02-15','No','No','No',62480,5),
(673,'Sonia','Alvarado','Main','IT','Half-Time','2013-02-22','Yes','Yes','No',35045,4),
(674,'Stephen','Lopez','Main','Quality Control','Contract','2013-02-26','No','No','No',61134,4),
(675,'William','Frank','Main','Account Management','Full Time','2013-03-02','Yes','Yes','No',54500,5),
(676,'Julia','Bartlett','Watson','Professional Training Group','Full Time','2013-03-05','No','Yes','No',44560,2),
(677,'Lowell','Mann','Main','Account Management','Contract','2013-03-07','No','No','No',52750,1),
(678,'Shawn','Herrera','Main','Account Management','Full Time','2013-03-18','No','Yes','No',79400,4),
(679,'Angela','Mullins','Main','Facilities/Engineering','Full Time','2013-03-19','No','No','Yes',85920,4),
(680,'Anthony','Garza','Main','Professional Training Group','Full Time','2013-03-28','Yes','Yes','Yes',81530,5),
(681,'Justin','Monroe','Watson','Quality Assurance','Full Time','2013-04-09','No','No','Yes',63050,3),
(682,'Kelly','Wyatt','West','Environmental Compliance','Full Time','2013-04-12','Yes','Yes','No',41350,2),
(683,'Lisa','Hopkins','North','Quality Control','Contract','2013-04-23','No','No','No',57500,1),
(684,'Charles','Woodard','North','Account Management','Full Time','2013-05-04','Yes','No','No',71680,4),
(685,'Robert','Hammond','Main','Facilities/Engineering','Full Time','2013-05-06','Yes','Yes','No',61400,5),
(686,'Dennis','Wong','Main','IT','Full Time','2013-05-09','Yes','Yes','Yes',43580,5),
(687,'Matt','Ford','West','Account Management','Contract','2013-05-09','No','No','No',50840,4),
(688,'Michael','Hartman','West','Professional Training Group','Full Time','2013-05-19','No','No','Yes',44620,5),
(689,'Maria','Fisher','North','Quality Assurance','Full Time','2013-06-04','Yes','Yes','Yes',54830,1),
(690,'Lori','Knox','North','Marketing','Full Time','2013-06-06','Yes','Yes','No',87120,3),
(691,'Timothy','Allison','Main','Creative','Full Time','2013-06-13','No','Yes','No',82500,5),
(692,'Fredrick','Rios','North','Manufacturing','Full Time','2013-06-13','Yes','No','Yes',56900,5),
(693,'Susan','Maynard','South','Sales','Full Time','2013-06-17','Yes','Yes','Yes',39110,5),
(694,'Greg','Bullock','North','Facilities/Engineering','Hourly','2013-06-20','No','No','No',14568,3),
(695,'Brenda','Ellis','West','IT','Full Time','2013-06-20','No','No','Yes',43190,2),
(696,'Christopher','Castro','Main','Manufacturing','Full Time','2013-07-01','Yes','Yes','Yes',52940,4),
(697,'Greg','Reeves','West','IT','Full Time','2013-07-06','Yes','Yes','Yes',26360,1),
(698,'Adam','Frost','West','Account Management','Contract','2013-07-08','No','No','No',47590,3),
(699,'Matthew','Sutton','North','IT','Full Time','2013-07-12','Yes','Yes','Yes',79770,4),
(700,'Henrietta','Herman','Main','Manufacturing','Full Time','2013-07-18','Yes','No','No',60380,4),
(701,'George','Fitzgerald','West','Account Management','Contract','2013-07-28','No','No','No',60550,2),
(702,'Angela','Higgins','West','Account Management','Half-Time','2013-08-10','Yes','Yes','Yes',46380,3),
(703,'Dana','Pitts','Taft','Facilities/Engineering','Contract','2013-08-17','No','No','No',64460,1),
(704,'Paul','Leonard','North','Quality Control','Full Time','2013-08-20','Yes','Yes','No',46550,4),
(705,'Carrie','Dyer','North','Quality Assurance','Full Time','2013-08-24','Yes','Yes','Yes',65571,3),
(706,'Daniel','Hogan','North','Marketing','Full Time','2013-09-03','Yes','Yes','No',60560,4),
(707,'Robert','Prince','West','Marketing','Full Time','2013-09-10','Yes','Yes','Yes',37020,2),
(708,'Mark','Lara','West','Product Development','Half-Time','2013-09-17','Yes','Yes','Yes',34110,4),
(709,'Dwight','Owens','North','Quality Assurance','Full Time','2013-09-19','Yes','Yes','Yes',68470,4),
(710,'Craig','Beck','North','Environmental Compliance','Full Time','2013-09-21','Yes','Yes','Yes',46220,3),
(711,'Alexander','Greene','West','Manufacturing','Full Time','2013-09-28','No','No','Yes',58910,1),
(712,'Brenda','Fuller','Main','Manufacturing','Full Time','2013-09-29','No','No','Yes',26190,5),
(713,'Scott','McCullough','North','Sales','Full Time','2013-10-19','Yes','Yes','Yes',48550,5),
(714,'Debbie','Richardson','North','Facilities/Engineering','Full Time','2013-10-24','Yes','Yes','No',31830,3),
(715,'Christopher','Joseph','South','Manufacturing','Hourly','2013-10-29','No','No','No',22344,4),
(716,'Patricia','Buckel','Taft','Marketing','Full Time','2013-11-12','Yes','Yes','No',73930,1),
(717,'David','English','North','Manufacturing','Contract','2013-11-21','No','No','No',32190,3),
(718,'John','Hickman','West','Facilities/Engineering','Full Time','2013-12-03','Yes','Yes','Yes',71150,2),
(719,'Kes','Bowen','West','Quality Control','Contract','2013-12-06','No','No','No',59128,4),
(720,'Tonya','Davis','Main','Quality Control','Full Time','2013-12-23','Yes','Yes','No',62780,3),
(721,'Matthew','Walsh','North','IT','Contract','2013-12-28','No','No','No',32650,1),
(722,'Shannon','Mitchell','Main','Manufacturing','Contract','2014-01-05','No','No','No',49530,2),
(723,'Duane','Snyder','West','Quality Control','Contract','2014-01-06','No','No','No',70300,3),
(724,'John','Lloyd','North','Creative','Full Time','2014-01-09','No','No','Yes',82760,4),
(725,'Jesse','Wilkins','North','Training','Full Time','2014-01-17','Yes','Yes','Yes',79760,5),
(726,'Susan','Carr','South','Manufacturing Admin','Full Time','2014-01-18','Yes','Yes','Yes',39160,3),
(727,'Brian','Duran','Taft','ADC','Hourly','2014-02-01','No','No','No',35680,2),
(728,'Michael','Walter','Main','Quality Assurance','Full Time','2014-02-07','Yes','No','No',86240,1),
(729,'Dennis','Clarke','South','Product Development','Full Time','2014-02-27','Yes','Yes','Yes',64510,3),
(730,'Melanie','Olson','North','IT','Full Time','2014-03-05','Yes','No','No',75370,2),
(731,'Shaun','Peterson','Main','IT','Full Time','2014-03-08','Yes','No','No',46910,3),
(732,'Aron','Harrington','Watson','Quality Assurance','Half-Time','2014-03-17','No','No','Yes',25885,5),
(733,'Tracy','Poole','North','Facilities/Engineering','Full Time','2014-03-22','No','No','Yes',71670,4),
(734,'Kirk','Ball','North','Sales','Full Time','2014-03-31','Yes','Yes','No',87980,1),
(735,'Madelyn','Obrien','North','Quality Assurance','Contract','2014-04-10','No','No','No',55690,2),
(736,'Mark','Rose','Watson','Quality Control','Full Time','2014-04-17','No','Yes','No',32160,3),
(737,'Michelle','Lowe','Taft','Product Development','Full Time','2014-04-19','No','No','Yes',46340,5),
(738,'Karin','Terry','North','IT','Full Time','2014-04-24','Yes','Yes','No',68010,1),
(739,'Christopher','Padilla','Main','Product Development','Contract','2014-05-15','No','No','No',81070,5),
(740,'Daniel','Solis','Main','Account Management','Contract','2014-05-15','No','No','No',44720,2),
(741,'Karen','Garcia','Main','Quality Control','Full Time','2014-05-23','Yes','Yes','No',59490,3);


SELECT * FROM Employees;

SELECT max(HireDate),min(HireDate) FROM Employees;

UPDATE Employees SET HireDate=current_timestamp() WHERE EmployeeID=1;
SELECT HireDate,year(HireDate) as year, month(HireDate) as month , day(HireDate) as day , date(HireDate) as date, 
time(HireDate) as time ,hour(HireDate) as hr, minute(HireDate) as minute, second(HireDate) as sec FROM Employees WHERE employeeid=1;

SELECT * FROM employees WHERE year(HireDate) = 2010 and month(HireDate)=01;

SELECT first,last,department,date_format(hiredate,"%D %M %Y %W"),salary FROM employees WHERE  EmployeeID=460;

SELECT date_format(current_date(),"%W,%d %M, %Y");
SELECT date_format(current_date(),"%b/%d/%Y");
SELECT date_format(current_date(),"%m/%d/%Y");
SELECT date_format(current_date(),"%d-%m-%Y") ;

SELECT ADDDATE(current_date(), INTERVAL 5 DAY);
SELECT ADDDATE(current_date(), INTERVAL 365 DAY);

SELECT ADDDATE(current_timestamp(), INTERVAL 2 HOUR);

SELECT ADDDATE(current_timestamp(), INTERVAL 3 MONTH);

SELECT ADDDATE(current_timestamp(), INTERVAL -3 MONTH);

SELECT ADDDATE(current_timestamp(), INTERVAL -1 DAY);

SELECT ADDDATE(current_timestamp(), INTERVAL 1 MONTH );


SELECT ADDTIME(current_timestamp(),"3:00:00");
SELECT ADDTIME(current_timestamp(),"3:30:00");
SELECT ADDTIME(current_timestamp(),"00:30:00");

-- DATE_ADD  works same as ADDATE

SELECT DATEDIFF(current_date(), "2023-01-01");

SELECT dayofmonth(current_date());
SELECT dayofweek(current_date());
SELECT dayofyear(current_date());

SELECT timestampdiff(MONTH, '2023-02-26', '2023-11-26');
SELECT timestampdiff(DAY, '2023-02-26', '2023-11-26');
SELECT timestampdiff(YEAR, '2023-02-26', '2030-11-26');


-- --------------------------------
SELECT * FROM OFFICE;

SELECT * FROM country;
SELECT coalesce(country_name, 'NEWZELAND') FROM country;
SELECT IFNULL(country_name, 'NEWZELAND') FROM country;

SELECT * FROM Employees;

SELECT sal_category , count(sal_category) FROM (
SELECT concat(first," " ,last) as fullname, Salary,IF(Salary>50000,"HIGH PAID","LESS PAID") as sal_category FROM Employees) tbl
GROUP BY 1;

-- CASE STATEMENT

SELECT * FROM Employees;

SELECT DISTINCT status FROM Employees;

-- SYNTAX:
-- CASE
-- WHEN condition THEN ops
-- WHEN condition2 THEN ops1
-- .
-- .
-- ELSE ops
-- END as col_name

SELECT concat(first," ",last) as fullname,  salary, CASE
													WHEN salary >= 50000 THEN "HIGH PAID"
                                                    WHEN salary < 50000 THEN "less paid"
                                                    END AS "category"
FROM employees;
                             
SELECT concat(first," ",last) as fullname,  salary, CASE
													WHEN salary >= 50000 THEN "HIGH PAID"
                                                    ELSE "less"
                                                    END AS "category"
FROM employees;

SELECT * FROM employees;

1999-2005  -> Super Senior
2006-2009 -> Senior
2010 - -> Junio

SELECT 
    CONCAT_WS(' ',first,last) AS Employee, 
    YEAR(hiredate) as year_of_hire, 
    CASE 
	  WHEN YEAR(hiredate) BETWEEN 1999 AND 2005 THEN 'Super Senior' 
	  WHEN YEAR(hiredate) > 2005 && YEAR(hiredate) <= 2009 THEN 'Senior' 
      ELSE 'Junior' 
	END AS Emp_type 
FROM 
    employees;

