/*1*/
/*RIGH*/
SELECT empleado.*, departamento.*
FROM departamento RIGHT JOIN  empleado
ON empleado.codigo_departamento=departamento.codigo
WHERE departamento.codigo IS NULL OR departamento.codigo IS NOT NULL;
/*LEFT*/
SELECT empleado.*, departamento.*
FROM empleado LEFT JOIN departamento
ON empleado.codigo_departamento=departamento.codigo
WHERE departamento.codigo IS NULL OR departamento.codigo IS NOT NULL;

/*2*/
/*RIGH*/
SELECT empleado.*, departamento.*
FROM departamento RIGHT JOIN  empleado
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL;
/*LEFT*/
SELECT empleado.*, departamento.*
FROM empleado LEFT JOIN   departamento
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL;

/*3*/
/*RIGH*/
SELECT empleado.*, departamento.*
FROM empleado RIGHT JOIN departamento
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL;
/*LEFT*/
SELECT empleado.*, departamento.*
FROM departamento LEFT JOIN  empleado
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL;

 /*4*/
/*RIGH*/
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM departamento RIGHT JOIN  empleado
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL OR departamento.codigo IS NOT NULL
UNION
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM empleado RIGHT JOIN departamento
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL OR departamento.codigo IS NOT NULL
ORDER BY 1 ASC;
/*LEFT*/
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM empleado LEFT JOIN   departamento
ON empleado.codigo_departamento=departamento.codigo
WHERE departamento.codigo IS NOT NULL
UNION
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM departamento LEFT JOIN  empleado
ON empleado.codigo_departamento=departamento.codigo
WHERE departamento.codigo IS NOT NULL
ORDER BY 1 ASC;
 
/*5*/
/*RIGH*/
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM departamento RIGHT JOIN  empleado
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL
UNION
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM empleado RIGHT JOIN departamento
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL
ORDER BY 1 ASC;
/*LEFT*/
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM empleado LEFT JOIN   departamento
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL
UNION
SELECT departamento.nombre, CONCAT_WS(' ',empleado.apellido1, empleado.apellido2, empleado.nombre) AS empleado
FROM departamento LEFT JOIN  empleado
ON empleado.codigo_departamento=departamento.codigo
WHERE empleado.codigo_departamento IS NULL
ORDER BY 1 ASC;
