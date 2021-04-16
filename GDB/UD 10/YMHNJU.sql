-- Optimización --

Explain
SELECT AVG(total)
FROM pago
WHERE YEAR(fecha_pago) = 2008;

Explain
SELECT AVG(total)
FROM pago
WHERE fecha_pago >= '2010-01-01' AND fecha_pago <= '2010-12-31';CREATE INDEX idx_year ON pago(total);
SHOW INDEX FROM pago;
/*EjemploNº1*/
EXPLAIN
SELECT nombre_contacto, telefono
FROM cliente
WHERE pais = 'France';
 
Show index from cliente;

DESCRIBE
cliente;

CREATE INDEX idx_pais ON cliente(pais);

/*EjemploNº2*/
CREATE FULLTEXT INDEX inx_nombre_descripcion ON producto(nombre,descripcion);

 show index from producto;

  DROP INDEX inx_nombre_descripcion ON producto;
  
/*7.1*/
-- 5 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('planta' IN NATURAL LANGUAGE MODE);
-- 5 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('planta' IN BOOLEAN MODE);
-- 131 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('planta' WITH QUERY EXPANSION);

/*7.2*/
-- 17 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('planta*' IN BOOLEAN MODE);

/*7.3*/
-- 1 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('planta*' IN BOOLEAN MODE)
AND (descripcion LIKE 'planta%' OR nombre LIKE 'planta%');
/*7.4*/
-- 80 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('tronco arbol' IN NATURAL LANGUAGE MODE);
-- 80 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('tronco arbol' IN BOOLEAN MODE);
-- 158 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('tronco arbol' WITH QUERY EXPANSION);

/*7.5*/
-- 80 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('+tronco +arbol' IN NATURAL LANGUAGE MODE);
-- 40 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('+tronco +arbol' IN BOOLEAN MODE);
-- 158 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('+tronco +arbol' WITH QUERY EXPANSION);

/*7.6*/
-- 7 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('+tronco -arbol' IN BOOLEAN MODE);

/*7.7*/
-- 5 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('"proviene de las costas"' IN NATURAL LANGUAGE MODE);
-- 5 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('"proviene de las costas"' IN BOOLEAN MODE);
-- 120 --
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('"proviene de las costas"' WITH QUERY EXPANSION);
