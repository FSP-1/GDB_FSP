-- Universidad Tipo B -- 
USE universidad;
/*1*/
SELECT asignatura.nombre,grado.nombre, COUNT(asignatura.id) as total_asignaturas
FROM grado INNER JOIN asignatura
ON grado.id = asignatura.id_grado
GROUP BY grado.nombre 
HAVING COUNT(asignatura.id) > 3
ORDER BY asignatura.nombre ASC;

/*2*/
SELECT   profesor.sexo, COUNT(profesor.sexo) as total_profesores
FROM profesor LEFT JOIN asignatura
ON profesor.id = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL
GROUP BY profesor.sexo;

/*3*/
SELECT grado.nombre, alumno_se_matricula_asignatura.id_curso_escolar, asignatura.cuatrimestre, COUNT(asignatura.id) as total_asignaturas
FROM grado  INNER JOIN  asignatura
ON grado.id = asignatura.id_grado
INNER JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
GROUP BY grado.id ,alumno_se_matricula_asignatura.id_curso_escolar,asignatura.cuatrimestre 
ORDER BY 1 ASC,2 ASC ,3 ASC;

-- Jardineria  -- 
USE jardineria;
/*4*/
SELECT cliente.codigo_cliente,cliente.nombre_cliente,pedido.codigo_pedido, SUM(detalle_pedido.precio_unidad * detalle_pedido.cantidad) as importe_total
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente  = pedido.codigo_cliente
INNER JOIN detalle_pedido
ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
WHERE cliente.ciudad = 'Madrid' and pedido.fecha_pedido LIKE '2009%' 
GROUP BY cliente.codigo_cliente,pedido.codigo_pedido
ORDER BY importe_total  desc
Limit 0,4;

/*5*/
SELECT cliente.nombre_cliente,cliente.codigo_cliente,cliente.limite_credito,pago.total
FROM cliente INNER JOIN pago
ON cliente.codigo_cliente  = pago.codigo_cliente
WHERE pago.fecha_pago LIKE '2006%' 
GROUP BY cliente.codigo_cliente,pago.total
HAVING cliente.limite_credito > pago.total;

/*6*/
SELECT cliente.ciudad,COUNT(pedido.codigo_pedido),SUM(detalle_pedido.precio_unidad * detalle_pedido.cantidad) as importe_total_maximo,SUM(detalle_pedido.precio_unidad * detalle_pedido.cantidad) as importe_total_minimo
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente  = pedido.codigo_cliente
INNER JOIN detalle_pedido
ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
GROUP BY cliente.ciudad;

-- Netflix  -- 
USE sakila_es;
/*7*/
SELECT cliente.nombre,cliente.apellidos,direccion.telefono,pago.total,COUNT(alquiler.id_alquiler)
FROM cliente INNER JOIN direccion
ON cliente.id_direccion = direccion.id_direccion
INNER JOIN pago
ON cliente.id_cliente = pago.id_cliente
INNER JOIN alquiler
ON pago.id_alquiler = alquiler.id_alquiler
GROUP BY cliente.id_cliente,pago.total
HAVING COUNT(alquiler.id_alquiler) > 15
ORDER BY COUNT(alquiler.id_alquiler) DESC;

/*8*/
SELECT pelicula.titulo,COUNT(alquiler.id_alquiler)
FROM pelicula INNER JOIN inventario
ON pelicula.id_pelicula = inventario.id_pelicula
INNER JOIN alquiler
ON inventario.id_inventario = alquiler.id_inventario
GROUP BY pelicula.titulo
ORDER BY COUNT(alquiler.id_alquiler) DESC;

/*9*/
SELECT cliente.nombre,cliente.apellidos,categoria.nombre,COUNT(alquiler.id_alquiler)
FROM cliente INNER JOIN alquiler
ON cliente.id_cliente = alquiler.id_cliente
INNER JOIN inventario 
ON inventario.id_inventario = alquiler.id_inventario
INNER JOIN pelicula 
ON pelicula.id_pelicula = inventario.id_pelicula
INNER JOIN pelicula_categoria
ON pelicula.id_pelicula = pelicula_categoria.id_pelicula
INNER JOIN categoria
ON pelicula_categoria.id_categoria = categoria.id_categoria
WHERE DATE_FORMAT(alquiler.fecha_alquiler,'%Y') = 2005
GROUP BY cliente.id_cliente,categoria.nombre;

