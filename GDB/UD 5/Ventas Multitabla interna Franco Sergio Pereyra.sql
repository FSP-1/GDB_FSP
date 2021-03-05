DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

CREATE TABLE cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoría INT UNSIGNED
);

CREATE TABLE comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comisión FLOAT
);

CREATE TABLE pedido (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  total DOUBLE NOT NULL,
  fecha DATE,
  id_cliente INT UNSIGNED NOT NULL,
  id_comercial INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);

/*1*/
/*SQL-1*/
SELECT DISTINCT (CONCAT_WS(' ',cliente.nombre, cliente.apellido1, cliente.apellido2)) AS Cliente
FROM cliente , pedido
WHERE pedido.id_cliente = cliente.id
ORDER BY Cliente ASC;
/*SQL-2*/
SELECT  DISTINCT (CONCAT_WS(' ',cliente.nombre, cliente.apellido1, cliente.apellido2)) AS Cliente
FROM cliente INNER JOIN pedido
ON  pedido.id_cliente = cliente.id
ORDER BY  Cliente ASC;

/*2*/
/*SQL-1*/
SELECT pedido.*, cliente.*
FROM cliente , pedido
WHERE pedido.id_cliente = cliente.id
ORDER BY cliente.nombre ASC, cliente.apellido1 ASC, cliente.apellido2 ASC;
/*SQL-2*/
SELECT pedido.*, cliente.*
FROM cliente INNER JOIN pedido
ON  pedido.id_cliente = cliente.id
ORDER BY cliente.nombre ASC, cliente.apellido1 ASC, cliente.apellido2 ASC;

/*3*/
/*SQL-1*/
SELECT pedido.*, comercial.*
FROM comercial , pedido
WHERE pedido.id_comercial = comercial.id
ORDER BY comercial.nombre ASC, comercial.apellido1 ASC, comercial.apellido2 ASC;
/*SQL-2*/
SELECT pedido.*, comercial.*
FROM comercial INNER JOIN pedido
ON pedido.id_comercial = comercial.id
ORDER BY comercial.nombre ASC, comercial.apellido1 ASC, comercial.apellido2 ASC;


/*4*/
/*SQL-1*/
SELECT *
FROM cliente,comercial,pedido
WHERE pedido.id_comercial = comercial.id AND pedido.id_cliente = cliente.id ;
/*SQL-2*/
SELECT  cliente.*,comercial.*, pedido.*
FROM comercial INNER JOIN pedido
ON pedido.id_comercial = comercial.id
INNER JOIN cliente
ON  pedido.id_cliente = cliente.id;

/*5*/
/*SQL-1*/
SELECT cliente.*
FROM cliente, pedido
WHERE pedido.id_cliente = cliente.id AND YEAR(pedido.fecha) = 2017 AND pedido.total BETWEEN 300 AND 1000 ;
/*SQL-2*/
SELECT  cliente.*
FROM pedido   INNER JOIN cliente
ON  pedido.id_cliente = cliente.id
WHERE DATE_FORMAT(pedido.fecha,'%Y') = 2017 AND pedido.total BETWEEN 300 AND 1000;

/*6*/
/*SQL-1*/
SELECT  CONCAT_WS(' ',comercial.nombre, comercial.apellido1, comercial.apellido2) AS Comerciante
FROM cliente,comercial,pedido
WHERE pedido.id_comercial = comercial.id AND pedido.id_cliente = cliente.id AND
cliente.nombre LIKE '%María%' AND cliente.apellido1 LIKE '%Santana%' AND cliente.apellido2 LIKE '%Moreno%' ;
/*SQL-2*/
SELECT CONCAT_WS(' ',comercial.nombre, comercial.apellido1, comercial.apellido2) AS Comerciante
FROM comercial INNER JOIN pedido
ON pedido.id_comercial = comercial.id
INNER JOIN cliente
ON  pedido.id_cliente = cliente.id
WHERE cliente.nombre LIKE '%María%' AND cliente.apellido1 LIKE '%Santana%' AND cliente.apellido2 LIKE '%Moreno%';

/*7*/
/*SQL-1*/
SELECT CONCAT_WS(' ',cliente.nombre, cliente.apellido1, cliente.apellido2) AS Cliente
FROM cliente,comercial,pedido
WHERE pedido.id_comercial = comercial.id AND pedido.id_cliente = cliente.id AND
comercial.nombre LIKE '%Daniel%' AND comercial.apellido1 LIKE '%Sáez%' AND comercial.apellido2 LIKE '%Vega%';
/*SQL-2*/
SELECT   CONCAT_WS(' ',cliente.nombre, cliente.apellido1, cliente.apellido2) AS Cliente
FROM comercial INNER JOIN pedido
ON pedido.id_comercial = comercial.id
INNER JOIN cliente
ON  pedido.id_cliente = cliente.id
WHERE comercial.nombre LIKE '%Daniel%' AND comercial.apellido1 LIKE '%Sáez%' AND comercial.apellido2 LIKE '%Vega%';