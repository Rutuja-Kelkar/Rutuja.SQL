-- FIND_IN_SET() function :
-- FIND_IN_SET(str, strlist);
-- Returns a value in a range of 1 to N if str is in the string list consisting of N substrings.
-- A sring list is a string seperated by , characters.
-- A string constant is also called as strin literal
-- A string literal is a sequence of fixed sequence of characters 
-- A string literal can have any number of characters surrounded by double quotes 
-- If  the first string is a columnof SET() (which means set of valid values - works similar enum, except that set allows for empty values )
-- Comparison of a sting with an empty string is always a zero
-- This fiuction does not work properly if the first arguement contains a comma character




-- Observation :
-- String list and string literal are same 
-- string indexing starts from 1

-- Positive scenarios : 
select find_in_set('a','a,b,c');                  -- returns 1 , since 'a' is at first position in the string.
select find_in_set('','a,b,c');                   -- returns 0, since firs arguement is empty string.
select find_in_set(' ',' ,a,b,c');                -- returns 1, since ' ' is the first sub sting in a list of 2nd string arguement \
select find_in_set(null,'a,b,b');                 -- returns null, since first arguement is null
select find_in_set('a','null,bdef');              -- return 0, since string 'a' could not be found in list of strings 
select find_in_set('a', null);                    -- returns null since the 2nd arguementg is null
select find_in_set('','');                        -- returns 0, if both the strings are empty 
select find_in_set('Rutuja', first_name) from my_contact_list;    -- takes in arguement as a column name 
select find_in_set('++','w,y,y');                 -- returns 0, sice '++' could not be found in list of string 
select find_in_set(123,123);                      -- takes in iput as a binary string value 
select find_in_set(123,'d,b,123');                -- Works for binary input value as well







-- Negative scenarios :
select find_in_set('a','a','v');                                                     -- 1604, syntax error 
select find_in_set(+,'a,b,s');                                                       -- 1604, syntax error 
select find_in_set();                                                                -- 1582, Incorrcets parameters 
select find_in_set('''');                                                            -- 1582, iIncorrect parameter 
select find_in_set(//////);                                                          -- 1604, Incorrect suyntax