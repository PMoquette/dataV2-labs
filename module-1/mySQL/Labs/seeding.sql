{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 USE lab_mysql;\
\
CREATE TABLE cars (\
	car_id int AUTO_INCREMENT PRIMARY KEY, \
	vin int, \
	manufacturer varchar(30), \
	model varchar(30),\
	year int, \
	color varchar(20)\
	);\
\
\
CREATE TABLE salesperson (\
	id int AUTO_INCREMENT PRIMARY KEY, \
	staff_id INT, \
	name varchar(30), \
	store varchar(30)\
	);\
\
\
CREATE TABLE invoices (\
	id int AUTO_INCREMENT PRIMARY KEY,\
	inv_number INT,\
	inv_date DATE,\
	car_id INT,\
	customer_id INT,\
	salesperson_id INT\
	);\
\
CREATE TABLE customers (\
	id int AUTO_INCREMENT PRIMARY KEY,\
	customer_id INT,\
	cust_name VARCHAR(30),\
	cust_phone INT,\
	cust_email VARCHAR(50),\
	cust_address VARCHAR(50),\
	city VARCHAR(30),\
	state_province VARCHAR(30),\
	country VARCHAR(30),\
	zip_postal INT\
	);	\
\
\
INSERT INTO cars (vin, manufacturer, model, year, color)\
VALUES\
('12345', 'Volkswagen', 'Tiguan', 2019, 'Blue'),\
('12346', 'Peugeot', 'Rifter', 2019, 'Red'),\
('12347', 'Ford', 'Fusion', 2018, 'White')\
;\
\
\
INSERT INTO customers (customer_id, cust_name, cust_phone, cust_email, cust_address, city, state_province, country, zip_postal)\
VALUES\
('10001', 'Pablo Picasso', '0034 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),\
('20001', 'Abraham Lincoln', '001 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),\
('30001', 'Napol\'e9on Bonaparte', '0033 1 79 75 40 00', '-', '40 Rue du Colis\'e9e', 'Paris', '\'cele-de-France', 'France', '75008')\
;\
\
ALTER TABLE customers CHANGE cust_phone cust_phone VARCHAR(50);\
\
\
INSERT INTO invoices (inv_number, inv_date, car_id, customer_id, salesperson_id)\
VALUES\
('852399038', '2018-08-22', 0, 1, 3),\
('731166526', '2018-12-31', 3, 0, 5),\
('271135104', '2019-01-22', 2, 2, 7)\
;\
\
INSERT INTO salesperson (staff_id, name, store)\
VALUES\
('1001', 'Petey Cruiser', 'Madrid'),\
('1002', 'Anna Sthesia', 'Barcelona'),\
('1003', 'Paul Molive', 'Berlin'),\
('1004', 'Gail Forcewind', 'Paris'),\
('1005', 'Paige Turner', 'Mimia'),\
('1006', 'Bob Frapples', 'Mexico City'),\
('1007', 'Walter Melon', 'Amsterdam'),\
('1007', 'Shonda Leer', 'S\'e3o Paulo')\
;}