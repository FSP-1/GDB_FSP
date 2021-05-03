/*1*/
 INSERT INTO oficina VALUES ('ALM-ES','Almeria','España','Almeria','05670','+34 987 43 564','BLA BLA','BLA2 BLA2');
 
SELECT *
FROM oficina;
/*2*/
INSERT INTO empleado VALUES (32,'Paco ','Fezez','Parter','3456','pfezez@hotmail.es','ALM-ES',11,'Representante Ventas');

SELECT *
FROM empleado;

/*3*/
INSERT INTO cliente VALUES (39,'Foraz','Santa','Merez','8157876622','214525645','C/Paseo del Parque',NULL,'Almeria','Almeria','Spain','57640',32,100000);

SELECT *
FROM cliente;

/*4*/
INSERT INTO pedido VALUES (129,'2010-01-14','2010-01-20','2010-01-19','Entregado','El cliente llama para confirmar la fecha - Esperando al proveedor',39);

SELECT *
FROM pedido;

/*5*/
 UPDATE  cliente SET codigo_cliente = '39';
SELECT *
FROM cliente
WHERE codigo_cliente = '39';

/*6*/
DELETE FROM cliente WHERE codigo_cliente = '39';
-- No se ha eliminado el cliente ya que estaba relacionado con la tabla pedido --

/*7*/
 DELETE FROM cliente WHERE codigo_cliente  NOT IN  (SELECT pedido.codigo_cliente FROM pedido);

SELECT *
FROM cliente;

/*8*/
UPDATE producto
SET precio_venta =(precio_venta / 100)*120
WHERE codigo_producto NOT IN(SELECT codigo_producto
FROM detalle_pedido); 

SELECT * FROM producto;
SELECT * FROM producto WHERE codigo_producto NOT IN(SELECT codigo_producto
FROM detalle_pedido); 

/*9*/
DELETE FROM pago WHERE codigo_cliente = (SELECT codigo_cliente FROM cliente WHERE limite_credito = (SELECT MIN(limite_credito) FROM cliente));

SELECT *
FROM pago;

/*10*/
UPDATE cliente
SET limite_credito = 0
WHERE codigo_cliente = (SELECT codigo_cliente
FROM pedido
WHERE codigo_pedido = (SELECT codigo_pedido  FROM detalle_pedido WHERE codigo_producto = 'OR-179' AND detalle_pedido.codigo_pedido = pedido.codigo_pedido) AND pedido.codigo_cliente = cliente.codigo_cliente);

SELECT *
FROM cliente;

/*11*/

ALTER TABLE detalle_pedido ADD iva DECIMAL NOT NULL AFTER numero_linea;

SET AUTOCOMMIT = 0;

START TRANSACTION;
UPDATE detalle_pedido
SET iva = 18
WHERE codigo_pedido = (SELECT codigo_pedido
FROM pedido
WHERE YEAR(fecha_pedido)=2009 AND detalle_pedido.codigo_pedido = pedido.codigo_pedido);


UPDATE detalle_pedido
SET iva = 21
 WHERE codigo_pedido NOT IN (SELECT codigo_pedido
FROM pedido
WHERE YEAR(fecha_pedido)=2009 AND detalle_pedido.codigo_pedido = pedido.codigo_pedido);

SELECT *
FROM detalle_pedido;

 rollback;

/*12*/

ALTER TABLE detalle_pedido ADD total_linea DECIMAL(15,2) NOT NULL AFTER iva;

UPDATE detalle_pedido
SET total_linea = precio_unidad*cantidad * (1 + (iva/100));

SELECT *
FROM detalle_pedido;

/*13*/
 DELETE FROM cliente WHERE limite_credito = (SELECT MIN(limite_credito) FROM cliente);
 
 -- No, por que no se puede especificar la eliminación o modificación de una tabla -- 

SELECT *
FROM cliente;
