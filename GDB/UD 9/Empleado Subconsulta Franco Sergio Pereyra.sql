/* Con operadores básicos de comparación*/
/*1*/
SELECT *
FROM empleado
WHERE empleado.codigo_departamento = (SELECT departamento.codigo
        FROM departamento
        WHERE  departamento.nombre = 'Sistemas');
        
 /*2*/       
SELECT *
FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) 
     FROM departamento);

 /*3*/       
SELECT *
FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) 
     FROM departamento);
     
/*Subconsultas con ALL y ANY*/
 /*4*/       
SELECT *
FROM departamento
WHERE presupuesto >= ALL (SELECT presupuesto
     FROM departamento);

 /*5*/       
SELECT *
FROM departamento
WHERE presupuesto <= ALL (SELECT presupuesto
     FROM departamento);

 /*6*/       
SELECT nombre
FROM departamento
WHERE codigo = ANY (SELECT codigo_departamento
     FROM empleado);     
     
 /*7*/       
SELECT nombre
FROM departamento
WHERE codigo != ALL (SELECT empleado.codigo_departamento
     FROM empleado
     WHERE codigo_departamento IS NOT NULL); 
     
/*Subconsultas con IN y NOT IN*/
 /*8*/       
SELECT nombre
FROM departamento
WHERE codigo IN (SELECT codigo_departamento
     FROM empleado);     
     
 /*9*/       
SELECT nombre
FROM departamento
WHERE codigo NOT IN  (SELECT codigo_departamento
     FROM empleado
     WHERE codigo_departamento IS NOT NULL); 
     
/*Subconsultas con EXISTS y NOT EXISTS*/
 /*10*/       
SELECT nombre
FROM departamento
WHERE EXISTS (SELECT codigo_departamento
     FROM empleado
     WHERE empleado.codigo_departamento = departamento.codigo);     
     
 /*11*/       
SELECT nombre
FROM departamento
WHERE  NOT EXISTS  (SELECT codigo_departamento
     FROM empleado
     WHERE empleado.codigo_departamento = departamento.codigo AND codigo_departamento IS NOT NULL); 
     
