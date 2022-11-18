-- ORD() FUNCTION :
-- https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_ord
-- If the left most character of the string is a multibyte character set then it return the code for that character
-- code character formula 
	-(1st byte of the code) + (2nd byte of the code * 255) + (3rd byte of the code * 256^2);
    


select ord('1');    -- 1 is not a multi byte character thats why ascii() and ord() output is same;
select ascii('1');

-- positive scanarios : 
select ord('String'); -- returns ascii() value of left ,ost character in the string.
select ord(first_name) from my_contact_list;  -- returns an ascii() value of the leftmost character in the string existingin first_name column
select ord('');     -- returns zero on empty string input;
select ord(null);    -- returns a null on passing a string input;
select ord(-1);      -- takes input as negative numbers
select ord(1);
select ord('-1');
select ord(ord('a')) as Output;


-- negative scanarios :
select ord('-1');    -- error code 1604 - syntax error - for negative numbers
select ord(1)       -- error code 1604 - syntax error.
select ord(a);       -- error code 1604 - syntax error.
select ord();        -- error code 1604 - syntax error.
