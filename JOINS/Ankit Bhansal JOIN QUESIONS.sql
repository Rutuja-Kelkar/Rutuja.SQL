/*
SOLVING sql joins using ANkit bhansal's video
https://www.youtube.com/watch?v=xR87ctOgpAE
*/


/*IMPORTANT NOTES 
-- If all are matching records in both the tables then the output / result of all joins - right, left , inner  and outer are same 
-- Resultant output of INNER JOIN = Number of commom reords in table 1 * No of common records in table 2
*/

-- Select a database to create tables 
use sakila;

-- Create a table to import dataset
-- Using thne data that is already present in sakila 

SELECT * 
FROM customer;  -- Selecting all thr records 
SELECT COUNT(*)
FROM CUSTOMER;  -- Counting the records selected 


-- Create short table to learn and solve SQL joins 

-- Create table t1 

CREATE TABLE t1 (
id1 int
);

-- desc table t1 
desc t1;
select * from t1;

CREATE TABLE t2 (
id2 int 
);

desc table t2;
select * from t2;
select * from t1;

-- INSERT data in TABLE t1 and t2 -
Insert into t1 (
id1
)
VALUES 
  (1)
, (1);

Insert into t2 (
id2
)
VALUES 
  (1)
, (1)
, (1);

-- Queries executing joins 

-- Inner join
SELECT *
FROM t1 
INNER JOIN t2
ON t1.id1 = t2.id2;

-- Right join
SELECT *
FROM t1 
RIGHT JOIN t2 
ON t1.id1 = t2.id2;

-- Left join
SELECT *
FROM t1
LEFT JOIN t2 
ON t1.id1 = t2.id2;


-- Full outer join
SELECT count(*) from
(SELECT *
FROM t1 
RIGHT JOIN t2 
ON t1.id1 = t2.id2
Union all
SELECT *
FROM t1 
LEFT JOIN t2 
ON t1.id1 = t2.id2
) as All_Records;


-- Insert another set of values 
INSERT into t1(id1) VALUES(2);  
INSERT into t2(id2) VALUES(3);  












