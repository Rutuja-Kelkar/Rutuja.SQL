-- SQL LENGTH() FUNCTION :
-- length('str');
-- Returns the length of the string arguemnt measured in bytes
-- A multibyte charcater counts as a multibyte string 
-- For a string containing 5 characters of 2 bytes each, it returns 10
-- where as char_length() returns 5.


-- positive scenarios:
select length('Rutuja');
select length(null);         -- returns null for null arguement
select length('');           -- returns zero for empty string 
select length(' ');          -- returns 1 for 1 whitespace
select length(1234);         -- takes numeric arguements 
select length('1234');       -- returns 4 for length of characters 

-- Negative scenarios :
select length(++++);         -- 1064, syntax error
select length(||||||);       -- 1064, syntax error
select length(lllll);        -- 1054, unknown column
select length();             -- 1582, incorrect parameter count    

