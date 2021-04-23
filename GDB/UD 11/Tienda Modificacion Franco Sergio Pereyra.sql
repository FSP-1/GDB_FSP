/*1*/
INSERT INTO fabricante VALUES (20,'Almido Brakers');

/*2*/
INSERT INTO fabricante(nombre) VALUES ('Rofa g');

/*3*/
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES (12,'Galaxy 20',400,20);

SELECT *
FROM producto inner join fabricante
On producto.codigo_fabricante = fabricante.codigo;

/*4*/
CREATE TABLE fabricante_productos (
  nombre_fabricante VARCHAR(100) NOT NULL, 
  nombre_producto VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL
);

INSERT INTO fabricante_productos 
SELECT fabricante.nombre , producto.nombre,producto.precio
FROM producto inner join fabricante
On producto.codigo_fabricante = fabricante.codigo;

SELECT *
FROM fabricante_productos;

/*6*/
CREATE OR REPLACE VIEW vista_fabricante_productos AS
SELECT fabricante.nombre AS frabicante_nombre , producto.nombre AS nombre_producto,producto.precio
FROM producto inner join fabricante
On producto.codigo_fabricante = fabricante.codigo;

SELECT *
FROM vista_fabricante_productos;

/*7*/
 delete  from fabricante  where nombre = 'Asus';
-- No es posible eliminarlo por que el codigo de ASUS esta en la Foreing Key de la tabla producto --
/* Para poder eliminarlo habria que hacer esto --> 
  CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo) ON DELETE CASCADE 
); */

SELECT *
FROM fabricante;

/*8*/
 delete  from fabricante  where nombre = 'Xiaomi';
 
SELECT *
FROM fabricante;

/*9*/
 UPDATE  fabricante SET codigo = '20' where nombre = 'Lenovo';
-- No es posible modificarlo por que el codigo de Lenovo esta en la Foreing Key de la tabla producto --
/* Para poder eliminarlo habria que hacer esto --> 
  CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo) ON UPDATE CASCADE 
); */

SELECT *
FROM fabricante;

/*10*/
 UPDATE  fabricante SET codigo = '30' where  nombre = 'Huawei';
 
SELECT *
FROM fabricante; 

/*11*/
UPDATE producto
SET precio = precio + 5;

SELECT *
FROM producto;

/*12*/
DELETE FROM producto
WHERE precio < 200;

SELECT *
FROM producto;