-- SQL QUESTIONS ON DIFFICULT SELCT CLUASE STATEMENT 

-- COMMON QUESRIES 
SHOW DATABASES;
use sakila;
show tables ;
SELECT * 
FROM emp_compensation;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Solving questions from - https://www.kdnuggets.com/2020/11/5-tricky-sql-queries-solved.html

-- 1)


ALTER TABLE customer 
drop column customer_profesion;

ALTER TABLE customer
ADD customer_profession varchar(20);

INSERT INTO customer (
customer_first_name, customer_profession )
VALUES 
('Sam','Doctor')
,('Shyam','Actor')
,('Samuel','Cricketer')
,('Sammy','Singer');

SELECT concat(customer_first_name, ' ', '(',SUBSTRING(customer_profession, 1,1),')')
AS CUstomer_Name_Profession
FROM customer
WHERE customer_first_name in ('Sam','Shyam','Samuel','Sammy');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from emp_compensation;
SELECT salary_component_type
, avg(val) as Actual_Avg
, avg(REPLACE (emp_compensation, 0, '')) as Calculated_salary
FROM emp_compensation
WHERE salary_component_type = 'salary';

-- solve later 


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3)

-- NOTES 
-- A binary tree data structure has a node and a pointer value 
-- A binaryy tree has at most 2 childs - right and left child 
-- There are 3 types of nodes - root, leaf and inner 

-- How to solve the logic :
-- If P value is null for a corresponding pointer then N is Root node 
-- For a given Node N if it exists in the P column it is not an inner node (Which means it is a LEAF node)
-- Else it is a INNER NODE 

use temp;
show tables;
CREATE TABLE node(
  N int 
, P int 
);

INSERT INTO node (
N,P)
VALUES 
(1,2)
,(3,2)
,(6,8)
,(9,8)
,(2,5)
,(8,5)
,(5,NULL);

SELECT * 
FROM node;

-- Solved code logic :
SELECT CASE
	WHEN N IS NULL THEN CONCAT(N,' Root')
    WHEN N IN (SELECT P FROM node) THEN concat(N,' Inner')
    ELSE CONCAT(N,' Leaf')
END AS node_value
FROM node
ORDER BY N asc;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4)

Use temp;
show tables;
DROP table tbl_transaction;
-- Below code creates a "Transaction" table named as "tbl_transaction" :
CREATE TABLE tbl_transaction(
  TRANSACTION_ID INT auto_increment
, USER_ID char(2)
, CREATED_DATE date
, PRODUCT_ID char(2)
, QUANTITY INT
, CONSTRAINT PK_TRANSACTION_ID PRIMARY KEY(TRANSACTION_ID) 
);

-- Following code describes te above created table - tbl_transaction
DESC Tbl_transaction;

-- Following code insert values in tbl_transaction 
INSERT INTO tbl_transaction(
USER_ID
, CREATED_DATE
, PRODUCT_ID
, QUANTITY
)
VALUES 
  ('U1','2020-12-16','P1',2)
, ('U2','2020-12-16','P2',1)
, ('U1','2020-12-16','P3',1)
, ('U4','2020-12-16','P4',4)
, ('U2','2020-12-17','P5',3)
, ('U2','2020-12-17','P6',2)
, ('U4','2020-12-18','P7',1)
, ('U3','2020-12-19','P8',2)
, ('U3','2020-12-19','P9',8);


SELECT *
FROM tbl_transaction;
  
-- Solution to the question 
SELECT count(USER_ID) as 'User who had multiple pruchase orders '
from
(SELECT USER_ID
FROM tbl_transaction 
GROUP BY USER_ID
HAVING COUNT(DISTINCT date(CREATED_DATE))>1
) tmptbl_user_id;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5) 
 -- Error faced asked - https://www.reddit.com/r/mysql/comments/ywfhrl/how_to_solve_1175_error_in_mysql/

-- adding two columns in the table tabl_transactions 
ALTER TABLE tbl_transaction
  MODIFY column START_DATE date
, MODIFY COLUMN END_DATE date;


-- check the added columns in tabl_transaction
DESC tbl_transaction;

-- Retrive all data from tbl_transaction 
SELECT *
FROM tbl_transaction;


-- Update ststement gives error, hence set the sql safe updates as 0 
SET sql_safe_updates=0; 


-- update START_DATE  and END_DATE
UPDATE tbl_transaction 
  SET START_DATE = '2021-01-16'
, END_DATE = '2021-01-31'
WHERE USER_ID = 'U1';

UPDATE tbl_transaction 
  SET START_DATE = '2021-01-16'
, END_DATE = '2021-01-26'
WHERE USER_ID = 'U2';


UPDATE tbl_transaction 
  SET START_DATE = '2021-01-28'
, END_DATE = '2021-02-06'
WHERE USER_ID = 'U3';

UPDATE tbl_transaction 
  SET START_DATE = '2021-02-16'
, END_DATE = '2021-02-26'
WHERE USER_ID = 'U4';












-- INSERT INTO tbl_transaction(START_DATE, END_DATE)
-- SELECT STRAT_DATE, END_DATE FROM tbl_transaction
-- WHERE USER_ID = 'U1';
-- -- , ('20201-01-16','20201-01-26') WHERE USER_ID = 'U2'
-- -- , ('20201-01-28','20201-01-06') WHERE USER_ID = 'U3'
-- -- , ('20201-02-16','20201-02-26') WHERE USER_ID = 'U4'
-- -- ;



/* lOGIC FOR OUTPUT -

-- U1 is overlapping with U2 and U3, hence output is true 
-- U2 is overlapping with U1, hence output hence output is true
-- U4 is overlapping with none, hence output is false
-- make sure a user is not compared to itself
*/

SELECT t1.USER_ID, 
(CASE WHEN t2.USER_ID IS not null THEN 1 ELSE 0 END) AS OVERLAP
FROM tbl_transaction AS t1
LEFT JOIN tbl_transaction AS t2
    ON t1.USER_ID != t2.USER_ID
    AND t1.START_DATE <= t2.END_DATE
    AND t1.END_DATE >= t2.END_DATE
GROUP BY t1.USER_ID
order by user_id;










	