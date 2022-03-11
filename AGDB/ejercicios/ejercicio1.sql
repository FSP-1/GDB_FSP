DROP DATABASE IF EXISTS TEST;
CREATE DATABASE TEST CHARACTER SET utf8mb4;
USE TEST;

CREATE TABLE alumno (
  id INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
Primary key (id)
);
CALL insert_alumno(2,"a","a","a",@x);
SELECT @x; 
SELECT *
from alumno;
 