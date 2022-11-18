-- SQL TIPS AND TRICKS - YT PLAYLIST ankit Bhansal 
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*
1) Difference between having and where clause -
-- Where clause is applied on individual rows 
-- Having clause is used when aggregation values are used 
*/

Use sakila;
show tables;
desc category;
desc customer;

-- PRACTISE



/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*
2) Converting row into columns 
-- https://www.youtube.com/watch?v=O6mDdUIvx9k&list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH&index=2
-- table used is emp_compensation - created below 
-- Convert salry_component_type column into row 
-- It is also called table pivoting 
*/

-- databes used "sakila" :
use sakila; 

-- emp_compensation table created :
create table emp_compensation (
emp_id int
, salary_component_type varchar(20)
, val int
);

-- description of emp_compensation table :
DESC emp_compensation;

-- Values inserted in emp_compensation table :
INSERT INTO emp_compensation
VALUES (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10),
(2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8),
(3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);

-- All rows with values are retrived from emp_compensation table :
SELECT *
FROM emp_compensation;

-- Converting present table columns into rows 
-- Expected row output : emp_id, salary, bonus, hike-percent alter
-- Input table : present emp_compensation table 

-- Expected output code :




SELECT emp_id
, sum(CASE WHEN salary_component_type = 'salary' THEN VAL end) as salary
, sum(CASE WHEN salary_component_type = 'bonus' THEN VAL end ) as bonus
, sum(CASE WHEN salary_component_type = 'hike_percent' THEN VAL end) as hike_percent
FROM emp_compensation
group by emp_id;


-- Storing the result set in a new table called "emp_compensation_pivot" -https://www.oreilly.com/library/view/mysql-cookbook-2nd/059652708X/ch04s03.html
CREATE TABLE emp_compensation_pivot    -- Added this line to store the result set of select statement into "emp_compensation_pivot"
SELECT emp_id
, sum(CASE WHEN salary_component_type = 'salary' THEN VAL end) as salary
, sum(CASE WHEN salary_component_type = 'bonus' THEN VAL end ) as bonus
, sum(CASE WHEN salary_component_type = 'hike_percent' THEN VAL end) as hike_percent
FROM emp_compensation
group by emp_id;


-- desc "emp_compensation_pivot" table 
DESC emp_compensation_pivot;

-- Retrive all the rows of "emp_compensation_table"
SELECT *
FROM emp_compensation_pivot;
select * from emp_compensation;

-- Get an output result as is in table "emp_compensation"
SELECT *
FROM (
SELECT
emp_id, 'salary' as salary_component_type, salary as val 
FROM emp_compensation_pivot
union all
SELECT
emp_id, 'bonus' as salary_component_type, bonus as val 
FROM emp_compensation_pivot
union all
SELECT
emp_id, 'hike_percent' as salary_component_type, hike_percent as val 
FROM emp_compensation_pivot
) as emp
ORDER by emp_id;

-- PRACTISE  



/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Ankit bhansal - https://www.youtube.com/watch?v=Iv9qBz-cyVA&list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH&index=3

-- Q1) How to find duplicates in a given table


Use sakila;
CREATE TABLE student(
  STUDENT_ID INT
, FIRST_NAME VARCHAR(20)
, LAST_NAME VARCHAR(20)
);

-- describe created table 
desc student;

-- Insert values in student table 
INSERT INTO student(
  STUDENT_ID
, FIRST_NAME
, LAST_NAME
)
VALUES 
  (1, 'Rutuja','Kelkar')
, (1, 'Rutuja','Kelkar')
, (2, 'Nidhi','Kelkar')
, (2, 'Nidhi','Kelkar')
, (3, 'Anandraj','Kelkar')
, (3, 'Anandraj','Kelkar');


-- check if inserted values are correct ? 
use sakila;
SELECT * FROM student;


-- Find if inserted values have duplicates in student table in student_id column

SELECT STUDENT_ID, count(1)    -- select staudent id and selected a count for it 
FROM STUDENT 
GROUP BY STUDENT_ID            -- Group by the column you want to find the duplicate on 
HAVING count(1) > 1;           -- This gives you the exact output of duplicates \

-- Practise : 

-- Finding duplicates 
use temp;
use sakila;
show tables ;
select *
FROM student;

-- You got it right 
SELECT STUDENT_ID , COUNT(1)
FROM student 
GROUP BY STUDENT_ID
HAVING count(1) > 1;

DESC STUDENT;

SELECT STUDENT_ID , FIRST_NAME, COUNT(*)
FROM student 
GROUP BY STUDENT_ID, FIRST_NAME
HAVING COUNT(*) > 1;


-- Practise 

-- Deleting duplicates from a column 
-- step 1 - Select the column that you want to find duplicates from
-- step 2 - Select the count(1) after the column 
-- step 3 - group by the selected column 
-- step 4 - select count(1) that is greater than 1 


use sakila;
desc student;
Select * from student;

SELECT STUDENT_ID, COUNT(1)
From student 
group by STUDENT_ID 
Having count(1) > 1;




/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Ankit bhansal - https://www.youtube.com/watch?v=Iv9qBz-cyVA&list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH&index=3

-- Q2) How to delete duplicates in a table


WITH CTE AS
(SELECT * , row_number() OVER(PARTITION BY STUDENT_ID order by STUDENT_ID ) as rn
FROM student)
delete FROM cte where rn > 1;

/* LOGIC TO DELETE DUPLICATES 

step 1  - Identify the duplicates 
step 2  - Find on what column you want to find the duplicates 
step 3  - Assign a row number over partition of the selected column to duplicate
step 4 - Create a cte function for it 
step 5 - Delete from cte where row number is greater than 1 

*/



/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Ankit bhansal - https://www.youtube.com/watch?v=Iv9qBz-cyVA&list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH&index=3

-- Q3) Difference between union and union all

    

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Ankit bhansal - https://www.youtube.com/watch?v=xMWEVFC4FOk

-- Q4) Difference between rank , row number() and dense rank 

-- rank() - produces a rank to a selected column 

    


