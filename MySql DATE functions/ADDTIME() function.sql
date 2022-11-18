-- ADDTIME() function :
-- addtime(expr1, expr2) - adds expr2 to expr1;
-- expr1 is date or datetime expression
-- expr2 is time expression
-- returns null if one of the expr is null
-- This function returns a subtime() value :
-- Returns TIME, if the value of first expression is dynamic (such as in prepared statement) 
-- Otherwise resolved type of of the function is derived from type of the first arguement

 
-- POSITIVE SCENARIOS :
SELECT addtime('2020-01-01 01:01:01','01:01:01');   -- expression1  is datetime
SELECT addtime('01:01:01','01:01:01');              -- expression 1 in time only 
SELECT ADDTIME('2020-01-01 01:01:01.000009','01:01:01');
SELECT addtime('2020-01-01 01:01:01.000009', '');


-- NEGATIVE SCENARIOS :
SELECT addtime('','') as time1;
SELECT addtime('2020-01-01','01:01:01');            -- Expression 1 contains only date, which won't be considered , However you get the result 
SELECT addtime(NULL, '');                           -- Null output for a NULL input

-- ERROR SCENARIOS : 

