-- LCASE() function :
-- synonym of LOWER()
-- Takes in str input and retuns lowercased string output


-- positive scenarios :
select lcase('Rutuja');       -- returns lower case string output
select lower('RURBHGFR');
select lcase('rutuja');  
select lcase('+++++++');
select lcase('-=Gdcf77980');
select lcase('');             -- return empty string if input arguement is empty
select lcase(' 1');           -- Whitespace clarification
select lcase(null);           -- retyens null for null input arguement
select lcase(1234);           -- returns same output as numeric input argument



-- Negative scenarios :
select lcase();               -- 1582, Incorrect parameter count
select lcase(hjdgf);          -- 1054, Unknown column in the string 
     