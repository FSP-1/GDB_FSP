/*8*/
CREATE  INDEX idx_nombre_cliente ON cliente(apellido_contacto,nombre_contacto);
DROP INDEX idx_nombre_cliente ON cliente;
SHOW INDEX FROM cliente;

/*9*/
/*9.1*/
-- ROWS 1 --	
EXPLAIN
SELECT *
FROM cliente
WHERE nombre_contacto = 'Javier' AND apellido_contacto = 'Villar';

/*9.2*/
-- ROWS 1 --	
EXPLAIN
SELECT *
FROM cliente
WHERE apellido_contacto = 'Villar';

/*9.3*/
-- ROWS 36 --	
EXPLAIN
SELECT *
FROM cliente
WHERE nombre_contacto = 'Javier';