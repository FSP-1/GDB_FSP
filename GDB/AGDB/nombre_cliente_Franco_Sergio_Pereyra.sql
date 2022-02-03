CREATE DEFINER=`root`@`%` PROCEDURE `nombre_cliente`(
IN  codigo_cliente INTEGER, 
OUT nombre VARCHAR(50),  
OUT total_gastado DECIMAL(15, 2))
BEGIN
SELECT cliente.nombre_cliente,SUM(precio_unidad * cantidad) AS total_pagado
FROM detalle_pedido INNER JOIN pedido
ON detalle_pedido.codigo_pedido = pedido.codigo_pedido
INNER JOIN cliente
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.codigo_cliente = codigo_cliente
group by cliente.codigo_cliente
INTO nombre, total_gastado;
END