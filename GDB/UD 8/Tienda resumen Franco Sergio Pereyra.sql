/*1*/
SELECT COUNT(codigo) AS total_producto
FROM producto;

/*2*/
SELECT COUNT(codigo) AS total_fabricante
FROM fabricante;

/*3*/
SELECT COUNT(DISTINCT codigo_fabricante) AS total_distinto_codigo_fabricante
FROM producto;

/*4*/
SELECT AVG(precio) AS precio_avg
FROM producto;

/*5*/
SELECT MIN(precio) AS min_precio
FROM producto;

/*6*/
SELECT MAX(precio) AS min_precio
FROM producto;

/*7*/
SELECT precio, nombre
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);

/*8*/
SELECT precio, nombre
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);
/*9*/
SELECT SUM(precio) AS sum_precio
FROM producto;

/*10*/
SELECT fabricante.nombre, COUNT(producto.codigo) AS productos_echos
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
GROUP BY fabricante.nombre;

/*11*/
SELECT fabricante.nombre, AVG(producto.precio) AS avg_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
GROUP BY fabricante.nombre;

/*12*/
SELECT fabricante.nombre, MIN(producto.precio) AS min_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
GROUP BY fabricante.nombre;

/*13*/
SELECT fabricante.nombre, MAX(producto.precio) AS max_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
GROUP BY fabricante.nombre;

/*14*/
SELECT fabricante.nombre, SUM(producto.precio) AS sum_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
GROUP BY fabricante.nombre;

/*15*/
SELECT fabricante.nombre, MIN(producto.precio) AS min_precio, MAX(producto.precio) AS max_precio, AVG(producto.precio) AS avg_precio, COUNT(producto.codigo) AS productos_echos
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial'
GROUP BY fabricante.nombre;

/*16*/
SELECT fabricante.nombre, COUNT(producto.codigo) AS total
FROM fabricante LEFT JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
ORDER BY 2 DESC;

/*17*/
SELECT fabricante.nombre, MIN(producto.precio) AS min_precio, MAX(producto.precio) AS max_precio, AVG(producto.precio) AS avg_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;

/*18*/
SELECT codigo_fabricante, MIN(producto.precio) AS min_precio, MAX(producto.precio) AS max_precio, AVG(producto.precio) AS avg_precio
FROM producto
GROUP BY codigo_fabricante
HAVING AVG(producto.precio) >=200;

/*19*/
SELECT fabricante.nombre, MIN(producto.precio) AS min_precio, MAX(producto.precio) AS max_precio, AVG(producto.precio) AS avg_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING AVG(producto.precio) >=200;

/*20*/
SELECT COUNT(codigo) AS total_producto
FROM producto
WHERE precio >=180;

/*21*/
SELECT fabricante.nombre, COUNT(producto.codigo) AS total_producto
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >=180
GROUP BY fabricante.nombre;

/*22*/
SELECT AVG(producto.precio),codigo_fabricante
FROM producto
GROUP BY codigo_fabricante;

/*23*/
SELECT AVG(producto.precio),fabricante.nombre
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;

/*24*/
SELECT fabricante.nombre,  AVG(producto.precio) AS avg_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.codigo
HAVING AVG(producto.precio) >=150;

/*25*/
SELECT fabricante.nombre, COUNT(producto.codigo)
FROM fabricante LEFT JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.codigo
HAVING COUNT(producto.codigo) >= 2;

/*26*/
SELECT fabricante.nombre, COUNT(producto.codigo) AS total_producto
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >=220
GROUP BY  fabricante.nombre 
ORDER BY 2 DESC;

/*27*/
SELECT fabricante.nombre, COUNT(producto.codigo) AS total_producto
FROM fabricante left JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >=220
GROUP BY  fabricante.nombre 

UNION 

SELECT fabricante.nombre, COUNT(producto.codigo) AS total_producto
FROM fabricante LEFT JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
where producto.codigo not in (SELECT COUNT(producto.codigo) AS total_producto
FROM fabricante left JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >=220
GROUP BY  fabricante.nombre  )
GROUP BY  fabricante.nombre 
ORDER BY 2 DESC;


/*28*/
SELECT fabricante.nombre, SUM(producto.precio) AS sum_precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING SUM(producto.precio) >1000;

/*29*/
SELECT producto.nombre , producto.precio, fabricante.nombre
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio =(SELECT MAX( producto.precio) FROM producto WHERE producto.codigo_fabricante = fabricante.codigo )


