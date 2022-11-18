use temp;

-- "Salesman" table is created
create table salesman(
salesman_id smallint auto_increment,
first_name varchar(20),
last_name varchar(20),
city varchar(20),
commision float,
constraint pk_salesman primary key(salesman_id)
);


-- "Customer" table is created 
create table customer(
customer_id int auto_increment,
customer_first_name varchar(20),
customer_last_name varchar(20),
grade int,
salesman_id smallint,
constraint pk_customer primary key(customer_id),
constraint fk_customer foreign key(salesman_id)
references salesman(salesman_id)
);


-- "orders" table is created --
create table orders(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id smallint,
constraint fk1_orders foreign key (customer_id)
references customer(customer_id),
constraint fk2_orders foreign key (salesman_id)
references salesman(salesman_id)
);





-- description of all tables created 
desc salesman;
desc customer;
desc orders;


-- Inserting data into salesman table  --
insert  into salesman(first_name, last_name, city, commision)
values ('James','Hoog','New York',0.15),
	   ('Pit','Alex','London',0.11),
	   ('Nail','Knite','Paris',0.13),
       ('Mc','Lyon','Paris',0.14),
	   ('Paul','Adam','Rome',0.13),
       ('Lauson','Hen','San Jose',0.12);


-- Inserting data into customer table  --
insert  into customer(customer_first_name, customer_last_name, customer_city, grade,salesman_id)
values ('Brad','Davis', 'New York', 200, 2 ),
('Graham','Zusi', 'California', 200, 3 ),
('Julian','Green', 'London', 300, 4 ),
('Fabian','Jason', 'Paris', 300, 5 );


-- Inserting data into orders table  --
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values
(2, 270.65, '2012-09-10', 4 ,2),
(3, 65.26, '2012-10-05', 5, 3),
(4, 110.5, '2012-08-17', 6, 4),
(5, 948.5, '2012-09-10', 7, 5);
       
       


-- Table manipulation queries --       
Alter table customer
add customer_city varchar(20);

delete from customer
where customer_id in (2,3);

       
       
-- Validating inserted data into tables;
select * from salesman;
select * from customer;
select * from orders;






-- SOLVED QUESTIONS FROM - https://www.w3resource.com/sql-exercises/sql-joins-exercises.php

-- Experimenting on table joins 
-- 1)
select 
	c.customer_id as "Customer ID",
    concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer full name',
    c.customer_city as "Customer city",
    s.salesman_id "Salesman ID",
    concat(s.first_name, ' ', s.last_name) as 'Salesman full name',
    s.city as "Salesman city"
    from customer c
inner join salesman s
on c.customer_city = s.city;

		
        
-- 2)
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    o.ord_no as 'Return order no',
    o.purch_amt as 'Customer\'s Purchase amount'
    from customer c
    inner join orders o
    on c.customer_id = o.customer_id
    where o.purch_amt between 500 and 2000;
    
-- 3 ) 

select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    concat(s.first_name, ' ', s.last_name) as 'Salesman full name',
    s.commision
    from customer c
    inner join salesman s
    on c.salesman_id = s.salesman_id;
    
    
-- 4)
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    concat(s.first_name, ' ', s.last_name) as 'Salesman full name',
    s.city as 'Salesman\'s city',
    s.commision as 'Salesman\'s commision'
from customer c
inner join salesman s
    on c.salesman_id = s.salesman_id
where c.customer_city <> s.city
and s.commision > 0.12;


-- 5)
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    concat(s.first_name, ' ', s.last_name) as 'Salesman full name',
    s.city as 'Salesman\'s city',
    s.commision as 'Salesman\'s commision'
from customer c
inner join salesman s
    on c.salesman_id = s.salesman_id
where s.commision > 0.12;


-- 6)
select 
	o.ord_no as 'Order number', 
    o.ord_date as 'Order date',
    o.purch_amt as 'Order amaount',
    concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.grade as 'Salesman\'s grade',
    s.commision as 'Salesman\'s commision'
from customer c
inner join salesman s
on c.salesman_id = s.salesman_id
inner join orders o
on s.salesman_id = o.salesman_id;

    

-- 7) 
select *
from orders
natural join customer
natural join salesman;



-- 8)
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    c.grade as 'Customer\'s grade',
    concat(s.first_name, ' ', s.last_name) as 'Salesman full name',
    s.city as 'Salesman\'s city'
from customer c
inner join salesman s
on c.salesman_id = s.salesman_id
order by c.customer_id;



-- 9)
use temp;
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    c.grade as 'Customer\'s grade',
    concat(s.first_name, ' ', s.last_name) as 'Salesman full name',
    s.city as 'Salesman\'s city'
from customer c
inner join salesman s 
on c.salesman_id = s.salesman_id
where c.grade < 300 
order by c.customer_id;

use temp;
-- 10)
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    o.ord_no as 'Order number',
    o.ord_date as 'Order date',
    o.purch_amt as 'Order amount'
from customer c
left join orders o
on c.customer_id = o.customer_id
order by o.ord_date;
    
    
	

-- 11)
use temp;
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    c.customer_city as 'Customer\'s city',
    o.ord_no as 'Order number',
    o.ord_date as 'Order date',
    o.purch_amt as 'Order amount',
    concat(s.first_name, ' ', s.last_name) as 'Salesman full name',
    s.commision as 'Sales commision'
from customer c
left outer join orders o
on c.salesman_id = o.salesman_id
left outer join salesman s
on o.salesman_id = s.salesman_id;

-- 'Customer_city' table renamed to city similar to salesman table 
alter table customer
rename column customer_city to city;
desc customer;


-- 12)
select 
	concat(c.customer_first_name, ' ', c.customer_last_name) as 'Customer\'s full name',
    concat(s.first_name, ' ', s.last_name) as 'Salesman\'s name',
    c.city as 'City'
from customer c
right join salesman s
on c.city = s.city
group by city;
-- order by s.salesman_id;


    

    
    









