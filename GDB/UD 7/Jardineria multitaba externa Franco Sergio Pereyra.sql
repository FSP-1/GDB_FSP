/* 1 */
/* LEFT JOIN */
SELECT cliente.nombre_cliente, cliente.apellido_contacto 
FROM cliente LEFT JOIN pago
ON cliente.codigo_cliente  = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;
/* RIGHT JOIN  */
SELECT cliente.nombre_cliente, cliente.apellido_contacto
FROM pago RIGHT JOIN  cliente
ON cliente.codigo_cliente  = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;

/* 2 */
/* LEFT JOIN */
SELECT cliente.nombre_cliente, cliente.apellido_contacto 
FROM cliente LEFT JOIN pedido
ON cliente.codigo_cliente  = pedido.codigo_cliente
WHERE pedido.codigo_cliente IS NULL;
/* RIGHT JOIN  */
SELECT cliente.nombre_cliente, cliente.apellido_contacto 
FROM pedido RIGHT JOIN  cliente
ON cliente.codigo_cliente  = pedido.codigo_cliente
WHERE pedido.codigo_cliente IS NULL;

/* 3 */
/* LEFT JOIN */
SELECT cliente.*
FROM cliente LEFT JOIN pedido
ON cliente.codigo_cliente  = pedido.codigo_cliente
LEFT JOIN pago
ON cliente.codigo_cliente  = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL AND pedido.codigo_cliente IS NULL;
/* RIGHT JOIN  */
SELECT cliente.* 
FROM pedido RIGHT JOIN  cliente
ON cliente.codigo_cliente  = pedido.codigo_cliente
LEFT JOIN  pago  
ON cliente.codigo_cliente  = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL AND pedido.codigo_cliente IS NULL;

/* 4 */
/* LEFT JOIN */
SELECT empleado.*
FROM empleado LEFT JOIN   oficina
ON oficina.codigo_oficina  = empleado.codigo_oficina
WHERE oficina.codigo_oficina IS NULL;
/* RIGHT JOIN  */
SELECT empleado.*
FROM oficina RIGHT JOIN  empleado 
ON oficina.codigo_oficina  = empleado.codigo_oficina
WHERE oficina.codigo_oficina  IS NULL;

/* 5 */
/* LEFT JOIN */
SELECT empleado.*
FROM empleado LEFT JOIN  cliente
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
WHERE cliente.codigo_empleado_rep_ventas  IS NULL;
/* RIGHT JOIN  */
SELECT empleado.*
FROM cliente RIGHT JOIN empleado 
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
WHERE cliente.codigo_empleado_rep_ventas  IS NULL;

/* 6 */
/* LEFT JOIN */
SELECT empleado.*,oficina.*
FROM empleado LEFT JOIN  cliente
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas
INNER JOIN oficina
ON oficina.codigo_oficina  = empleado.codigo_oficina
WHERE cliente.codigo_empleado_rep_ventas  IS NULL;
/* RIGHT JOIN  */
SELECT empleado.*,oficina.*
FROM cliente RIGHT JOIN empleado 
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
INNER JOIN oficina
ON oficina.codigo_oficina  = empleado.codigo_oficina
WHERE cliente.codigo_empleado_rep_ventas  IS NULL;

/* 7 */
/* LEFT JOIN */
SELECT empleado.*
FROM empleado LEFT JOIN  oficina
ON oficina.codigo_oficina  = empleado.codigo_oficina
LEFT JOIN  cliente
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
WHERE cliente.codigo_empleado_rep_ventas IS NULL;
/* RIGHT JOIN  */
SELECT empleado.*
FROM oficina RIGHT JOIN  empleado 
ON oficina.codigo_oficina  = empleado.codigo_oficina
WHERE oficina.codigo_oficina  IS NULL
UNION
SELECT empleado.*
FROM cliente RIGHT JOIN empleado 
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
WHERE cliente.codigo_empleado_rep_ventas  IS NULL;

/* 8 */
/* LEFT JOIN */
SELECT producto.*
FROM producto LEFT JOIN  detalle_pedido
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
LEFT JOIN pedido
ON detalle_pedido.codigo_pedido  = pedido.codigo_pedido
WHERE pedido.codigo_pedido  IS NULL;
/* RIGHT JOIN  */
SELECT producto.*
FROM detalle_pedido RIGHT JOIN   producto
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
LEFT JOIN pedido
ON detalle_pedido.codigo_pedido  = pedido.codigo_pedido
WHERE pedido.codigo_pedido  IS NULL;

/* 9 */
/* LEFT JOIN */
SELECT producto.nombre, producto.descripcion, gama_producto.imagen
FROM producto LEFT JOIN  detalle_pedido
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
LEFT JOIN pedido
ON detalle_pedido.codigo_pedido  = pedido.codigo_pedido
INNER JOIN gama_producto
ON producto.gama = gama_producto.gama
WHERE pedido.codigo_pedido  IS NULL;
/* RIGHT JOIN  */
SELECT producto.nombre, producto.descripcion, gama_producto.imagen
FROM detalle_pedido RIGHT JOIN   producto
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
LEFT JOIN pedido
ON detalle_pedido.codigo_pedido  = pedido.codigo_pedido
INNER JOIN gama_producto
ON producto.gama = gama_producto.gama
WHERE pedido.codigo_pedido  IS NULL;

/*10*/
/* LEFT JOIN */
SELECT DISTINCT oficina.*
FROM empleado LEFT JOIN oficina
ON oficina.codigo_oficina  = empleado.codigo_oficina
INNER JOIN  cliente 
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN detalle_pedido
ON detalle_pedido.codigo_pedido  = pedido.codigo_pedido
INNER JOIN producto
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
WHERE producto.gama ='Frutales';
/* RIGHT JOIN  */
SELECT DISTINCT oficina.*
FROM oficina RIGHT JOIN  empleado
ON oficina.codigo_oficina  = empleado.codigo_oficina
INNER JOIN  cliente 
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN detalle_pedido
ON detalle_pedido.codigo_pedido  = pedido.codigo_pedido
INNER JOIN producto
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
WHERE producto.gama ='Frutales';

/*11*/
/* LEFT JOIN */
SELECT DISTINCT cliente.*
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente  = pedido.codigo_cliente
LEFT JOIN pago
ON cliente.codigo_cliente  = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;
/* RIGHT JOIN  */
SELECT DISTINCT cliente.*
FROM  pago RIGHT JOIN  cliente
ON cliente.codigo_cliente  = pago.codigo_cliente
INNER JOIN pedido
 ON cliente.codigo_cliente  = pedido.codigo_cliente
WHERE pago.codigo_cliente IS NULL;

/* 12 */
/* LEFT JOIN */
SELECT empleado.codigo_empleado,CONCAT_WS(' ',empleado.nombre, empleado.apellido1, empleado.apellido2) AS empleado, jefe.codigo_empleado, CONCAT_WS(' ',jefe.nombre, jefe.apellido1, jefe.apellido2) AS jefe 
FROM empleado LEFT JOIN  cliente
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
INNER JOIN empleado AS jefe
ON empleado.codigo_jefe = jefe.codigo_empleado
WHERE cliente.codigo_empleado_rep_ventas  IS NULL;
/* RIGHT JOIN  */
SELECT empleado.codigo_empleado,CONCAT_WS(' ',empleado.nombre, empleado.apellido1, empleado.apellido2) AS empleado, jefe.codigo_empleado, CONCAT_WS(' ',jefe.nombre, jefe.apellido1, jefe.apellido2) AS jefe
FROM cliente RIGHT JOIN empleado 
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
INNER JOIN empleado AS jefe
ON empleado.codigo_jefe = jefe.codigo_empleado
WHERE cliente.codigo_empleado_rep_ventas  IS NULL;
