/*
Ankit bhansal video - https://www.youtube.com/watch?v=G7v7TZ3ylDI&list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH&index=4
*/

-- select the database 
use sakila;
show tables;
SELECT *
FROM emp;



-- Q) Find the names of employees whose salary is greater then their manager

SELECT 
  e.emp_name
, e.salary as emp_salary
, m.emp_name as manager_name
, m.salary as manager_salary
FROM emp e
INNER JOIN emp m
ON e.emp_id = m.manager_id
WHERE e.salary > m.salary;



-- Q) Find the manage name for each employee 

/*Steps to solve above problem 
Step 1 - Identify the table that is to be targeted 
step 2 - Self join the table on manager id and emp id 
step 3 - get te desired result in the select clause */

select * from emp;
SELECT 
  e.emp_id as Emplyoyee_ID 
, e.emp_name as Emplyoyee_Name
, m.manager_id as Manager_ID
, m.emp_name as Manager_Name
FROM emp e 
INNER JOIN emp m
ON e.manager_id = m.manager_id;



