use training;

-- PRIMARY KEY CONSTRAINT  (UNIQUE + NOT NULL)
CREATE TABLE pk_table(
custid INT PRIMARY KEY,     -- SIMPLE PRIMARY KEY
custname VARCHAR(100) NOT NULL,
age INT CHECK (age>20 and age<=60),
city VARCHAR(100) DEFAULT 'HYDERABAD',
mobile VARCHAR(100) UNIQUE
);

INSERT INTO pk_table  VALUES(1000,'Madhan',36,'Chennai','9876543211');
SELECT * FROM Pk_table;
INSERT INTO pk_table  VALUES(1000,'Ravi',37,'Bangalore','9876543212'); -- ERROR since custid 1000 is duplicate value
INSERT INTO pk_table  VALUES(1001,'Ravi',37,'Bangalore','9876543212');
SELECT * FROM Pk_table;
INSERT INTO pk_table(custname,age,city,mobile)  VALUES('Ganga',27,'Pune','9876543213');  -- ERROR since custid does't have a value
INSERT INTO pk_table(custid,custname,age,city,mobile)  VALUES(1002,'Ganga',27,'Pune','9876543213');  
SELECT * FROM Pk_table;
INSERT INTO pk_table(custid,custname,age,city,mobile)  VALUES(1003,'Begam',27,'Pune','+91-9876543214');  
SELECT * FROM Pk_table;


CREATE TABLE pk_table_comp(
custid INT ,     -- SIMPLE PRIMARY KEY
custname VARCHAR(100) NOT NULL,
age INT CHECK (age>20 and age<=60),
city VARCHAR(100) DEFAULT 'HYDERABAD',
mobile VARCHAR(100) UNIQUE,
primary key (custid,custname)    -- COMPOSITE PRIMAY KEY
);

INSERT INTO pk_table_comp VALUES(1000,'Raja',30,'Chennai','9898989898');
SELECT * FROM pk_table_comp;
INSERT INTO pk_table_comp VALUES(1000,'Rajesh',30,'Chennai','9898989899');
SELECT * FROM pk_table_comp;
INSERT INTO pk_table_comp VALUES(1001,'Raja',30,'Chennai','9898989890');
SELECT * FROM pk_table_comp;
INSERT INTO pk_table_comp VALUES(1001,'Raja',36,'Bangalore','9898989891');  -- ERROR since '1001-Raja' is duplicate

-- FOREIGN KEY

CREATE TABLE customers(
cust_id INT PRIMARY KEY,
custname VARCHAR(100) NOT NULL,
city VARCHAR(100) DEFAULT 'HYDERABAD'
);

INSERT INTO customers VALUES(1000,'Bala','Bangalore'),(1001,'Irfan','Hyderabad'),(1002,'Anand','Chennai');
SELECT * FROM customers;

CREATE TABLE orders (
ord_id INT primary key,
cust_id INT ,
produ_name varchar(100),
amount INT,
CONSTRAINT fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO orders VALUES(1,1000,'Mobile',50000);
SELECT * FROM orders;
INSERT INTO orders VALUES(2,1003,'Laptop',100000);  -- 1003 is not present in the cusomers table
INSERT INTO orders VALUES(2,1001,'Laptop',100000); 
SELECT * FROM orders;

SELECT * FROM customers;
DELETE FROM customers WHERE cust_id=1000;  -- Can't delete 1000 since the child table orders has 1000 in it
-- If you want to remove the customer id 1000 then first we need to remove from child table and then we can remove from parent table
DELETE FROM orders WHERE cust_id=1000;
DELETE FROM customers WHERE cust_id=1000; 

SELECT * FROM customers;

DROP TABLE orders;


CREATE TABLE orders (
ord_id INT primary key,
cust_id INT ,
produ_name varchar(100),
amount INT,
CONSTRAINT fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE CASCADE
);

INSERT INTO orders VALUES(1,1000,'Mobile',50000);
INSERT INTO orders VALUES(2,1001,'Laptop',100000); 

 SELECT * FROM orders;
 
 DELETE FROM customers WHERE cust_id=1000; 
 
 
 DROP TABLE orders;
 
 CREATE TABLE orders (
ord_id INT primary key,
cust_id INT ,
produ_name varchar(100),
amount INT,
CONSTRAINT fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON UPDATE CASCADE
);

-- ======================================auto_increment=================================
CREATE TABLE users(
user_id INT UNIQUE auto_increment,
user_name VARCHAR(100),
city VARCHAR(100)
);

INSERT INTO users(user_name, city) VALUES('Ganesh','Mumbai');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Ramya','Kolkatta');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Siva','Chennai');
SELECT * FROM users;
INSERT INTO users VALUES(100,'Raghul','Chennai');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Venkatesh','Hyderabad');
SELECT * FROM users;
INSERT INTO users VALUES(50,'Ashwin','Chennai');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Tharani','Hyderabad');
SELECT * FROM users;

-- ========================================================

-- ALTER STATEMENT
-- ADD A NEW COLUMN
-- REMOVE THE COLUMN
-- MODIFYING THE COLUMN
-- RENAMING THE COLUMN
-- RENAMING THE TABLE



SELECT * FROM CUSTOMERS;

DESC CUSTOMERS;

ALTER TABLE CUSTOMERS
ADD COLUMN country VARCHAR(100);

SELECT * FROM CUSTOMERS;

INSERT INTO CUSTOMERS VALUES(1003,'Durga','Hyderabad','India');
SELECT * FROM CUSTOMERS;

UPDATE CUSTOMERS SET country='India' WHERE country is null;
SELECT * FROM CUSTOMERS;

ALTER TABLE CUSTOMERS
ADD COLUMN profession VARCHAR(100) DEFAULT 'Software Engineer';

SELECT * FROM CUSTOMERS;

DESC customers;

-- REMOVING THE COLUMN

ALTER TABLE CUSTOMERS
DROP COLUMN country;

SELECT * FROM CUSTOMERS;

-- MODIFY THE COLUMN
DESC CUSTOMERS;

ALTER TABLE CUSTOMERS
MODIFY COLUMN city VARCHAR(20) DEFAULT 'New Delhi';

DESC CUSTOMERS;

ALTER TABLE CUSTOMERS
MODIFY custname VARCHAR(100) UNIQUE NOT NULL;

DESC CUSTOMERS;


-- Rename the column
ALTER TABLE CUSTOMERS
RENAME COLUMN city TO location;

DESC CUSTOMERS;

SELECT * FROM CUSTOMERS;


-- RENAME THE TABLE

ALTER TABLE office
RENAME TO organisation;

RENAME TABLE organisation TO office;

-- ADD PK CONSTRAIN

DESC product;

ALTER TABLE product
ADD PRIMARY KEY (prod_id);  -- ERROR SINCE THERE IS A NULL VALUE PRESENT

SELECT * FROM product;

DELETE FROM product WHERE prod_id IS NULL;

ALTER TABLE product
ADD PRIMARY KEY (prod_id);

DESC product;

ALTER TABLE product 
MODIFY COLUMN amount INT CHECK(amount>0);

DESC product;

SELECT * FROM PRODUCT;

INSERT INTO product VALUES(12,'toys',0); -- ERRPR
INSERT INTO product VALUES(12,'toys',100); 
SELECT * FROM product;

-- DELETE , TRUNCATE , DROP
-- DELETE statement can be used to delete one/many/all rows
DELETE FROM product WHERE amount IS NULL;
SELECT * FROM product;

DELETE FROM product WHERE amount<50000;
SELECT * FROM product;

DELETE FROM product;
SELECT * FROM PRODUCT;

-- TRUNCATE
-- TRUNCATE is delete all the records in a table
SELECT * FROM users;
TRUNCATE TABLE users;
SELECT * FROM users;

-- DROP
-- Drop will delete the entire data as well as the table as well
SELECT * FROM customer;
DROP TABLE customer;
SELECT * FROM customer;


--  TCL -  TRANSACTION CONTROL LANGUAGE

START TRANSACTION;
SELECT * FROM CUSTOMERS;

DELETE FROM CUSTOMERS WHERE custname IN ('Irfan','Anand');

SELECT * FROM CUSTOMERS;

COMMIT;

SELECT * FROM CUSTOMERS;

SELECT * FROM unique_table;

START TRANSACTION;
SELECT * FROM unique_table;

DELETE FROM unique_table;

SELECT * FROM unique_table;

ROLLBACK;

SELECT * FROM unique_table;

START TRANSACTION;

DELETE FROM unique_table WHERE custid IS NULL;

SELECT * FROM unique_table;

COMMIT;

START TRANSACTION;
SELECT * FROM unique_table;
TRUNCATE TABLE unique_table;
SELECT * FROM unique_table;
ROLLBACK;
SELECT * FROM unique_table;


START TRANSACTION;

SELECT * FROM OFFICE;

SAVEPOINT p1;
UPDATE OFFICE SET salary=10000 WHERE salary='';
SELECT * FROM OFFICE;

SAVEPOINT p2;
UPDATE OFFICE SET company='WIPRO' WHERE company='';
SELECT * FROM OFFICE;

SAVEPOINT p3;
DELETE FROM OFFICE WHERE Place='';
SELECT * FROM OFFICE;

SAVEPOINT p4;
DELETE FROM OFFICE WHERE AGE=0;
SELECT * FROM OFFICE;

ROLLBACK TO SAVEPOINT p4;
ROLLBACK TO SAVEPOINT p3;

COMMIT;

SELECT * FROM OFFICE;
