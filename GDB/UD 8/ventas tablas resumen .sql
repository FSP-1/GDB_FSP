/*1*/
SELECT TRUNCATE(SUM(total),2)
FROM pedido;

/*2*/
SELECT TRUNCATE(AVG(total),2)
FROM pedido;

/*3*/
SELECT DISTINCT(COUNT(comercial.id))
FROM comercial INNER JOIN pedido
ON comercial.id = pedido.id_comercial
GROUP BY comercial.id;

/*4*/
SELECT COUNT(id)
FROM cliente;

/*5*/
SELECT MAX(total)
FROM pedido;


/*6*/
SELECT MIN(total)
FROM pedido;

/*7*/
SELECT  ciudad,MAX(categoría)
FROM cliente 
GROUP BY ciudad;

/*8*/
SELECT  cliente.id, CONCAT_WS(' ',cliente.nombre,cliente.apellido1, cliente.apellido2) AS cliente, pedido.fecha,pedido.total
FROM cliente INNER JOIN pedido
ON cliente.id = pedido.id_cliente
WHERE pedido.total =(SELECT MAX(pedido.total) FROM pedido WHERE pedido.id_cliente = cliente.id );

/*9*/
SELECT  cliente.id, CONCAT_WS(' ',cliente.nombre,cliente.apellido1, cliente.apellido2) AS cliente, pedido.fecha,pedido.total
FROM cliente INNER JOIN pedido
ON cliente.id = pedido.id_cliente
WHERE pedido.total =(SELECT MAX(pedido.total) FROM pedido WHERE pedido.id_cliente = cliente.id )
GROUP BY cliente.id, pedido.fecha,pedido.total
HAVING pedido.total >2000;

/*10*/
SELECT  comercial.id,CONCAT_WS(' ',comercial.nombre,comercial.apellido1, comercial.apellido2) AS comercial,MAX(pedido.total)
FROM comercial INNER JOIN pedido
ON comercial.id = pedido.id_comercial
WHERE pedido.fecha = '2016-08-17'
GROUP BY comercial.id;

/*11*/
SELECT  cliente.id, CONCAT_WS(' ',cliente.nombre,cliente.apellido1, cliente.apellido2) AS cliente, COUNT(pedido.id_cliente) AS total_pedidos
FROM cliente LEFT JOIN pedido
ON cliente.id = pedido.id_cliente
GROUP BY cliente.id;

/*12*/
SELECT  cliente.id, CONCAT_WS(' ',cliente.nombre,cliente.apellido1, cliente.apellido2) AS cliente, COUNT(pedido.id_cliente) AS total_pedidos
FROM cliente INNER JOIN pedido
ON cliente.id = pedido.id_cliente
WHERE YEAR(pedido.fecha) = 2017
GROUP BY cliente.id;

/*13*/
SELECT  cliente.id, CONCAT_WS(' ',cliente.nombre,cliente.apellido1, cliente.apellido2) AS cliente, IFNULL(MAX(pedido.total),0) AS total_dinero
FROM cliente LEFT JOIN pedido
ON cliente.id = pedido.id_cliente
GROUP BY cliente.id;

/*14*/
SELECT  YEAR(pedido.fecha),max(pedido.total)
FROM pedido 
GROUP BY YEAR(pedido.fecha);


/*15*/
SELECT COUNT(pedido.id),YEAR(pedido.fecha)
FROM pedido INNER JOIN cliente
ON cliente.id = pedido.id_cliente
GROUP BY YEAR(pedido.fecha);
                      
