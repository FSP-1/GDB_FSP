/* 1 */
/* LEFT JOIN */
SELECT  CONCAT_WS(' ',cliente.nombre, cliente.apellido1 , cliente.apellido2) AS cliente ,pedido.*
FROM cliente LEFT JOIN pedido
ON cliente.id = pedido.id_cliente
ORDER BY cliente.apellido1 ASC, cliente.apellido2 ASC, cliente.nombre ASC;
/* RIGHT JOIN  */
SELECT  CONCAT_WS(' ',cliente.nombre, cliente.apellido1 , cliente.apellido2) AS cliente ,pedido.*
FROM pedido RIGHT JOIN  cliente
ON cliente.id = pedido.id_cliente
ORDER BY cliente.apellido1 ASC, cliente.apellido2 ASC, cliente.nombre ASC;

/* 2 */
/* LEFT JOIN */
SELECT  CONCAT_WS(' ',comercial.nombre, comercial.apellido1 , comercial.apellido2) AS comerciante ,pedido.*
FROM comercial LEFT JOIN pedido
ON comercial.id = pedido.id_comercial
ORDER BY comercial.apellido1 ASC, comercial.apellido2 ASC, comercial.nombre ASC;
/* RIGHT JOIN  */
SELECT  CONCAT_WS(' ',comercial.nombre, comercial.apellido1 , comercial.apellido2) AS comerciante ,pedido.*
FROM pedido RIGHT JOIN comercial
ON comercial.id = pedido.id_comercial
ORDER BY comercial.apellido1 ASC, comercial.apellido2 ASC, comercial.nombre ASC;

/* 3 */
/* LEFT JOIN */
SELECT *
FROM cliente LEFT JOIN pedido
ON cliente.id = pedido.id_cliente
WHERE pedido.id_cliente IS NULL;
/* RIGHT JOIN  */
SELECT  cliente.*, pedido.*
FROM pedido RIGHT JOIN  cliente
ON cliente.id = pedido.id_cliente
WHERE pedido.id_cliente IS NULL;

/* 4 */
/* LEFT JOIN */
SELECT *
FROM comercial LEFT JOIN pedido
ON comercial.id = pedido.id_comercial
WHERE pedido.id_comercial IS NULL;
/* RIGHT JOIN  */
SELECT comercial.*, pedido.*
FROM pedido RIGHT JOIN comercial
ON comercial.id = pedido.id_comercial
WHERE pedido.id_comercial IS NULL;

/* 5 */
/* LEFT JOIN */
SELECT  CONCAT_WS(' ',cliente.nombre, cliente.apellido1 , cliente.apellido2) AS cliente ,CONCAT_WS(' ',comercial.nombre, comercial.apellido1 , comercial.apellido2) AS comerciante
FROM cliente  LEFT JOIN pedido 
ON cliente.id = pedido.id_cliente
left JOIN comercial
ON comercial.id = pedido.id_comercial
WHERE pedido.id_cliente IS NULL
UNION
SELECT  CONCAT_WS(' ',cliente.nombre, cliente.apellido1 , cliente.apellido2) AS cliente ,CONCAT_WS(' ',comercial.nombre, comercial.apellido1 , comercial.apellido2) AS comerciante
FROM comercial LEFT JOIN pedido 
ON comercial.id = pedido.id_comercial
LEFT JOIN cliente
ON cliente.id = pedido.id_cliente
WHERE pedido.id_comercial IS NULL;
/* RIGHT JOIN  */
SELECT  CONCAT_WS(' ',cliente.nombre, cliente.apellido1 , cliente.apellido2) AS cliente ,CONCAT_WS(' ',comercial.nombre, comercial.apellido1 , comercial.apellido2) AS comerciante
FROM  pedido RIGHT JOIN  cliente
ON cliente.id = pedido.id_cliente
left JOIN comercial
ON comercial.id = pedido.id_comercial
WHERE pedido.id_cliente IS NULL
UNION
SELECT  CONCAT_WS(' ',cliente.nombre, cliente.apellido1 , cliente.apellido2) AS cliente ,CONCAT_WS(' ',comercial.nombre, comercial.apellido1 , comercial.apellido2) AS comerciante
FROM pedido  RIGHT JOIN comercial 
ON comercial.id = pedido.id_comercial
LEFT JOIN cliente
ON cliente.id = pedido.id_cliente
WHERE pedido.id_comercial IS NULL;

/*6*/
-- No, porque NATURAL se utiliza en las tablas que se van a relacionar sobre aquellas columnas que tengan el mismo nombre, en estas consultas no cumplen con este requisito --
