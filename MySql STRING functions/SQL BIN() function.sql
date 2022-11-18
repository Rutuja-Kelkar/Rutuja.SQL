-- SQL BIN() FUNCTION :
-- Returns the string representation of a binary value of N, where N is a longlong (BIGINT) number.
-- returns null for a null value 
-- Nim() is equivalent to conv(N,10,12);

-- Positive scenarios :
select bin(12);             -- returns a binary value on N
select bin(136645);         -- returns a string representation of binary value of N;
select bin(-1);             -- returns a long string representation of binary value of (-1)- reason unknown;
select bin(0);              -- returns just a zero;
select bin('');             -- return a null value for empty string.
select bin(null);           -- returns a null value for null.
select BIN('1');    
select bin(' ');        

-- negative scenarios :
select bin();               -- Incorrect parameter ccount inn the call to native function 'bin'.
select bin(/);              -- 1604 suntax error 
select bin(+++);            -- 1604 suntax error 
select bin(p);              -- 1054 unknown column in p in field list.
select bin(667dswd);        -- 1054 unknown column in 667dswd in field list.
select bin(?);              -- 1604 syntax error 
select bin(0);
select bin('0');
select bin('___');
select conv(10,10,12);
select bin(10);

