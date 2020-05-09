MYSQL

Fer drop schema de ts1 i executar:





SET GLOBAL time_zone = '-3:00';

CREATE DATABASE ts1; 

USE ts1;

CREATE TABLE users (
name CHAR(24),
surname CHAR(24),
gender CHAR(24),
birthday CHAR(24),
userName CHAR(24),
email CHAR(24),
pwd CHAR(24),
PRIMARY KEY (userName));

INSERT INTO users (name,surname,gender,birthday,userName,email,pwd) VALUES ('name','surname','gender','birthday','userName','email','pwd');

SELECT * FROM users;