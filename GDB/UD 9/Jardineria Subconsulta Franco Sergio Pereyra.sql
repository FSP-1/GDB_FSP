/* Con operadores básicos de comparación*/
/*1*/
SELECT CONCAT_WS(' ',cliente.nombre_cliente,cliente.apellido_contacto) AS cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito)
                        FROM cliente);

/*2*/
SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta)
                        FROM producto);
         
/*3*/
SELECT producto.codigo_producto,  t.numero_unidades
FROM producto INNER JOIN  
 (SELECT detalle_pedido.codigo_producto ,SUM(detalle_pedido.cantidad) AS numero_unidades
                                  FROM detalle_pedido 
                                  GROUP BY  detalle_pedido.codigo_producto) as t
ON producto.codigo_producto = t.codigo_producto;
