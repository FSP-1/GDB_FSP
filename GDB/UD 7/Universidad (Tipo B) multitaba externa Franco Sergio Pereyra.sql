/*1*/
/*RIGHT*/
SELECT  profesor.apellido1, profesor.apellido2, profesor.nombre, departamento.nombre
FROM profesor RIGHT JOIN departamento
ON profesor.id_departamento = departamento.id
ORDER BY departamento.nombre ASC, profesor.apellido1 ASC, profesor.apellido2 ASC, profesor.nombre ASC;
/*LEFT*/
SELECT  profesor.apellido1, profesor.apellido2, profesor.nombre, departamento.nombre
FROM departamento LEFT JOIN  profesor
ON profesor.id_departamento = departamento.id
ORDER BY departamento.nombre ASC, profesor.apellido1 ASC, profesor.apellido2 ASC, profesor.nombre ASC;

/*2*/
/*RIGHT*/
SELECT  *
FROM departamento RIGHT JOIN  profesor
ON profesor.id_departamento = departamento.id
WHERE departamento.id IS NULL;
/*LEFT*/
SELECT  *
FROM profesor LEFT JOIN departamento
ON profesor.id_departamento = departamento.id
WHERE departamento.id IS NULL;

/*3*/
/*RIGHT*/
SELECT  *
FROM profesor RIGHT JOIN departamento
ON profesor.id_departamento = departamento.id
WHERE profesor.id_departamento IS NULL;
/*LEFT*/
SELECT *
FROM departamento LEFT JOIN  profesor
ON profesor.id_departamento = departamento.id
WHERE profesor.id_departamento IS NULL;

/*4*/
/*RIGHT*/
SELECT  profesor.*
FROM asignatura  RIGHT JOIN  profesor
ON profesor.id = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL;
/*LEFT*/
SELECT  profesor.*
FROM profesor LEFT JOIN   asignatura
ON profesor.id = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL;

/*5*/
/*RIGHT*/
SELECT  asignatura.*
FROM profesor  RIGHT JOIN   asignatura
ON profesor.id = asignatura.id_profesor
WHERE profesor.id IS NULL;
/*LEFT*/
SELECT  asignatura.*
FROM  asignatura LEFT JOIN    profesor
ON profesor.id = asignatura.id_profesor
WHERE profesor.id IS NULL;

/*6*/
/*RIGHT*/
SELECT departamento.nombre, asignatura.nombre
FROM profesor RIGHT JOIN   departamento
ON profesor.id_departamento = departamento.id
INNER JOIN asignatura
ON profesor.id = asignatura.id_profesor
LEFT JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
LEFT JOIN curso_escolar
ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id;
/*LEFT*/
SELECT departamento.nombre, asignatura.nombre
FROM departamento LEFT JOIN profesor
ON profesor.id_departamento = departamento.id
INNER JOIN asignatura
ON profesor.id = asignatura.id_profesor
LEFT JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
LEFT JOIN curso_escolar
ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id;
