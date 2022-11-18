-- TO_BASE64 function :
-- Takes in input as a string arguement.
-- returns a base 64 encoded string with connection character set and collation.
-- if arguement is not a string it converts it to string before conversion 
-- returns null if arguement is null
-- base 64 encoded strimgs can be decoded using FROM_BASE64 function
-- Encoded values consist of groups of 4 printable characters 
-- Each 3 byte of data is encoded using 4 characters.
-- If the last group is incomplete , it is padded with '=' characters of length of 4. 	
-- a new line is added after each 76 characters of encoded output into multiple lines
-- Decoding recognizes and ignore newline, carriage return , tab and space.


-- Positive scenarios :
select to_base64('a');             -- takes in input as a string and gives a string base64 encoded string
select to_base64('Rutuja')         -- same as above 
select to_base64('ABC');     
select to_base64('+++++++');       -- Takes in special charcaters as string input arguements 
select to_base64(']\]\]ewuygfy78');
select to_base64('526535'); 
select to_base64('     ');         -- Does not error out multi - white space
select to_base64(null);            -- returns null for null input
select to_base64('null');          
select to_base64('[][[][][64 bdhe'); 
select to_base64('');                  -- returns empty string for empty input arguement
select to_base64(' ');                 -- take in white space input arguement
select to_base64('\'');


-- Negative scenarios :
select to_base64();                -- 1582, Incoorect parameter count 
select to_base64(526535);          -- 1604, syntax error, Errors out for binary or non- string inputs 
select to_base64('526535');        -- Ideally should convert given input as string and retuen encoded output
								   -- But, Erroring out here, 1604, syntax error 
select to_base64(*-*-+);           -- 1604, syntax errors