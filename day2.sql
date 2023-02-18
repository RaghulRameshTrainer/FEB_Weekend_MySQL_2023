CREATE DATABASE training;

use training;

CREATE TABLE product(
prod_id INT,
prod_name VARCHAR(100),
amount int
);

INSERT INTO product VALUES(1,'Mobile',30000),(2,'laptop',75000),(3,'TV',60000),(4,'Desktop',55000),(5,'Fridge',30000);

SELECT * FROM product;

SELECT * from company;

SELECT * FROM company WHERE company='Infosys';
SELECT * FROM company WHERE company='Infosys' AND place='Hyderabad';

SELECT * FROM company WHERE Place='Chennai' AND salary>5000;

SELECT * FROM company WHERE age<25;

SELECT company, age FROM company WHERE age>25;

SELECT * FROM company WHERE age < 20 AND place='Calcutta';

SELECT * FROM company WHERE age < 20 OR place='Calcutta';

-- UPDATE and DELETE statement:

SELECT * FROM company WHERE place='';

SET sql_safe_updates=0;

UPDATE company SET place='Newyork'  WHERE place='';

SELECT * FROM company WHERE place='';

SELECT * FROM company WHERE place='Newyork';

SELECT * FROM product;

UPDATE product SET prod_name='Television' , amount=100000 WHERE prod_id=3;

SELECT * FROM product;

SELECT * FROM company;

-- DELETE RECORDS

SELECT * FROM product;

SELECT * FROM product WHERE prod_name='Fridge';

DELETE FROM product  WHERE prod_name='Fridge';

SELECT * FROM product;
SELECT * FROM product WHERE prod_id>2;
DELETE FROM product WHERE prod_id>2;
SELECT * FROM product;

SELECT * FROM company WHERE salary='';
DELETE FROM company WHERE salary='';
SELECT * FROM company;


-- CONSTRAINT
-- UNIQUE  -> Allows only the unique value 
-- NOT NULL
-- CHECK
-- DEFAULT
-- PRIMARY KEY
-- FOREIGN KEY

CREATE TABLE unique_table(
custid INT UNIQUE ,
custname VARCHAR(100),
age INT,
city VARCHAR(100)
);

INSERT INTO unique_table VALUES(100,'Ramkumar',35,'Chennai');
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(101,'Balaravikumar',30,'Hyderabad');
INSERT INTO unique_table VALUES(100,'Mohan',40,'Bangalore');  -- ERROR since the custid=100 is duplication
INSERT INTO unique_table VALUES(102,'Mohan',40,'Bangalore'); 
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(103,'Mohan',40,'Bangalore'); 
SELECT * FROM unique_table;
INSERT INTO unique_table(custname,age,city) VALUES('Aveek',40,'Delhi');
INSERT INTO unique_table(custname,age,city) VALUES('Chandra',30,'Pune');



SELECT * FROM product;

INSERT INTO product vALUES(10,'House',10000000);

INSERT INTO product(prod_id, prod_name) VALUES(11,'Car');
INSERT INTO product(prod_name) VALUES('Bike');


INSERT INTO product VALUES(NULL,NULL,1000);

-- NOT NULL 
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(103,'Mohan',40,'Bangalore'); 
SELECT * FROM unique_table;
INSERT INTO unique_table(custname,age,city) VALUES('Aveek',40,'Delhi');
INSERT INTO unique_table(custname,age,city) VALUES('Chandra',30,'Pune');

CREATE TABLE notnull_table(
custid INT NOT NULL,
custname VARCHAR(100) UNIQUE,
age INT,
city VARCHAR(100)
);


INSERT INTO notnull_table VALUES(1,'Raja',25,'Hyderabad');
SELECT * FROM notnull_table;
INSERT INTO notnull_table VALUES(1,'Raja',25,'Hyderabad');  -- Custname is duplocate. ERROR
INSERT INTO notnull_table VALUES(1,'Rajesh',25,'Hyderabad');
SELECT * FROM notnull_table;
INSERT INTO notnull_table(custname,age,city) VALUES('Bala',40,'Bangalore') ; -- Error since custid is null
INSERT INTO notnull_table(custid,custname,age,city) VALUES(2,'Bala',40,'Bangalore') ;
SELECT * FROM notnull_table;

-- CHECK CONSTRAINT

CREATE TABLE check_table(
custid INT UNIQUE NOT NULL,
custname VARCHAR(100) NOT NULL,
age INT CHECK (age>0 and age<=100),
city VARCHAR(100)
);

INSERT INTO check_table VALUES(1,'Siva',30,'Chennai');
INSERT INTO check_table VALUES(1,'Venkatesh',36,'Hyderabad'); -- ERROR since it is duplicate custid
INSERT INTO check_table(custname,age,city) VALUES('Venkatesh',36,'Hyderabad');  -- ERROR since it is NULL
INSERT INTO check_table VALUES(2,'Venkatesh',36,'Hyderabad');
SELECT * FROM check_table ;
INSERT INTO check_table VALUES(3,'Ramya',-1,'Delhi');  -- ERROR since age is < 0
INSERT INTO check_table VALUES(3,'Ramya',101,'Delhi');  -- ERROR since age is > 100
INSERT INTO check_table VALUES(3,'Ramya',25,'Delhi'); 
SELECT * FROM check_table ;

-- DEFAULT CONSTRAINT
CREATE TABLE default_table(
custid INT UNIQUE NOT NULL,
custname VARCHAR(100) UNIQUE,
age INT CHECK (age>=22 AND age <=40),
city VARCHAR(100) DEFAULT 'Hyderabad'
);

INSERT INTO default_table VALUES(1,'Prakash',25,'Bangalore');
INSERT INTO default_table VALUES(2,'Priya',20,'Bangalore');  -- ERROR since age is <=22
INSERT INTO default_table VALUES(2,'Priya',50,'Bangalore');   -- ERROR since age is >= 40
INSERT INTO default_table VALUES(2,'Priya',30,'Bangalore'); 
SELECT * FROM default_table;
INSERT INTO default_table(custid, custname,age) VALUES(3,'Satya',35);
SELECT * FROM default_table;

CREATE TABLE check_table_2(
custid INT UNIQUE NOT NULL,
custname VARCHAR(100) UNIQUE,
age INT CHECK (age>=22 AND age <=40),
city VARCHAR(100) CHECK (city IN ('Chennai','Hyderabad','Bangalore'))
);

