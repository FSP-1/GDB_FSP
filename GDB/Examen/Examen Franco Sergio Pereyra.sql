-- Universidad Tipo B -- 
USE universidad;
/*1*/
SELECT asignatura.nombre, grado.nombre, COUNT(alumno_se_matricula_asignatura.id_alumno)
FROM grado INNER JOIN asignatura
ON grado.id = asignatura.id_grado
INNER JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
GROUP BY asignatura.id
HAVING COUNT(alumno_se_matricula_asignatura.id_alumno) > 3
ORDER BY asignatura.nombre;

/*2*/
SELECT   profesor.sexo, COUNT(profesor.sexo) as total_profesores
FROM profesor LEFT JOIN asignatura
ON profesor.id = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL
GROUP BY profesor.sexo;

/*3*/
SELECT grado.nombre, asignatura.curso, asignatura.cuatrimestre,  COUNT(asignatura.id)
FROM grado INNER JOIN asignatura
ON grado.id = asignatura.id_grado
GROUP BY grado.id, asignatura.curso, asignatura.cuatrimestre
ORDER BY 1, 2, 3 ASC;

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
SELECT cliente.codigo_cliente, cliente.nombre_cliente, cliente.limite_credito, SUM(pago.total)
FROM cliente INNER JOIN pago
ON cliente.codigo_cliente = pago.codigo_cliente
WHERE YEAR(fecha_pago) = 2006
GROUP BY cliente.codigo_cliente
HAVING cliente.limite_credito > SUM(pago.total);

/*6*/
SELECT ciudad, COUNT(codigo_pedido), MAX(total_pedido), MIN(total_pedido)
FROM (
    SELECT 
        cliente.ciudad AS ciudad, 
        pedido.codigo_pedido AS codigo_pedido, 
        SUM(detalle_pedido.cantidad * detalle_pedido.precio_unidad) AS total_pedido
    FROM cliente INNER JOIN pedido
    ON cliente.codigo_cliente = pedido.codigo_cliente
    INNER JOIN detalle_pedido
    ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
    GROUP BY cliente.ciudad, pedido.codigo_pedido) AS t
GROUP BY ciudad
ORDER BY 2 DESC;

-- Netflix  -- 
USE sakila_es;
/*7*/
SELECT cliente.nombre, cliente.apellidos, direccion.telefono, SUM(pago.total), COUNT(pago.id_alquiler)
FROM cliente INNER JOIN direccion
ON cliente.id_direccion = direccion.id_direccion
INNER JOIN pago
ON cliente.id_cliente = pago.id_cliente
GROUP BY cliente.id_cliente
HAVING COUNT(pago.id_alquiler) > 15
ORDER BY 4 DESC;

/*8*/
SELECT pelicula.titulo,COUNT(alquiler.id_alquiler)
FROM pelicula INNER JOIN inventario
ON pelicula.id_pelicula = inventario.id_pelicula
INNER JOIN alquiler
ON inventario.id_inventario = alquiler.id_inventario
GROUP BY pelicula.titulo
HAVING COUNT(alquiler.id_alquiler) > 30
ORDER BY COUNT(alquiler.id_alquiler) DESC;


/*9*/
SELECT cliente.nombre, cliente.apellidos, categoria.nombre, COUNT(pelicula.id_pelicula)
FROM cliente INNER JOIN alquiler
ON cliente.id_cliente = alquiler.id_cliente
INNER JOIN inventario
ON inventario.id_inventario = alquiler.id_inventario
INNER JOIN pelicula
ON pelicula.id_pelicula = inventario.id_pelicula
INNER JOIN pelicula_categoria
ON pelicula_categoria.id_pelicula =pelicula.id_pelicula
INNER JOIN categoria
ON categoria.id_categoria = pelicula_categoria.id_categoria
WHERE YEAR(alquiler.fecha_alquiler) = 2005 AND MONTH(alquiler.fecha_alquiler) = 5
GROUP BY cliente.id_cliente, categoria.id_categoria;

