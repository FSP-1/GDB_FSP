/*14*/
 INSERT INTO oficina VALUES ('GRA-ES','Granada','España','Granada','02395','+34 977 32 643','BLA BLA','BLA2 BLA2');
 
INSERT INTO empleado VALUES (32,'Paco ','Fezez','Parter','3456','pfezez@hotmail.es','GRA-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (33,'Marta ','Mcgiver','Cady','3214','mafacgiverc@hotmail.es','GRA-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (34,'Serena','Parket','Zaker','3578','sparket@hotmail.es','GRA-ES',11,'Representante Ventas');
SELECT *
FROM oficina;
SELECT *
FROM empleado;

/*15*/
INSERT INTO cliente VALUES (39,'Foraz','Santa','Merez','8157876622','687370567','C/Paseo del Parque',NULL,'Granada','Granada','Spain','57640',32,100000);
INSERT INTO cliente VALUES (40,'Hank','Chef','Gimenez','2549678609','234587056','C/Paseo del Mañana',NULL,'Granada','Granada','Spain','52379',33,200000);
INSERT INTO cliente VALUES (41,'Pepe','Pepito','Perez','9564056577','968675433','C/Paseo del Perdido',NULL,'Granada','Granada','Spain','95764',34,1000000);
SELECT *
FROM cliente;

/*16*/
SET AUTOCOMMIT = 0;

START TRANSACTION;
INSERT INTO pedido VALUES (129,'2010-01-14','2010-01-20','2010-01-19','Entregado','El cliente llama para confirmar la fecha - Esperando al proveedor',39);
INSERT INTO pedido VALUES (130,'2010-01-10','2011-12-30','2011-12-25','Entregado','El cliente llama para confirmar la fecha - Esperando al proveedor',40);
INSERT INTO pedido VALUES (131,'2014-01-09','2014-11-30','2014-11-14','Entregado','El cliente llama para confirmar la fecha - Esperando al proveedor',41);
ROLLBACK;

SELECT *
FROM pedido;
COMMIT;

/*17*/
ALTER TABLE pedido
DROP FOREIGN KEY pedido_ibfk_1;

ALTER TABLE pedido
ADD FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
ON DELETE CASCADE;

ALTER TABLE pago
DROP FOREIGN KEY pago_ibfk_1;

ALTER TABLE pago
ADD FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
ON DELETE CASCADE;


DELETE FROM cliente WHERE codigo_cliente = '39';

SELECT *
FROM cliente;
/*18*/
