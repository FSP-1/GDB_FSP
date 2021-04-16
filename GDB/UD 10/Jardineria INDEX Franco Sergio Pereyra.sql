/*1*/

DESCRIBE producto;
SHOW INDEX FROM producto;

/*2*/

-- type const y rows = 1 --
EXPLAIN
SELECT *
FROM producto
WHERE codigo_producto = 'OR-114'; 
 
-- type ALL y rows = 276 --
EXPLAIN 
SELECT *
FROM producto
WHERE nombre = 'Evonimus Pulchellus';

/*3*/
CREATE INDEX idx_year ON pago(fecha_pago);
DROP INDEX idx_year ON pago;

Explain
SELECT AVG(total)
FROM pago
WHERE YEAR(fecha_pago) = 2008;

Explain
SELECT AVG(total)
FROM pago
WHERE fecha_pago >= '2010-01-01' AND fecha_pago <= '2010-12-31';CREATE INDEX idx_year ON pago(total);
SHOW INDEX FROM pago;

-- Los dos son de igual de eficientes --

/*4*/
CREATE  INDEX idx_nombre_cliente ON cliente(nombre_cliente);
DROP INDEX idx_nombre_cliente ON cliente;
SHOW INDEX FROM cliente;

EXPLAIN
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE  cliente.nombre_cliente LIKE 'A%';

/*5*/

EXPLAIN
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A%';

EXPLAIN
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A';

-- No se pueden optemizar las consultas, por que tienen que revisar toda la tabla para devolverte la consulta perfectamente --