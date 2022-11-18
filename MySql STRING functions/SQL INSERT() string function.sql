-- INSERT() function : 
-- INSERT(str, position, length, newstr)
-- Returns the string str at with the substring begining at the pos and len characters long replaced by string newstr  
-- 


-- Positive scenarios :
select insert('Rutuja',2,3,'AA');   -- Returns str with replaced 3 characters by 'AA' at position 2.
select  insert('Rutuja',7,1,'AA');  -- Returns str since position exceeds thbe length of str
select insert('',3,2,'AA');         -- Returns an empty str since, imput arguement to replace is empty string.
select insert(' ',1,1,'AA');        -- Returns str which is a whitespace  at position 1, replces strnew with str
select insert('QWERTYU',1,1,'Rutuja'); 
select insert(null,1,1,'m');        -- Returns null since str nput arguement is null
select insert(1234,1,1,0);          -- takes in binary string input arguements 
select insert(1234,1,1,'A');        -- takes in binary and non-binary inout string arguement 
select insert('AB',0,1,'CC');       -- returns str if psotion is 0
select insert('ABC',1,1,' ');      
select insert('ABC',1,1,'');        
select insert(first_name,5,1,'AAAA') from my_contact_list;
select insert(first_name, 10, 1, 'AAAA') from my_contact_list;



-- Negative scenarios :
select insert(1,2,'m');             -- 1064, syntax error
select insert('AA',1,'BB');         -- 1064, syntax error
select insert(=+==,1,1,123);        -- 1064, syntax error
select insert('');                  -- 1064, syntax error
select insert('\\\\\'');            -- 1064, syntax error