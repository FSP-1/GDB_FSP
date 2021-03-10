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
FROM grado INNER JOIN asignatura
ON grado.id = asignatura.id_grado
GROUP BY grado.id
HAVING COUNT(asignatura.id) > 40;

/*7*/
SELECT grado.nombre ,asignatura.tipo, SUM(asignatura.creditos)
FROM grado INNER JOIN asignatura
ON grado.id = asignatura.id_grado
GROUP BY grado.id,asignatura.tipo
ORDER BY SUM(asignatura.creditos)DESC;

/*8*/
SELECT  DISTINCT  COUNT(alumno_se_matricula_asignatura.id_asignatura), curso_escolar.anyo_inicio
FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura
ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
GROUP BY alumno_se_matricula_asignatura.id_asignatura,curso_escolar.anyo_inicio
