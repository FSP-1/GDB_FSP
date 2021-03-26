/*Subconsulta en Where*/
/*1*/
SELECT *
FROM producto
WHERE producto.codigo_fabricante = (SELECT fabricante.codigo
        FROM fabricante
        WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo');

/*2*/
SELECT *
FROM producto
WHERE precio = (
  SELECT MAX(precio)
  FROM producto
  WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Lenovo'));

/*3*/
SELECT  nombre
FROM producto
WHERE precio = (SELECT MAX(producto.precio)
                FROM producto INNER JOIN fabricante 
                ON producto.codigo_fabricante = fabricante.codigo
                WHERE fabricante.nombre = 'Lenovo');
                
/*4*/
SELECT  nombre
FROM producto
WHERE precio = (SELECT MIN(producto.precio)
                FROM producto INNER JOIN fabricante 
                ON producto.codigo_fabricante = fabricante.codigo
                WHERE fabricante.nombre = 'Hewlett-Packard');
                
/*5*/
SELECT *
FROM producto
WHERE precio >= (SELECT MAX(precio)
    FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante
    WHERE fabricante.nombre = 'Lenovo');
    
/*6*/
SELECT producto.*
FROM producto INNER JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante
WHERE precio >= (SELECT AVG(precio)
    FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante
    WHERE fabricante.nombre = 'Asus') 
AND fabricante.nombre = 'Asus';
    
/*Subconsultas con ALL y ANY*/
/*8*/
SELECT *
FROM  producto
WHERE precio >= ALL (SELECT precio
                     FROM  producto);
/*9*/				
SELECT *
FROM producto
WHERE precio <= ALL (SELECT precio
        FROM producto);
                     
/*10*/
SELECT DISTINCT fabricante.*
FROM fabricante
WHERE codigo = ANY (SELECT producto.codigo_fabricante
	FROM  producto);
 
/*11*/ 
SELECT  fabricante.*
FROM fabricante
WHERE codigo <> ALL (SELECT producto.codigo_fabricante
	FROM  producto);

/*Subconsultas con IN y NOT IN*/    
/*12*/
SELECT  fabricante.*
FROM fabricante
WHERE codigo IN (SELECT producto.codigo_fabricante
	FROM  producto);
 
/*13*/ 
SELECT  fabricante.*
FROM fabricante
WHERE codigo NOT IN (SELECT producto.codigo_fabricante
	FROM  producto);
    
 /* Subconsultas con EXISTS y NOT EXISTS*/     
 /*14*/
SELECT  fabricante.*
FROM fabricante
WHERE  EXISTS (SELECT producto.codigo_fabricante
	FROM  producto
    WHERE fabricante.codigo = producto.codigo_fabricante);
 
/*15*/ 
SELECT  fabricante.*
FROM fabricante
WHERE  NOT EXISTS (SELECT producto.codigo_fabricante
		FROM  producto
		WHERE fabricante.codigo = producto.codigo_fabricante);

 /*Subconsultas correlacionadas*/  
 /*16*/
SELECT fabricante.nombre ,producto.nombre , producto.precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio =(SELECT MAX(producto.precio)
			FROM producto
			WHERE producto.codigo_fabricante = fabricante.codigo);

/*17*/
SELECT  producto.*
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >=(SELECT AVG(producto.precio)
    FROM producto
    WHERE producto.codigo_fabricante = fabricante.codigo
    GROUP BY producto.codigo_fabricante);
    
 /*18*/
SELECT fabricante.nombre ,producto.nombre , producto.precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio =(SELECT MAX(producto.precio)
			FROM producto
			WHERE producto.codigo_fabricante = fabricante.codigo)
            AND fabricante.nombre = 'Lenovo'; 

/*Subconsulta en Having*/
/*7*/
SELECT fabricante.nombre, COUNT(producto.codigo)
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo
HAVING COUNT(producto.codigo) = (SELECT COUNT(producto.codigo)
    FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante
    WHERE fabricante.nombre = 'Lenovo');