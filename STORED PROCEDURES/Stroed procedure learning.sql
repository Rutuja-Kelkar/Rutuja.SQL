-- SYNTAX OF STORED PROCEDURES ?
/*

Basic syntax -


delimiter $$
create procedure SP_name()
begin 
end $$
Delimiter ;

*/
-- VIEWING STORED PROCEDURE 
/*
Show procedure status;               -- Shows procedure status
Show procedusre status where name like 'pattern'  -- fetches produres with matching patterns 
show procedure status where db like 'Pattern'      -- fetches procedure with matching database
*/

-- DROPPING A STORED PROCEDURE 
/* Syntax 

Drop procedure Procedure_name ();
*/




-- Exercise to create 10 stored procedures :

-- 1) Retrive all customers names with rental date due today
use sakila;
show tables;
desc rental;
desc customer;
desc store;


desc customer;
select count(*)
from customer;

Delimiter $$
Create procedure SP_GetCustomerReturnDate()
begin
Select 
	concat(c.first_name, ' ',c.last_name) as 'Customer\'s Full Name',
    r.rental_date
    from customer c
    inner join rental r
    on c.customer_id = r.customer_id
    where r.rental_date between '2005-05-24 22:53:30'
    and '2005-05-31 00:46:31';
end $$
delimiter ;

call SP_GetCustomerReturnDate();


-- 2) Get customer address --
desc customer;
desc address;
Delimiter $$
create procedure SP_CustomerAddress()
begin
select 
	concat(c.first_name, ' ',c.last_name) as "Customer\'s Full name",
    a.address as "Customer\'s Address"
    from customer c
    inner join address a
    on c.address_id = a.address_id;
end $$
delimiter ;

call SP_CustomerAddress();

-- 3)
USE temp;
DELIMITER $$
CREATE PROCEDURE SP_GetCustomerID(IN empid int)
BEGIN 

SELECT *
FROM customer
WHERE customer_id = empid;

END $$
DELIMITER ;

CALL SP_GetCustomerID();


-- What if I have to pass multiple values in arguemnets in store procedures ?









