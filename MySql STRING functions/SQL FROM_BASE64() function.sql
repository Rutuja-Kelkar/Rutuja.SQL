-- FROM_BASE64() function :
-- takes in input arguement as an to_base64 encoded string
-- returns a binary decoded strjing arguement which was encoded by from_base64()
-- returns null if arguement is null or is not a valid base-64 string.
-- If from_base64 is invoked using my sql client then , binary string displays hexadecimal notation
--  disable this behavior by setting the value of the --binary-as-hex to 0 when starting the mysql client. For more information about that option, see Section 4.5.1, “mysql — The MySQL Command-Line Client”.


-- Positive scenarios :
select to_base64('a'), from_base64(to_base64('a'));          -- returning a blob recheck , with this function in depth later
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