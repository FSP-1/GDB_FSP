/* Con operadores básicos de comparación*/
/*1*/
SELECT *
FROM empleado
WHERE empleado.codigo_departamento = (SELECT departamento.codigo
        FROM departamento
        WHERE  empleado.codigo_departamento = departamento.codigo AND departamento.nombre = 'Sistemas');
        
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
     