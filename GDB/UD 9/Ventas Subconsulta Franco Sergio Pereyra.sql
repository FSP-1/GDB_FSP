/* Con operadores básicos de comparación*/
/*1*/
SELECT *
FROM pedido
WHERE pedido.id_cliente = (SELECT cliente.id
        FROM cliente
        WHERE  cliente.nombre = 'Adela' AND cliente.apellido1 = 'Salas' AND cliente.apellido2 = 'Díaz');

/*2*/
SELECT COUNT(id_comercial) AS total_pedidos
FROM pedido
WHERE pedido.id_comercial = (SELECT comercial.id
        FROM comercial
        WHERE  comercial.nombre = 'Daniel' AND comercial.apellido1 = 'Sáez' AND comercial.apellido2 = 'Vega');
        
/*3*/
SELECT *
FROM cliente
WHERE cliente.id = (SELECT pedido.id_cliente 
        FROM pedido
        WHERE total = (SELECT MAX(total) 
        FROM pedido 
        WHERE YEAR(fecha) = '2019'));
     
/*4*/
SELECT total, fecha
FROM pedido
WHERE pedido.total = (SELECT MIN(pedido.total)
        FROM cliente INNER JOIN pedido
        ON pedido.id_cliente = cliente.id 
        WHERE  cliente.nombre = 'Pepe' AND cliente.apellido1 = 'Ruiz' AND cliente.apellido2 = 'Santana');
        
/*5*/
SELECT *
FROM cliente INNER JOIN pedido
ON pedido.id_cliente = cliente.id 
WHERE pedido.total >= (SELECT AVG(pedido.total)
    FROM cliente INNER JOIN pedido
    ON pedido.id_cliente = cliente.id
    WHERE YEAR(fecha) = '2017') 
 AND YEAR(fecha) = '2017';
 
 /*Subconsultas con ALL y ANY*/
 /*6*/       
SELECT *
FROM pedido
WHERE total >= ALL (SELECT total
     FROM pedido);
    
 /*7*/       
SELECT *
FROM cliente
WHERE id != ALL (SELECT pedido.id_cliente
     FROM pedido); 
     
/*8*/       
SELECT *
FROM comercial
WHERE id != ALL (SELECT pedido.id_comercial
     FROM pedido);     
/*Subconsultas con IN y NOT IN*/
 /*9*/       
SELECT *
FROM cliente
WHERE id NOT IN (SELECT pedido.id_cliente
     FROM pedido);     

 /*10*/       
SELECT *
FROM comercial
WHERE id NOT IN (SELECT pedido.id_comercial
     FROM pedido);       
     
/*Subconsultas con EXISTS y NOT EXISTS*/
 /*11*/       
SELECT *
FROM cliente
WHERE NOT EXISTS (SELECT pedido.id_cliente
     FROM pedido
     WHERE pedido.id_cliente = cliente.id );     
     
 /*12*/       
SELECT *
FROM comercial
WHERE  NOT EXISTS  (SELECT pedido.id_comercial
     FROM pedido
     WHERE pedido.id_comercial = comercial.id); 