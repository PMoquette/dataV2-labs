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
}