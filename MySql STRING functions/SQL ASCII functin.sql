-- ASCII() FUNCTION : 
-- https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_ascii
-- ascii() function takes in the input as a character and returns the ascii value of that character. 
-- The input can be a literal character, a string or a  column name.
-- If input is a column name or a string it returns the ascii() value of the left most character.
-- AScii() works for 8 bit characters	
-- It is opposite of char() function


-- postive scaenarios :
SELECT ascii('Rutuja');   -- returns the ascii value of first charcater i.e leftmost character "R"; True for ACS
SELECT ascii(' ');
Select ascii('');         -- returns 0 for empty string input ;
Select ascii(null);       -- returns a null for a null input;
select ascii('R');        -- returns the ascii value for letter 'R';
select first_name, ascii(first_name) AS AsciiValueoffirst_name FROM customer; -- returns the ascii value for the first letter in column name : first_name;
select ascii(0);           -- returns ascii() value for intergers ; do not require '' as string
select ascii(12324);       -- returns ascii() value first character of the number string
select ascii(123) as 'Ascii value';
select first_name, ascii(first_name) AS 'ASCII Value of first name' from my_contact_list where ascii(first_name) > 65;
select ascii(-34);        -- takes input as negative numbers ;
select ascii(0.254);

-- negative scenarios :
select ascii();            -- error code 1604 - syntax error.
select ascii(jkjkbh);
select ascii(a);


-- Multiple queries in a select statement :
SELECT
	ascii('A') A,         -- Even if as is not used column name is set to A;
    ascii('TD') AS T;     


-- ascii() questions :
https://www.sanfoundry.com/computer-fundamentals-questions-answers-ascii/
https://www.geeksforgeeks.org/ascii-table/

-- ascii() practical applications :
https://www.quora.com/What-is-ASCII-code-where-is-it-used-and-why
https://rosieresearch.com/why-is-ascii-important/#:~:text=What%20is%20ASCII%20used%20for,their%20own%20version%20of%20languages.

-- Statement to generate ascii() function to generate 26 alphabets characters :
written a python program.

