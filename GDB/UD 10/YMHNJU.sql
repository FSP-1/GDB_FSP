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


CREATE FULLTEXT INDEX inx_nombre_descripcion ON producto(nombre,descripcion);

 show index from producto;

  DROP INDEX inx_nombre_descripcion ON producto;

Explain
SELECT *
FROM producto
WHERE MATCH (nombre,descripcion) AGAINST ('A*' IN BOOLEAN MODE);

EXPLAIN SELECT *
FROM producto
WHERE nombre LIKE '%semilla%' OR descripcion LIKE '%semilla%';