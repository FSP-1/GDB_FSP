/*1*/
SELECT COUNT(codigo_empleado)
FROM empleado;

/*2*/
SELECT  pais, COUNT(codigo_cliente) as numero_cliente
FROM cliente
GROUP BY pais;

/*3*/
SELECT AVG(total) as total
FROM pago
WHERE fecha_pago LIKE '%2009%';
/*4*/
SELECT  estado, COUNT(codigo_pedido) as numero_pedido
FROM pedido
GROUP BY estado
ORDER BY numero_pedido DESC;

/*5*/
SELECT   MIN(precio_venta), MAX(precio_venta)
FROM producto;

/*6*/
SELECT  COUNT(codigo_cliente) as numero_cliente,empleado.codigo_oficina
FROM cliente INNER JOIN empleado
ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
GROUP BY empleado.codigo_oficina;

/*7*/
SELECT  ciudad, COUNT(codigo_cliente) as numero_cliente
FROM cliente
GROUP BY ciudad
HAVING ciudad = 'Madrid';

/*8*/
SELECT  ciudad, COUNT(codigo_cliente) as numero_cliente
FROM cliente
WHERE ciudad LIKE 'M%'
GROUP BY ciudad;


/*9*/
SELECT CONCAT_WS(' ',empleado.nombre,empleado.apellido1,empleado.apellido2) AS empleado, COUNT(codigo_cliente) as numero_cliente
FROM cliente INNER JOIN empleado
ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
GROUP BY empleado.codigo_empleado;

/*10*/
SELECT COUNT(codigo_cliente) as numero_cliente
FROM cliente RIGHT JOIN   empleado
ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE empleado.codigo_empleado IS NULL
GROUP BY empleado.codigo_empleado;

/*11*/
SELECT cliente.nombre_cliente,cliente.apellido_contacto,MAX(pago.fecha_pago),MIN(pago.fecha_pago)
FROM cliente INNER JOIN pago
ON cliente.codigo_cliente  = pago.codigo_cliente
GROUP BY cliente.codigo_cliente
ORDER BY 3 DESC;

/*12*/
SELECT detalle_pedido.codigo_pedido AS pedido, COUNT(producto.codigo_producto) as productos_que_tiene
FROM producto INNER JOIN  detalle_pedido
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
GROUP BY detalle_pedido.codigo_pedido;

/*13*/
SELECT detalle_pedido.codigo_pedido AS pedido, SUM(detalle_pedido.cantidad) as productos_total
FROM   detalle_pedido
GROUP BY detalle_pedido.codigo_pedido;

/*14*/
SELECT producto.nombre,SUM(cantidad)
FROM producto INNER JOIN  detalle_pedido
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
GROUP BY producto.codigo_producto
ORDER BY SUM(cantidad)  desc
Limit 0,20;

/*15*/
SELECT 
    SUM(precio_unidad * cantidad) 
           AS base_imponible,
    TRUNCATE((((SUM(precio_unidad * cantidad)) * 21) / 100),
        2) AS IVA,
    SUM(precio_unidad * cantidad)  +  TRUNCATE((((SUM(precio_unidad * cantidad)) * 21) / 100),
        2) AS total_facturado
FROM
    detalle_pedido; 

/*16*/
SELECT 
       SUM(precio_unidad * cantidad) 
           AS base_imponible,
    TRUNCATE((((SUM(precio_unidad * cantidad)) * 21) / 100),
        2) AS IVA,
    SUM(precio_unidad * cantidad)  +  TRUNCATE((((SUM(precio_unidad * cantidad)) * 21) / 100),
        2) AS total_facturado
FROM
    detalle_pedido
GROUP BY codigo_producto;

/*17*/
SELECT 
        SUM(precio_unidad * cantidad) 
           AS base_imponible,
    TRUNCATE((((SUM(precio_unidad * cantidad)) * 21) / 100),
        2) AS IVA,
    SUM(precio_unidad * cantidad)  +  TRUNCATE((((SUM(precio_unidad * cantidad)) * 21) / 100),
        2) AS total_facturado, codigo_producto
FROM
    detalle_pedido
GROUP BY codigo_producto
HAVING codigo_producto LIKE 'OR%';

/*18*/
SELECT DISTINCT producto.nombre,SUM(detalle_pedido.cantidad) AS unidades_vendidas,
    SUM(precio_unidad * cantidad)  +  TRUNCATE((((SUM(precio_unidad * cantidad)) * 21) / 100),
        2) AS total_facturado
FROM detalle_pedido INNER JOIN producto
GROUP BY detalle_pedido.codigo_producto ,producto.nombre
HAVING total_facturado >3000 ;


