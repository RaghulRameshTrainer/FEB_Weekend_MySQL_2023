CREATE DATABASE training;

-- DROP DATABASE training;

use training;

-- --------------------
-- DDL   -- Data Definition Language ( CREATE, ALTER, DROP, TRUNCATE )
-- DML  -- DATA MANUPULATION LANGUAGE (INSERT, UPDATE, DELETE)
-- DCL  -- DATA CONTROL LANGUAGE ( GRANT, REVOKE)
-- TCL  -- TRANSACTION CONTROL LANGUAGE (COMMIT, ROLLBACK, SAVEPOINT)
-- DQL  -- DATA QUERY LANGUGE (SELECT)

-- JOINS
-- FUNCTIONS
-- PLSQL
-- ---------------------------------


-- OLTP -> ONLINE TRANSACTION PROCESS
-- OLAP -> ONLINE ANALYTICS PROCESS   (WORM -> Write Once Read Many)

-- RELATIONAL DATABASE SYSTEM -> MYSQL, ORACLE, MsSQL

-- NoSQL -> Mongo DB, ElasticSearch, Cassandra, Hbase

-- DataWarehouse -> RedShift, BigQuery, Snowflake

-- Datalake -> S3, GFS, Azure Blob

-- Data Lakehouse -> Databricks

-- -----------------------------------------------

CREATE TABLE customer (
custid INT,
custname VARCHAR(50),
age INT,
gender CHAR(1),
city VARCHAR(50)
);




-- Data Types
-- INT -> to store a number 1,2,3,4,5
-- CHAR -> Fixed length of string
-- VARCHAR -> variable characters
-- DATE  -> 05-02-2023 02/05/2023, 2023-02-05 10:30
-- BOOLEAN  -- True False None
-- DOUBLE  -- 30.56,1.11

-- -------------------------------------------------------------

-- LOAD DATA (INSERT)

INSERT INTO customer VALUES(1000,'Raghul Ramesh', 37, 'M', 'Chennai');
INSERT INTO CUSTOMER VALUES(1001,'Priya Rajesh',30,'F','Hyderabad');

INSERT INTO CUSTOMER(custid, custname, gender, city) VALUES(1002,'Malini','F','Bangalore');
INSERT INTO customer(city,custname,gender,custid,age) VALUES('Pune','Pankaj Kumar','M',1003,40);

INSERT INTO CUSTOMER VALUES(1004,'Mohan Kuamr',37,'M','Chennai'),(1005,'Sivanandam',50,'M','Delhi'),(1006,'Ranga',55,'M','Chennai');

INSERT INTO CUSTOMER(custid, custname,gender,city) VALUES(1007,'Raj S','M','Pandicherry');
SELECT * FROM customer;

-- =================================================================================

SELECT * FROM customer;

-- UPDATE statement

-- SAFE MODE disable
SET sql_safe_updates=0;

UPDATE customer SET age=30 WHERE custid=1002;

UPDATE customer SET age=60 WHERE custid=1007;

-- CONSTAINTS (UNIQUE, NOT NULL, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT);

UPDATE customer SET custid=2000 WHERE custid=1006;

UPDATE customer SET age=41, city='Hyderabad' WHERE custid=1003;


INSERT INTO CUSTOMER(custname, age, gender, city) VALUES('Aveek Sharma',45,'M','Hyderabad');

UPDATE customer SET custid=1008 WHERE custid IS NULL;

 -- DELETE the records
 
 DELETE FROM customer WHERE custname='Priya Rajesh';
 
 SELECT * FROM CUSTOMER;
 
 DELETE FROM customer WHERE age>=50;
 
  SELECT * FROM CUSTOMER;
  
  DELETE FROM CUSTOMER WHERE city IN ('Chennai','Bangalore');
  DELETE FROM CUSTOMER WHERE city != 'Hyderabad';
  
  -- DELETE THE RECORD IF THE CUSTOMER ARE NOT FROM EITHER CHENNAI OR HYDERABD
  
  DELETE FROM CUSTOMER WHERE CITY NOT IN ('Chennai','Hyderabad');
