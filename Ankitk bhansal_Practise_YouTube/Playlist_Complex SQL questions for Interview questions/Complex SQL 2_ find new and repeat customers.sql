/*
ANKIT BHANSAL YOUTUV=BE PLAYLIST
-- https://www.youtube.com/watch?v=MpAMjtvarrc&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=2


GIVEN DATABSE AND TABLE :
-- "customer_orders" in "temp" database


PROBLEM DESCRIPTION :
-- Consider you have a website and you want to see everyday how many new customer andm ow many repeat customers are coming 
-- use data set "customer_orders"
-- Given data set contains follwing columns 
      order_id
    , customer_id
    , order_date
    , order_amount


EXPECTED OUTPUT :
-- Find count of new and repeat customers
-- example output columns and data (below date is derived from "customer_orders" table) 
    order_date, new_customer_count, repeat_customer_count
    2022-01-01, 3, 0   -- if 2022-01-01 is first day of website launch, then all 3 are new customers
    2022-01-02, 1, 2   -- On 2022-01-02 1 repeat customer and 2 new customers
    2022-01-03, 2, 1   -- On 2022-01-03 2 repat customers and 1 new customer 
    
   


LOGOCAL STEPS TO SOLVE ABOVE PROBLEM :
Step 1) Find the date of website launch, assume 2022-01-01 from given date
Step 2) Derive customer_id and "first_visit_date" from customer_orders table
        -- Logic for above - min(order_date)
        -- create a virtual table using cte with as first_visit_virtual_table
Step 3) Join above table with original "customer_orders" table
Step 4) 


PROBLEMS / ERROS FACED WHILE SOLVING THE ORIGINAL CODE 
1) 1604 due to with cte expression
*/
-- Select "temp" database 
use temp;        

         
-- Create "customer_orders" table
CREATE TABLE customer_orders (
    order_id integer,
    customer_id integer,
    order_date date,
    order_amount integer
);


-- Retrive all records from customers table
SELECT * 
FROM customer_orders;


-- Insert records to "customer_orders" table
INSERT INTO customer_orders 
VALUES
     (1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
    ,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
    ,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

-- LOGIC CODE
WITH first_visit_virtual_table AS
(SELECT 
      customer_id
    , min(order_date) as first_visit_date
FROM
customer_orders
group by customer_id)





