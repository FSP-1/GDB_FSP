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
SELECT  cliente.ciudad,MAx
FROM cliente INNER JOIN pedido
ON cliente.id = pedido.id_cliente
GROUP BY cliente.ciudad;