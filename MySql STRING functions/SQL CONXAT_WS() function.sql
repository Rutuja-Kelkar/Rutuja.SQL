-- CONCAT_WS() FUCTION :
-- works similar to CONCAT() function except that first arguement is a seperator for the rest of the arguements.
-- concat_ws(seperator,string 1, string 2....)
-- seperator is used to seperate the input stgring arguements
-- seperator can be a string
-- if the seperato is null, the rest is null
-- string arguements (seperator & string) can be binary or non - binary
-- if any string is binary, output is binary string 

-- positive scenarios :
select concat_ws(' ','String1','String2');    -- returns concataneted string with first string as a seperator between string 1 and string 2.
select concat_ws('1','Rutuja','Kelkar');      -- same as above 
select concat_ws('','','');                   -- Arguememnt passed as imput empty strings give an empty string output
select concat_ws(1212324,'Rutuja ',' Kelkar'); -- takes in binary input as seperator string;
select concat_ws(23672, 76475);                -- just take seperator input and that as outout, since 2nd arguement is not a string 
select concat_ws('13656','','');
select concat_ws('','A','B');
select concat_ws(null, 'Rutuja','Kelkar');   -- outputs a null for a null seperator arguement input
select  concat_ws(null, null, null);
select concat_ws(' ',123,456);             -- gives output for binary string inputs with first string as a seperator arguement 
select concat_ws(' ',123,'Rutuja');        -- output is a binary string 
select concat_ws(',',null,'Rutuja','Nidhi');     -- skips the null values 
select first_name, last_name, concat_ws(' ', first_name, last_name) from my_contact_list;

-- negative scenarios :
select concat_ws('');                        -- 1582 error , incorrect parameter count 
select concat_ws(23672t6,gyde7);             -- 1054 ,Unknown column 
select concat_ws(+++,'bvgdfge');             -- 1604 , syntax error
select concat_ws(null);                      -- 1604, incorrect syntax
Select concat_ws('ABC');                     -- 1582, incorrect parameter count
select concat_ws([][][],' Rutuja');          -- 1604, incorrect syntax
select concat_ws('Rutuja''Kelkar');          -- 1582, incorret parameter count 
select concat_ws(,,,,);                      -- 1604, incorrect syntax
select concat_ws();                          -- 1582, incorrect parameter count

