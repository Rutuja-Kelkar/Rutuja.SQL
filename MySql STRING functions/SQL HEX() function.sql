-- HEX() function : 
-- Takes in input arguement as a string or numeric 

-- Hex(str) : 
-- returns a hexadeximal string representation for string arguement
-- where each byte of each character is converted into 2 hexadeciaml digits.
-- Multibyte character therfore take more than 2 hexadecimal digits 
-- The inverse of this is performed by UNIHEX() function 

-- Hex(N) :
-- returns hexadeciaml string representation of the value treated as a lonlong (BIGINT)
-- HEX(N) is equivalent to CONV(N,10,16)
-- Inverse of this operation iis perormed by CONV(HEX(N),16,10)


-- Positive scenarios :
select hex('abc'), unhex(hex('abc'));       -- check why is unhex retuning a blob
select hex('');                             -- returns an empty string arguememnt
select hex(null);                           -- returns null  for null string arguement
select hex('dbhevffvecf7879igh[[]]');
select hex('++++\'');                       
select hex(13324);                          
select hex(0);                              
select hex(01010);                          


select hex('01010');



-- negative scenarios: 
select hex('dnh','bydg');                  -- 1582, incorrect parameter count 
select hex(abc);                           -- 1504, abc column field unknon

