DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
USE instituto;

CREATE TABLE alumno (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  fecha_nacimiento DATE NOT NULL,
  es_repetidor ENUM('sí', 'no') NOT NULL,
  teléfono VARCHAR(9)
);

INSERT INTO alumno VALUES(1, 'María', 'Sánchez',null, '1990/12/01', 'no', NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega', '1998/04/02', 'no', 618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea', '1988/01/03', 'no', NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega', '1993/06/13', 'sí', 678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López', '1995/11/24', 'no', 692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez', '1991/03/28', 'sí', NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández', 'Ramírez', '1996/09/17', 'no', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega', '1994/05/20', 'sí', 612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez', 'Hernández', '1999/07/08', 'no', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz', '1998/02/03', 'no', NULL);

SELECT nombre, REVERSE(nombre)
FROM alumno;

SELECT CONCAT_WS( ' ',nombre, apellido1,apellido2 ) AS ALUMNO, REVERSE(CONCAT_WS( ' ',nombre, apellido1,apellido2 )) AS ONMULA
FROM alumno;

SELECT UPPER(CONCAT_WS( ' ',nombre,apellido1,apellido2  )) AS ALUMNO, REVERSE (LOWER(CONCAT_WS( ' ',nombre,apellido1,apellido2  ))) AS onmula
FROM alumno;

SELECT CONCAT_WS( ' ',nombre, apellido1,apellido2 ) AS ALUMNO, CHAR_LENGTH(CONCAT_WS( nombre, apellido1,apellido2 )) AS ALUMNO_CARACTERES
FROM alumno;

SELECT CONCAT_WS( ' ',nombre, apellido1,apellido2 ) AS ALUMNO, CONCAT_WS(CONCAT_WS('.',nombre,apellido1),'','@iescelia.org') AS EMAIL
FROM alumno;

SELECT CONCAT_WS( ' ',nombre, apellido1,apellido2 ) AS ALUMNO, CONCAT_WS(CONCAT_WS('.',nombre,apellido1),'','@iescelia.org') AS EMAIL, CONCAT_WS(SUBSTR(fecha_nacimiento,1,4),'') AS CONTRASEÑA
FROM alumno;