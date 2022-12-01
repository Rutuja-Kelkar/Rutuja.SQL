/*
ANKIT BHANSAL YOUTUV=BE PLAYLIST
-- https://www.youtube.com/watch?v=P6kNMyqKD0A&t=2s


GIVEN DATABSE AND TABLE :
-- Table name : "entries" 
-- database name : "temp"


PROBLEM DESCRIPTION :
-- Consider the given table "table_entries" using containing following column names :
    -- name varchar
    -- address varchar
    -- email varchar
    -- floor int
    -- resources varchar (These are available resources in the company eg : desktop etc)
-- Given above is a table containing people that have entered the company
-- Company allows to enter every person to enter only once a day 
-- For eg - person A is allowed to enter the company only once 
-- While entering the building they are providing their email ID 
-- Loop hole here - If the person gives another email ID, he is allowed to enter again in the building 



EXPECTED OUTPUT :
-- Solve the loop hole by considering and get output columns as 
    -- name (This is the name of the person)
    -- total_visits (This is an int containing a number of how many times person with same name has visited)
    -- most visited_floor (This is an int containing a number of most visited floor by the person)
    -- resources_used (This is a varchar value containing the resources used by that person)
    
    
    
LOGICAL STEPS TO SOLVE ABOVE PROBLEM BEFORE WATCHING THE SOLUTION :
-- Ideally one one row should exist for one person, but there exist multiple with different email ids 
-- 
*/


-- Select "temp" database 
use temp; 

-- CREATE "entries" table 
create table entries( 
    name varchar(20),
    address varchar(20),
    email varchar(20),
    floor int,
    resources varchar(10)
);

-- Describe the table "entries"
DESC entries;


-- Inset values into table "entries"
insert into entries 
values 
    ('A','Bangalore','A@gmail.com',1,'CPU')
    ,('A','Bangalore','A1@gmail.com',1,'CPU')
    ,('A','Bangalore','A2@gmail.com',2,'DESKTOP')
    ,('B','Bangalore','B@gmail.com',2,'DESKTOP')
    ,('B','Bangalore','B1@gmail.com',2,'DESKTOP')
    ,('B','Bangalore','B2@gmail.com',1,'MONITOR')
;


-- Retrive all the inserted values 
SELECT *
FROM entries;
