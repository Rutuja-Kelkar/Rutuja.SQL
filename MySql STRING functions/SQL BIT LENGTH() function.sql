-- BIT LENGHT(str) length function :
-- returns the length of the string in bit
-- 8 bits = 1 byte
-- Returns null if str is null.
-- bit_length returns the length of the character in bits where as,
-- length() returns length of the character in bytes.
   
   
-- positive scenarios :
select bit_length('text');    -- return the bit length of the string.
select bit_length(12334);     -- return the bit length of binary string 
select bit_length('');        -- returns zero if string is empty
select bit_length(null);      -- returns null if string is null
select bit_length('2u83t4');  -- return bit length of string arguement passed.alter
select bit_length(''''); 
select bit_length(-1);        -- takes imput as negatve numbers.
Select bit_length('-1');
select bit_length('-');
select bit_length(0000000000);  -- Observe that ideally output = 8 is not expected, anythin starting with 0 gives output=8
select bit_length(01);
select bit_length('01');
select bit_length("****");

-- negative scenarios :
select bit_length(****);      -- 1604 syntax error
select bit_length(0000000000);
select bit_length(--);        -- 1604 syntax error