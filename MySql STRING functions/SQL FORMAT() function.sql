-- FORMAT() function :
-- Format(X,D,[locale])
-- X is a anumber
-- D is a deciaml point
-- locale is a formattig value 




-- positive scenarios :
select format(165.78,2);                 -- Returns a string formated to 2 decimal places 
select format(6748.909090,9);            -- returns a string with appending zero's if digits of D are greater than x
select format(12,3);                     -- returns a string appding a zero if the X is passed as an integer value without decimall points 
select format(213,0);                    -- returns a string with no fractional points 
select format(null,7);                   -- returns null if D is null
select format(9336,null);                -- returns null if D is null
select format(null,null);    
select sysdate();
select format(sysdate(),'D');



select 



-- Negative scenarios :
select format('78787878','8');          -- Does not take in input as a string , only takes as an integer or binary string
select format(994y46t55.90,2);          -- 1109, unknown field 
select format(sdffff,2);                -- 1054, unknown column
select format();                         -- 1604, syntax error 