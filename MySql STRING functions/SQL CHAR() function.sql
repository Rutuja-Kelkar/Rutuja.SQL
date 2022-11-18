-- CHAR() function :

-- Interprets each arguement N as an integer &
-- returns a string consisting of charcaters given by the code values of those integers.


-- positive scenarios :
select char(33,784 using utf8mb4);                  -- returns a blob 
SELECT CHAR(77,77.3,'77.3' USING utf8mb4);      
select CHAR(77,121,83,81,'76' USING utf8mb4);
select char(65 USING utf8mb4);
select char('A' using utf8mb4); 
select char(89 USING utf8mb4);
select char(500 USING utf8mb4);


-- Negative scenarios :
select char('1');
select char(100 using utf8mb4); 
select char(-100 using utf8mb4);  --- returns negative for negative numbers