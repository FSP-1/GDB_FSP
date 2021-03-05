/*1*/
/*RIGH*/
SELECT  fabricante.*, producto.nombre
FROM  producto RIGHT JOIN  fabricante
ON fabricante.codigo=producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL OR producto.codigo_fabricante IS NOT NULL;
/*LEFT*/
SELECT  fabricante.*, producto.nombre
FROM fabricante  LEFT JOIN   producto
ON fabricante.codigo=producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL OR producto.codigo_fabricante IS NOT NULL;

/*2*/
/*RIGH*/
SELECT  fabricante.*
FROM  producto RIGHT JOIN  fabricante
ON fabricante.codigo=producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL;
/*LEFT*/
SELECT  fabricante.*
FROM fabricante  LEFT JOIN   producto
ON fabricante.codigo=producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL;

/*3*/
/* No, porque  las tablas estan configuradas para que no haya null en el codigo Fabricante
Haciendo imposible que haya productos sin fabricante */
/*RIGH*/
SELECT *
FROM  fabricante RIGHT JOIN   producto
ON fabricante.codigo=producto.codigo_fabricante
WHERE fabricante.codigo IS NULL;
/*LEFT*/
SELECT  *
FROM producto  LEFT JOIN    fabricante
ON fabricante.codigo=producto.codigo_fabricante
WHERE fabricante.codigo IS NULL;