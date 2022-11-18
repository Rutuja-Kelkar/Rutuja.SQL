-- INSTR() FUNCTION:
-- INSTR(str, substr);
-- Returns the first occurence of substr in str;
-- This is same as 2 digit arguement in LOCATE(), except that the order of arguement is reversed.
-- This is multibyt safe
-- case sensitive only if at least one of the arguement i
-- this function is multi byte safe


-- Positive scenarios :
select instr('Rutuja','Rut');
select instr(null,'Rutuja');        -- returns null if one arguement is null
select instr('','');                -- returns 1 since both str arguements are empty; comparison of 2 empty str's returns 1
select instr(' ',' Rutuja');        -- Returns 0 if substr is not found in str 
select instr('',' ');               -- Returns 0, since whitespace is not found in str
select instr('Rutuja','K');         -- returns 0, since K is not found in Rutuja
select instr(null,'Rutuja');        -- returns null, if one str is null
select instr('AAAAAAAAAAAA','AA');  -- Returns first occurance only 
select instr(1234,'12');            -- Take binary str values 
select instr(123,123);               -- Compares 2 binary str's 
select instr('++000','0');          -- returns 3, since  '0' is found at 3rd position in str
select instr(first_name, 'Rut') from my_contact_list;
select instr(first_name, '') from my_contact_list;  -- comparion with empty string returns 1
select instr(first_name, last_name) from my_contact_list; 




-- Negative scenarios :
select instr('');                   -- 1582, Incorrect parameter count
select instr('',);                  -- 1604, Incorrect syntax
select instr();                     -- 1582, Incorrect parameter count
select instr(hiduegt,bgydge);       -- 1054 unknown field list
select instr(ydteg,'db');           -- 1054, Unknown field list
select instr(+++++,....);           -- 1604, syntax error 
select instr(;;);                   -- 1604, syntax error 

