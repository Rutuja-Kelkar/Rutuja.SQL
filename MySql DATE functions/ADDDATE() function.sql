-- ADDDATE() function :
-- ADDDATE(date, INTERVAL epr unit)
-- ADDDATE(date, days) - treats days as integer to be added to the specified date.
-- ADDDATE() is synonym of DATE ADD()
-- Related function SUBDATE() is a synonym of DATE SUB()
-- For unit refer : https://dev.mysql.com/doc/refman/8.0/en/expressions.html#temporal-intervals


-- Positive scenarios : 
select adddate('2022-01-02', Interval 2 week);  -- Returns a date after 2 weeks ;
select adddate('2021-06-05', INTERVAL 100 MICROSECOND );
select adddate('2021-09-10',INTERVAL 60 minute );
select adddate('2021-10-03', INTERVAL 2 HOUR);
select adddate('2021-10-03', INTERVAL 2 day_minute);
select adddate('2021-09-01',30);  
select adddate(null,51);      -- returns null if date is null
select adddate('',90);        -- returns null if date is empty
select adddate(2022-12-09,13);   -- returns null id date is not provided in string format
select adddate('20222-01-01',10);  -- returns null for wrong date format
select adddate('2020-90-01',10);   -- returns null for invalid value of month
select adddate('2202-01-9090',10);  -- returns null for invalid dd value in date
select adddate('2022-01-',10);      -- returns null if date value in invalid or not provided
select adddate('--',10);      -- same as above
select adddate('2022-01-01', 1234567); -- max length of days digit =7, beyond which it return null
select addate('2022-01-01', 12345678);  -- exeeds max liit for sakila DB
select adddate('2022-01-01', '');    -- returns the date as is for an entered empty value of day entered as empty string
select adddate('2022-01-01', '10');  -- takes in input value for day as a string input;
select adddate('2022-01-01', INTERVAL 30 DAY) AS modified_date;



-- Negative scenarios : 
select adddate('2022-12-09',);   -- 1064 , syntax error
select adddate('2022-12-09' 12); -- 1064, syntax error
select adddate('2022-01-01',home);  -- 1064, unknown field list
select adddate('2020-01-01',);  -- returns same date if not specified
select adddate(0,10);
select adddate(dane,10);       -- 1054, unknown field 
select adddate('01-01-2022', Interval 3 month); -- yyyy-mm--dd format is not right



-- Practise 1 
SELECT DATE_ADD('2020-02-01', INTERVAL 2 week);
SELECT DATE_SUB('2020-01-01',INTERVAL 1 day);
SELECT DATE_ADD('2020-01-01 01:01:01', INTERVAL 1 second );
SELECT DATE_ADD('2020-01-01 01:01:01', INTERVAL 1 day );
SELECT ADDDATE('2020-01-01 01:01:01', Interval 1.1 MINUTE_SECOND); -- Either use comma or semicolon - https://dev.mysql.com/doc/refman/8.0/en/expressions.html#temporal-intervals

-- Adding of dates can also be done by 
-- date + INTERVAL expr unit
-- date - INTERVAL expr unit
-- INTERVAL can be either side of the +_ operator, but it makes no sence to add a date to an interval
-- Temporal vlaues can be used to create events - 
SELECT '2020-01-01 01:01:01' + interval 1 day;
SELECT '2020-01-01 01:01:01' - INTERVAL 1 day;
SELECT INTERVAL 1 day + '2020-01-01 01:01:01';
SELECT INTERVAL 1 day - '2020-01-01 01:01:01'; -- makes no sense