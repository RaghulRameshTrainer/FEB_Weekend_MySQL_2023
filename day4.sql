use training;

-- JOINS
	INNER JOIN
    OUTER JOIN
		- LEFT
        - RIGHT
        - FULL
    SELF JOIN
    
    CREATE TABLE CUSTOMER_TBL(
cust_id INT,
cust_name VARCHAR(100)
);

INSERT INTO CUSTOMER_TBL VALUES(1000,'Ashwin');
INSERT INTO CUSTOMER_TBL VALUES(1001,'Malini');
INSERT INTO CUSTOMER_TBL VALUES(1002,'Tharani');
INSERT INTO CUSTOMER_TBL VALUES(1003,'Arun');
INSERT INTO CUSTOMER_TBL VALUES(1004,'Siva');

CREATE TABLE TRANSACTION_TBL(
trans_id INT,
cust_id INT,
product_name VARCHAR(100),
amount INT
);

INSERT INTO TRANSACTION_TBL VALUES(1,1000,'TV',65000);
INSERT INTO TRANSACTION_TBL VALUES(2,1001,'Laptop',75000);
INSERT INTO TRANSACTION_TBL VALUES(3,1000,'Desktop',50000);
INSERT INTO TRANSACTION_TBL VALUES(4,1002,'Fridge',45000);
INSERT INTO TRANSACTION_TBL VALUES(5,1002,'WashingMachine',40000);
INSERT INTO TRANSACTION_TBL VALUES(6,1003,'Chocolate',500);
INSERT INTO TRANSACTION_TBL VALUES(7,1003,'Biscuits',500);
INSERT INTO TRANSACTION_TBL VALUES(8,1002,'Snacks',200);
INSERT INTO TRANSACTION_TBL VALUES(9,1001,'Mobile',35000);
INSERT INTO TRANSACTION_TBL VALUES(10,1005,'MicroOven',30000);

-- INNER JOIN

SELECT * FROM CUSTOMER_TBL c INNER JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id;

-- LEFT JOIN
SELECT * FROM CUSTOMER_TBL c LEFT JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id;

-- RIGHT JOIN
SELECT * FROM CUSTOMER_TBL c RIGHT JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id;

-- FULL JOIN
SELECT * FROM CUSTOMER_TBL c JOIN TRANSACTION_TBL t;

-- GET TEH CUSTOMER NAME HAVE NOT PURCHSASED ANYTHING
SELECT cust_name FROM CUSTOMER_TBL c LEFT JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id
WHERE t.trans_id IS NULL;

-- GET THE TRANSACTION DETAILS MADE BY UN REGISTERED CUSTOMER
SELECT t.* FROM CUSTOMER_TBL c RIGHT JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id
WHERE c.cust_id IS NULL;


-- SELF JOIN   
CREATE TABLE EMPLOYEE_TBL(
emp_id INT,
emp_name VARCHAR(100),
salary INT,
mgr_id INT)
;


INSERT INTO EMPLOYEE_TBL VALUES(1,'Raja',10000,3);
INSERT INTO EMPLOYEE_TBL VALUES(2,'Ram',20000,3);
INSERT INTO EMPLOYEE_TBL VALUES(3,'Bala',15000,9);
INSERT INTO EMPLOYEE_TBL VALUES(4,'Prabha',25000,9);
INSERT INTO EMPLOYEE_TBL VALUES(5,'Priya',10000,8);
INSERT INTO EMPLOYEE_TBL VALUES(6,'Ramya',30000,8);
INSERT INTO EMPLOYEE_TBL VALUES(7,'Kavin',12000,9);
INSERT INTO EMPLOYEE_TBL VALUES(8,'Sakshi',20000,10);
INSERT INTO EMPLOYEE_TBL VALUES(9,'Aveek',22000,10);
INSERT INTO EMPLOYEE_TBL VALUES(10,'Chandra',50000,3);


SELECT e.emp_name , e.salary as emp_salary , m.salary as manager_Sal FROM employee_tbl e JOIN employee_tbl m ON e.mgr_id=m.emp_id WHERE e.salary > m.salary;


-- EXERCISE

CREATE TABLE COUNTRY
(
country_id INT primary key,
country_name VARCHAR(100) UNIQUE NOT NULL,
population_count INT CHECK(population_count > 0)
);

INSERT INTO COUNTRY VALUES(1,'India',1500000000),
							(2,'China',2000000000),
							(3,'Pakistan',5000000),
                            (4,'America',10000000),
                            (5,'Rusya',25000000),
                            (6,'Nepal',100000),
                            (7,'Srilank',2560000),
                            (8,'Singapore',6666666),
                            (9,'Australia',777777),
                            (10,'Canada',2222222);
                            
                            
SELECT * FROM COUNTRY;

SELECT country_name FROM country WHERE population_count = (SELECT max(population_count) FROM country);

SELECT country_name FROM country WHERE population_count = (
SELECT min(population_count) FROM country
);


-- SUB QUERY

SELECT country_name, population_count FROM country
WHERE population_count > 1000000000;

SELECT sum(population_count) FROM country;
SELECT max(population_count) FROM country;
SELECT min(population_count) FROM country;
SELECT avg(population_count) FROM country;

SELECT country_name, population_count FROM country
WHERE population_count > ( SELECT avg(population_count) FROM country );


SELECT country_name, population_count FROM country
WHERE population_count < ( SELECT avg(population_count) FROM country );

SELECT * FROM COUNTRY;

SELECT count(*) FROM COUNTRY;
SELECT count(1) FROM COUNTRY;
SELECT count(coalesce(country_name,'MISSING')) FROM COUNTRY;
SELECT country_id,coalesce(country_name,'MISSING') FROM COUNTRY;


INSERT INTO country(country_id,population_count) VALUES(11,10000);


-- GROUP BY operations

SELECT * FROM office;

SELECT sum(salary) as tot_sal FROM office;

use training;
SELECT company,sum(salary) as tot_sal FROM office
group by company;

SELECT company,place,sum(salary) as tot_sal FROM office
group by company,place;

SELECT company, min(salary) as minumum_sal , max(salary) as max_salary 
FROM office
WHERE place IS NOT NULL
GROUP BY company
ORDER BY minumum_sal ;

SELECT company, min(salary) as minumum_sal , max(salary) as max_salary 
FROM office
WHERE place IS NOT NULL
GROUP BY company
ORDER BY minumum_sal DESC;

SELECT company, min(salary) as minimum_sal , max(salary) as max_salary 
FROM office
WHERE place IS NOT NULL
GROUP BY company
HAVING max_salary >5000
ORDER BY minimum_sal ;

DESC office;

ALTER TABLE office 
MODIFY COLUMN salary INT;


-- VIEW 
-- View is a virtual table , read only table
SELECT * FROM employee;
INSERT INTO employee VALUES(6,'Mohan',100000,6);


CREATE OR REPLACE VIEW emp_view AS
SELECT * FROM employee;

SELECT * FROM emp_view;

DROP VIEW emp_info;

CREATE OR REPLACE VIEW test AS
SELECT * FROM employee WHERE salary>=20000;

SELECT * FROM test;

UPDATE test SET salary=200000 WHERE emp_id=4;