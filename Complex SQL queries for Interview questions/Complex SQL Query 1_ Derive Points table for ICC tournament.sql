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
 


