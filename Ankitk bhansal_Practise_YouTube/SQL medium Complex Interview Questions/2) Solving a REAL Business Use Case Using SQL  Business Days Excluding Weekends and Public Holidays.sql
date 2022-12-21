/* 
Ankit bhansal YT - https://www.youtube.com/watch?v=FZ0GCcnIIWA&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E&index=2
*/


-- Use sakila database 
USE SAKILA;

-- create a table "tickets" in sakila databaSE
CREATE TABLE TICKETS 
( 
      TICKET_ID VARCHAR(10), 
      CREATE_DATE DATE
    , RESOLVED_DATE DATE 
);

-- DESCRIPTION OF THE TABLE CREATED 
DESC TICKETS;

-- DELETE THE CONTENTS IN THE TABLE CRAETED 
DELETE FROM TICKETS;
DELETE FROM HOLIDAY;

-- INSERT VALUES INTO "TICKETS" TABLE 
USE SAKILA;
INSERT INTO TICKETS (TICKET_ID, CREATE_DATE, RESOLVED_DATE)
values
    (1,'2022-08-01','2022-08-03')
    ,(2,'2022-08-01','2022-08-12')
    ,(3,'2022-08-01','2022-08-16');
    
-- Create table - "HOLIDAY"
CREATE TABLE HOLIDAY 
(
      HOLIDAY_DATE DATE
    , HOLIDAY_REASON VARCHAR(100)
);

-- DESC CREATED TABLE - HOLLIDAY
DESC HOLIDAY;
DESC TICKETS;

-- DELETE VALUES FROM BOTH THE TABLE 
DELETE FROM HOLIDAY;
DELETE FROM TICKETS;

-- INSERT VALUES IN HOLIDAY TABLE 
INSERT INTO holiday
VALUES
      ('2022-08-11','Rakhi')
    , ('2022-08-15','Independence day')
;

-- CHECK INSERTED VALUES IN BOTH THE CREATED TABLES 
SELECT *
FROM HOLIDAY;
SELECT * 
FROM TICKETS;


-- Deleting duplicate values from  a table USING CTE
-- WITH DELETE_DUPLICATES_HOLIDAY AS 
-- (
--     SELECT
--           *
--         , ROW_NUMBER() OVER (PARTITION BY HOLIDAY_DATE, HOLIDAY_REASON) AS RN
--     FROM HOLIDAY
-- )
-- DELETE HOLIDAY_DATE, HOLIDAY_REASON 
-- FROM HOLIDAY
-- JOIN DELETE_DUPLICATES_HOLIDAY
-- ON HOLIDAY.HOLIDAY_DATE = HOLIDAY.HOLIDAY_DATE
-- WHERE RN <> 1;

-- Other method 
-- WITH CTE AS 
-- ( SELECT *
--     , ROW_NUMBER() OVER (PARTITION COLL1 ORDER BY COL1) AS RN
-- ) AS RN_table
-- delete from CTE 
-- where RN <>1;


-- solving error code - 1288 - https://stackoverflow.com/questions/47695149/error-1288-the-target-table-is-not-updatable-in-mysql-trigger

-- Problem statement 
-- Given are 2 table - TICKETS and HOLIDAY
-- Write a query to find business days between create_date and resolve _date 

SELECT 
      *
    , DATEDIFF(RESOLVED_DATE, CREATE_DATE) AS ACTUAL_DAYS
    , date part
FROM TICKETS;






/*SUMMARY OF LEARNING AFTER SOLVING THIS QUESTION

-- Learnt date functions - datediff() -https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_datediff
                         -
*/






