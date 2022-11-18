-- ELT() function :
-- returns the nth element of the list of strings 
-- return an string output
-- ELT(N string 1, string 2...)
-- returns null if N is leass than 1
-- ELT() is a complement of FIELD()

-- positive scenarios :
select elt(2,'A','B','C');     -- returns the 2nd element of the given list of string 
select elt('A','B','C');       -- If N is not passed as an arguement, it returns null
select elt('','','');          -- returns null for passing empty N and string arguements 
select elt('','Rutuja');       -- returns null if N value is passed as empty string 
select elt(1,'','');           -- returns the 1st value empty string arguement
select elt(100,'a','b');       -- returns null value if N>Number of string arguements passed
select elt(-1 ,'a','b');       -- returs null value if N<=0
select elt(0,'a','b');         -- returs null value if N=0
select elt(null,'a','b');      -- returns null if N=null.
select elt(null,null,null);    -- returns null if N and string is null arguements
select elt('a','b');           -- returns null if N arguement is a string 
select elt(0.3,'e','f');       -- returns null if N<0
select elt(1,1234,7890);       -- takes in input arguements as binary strings
select elt(1, first_name, last_name) from my_contact_list;    -- column input as a input arguements 

 

-- negative scenarios :
select elt(null);              -- 1582, incorrect parameter
select elt();                  -- same as above 
select elt(1,'a','b')          -- No semicolon provoded at the end 
select elt(====,'ud');         -- 1604, incorrectg syntax
select elt(++,++);             -- 1604, incorrect syntax



 