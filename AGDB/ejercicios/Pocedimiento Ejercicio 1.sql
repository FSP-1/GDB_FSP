CREATE DEFINER=`root`@`%` PROCEDURE `insert_alumno`(in id INTEGER,
  in nombre VARCHAR(50)  ,
  in apellido1 VARCHAR(50)  ,
  in apellido2 VARCHAR(50),
  out x int
)
BEGIN
DECLARE EXIT HANDLER FOR SQLSTATE '23000' SET x = 1;
  SET x = 0;
  INSERT INTO alumno VALUES (id,nombre,apellido1,apellido2);
  
END