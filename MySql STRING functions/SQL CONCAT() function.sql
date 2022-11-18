-- CONCAT() function :
-- Returns the string that results in concatenating the arguement.
-- may have one or more arguements.
-- syntax : concat (str1, str2,...);
-- An arguement is something that is passed inside a function.
-- An string is inside a quotation mark. eg : 'ABC'
-- If all the arguements are non-binary string the result is a non-binary string.
-- If the arguements include any bianary strings, the result is a binary string.
-- A numeric arguement is converted to its equivalent non-binary string.


-- Positive sceanrios :
select concat('Rutuja', 'Kelkar');     -- returns a concatanated string.
select concat('');                     -- Returns nothing;
select concat(' ');                    -- returns a whitespace for a whitespace input.
select concat('1 ','Rutuja');          -- returns a non-binary concatanated string.
select concat(1,'Rutuja');             -- returns a binary concatanated string since it first arguement passed is a binary string.
select concat(1000,200);               -- returns a binary string since both input arguements are binary strings.
select concat(-1,-200);                -- takes in arguements as negative numbers.
select concat(1,-1);                   -- returns a binary concatanated string.alter
select concat('','');
select concat('9078hdvgfgde//--++','WWW');
select concat('////','**'); 
select concat('Rutuja', null, 'Kelkar');  -- returns null if any arguemnt is null.
select 'My','SQL';                        -- returns string in differnt columns for placed next to each other using ',' with concat() function.
SELECT 'My' 'S' 'QL';                     -- returns 'My' as column name and 'MySQL' as concatanated string without concat() function.

	
-- set a variables and concatanate a string :
set @A='Hey';                             -- Observation : Running all lines of code 30, 31, 32 together won't result in table output, run all 3 lines of code seperately
set @B='There';
select concat(@A,' ',@B);





-- Negative scenarios: 
select concat(////,**);         -- 1064 syntax error
select concat(+++++,66);        -- 1064 syntax error
select concat([][][][],{}{}{);  -- 1064 syntax error
select concat();                -- 1582 Incorrect parameter count.
select concat('89')             -- working without semicoloun at the end // should be wrong.
select concat()                 -- 1064 incorrect syntax.
select concat(null);            -- 1602, incorrect parameter count