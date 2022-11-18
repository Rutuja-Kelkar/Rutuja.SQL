-- FIELD() function :
-- returns the integer output for position of string 1, in a list of string areguements passed
-- FIELD('str,'string 1','string 2'.....)
-- returns 0 if string is not found
-- If all arguements are passed as strings, then all arguememnts are companred as strings
-- If all the argurmmnts passed are numbers, then all arguments are compared as numbers 
-- If arguements contain string and nunbers then they are passed as double
-- If str is passed as null then returns 0, since null fails equality comparison withn anyvalue 
-- Field() is complement of elt()
-- field return value is an integer
-- indexing of string list starts from 1


-- Positive scenarios :
select field('A','A','B');                -- returns integer value of string position in a list of string argueents passed
select field(4,5,7,4,4);                  -- returns position value of 4 of the first occurance 
select field(3,'a',3);                    -- takes input as double arguements 
select  field(33,77);                     -- returns zero is str value is not found 
select field(null,2,2);                   -- returns 0, since any value compared to null is zero
select field(1,null,null);                -- returns 0, same as above
select field(+,757);
select field('+','Rutuja');
select field('a','aa','b');               -- returns zero since 'a' since is not found in strings


-- negative scenarios : 
select field(null);                      -- 1582, Incorrect parmeter 
select field(+,757);                     -- 1604, Incorrect syntax
select field(bhjcbhcw,bhcwvgh);          -- 1054, unknown column
select field();                          -- 1582, Incorrect parameter 
select field(_);                         -- 1064, incorrect syntax
     
