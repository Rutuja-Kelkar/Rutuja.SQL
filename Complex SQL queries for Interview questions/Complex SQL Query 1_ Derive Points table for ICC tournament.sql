/* 
Ankit bhansal YT - https://www.youtube.com/watch?v=qyAgWL066Vo&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=1&t=2s
*/

-- Create Tables to solve the problem 
use temp;   -- Select the database to create a table

-- Code to create table 
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

-- Code to describe the created tables 
desc icc_world_cup;


-- Insert values in the created table
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');


-- Retrive values to check if values are inserted properly or not 
select * from icc_world_cup;

/*Description of question to solve 

Input table contains - 
Team_1   varchar
Team_2   varchar
Winner   varchar
(This table is created above) 

Expected output table -
Team_Name  - varchar (contains name of the team)
Matches_Played - int (This is the number of matches played by the respective team)
No_of_wins     - int (This is the number of matches won by a team )
No_of_losses   - int (This is the number of losses by a team )

Approach to solve this problem 
Step 1 ) Derive a table containing folowing information regarding - a win_flag
        



*/


-- Resultant code : 
select team_name, count(1) as Number_of_matches_played, sum(WIN_FLAG) as no_of_matches_won, count(1) - sum(WIN_FLAG) as NO_of_matches_lost
from(
SELECT team_1 AS team_name, CASE WHEN Team_1 = Winner THEN 1 ELSE 0 END AS WIN_FLAG
from icc_world_cup
Union all
SELECT team_2 as team_name, CASE WHEN Team_2 = Winner THEN 1 ELSE 0 END AS WIN_FLAG
from icc_world_cup
) as A
Group by team_name
order by no_of_matches_won desc;


-- Practise 1)
Select * from icc_world_cup;

-- Addition in the code - Output coloumn - Points_scored
Select Team_name
, count(1) as Number_of_mactches_played
, sum(win_flag) as Number_of_matches_won
, count(1) - sum(win_flag) as Number_of_matches_lost
, sum(win_flag) * 2 as Points_scored 
from
(
SELECT Team_1 as Team_name, CASE WHEN Team_1 = Winner then 1 else 0 end as win_flag
from icc_world_cup
union all
Select Team_2 as Team_name, CASE WHEN Team_2 = Winner then 1 else 0 end as win_flag
from icc_world_cup
) as Count_win_losses
Group by team_name
order by Number_of_matches_won desc;


-- Practise 2) 
-- Breakm down the logic , extremely well and then attempt 
 
 /*
Input table contains following tables -
Team_1
Team2
Winner 


Expected output table -
-- Find the No_of matches won by a team 
-- Find the number of matches lost by a team 

Breaking down the solution
-- 1) Derive a table containing a win_flag for all the teams 
        How to derive this ?
            -- IF Team_1 = Winner then win flag is 1 else 0
            -- If Team_2 = winnar then win_flag is 1 else 0
-- 2) Output a column containg a count for all wins as No_of_matches_won
-- 3) Output a column containg no_of_matches_lost
-- 4) Calculate the points scored by each team, logic - no_of_wins * 2
 
 */


SELECT * 
FROM icc_world_cup;       -- Check for all existing data in all columns if icc_world_cup table 

-- Deriving step 1)
SELECT
   Team_name
 , count(1) as No_of_matches_played
 , sum(win_flag) as No_of_matches_won
 , count(1) - sum(win_flag) as No_of_matches_lost
 , sum(win_flag) * 2 as total_points_scored
FROM 
    (SELECT 
    Team_1 as Team_name                                        -- Team_1 and team_2 will be outputed as one column with alias Team_name
    , CASE WHEN Team_1 = Winner THEN 1 ELSE 0 END AS Win_flag  -- Creating a win_flag if Team_1 = winner
    FROM icc_world_cup
    Union all   
    SELECT                                                      -- Union data from both the columns 
    Team_2 as Team_name                                         -- Team_1 and team_2 will be outputed as one column with alias Team_name
    , CASE WHEN Team_2 = Winner THEN 1 ELSE 0 END AS Win_flag   -- Creating a win_flag if Team_2 = winner
    FROM icc_world_cup) as Team_win_info                        -- In this sub query with alias as "Team_win_info" we understand that Team_name and win_flag can be taken as output columns 
GROUP BY Team_name
ORDER BY No_of_matches_won desc;


