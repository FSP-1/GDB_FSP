SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;

DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;

CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE
);

INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');


-- 1 --
SELECT *
FROM producto;
 
 
 USE test;

-- ¿Qué devolverá esta consulta?
SELECT *
FROM producto;

-- Nada --

SET AUTOCOMMIT = 1;
SELECT @@AUTOCOMMIT;

DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;

CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE
);

INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');


-- 1 --
SELECT *
FROM producto;

-- 2 --
ROLLBACK;

-- 3 --
SELECT *
FROM producto;

-- Nada ya que no habiamos empezado un transaccíon para poder hacer rollback --

-- 4 --
START TRANSACTION;
INSERT INTO producto (id, nombre) VALUES (4, 'Cuarto');
SELECT * FROM producto;
ROLLBACK;

-- 5 --
SELECT * FROM producto;

-- Al haber hecho una transaccíon hemos podido hacer el comando rollback, que deshizo  la creacíon del producto 4 --

-- 6 --
INSERT INTO producto (id, nombre) VALUES (5, 'Quinto');
ROLLBACK;

-- 7 --
SELECT * FROM producto;

-- Nada ya que no habiamos empezado un transaccíon para poder hacer rollback --

-- 8 --
SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;

DELETE FROM producto WHERE id > 0;

-- 9 --
SELECT * FROM producto;

-- 10 --
INSERT INTO producto (id, nombre) VALUES (6, 'Sexto');
INSERT INTO producto (id, nombre) VALUES (7, 'Séptimo');
SELECT * FROM producto;

-- 11 --
ROLLBACK;

-- 12 --
SELECT * FROM producto;

-- Al poner el SET AUTOCOMMIT = 0; hemos hecho como una transiccíon y con el rollback volvimos a la tabla antes de eliminar sus datas --

-- 13 --
SET AUTOCOMMIT = 0;
START TRANSACTION;
CREATE TABLE fabricante (id INT UNSIGNED);
INSERT INTO fabricante (id) VALUES (1);
SELECT * FROM fabricante;
ROLLBACK;

-- 14 --
-- Si --