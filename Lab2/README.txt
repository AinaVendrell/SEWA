----------- MYSQL -----------

DROP SCHEMA IF EXISTS twitter;
CREATE SCHEMA IF NOT EXISTS twitter;

USE twitter;

CREATE TABLE `Users`(
    `id`  INTEGER NOT NULL AUTO_INCREMENT,
    `name`  CHAR(50) NOT NULL,
    `surname`  CHAR(50) NOT NULL,
    `gender` CHAR(50) NOT NULL,
    `birthday`  CHAR(50) NOT NULL,
    `userName`  CHAR(50) NOT NULL,
    `email`  CHAR(50) NOT NULL,
    `pwd`  CHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE(`email`),
    UNIQUE(`userName`)
);

USE twitter;

INSERT INTO `Users` (`name`, `surname`, `gender`, `birthday`, `userName`, `email`, `pwd`) VALUES
('eva', 'martos', 'mujer', '2016-01-14', 'evamartos', 'evamartos@gmail.com', 'EvMar1999'),
('aleix', 'alonso', 'hombre', '2016-01-14', 'aleixalonso', 'aleixalonso@gmail.com', 'AleAlo1999'),
('mar', 'calafato', 'mujer', '2016-01-14', 'marcalafato', 'marcalafato@gmail.com', 'MarCala1999'),
('aina', 'vendrell', 'mujer', '2016-01-14', 'ainavendrell', 'ainavendrell@gmail.com', 'AiVen1999');

SELECT * FROM Users