MYSQL

Fer drop schema de ts1 i executar:





SET GLOBAL time_zone = '-3:00';

CREATE DATABASE ts1; 

USE ts1;

CREATE TABLE users (
name CHAR(24),
surname CHAR(24),
gender CHAR(24),
bdate CHAR(24),
usr CHAR(24),
mail CHAR(24),
pwd CHAR(24),
PRIMARY KEY (usr));

INSERT INTO users (name,surname,gender,bdate,usr,mail,pwd) VALUES ('name','surname','gender','bdate','usr','mail','pwd');

SELECT * FROM users;