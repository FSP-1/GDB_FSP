DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  codigo_departamento INT UNSIGNED,
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

/*1*/
/*SQL-1*/
SELECT *
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo;
/*SQL-2*/
SELECT *
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo;

/*2*/
/*SQL-1*/
SELECT *
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo
ORDER BY departamento.nombre ASC, empleado.apellido1 ASC,empleado.apellido2 ASC,empleado.nombre ASC;
/*SQL-2*/
SELECT *
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
ORDER BY departamento.nombre ASC, empleado.apellido1 ASC,empleado.apellido2 ASC,empleado.nombre ASC;

/*3*/
/*SQL-1*/
SELECT DISTINCT departamento.codigo, departamento.nombre
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo;
/*SQL-2*/
SELECT  DISTINCT departamento.codigo, departamento.nombre
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo;

/*4*/
/*SQL-1*/
SELECT DISTINCT departamento.codigo, departamento.nombre, (departamento.presupuesto - departamento.gastos) AS presupuesto_actual
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo;
/*SQL-2*/
SELECT  DISTINCT departamento.codigo, departamento.nombre
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo;

/*5*/
/*SQL-1*/
SELECT departamento.nombre
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo AND empleado.nif= '38382980M';
/*SQL-2*/
SELECT departamento.nombre
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
WHERE empleado.nif= '38382980M';

/*6*/
/*SQL-1*/
SELECT *
FROM departamento.nombre
WHERE empleado.codigo_departamento = departamento.codigo AND 
(empleado.nombre LIKE '%Pepe%' AND empleado.apellido1 LIKE '%Ruiz%' AND empleado.apellido2 LIKE '%Santana%');
/*SQL-2*/
SELECT departamento.nombre
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
WHERE empleado.nombre LIKE '%Pepe%' AND empleado.apellido1 LIKE '%Ruiz%' AND empleado.apellido2 LIKE '%Santana%';

/*7*/
/*SQL-1*/
SELECT empleado.*
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo AND departamento.nombre= 'I+D'
ORDER BY  empleado.nombre ASC;
/*SQL-2*/
SELECT empleado.*
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
WHERE departamento.nombre= 'I+D'
ORDER BY  empleado.nombre ASC;

/*8*/
/*SQL-1*/
SELECT empleado.*
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo AND departamento.nombre IN('I+D','Sistemas','Contabilidad')
ORDER BY  empleado.nombre ASC;
/*SQL-2*/
SELECT empleado.*
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
WHERE departamento.nombre IN('I+D','Sistemas','Contabilidad')
ORDER BY  empleado.nombre ASC;

/*9*/
/*SQL-1*/
SELECT empleado.nombre
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo AND (NOT departamento.presupuesto BETWEEN 100000 AND 200000);
/*SQL-2*/
SELECT empleado.nombre
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
WHERE NOT departamento.presupuesto BETWEEN 100000 AND 200000;

/*10*/
/*SQL-1*/
SELECT DISTINCT departamento.nombre
FROM empleado , departamento
WHERE empleado.codigo_departamento = departamento.codigo AND empleado.apellido2 IS NULL;
/*SQL-2*/
SELECT DISTINCT departamento.nombre
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
WHERE empleado.apellido2 IS NULL;


