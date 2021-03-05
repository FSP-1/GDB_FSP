/*1*/
SELECT SUM(presupuesto) as presupuesto
FROM  departamento;

/*2*/
SELECT AVG(presupuesto) as presupuesto
FROM  departamento;

/*3*/
SELECT MIN(presupuesto) as presupuesto
FROM  departamento;

/*4*/
SELECT nombre, presupuesto
FROM  departamento
WHERE presupuesto = (SELECT MIN(presupuesto) as presupuesto
FROM  departamento);

/*5*/
SELECT MAX(presupuesto) as presupuesto
FROM  departamento;

/*6*/
SELECT nombre, presupuesto
FROM  departamento
WHERE presupuesto = (SELECT MAX(presupuesto) as presupuesto
FROM  departamento);

/*7*/
SELECT COUNT(codigo) as T0tal_Emplados
FROM  empleado;

/*8*/
SELECT COUNT(codigo) as Total_Emplados
FROM  empleado
WHERE apellido2 IS NOT NULL;

/*9*/
SELECT departamento.nombre, COUNT(empleado.codigo) as Total_Emplados
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
GROUP BY departamento.codigo;

/*10*/
SELECT departamento.nombre, COUNT(empleado.codigo) as Total_Emplados
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
GROUP BY departamento.codigo
HAVING COUNT(empleado.codigo) >2;

/*11*/
SELECT departamento.nombre, COUNT(empleado.codigo) as Total_Emplados
FROM departamento LEFT JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
GROUP BY departamento.codigo;

/*12*/
SELECT departamento.nombre, COUNT(empleado.codigo) as Total_Emplados
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.presupuesto >200000
GROUP BY departamento.codigo;


