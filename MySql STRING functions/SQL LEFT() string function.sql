-- LEFT() function :
-- left(str,N);
-- Returns N left most charcaters of string arguement 
-- return null if string is null


-- positive scenarios:
select left('Rutuja',5);     -- return 5 leftmost characters from str arguememnt
select left(1234,1);         -- Takes in input arguement as numeric input 
select left('ABC', 10);      -- returns the entire string if N>str length
select left('',1);           -- return empty string for empty string input arguement
select left(null,1);         -- returns null for null string arguement
select left('Rutuja', null);  -- return null for N=null
select left('Rutuja',0);    -- returns empty string when N=0
select left('Rutuja',-100);    -- returns empty string for N<0
select left('Rutuja',0.9);     -- For N as decimal value, takes in rounded value as N input arguement
select left('Rutuja',2.5);    


-- Negative scenarios :
select left(12frg,1);
select left('');            -- 1062, syntax error
select left();              -- 1064, syntax error
select left('',i);          -- 1054, unknown field 'i'
select left('Rutuja',0);    -- returns empty string when N=0

