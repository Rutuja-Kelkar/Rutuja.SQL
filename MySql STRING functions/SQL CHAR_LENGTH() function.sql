-- CHAR_LENGTH() FUNCTION : 
-- CHARACTER_LENGTH() is a synonym of character length.
-- Returns the length of the characters in an arguement.
-- returns the length of the string measure in code points.
-- A multibyte charcater counts as a single code point.
-- For eg : If a code point contains two 3 byte charcaters then output=2;
-- input can be a string, a literal charcater or a cloumn name.	

-- positive scenarios:
select char_length('Rutuja');         -- returns the lenght of the number of characters in arguement;
select character_length('Rutuja');    -- returns the length of the charcaters in arguement;
select char_length(first_name) from my_contact_list;  -- returns the length of the characters in arguement for column name first_name;
select char_length('海豚');            -- returns the lenght of code point for multibyte characters;           
select char_length(1234);              -- Cosiders numbers as a charcater
select char_length(-1234);             -- Cosiders '-'sign as well 
select char_length('Rutuja  Kelkar') AS CodePointOfString;

-- Negative scenarios:
select char_lenght();                -- 1305 error 
select char_lenght('');              -- 1305 error
select char_length(' ');             -- Considrs white space while returing output.
select char_length(null);            -- returns a null for an null input




