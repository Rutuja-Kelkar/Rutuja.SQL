/* 
Ankit bhansal YT - https://www.youtube.com/watch?v=dOLBRfwzYcU&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E
*/


-- Select database 
Use sakila;
drop table events;
show tables;

-- Create Tables to solve the problem 
CREATE TABLE EVENTS(
    ID int,
    EVENT_TYPE varchar(255),
    YEAR int,
    GOLD varchar(255),
    SILVER varchar(255),
    BRONZE varchar(255)
);

DESC EVENTS;
DELETE FROM EVENTS;

Select *
FROM events;

-- Insert values in events table 
INSERT INTO events 
VALUES 
    (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara'),
    (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith'),
    (3,'500m',2016, 'Charles','Nichole','Susana'),
    (4,'100m',2016, 'Ronald','maria','paula'),
    (5,'200m',2016, 'Alfred','carol','Steven'),
    (6,'500m',2016, 'Nichole','Alfred','Brandon'),
    (7,'100m',2016, 'Charles','Dennis','Susana'),
    (8,'200m',2016, 'Thomas','Dawn','catherine'),
    (9,'500m',2016, 'Thomas','Dennis','paula'),
    (10,'100m',2016, 'Charles','Dennis','Susana'),
    (11,'200m',2016, 'jessica','Donald','Stefeney'),
    (12,'500m',2016,'Thomas','Steven','Catherine');
    
    
-- Validate for values inserted or not
SELECT *
FROM EVENTS;

-- Count how many records exist in the table 
SELECT count(*)
FROM EVENTS;

-- Delete all records from the table
DELETE FROM EVENTS;

-- Modify a ID column to EVENTS_ID column in EVENTS table
ALTER TABLE EVENTS 
RENAME COLUMN ID TO EVENTS_ID;



/*Description of question to solve 
Write a query to find number of gold medals per swimmer who won only gold medals 

Input table contains - 
EVENT_ID 
EVENT 
GOLD 
SILVER 
BRONZE
Expected output table -
-- find all the records with player names having only gold medal alter
and not any other medal


My Approach to solve this problem (withoout watching the video)
Step 1) Retrive all the records who won gold medal using  having cluase



*/

-- METHOD 1 - Solution using sub query
SELECT 
    GOLD as PLAYER_NAME,
    count(1) as No_of_gold_medals
FROM events
WHERE GOLD not in (SELECT SILVER FROM EVENTS UNION ALL SELECT BRONZE FROM EVENTS)
GROUP BY GOLD;


-- Break down of the solution 
-- given input is event id, events (text), which ear, gold , silver , bronze 
-- Initial get all the player names who won gold 
-- Next count all the gold medals 
-- 3rd group by gold medal 
-- Extract from not in query which names are not in silver and bronze


/*

What happens when above sub query is used 

-- Memory consumption increases 
-- I can fiter out for gold, silver and bronze



*/

-- Method 2 - using cte funtion (written without reference)




-- Practise 1  -- USING SUB QUERY (written own my own without reference) ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    GOLD AS PLAYER_NAME_WON_GOLD, 
    COUNT(1) AS COUNT_OF_GOLD_WON
FROM EVENTS
WHERE GOLD NOT IN 
    (
        SELECT SILVER FROM EVENTS 
        UNION ALL 
        SELECT BRONZE FROM EVENTS
    )
GROUP BY PLAYER_NAME_WON_GOLD;


-- Practise 1 using CTE function ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WITH MEDALS AS 
(
    SELECT GOLD AS Player_that_won_gold, 'gold' as medal_type FROM EVENTS
    union all
    SELECT SILVER AS Player_that_won_silver, 'silver' as medal_type FROM EVENTS
    union all
    SELECT BRONZE AS Player_that_won_silver, 'bronze' as medal_type FROM EVENTS
)

SELECT 
    Player_that_won_gold, 
    COUNT(1) AS No_of_gold_medals
    FROM medals 
    group by Player_that_won_gold
    having count(distinct medal_type)=1 and max(medal_type) = 'gold';
    



-- 21TH DEC 2022 5:30:00 AM Practise 2 using SUB QUERY  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
Steps to solve this using sub query 

1) select the gold medal */

SELECT *
FROM EVENTS;

SELECT
      GOLD AS PLAYER_NAME
    , COUNT(1) AS NO_OF_GOLD_WON
FROM EVENTS
WHERE GOLD NOT IN 
    (
        SELECT SILVER FROM EVENTS 
        UNION ALL
        SELECT BRONZE FROM EVENTS
    )
GROUP BY PLAYER_NAME;





-- 21TH DEC 2022 5:30:00 AM Practise 2 using CTE function ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM EVENTS;



WITH EVENT_CTE AS 
(
    SELECT GOLD AS PLAYER_NAME, 
    'GOLD' AS MEDAL_TYPE FROM EVENTS 
UNION ALL
    SELECT SILVER AS PLAYER_NAME, 
    'SILVER' AS MEDAL_TYPE FROM EVENTS 
UNION ALL
    SELECT BRONZE AS PLAYER_NAME, 
    'BRONZE' AS MEDAL_TYPE FROM EVENTS 
)

SELECT
      PLAYER_NAME
    , COUNT(1) AS NO_OF_GOLD_WON
FROM EVENT_CTE
GROUP BY PLAYER_NAME
HAVING COUNT(DISTINCT MEDAL_TYPE=1)
AND MAX(MEDAL_TYPE)='GOLD';

