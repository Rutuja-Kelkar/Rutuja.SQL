-- LIKE() function :
-- expr LIKE pattern [ESCAPE 'escape_characacter']
-- Returns 1 (true) or 0 (false)
-- Returns null if either expression or pattern is null 
-- A pattern need not be a literal string, it can be specified as string expression or table comlumn.
-- In the later case, the column must be defiened as one of the mysql string types.
-- Per SQL standard, like() performs comparison on per charcater basis
-- thus it can produce different result from comparison operator 

-- Positve scenarios :
select 'a' Like 'a';      -- returns 1, since expr & patterns comparison is true
select 'a' like 'b';      -- returns 0, since expr & pattern comparison is false
select 'a' like	 'aa';   
select 'ä' = 'ae' COLLATE latin1_german2_ci; 
select '' like 'a';
select null like 'a';
select 'a' like null;
select 'aa' like 'aa';
select first_name like 'Rutuja' from my_contact_list;
select last_name like 'Rutuja' from my_contact_list;
select last_name like 'Rutuja' from my_contact_list;

-- Negative scenarios :
select first_name like '';        -- 1054, unknown field '';