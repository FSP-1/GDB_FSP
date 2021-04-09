/*Mi CREATE VIEW*/

CREATE OR REPLACE VIEW unidades AS
SELECT SUM(detalle_pedido.cantidad) AS total_unidad,
	    detalle_pedido.codigo_producto AS codigo_producto
      FROM detalle_pedido INNER JOIN producto  
      ON producto.codigo_producto = detalle_pedido.codigo_producto
      WHERE producto.codigo_producto = detalle_pedido.codigo_producto 
      GROUP BY detalle_pedido.codigo_producto;
      
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
SELECT producto.codigo_producto, producto.nombre, unidades.total_unidad AS numero_unidades
FROM producto INNER JOIN  unidades					
ON producto.codigo_producto = unidades.codigo_producto
WHERE unidades.total_unidad = (SELECT MAX(total_unidad) FROM unidades );

/* Con operadores básicos de comparación*/

/*4*/
EXPLAIN SELECT DISTINCT cliente.codigo_cliente, cliente.limite_credito, cliente.nombre_cliente
FROM cliente 
WHERE cliente.limite_credito > (
   SELECT SUM(total)
   FROM pago 
   WHERE pago.codigo_cliente = cliente.codigo_cliente);
   


/*5*/
SELECT *
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock)
                        FROM producto);
                        
/*6*/
SELECT producto.codigo_producto, producto.nombre, unidades.total_unidad AS numero_unidades
FROM producto INNER JOIN  unidades					
ON producto.codigo_producto = unidades.codigo_producto
WHERE unidades.total_unidad = (SELECT MIN(total_unidad) FROM unidades );

/*7*/
SELECT CONCAT_WS(' ',empleado.nombre,empleado.apellido1,empleado.apellido2) AS empleado, empleado.email, empleado.codigo_jefe
FROM empleado 
WHERE  empleado.codigo_jefe = (SELECT  codigo_empleado
FROM  empleado  
where  empleado.nombre= 'Alberto ');
                       
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
SELECT producto.codigo_producto, producto.nombre, unidades.total_unidad AS numero_unidades
FROM producto INNER JOIN  unidades					
ON producto.codigo_producto = unidades.codigo_producto
WHERE unidades.total_unidad <= ALL (SELECT total_unidad FROM unidades );

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
SELECT producto.codigo_producto
FROM producto
WHERE codigo_producto NOT IN(SELECT codigo_producto
FROM detalle_pedido);
    
/*15*/
SELECT CONCAT_WS(' ',empleado.nombre,empleado.apellido1,empleado.apellido2) AS empleado, empleado.puesto, oficina.telefono
FROM empleado INNER JOIN oficina
ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE empleado.codigo_empleado NOT IN (SELECT cliente.codigo_empleado_rep_ventas
	FROM  cliente);
 
/*16*/
SELECT *
FROM  oficina 
WHERE codigo_oficina NOT IN  (SELECT DISTINCT empleado.codigo_oficina
FROM empleado 
INNER JOIN  cliente 
ON  empleado.codigo_empleado  = cliente.codigo_empleado_rep_ventas 
INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN detalle_pedido
ON detalle_pedido.codigo_pedido  = pedido.codigo_pedido
INNER JOIN producto
ON  producto.codigo_producto  = detalle_pedido.codigo_producto
WHERE producto.gama ='Frutales');

/*17*/
SELECT *
FROM cliente
WHERE codigo_cliente NOT  IN (SELECT pago.codigo_cliente
	FROM  pago) 
    
    AND  
    
    codigo_cliente   IN (SELECT pedido.codigo_cliente
	FROM  pedido);
    
 /* Subconsultas con EXISTS y NOT EXISTS*/     
/*18*/
SELECT *
FROM cliente
WHERE NOT EXISTS (SELECT pago.codigo_cliente
	FROM  pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente );
    
/*19*/
SELECT *
FROM cliente
WHERE  EXISTS (SELECT pago.codigo_cliente
	FROM  pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente );
    
/*20*/
SELECT *
FROM detalle_pedido 
WHERE  NOT EXISTS (SELECT pedido.codigo_pedido
	FROM  pedido 
    WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido);
    
/*21*/
SELECT *
FROM detalle_pedido 
WHERE   EXISTS (SELECT pedido.codigo_pedido
	FROM  pedido 
    WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido);
