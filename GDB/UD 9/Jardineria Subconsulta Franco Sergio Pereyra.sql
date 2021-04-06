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
SELECT producto.codigo_producto, producto.nombre, MAX(t.numero_unidades)
FROM producto INNER JOIN  
 (SELECT detalle_pedido.codigo_producto ,SUM(detalle_pedido.cantidad) AS numero_unidades
                                  FROM detalle_pedido 
                                  GROUP BY  detalle_pedido.codigo_producto) as t
ON producto.codigo_producto = t.codigo_producto
GROUP BY producto.codigo_producto;

/*4*/
SELECT *
FROM cliente
WHERE limite_credito > (
   SELECT total
   FROM pago
   WHERE pago.codigo_cliente = (
      SELECT cliente.codigo_cliente
      FROM cliente
      WHERE pago.codigo_cliente = cliente.codigo_cliente));

/*5*/
SELECT *
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock)
                        FROM producto);
                        
/*6*/
SELECT producto.codigo_producto, producto.nombre, MIN(t.numero_unidades)
FROM producto INNER JOIN  
 (SELECT detalle_pedido.codigo_producto ,SUM(detalle_pedido.cantidad) AS numero_unidades
                                  FROM detalle_pedido 
                                  GROUP BY  detalle_pedido.codigo_producto) as t
ON producto.codigo_producto = t.codigo_producto
GROUP BY producto.codigo_producto;

/*7*/
SELECT CONCAT_WS(' ',empleado.nombre,empleado.apellido1,empleado.apellido2) AS empleado, empleado.email
FROM empleado INNER JOIN empleado AS jefe
ON empleado.codigo_jefe = jefe.codigo_empleado
WHERE  jefe.codigo_empleado = (SELECT  DISTINCT(jefe.codigo_empleado)
FROM empleado INNER JOIN empleado AS jefe
ON empleado.codigo_jefe = jefe.codigo_empleado where  jefe.nombre= 'Alberto '  );
                       
/*Subconsultas con ALL y ANY*/
/*8*/
SELECT *
FROM  cliente
WHERE limite_credito >= ALL (SELECT limite_credito
                     FROM  cliente);
/*9*/				
SELECT *
FROM producto
WHERE precio_venta >= ALL (SELECT precio_venta
        FROM producto);
/*10*/

/*Subconsultas con IN y NOT IN*/    
/*11*/
SELECT CONCAT_WS(' ',empleado.nombre,empleado.apellido1) AS empleado, puesto
FROM empleado
WHERE empleado.codigo_empleado NOT IN (SELECT cliente.codigo_empleado_rep_ventas
	FROM  cliente);
    
/*12*/
SELECT *
FROM cliente
WHERE codigo_cliente NOT IN (SELECT pago.codigo_cliente
	FROM  pago);

/*13*/
SELECT *
FROM cliente
WHERE codigo_cliente  IN (SELECT pago.codigo_cliente
	FROM  pago);
    
/*14*/
SELECT *
FROM detalle_pedido 
WHERE codigo_pedido  NOT IN (SELECT pedido.codigo_pedido
	FROM  pedido);
    
/*15*/
SELECT CONCAT_WS(' ',empleado.nombre,empleado.apellido1,empleado.apellido2) AS empleado, empleado.puesto, oficina.telefono
FROM empleado INNER JOIN oficina
ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE empleado.codigo_empleado NOT IN (SELECT cliente.codigo_empleado_rep_ventas
	FROM  cliente);
 
/*16*/ 
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
WHERE producto.gama ='Frutales' AND oficina.codigo_oficina NOT IN (SELECT empleado.codigo_oficina
	FROM  empleado);

 /* Subconsultas con EXISTS y NOT EXISTS*/     
/*17*/
SELECT *
FROM cliente
WHERE NOT EXISTS (SELECT pago.codigo_cliente
	FROM  pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente );
    
/*18*/
SELECT *
FROM cliente
WHERE  EXISTS (SELECT pago.codigo_cliente
	FROM  pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente );
    
/*19*/
SELECT *
FROM detalle_pedido 
WHERE  NOT EXISTS (SELECT pedido.codigo_pedido
	FROM  pedido 
    WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido);
    
/*20*/
SELECT *
FROM detalle_pedido 
WHERE   EXISTS (SELECT pedido.codigo_pedido
	FROM  pedido 
    WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido);
