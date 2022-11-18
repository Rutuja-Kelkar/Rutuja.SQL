CREATE DATABASE PERSONA;


USE PERSONA;
CREATE TABLE person
	( person_id smallint unsigned,
	  first_name varchar(20),
      last_name varchar(20),
      eye_color ENUM('BR','BL','GR'),
      birth_date date,
      street varchar(30),
      city varchar(20),
      state varchar(20),
      country varchar(20),
      postal_code varchar(20),
      CONSTRAINT pk_person PRIMARY KEY (person_id)
	);

desc person;


    
