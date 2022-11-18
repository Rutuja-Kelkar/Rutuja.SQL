-- /* CODE TO CREATE DATABASE "my_network" */
-- create database my_network CHARACTER SET utf8 COLLATE utf8_general_ci;

-- /* CODE TO USE AND CREATE TABLE "contact_list" inside "my_network" DATABASE SCHEMA */
-- use my_network;
-- create table my_contact_list
-- 	( contact_id smallint unsigned AUTO_INCREMENT,
-- 	  first_name char (50),
--       last_name char (50),
--       type_of_contact ENUM('professional','personnel'),
--       how_can_i_help_the_contact varchar(200),
--       how_contact_last_remembers_me varchar(200s),
--       how_contact_can_benefit_from_me varchar(200), 	
--       how_imp_am_i_to_the_contact ENUM('lifeline','high','medium','low','not important'),
--       contact_urgency_status ENUM('pastly_used','presently_using','for_immidiate_use','low','future_use'),
--       status_of_contact_establishment ENUM('discovery_lead1','discovery_lead2','initial_contact_established','medium_contact_established','strong_contact_established','ready_for_conversion'),
--       connected_for varchar(200),
--       initial_touchpoint varchar(200),
--       relationship_wih_contact char (50),
--       relationship_document varchar(200),
--       industry varchar(200),
--       best_in_which_field varchar(200),
--       present_title char (50),
--       pesent_company_or_other char (50),
--       email char (50),
--       contact_no int unsigned,
--       location char (50),
--       website varchar(200),
--       twitter char (50),
--       linkedln char(50),
--       likes varchar(200),
--       dislikes varchar(200),
--       basic_motivation varchar(200),
-- 	  immediate_goals_of_contact varchar(200),
--       long_term_goals varchar(200),
--       last_updated datetime,
--       CONSTRAINT pk_my_contact_list PRIMARY KEY (contact_id)
-- 	);
--     
-- /* Indexing */
-- use my_network;
-- EXECUTE sp_helpindex my_contact PRIMARY


-- /* CODE TO DESCRIBE THE contact_list table : */
-- desc my_contact_list

-- /* sql string functions */
-- INSERT INTO my_contact_list (first_name)
-- value ('Rutuja');
-- USE my_network;
-- SELECT first_name, char_length(first_name) AS LengthOffirst_name FROM my_contact_list;


-- /* Inserting recorfs in my contact list */
-- INSERT INTO my_contact_list (first_name, last_name) 
-- VALUES ('Rutuja','Kelkar')
-- -- View the added values :
-- SELECT * FROM my_contact_list WHERE first_name='Rutuja';
-- -- purge added value where name = Rutuja :
-- DELETE FROM my_contact_list WHERE first_name='Rutuja';
-- DELETE 

-- /* Updating records in my SQL */






-- -- CODE TO ALTER TABLE :
-- -- Alter table contact_list Modify contact_id SMALLINT UNSIGNED AUTO_INCREMENT;

-- -- DISPLAY CREATED TABLE :
-- SELECT * FROM contact_list;


-- -- CODE FOR FILE LOAD :
-- -- LOAD DATA INFILE 'C:/Users/Rutuja Kelkar/Downloads/my_contacts.csv' 
-- -- INTO TABLE contact_list
-- -- FIELDS TERMINATED BY ',' 
-- -- ENCLOSED BY '"'
-- -- LINES TERMINATED BY '\n'
-- -- IGNORE 1 ROWS;	

-- -- use my_network;
-- SELECT * FROM contact_list;


CREATE DATABASE PERSON;

Use PERSON;
CREATE TABLE PERSON 
( person_id smallint unsigned,
first_name varchar(20),
last_name varchar(20),
eye_colour ENUM('BR','BL','GR'),
birth_date date,
street varchar(30),
city varchar(30),
state varchar(20),
country varchar(20),
postal_code varchar(20),
CONSTRAINT pk_person PRIMARY KEY (person_id)
); 

ALTER TABLE person MODIFY person_id smallint UNSIGNED auto_increment;
set foreign_key_checks=0;
set foreign_key_checks=1;
SELECT @@sql_mode;
SET SESSION sql_mode='NO_AUTO_VALUE_ON_ZERO';
DESC person;

use person;
CREATE TABLE fav_food
( person_id smallint unsigned, 
food varchar(20),
constraint pk_fav_food PRIMARY KEY(person_id, food),
constraint fk_fav_food foreign key(person_id) REFERENCES person (person_id)
);

desc fav_food;

INSERT INTO person(person_id, first_name, last_name, eye_colour, birth_date) VALUES (null, 'William','Turner', 'BR', '1972-05-27');
select person_id, first_name, last_name, birth_date from person;
select person_id, first_name, last_name, birth_date from person where person_id = 1;	

INSERT INTO fav_food(person_id,food) VALUES (1,'pizza');
INSERT INTO fav_food(person_id,food) VALUES (1,'cookies');
INSERT INTO fav_food(person_id,food) VALUES (1,'nachos');
SELECT person_id, food from fav_food;
SELECT food from fav_food where person_id=1 ORDER BY food;

INSERT INTO person
(person_id, first_name, last_name, eye_colour, birth_date,street, city, state, country, postal_code)
VALUES (null, 'Susan','Smith', 'BL', '1975-11-02','23 Maple St.', 'Arlington', 'VA', 'USA', '20220');
SELECT person_id, first_name from person where first_name="Susan" & "William";
Select * from person;

INSERT INTO person
(person_id, first_name, last_name, eye_colour, birth_date,street, city, state, country, postal_code)
VALUES (null, 'Alan','Simonek', 'BL', '1975-11-02','23 Maple St.', 'Arlington', 'VA', 'USA', '20220');
SELECT person_id, first_name from person where first_name="Susan" & "William"& "Alan";


UPDATE person SET street = '1225 Tremont St.',
city = 'Boston',
state = 'MA',
country = 'USA',
postal_code = '02138'
WHERE person_id = 1;
SELECT * FROM person WHERE person_id = 1;


DELETE from person where person_id=3;


Update person set eye_colour='ZZ' where person_id=1;
UPDATE person
SET birth_date = str_to_date('DEC-21-1980' , '%b-%d-%Y')
WHERE person_id = 1;



	
drop database person;
drop table person;
drop table fav_food;
show tables;

desc customer;

