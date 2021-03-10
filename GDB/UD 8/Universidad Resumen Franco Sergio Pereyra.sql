/*1*/
SELECT COUNT(id) as total_alumnos
FROM persona
WHERE tipo = 'alumno';

/*2*/
SELECT COUNT(id) as total_alumnos
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';

/*3*/
SELECT departamento.nombre ,COUNT(profesor.id_profesor) as total_profesores
FROM profesor INNER JOIN departamento
ON profesor.id_departamento = departamento.id
GROUP BY departamento.id
ORDER BY COUNT(profesor.id_profesor) DESC;

/*4*/
SELECT departamento.nombre ,COUNT(profesor.id_profesor) as total_profesores
FROM profesor RIGHT JOIN departamento
ON profesor.id_departamento = departamento.id
GROUP BY departamento.id
ORDER BY COUNT(profesor.id_profesor) DESC;

/*5*/
SELECT grado.nombre ,COUNT(asignatura.id) as total_asignaturas
FROM grado LEFT JOIN asignatura
ON grado.id = asignatura.id_grado
GROUP BY grado.id
ORDER BY COUNT(asignatura.id) DESC;

/*6*/
SELECT grado.nombre ,COUNT(asignatura.id) as total_asignaturas
FROM grado LEFT JOIN asignatura
ON grado.id = asignatura.id_grado
GROUP BY grado.id
HAVING COUNT(asignatura.id) > 40;