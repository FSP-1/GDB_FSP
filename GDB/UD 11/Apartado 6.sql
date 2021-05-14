-- o --
mysqldump -u root -p --fields-enclosed-by '"' --fields-terminated-by ',' --lines-terminated-by '\n' --tab /opt/csv jardineria

-- Tema 11 Apartado 6 --
DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;

CREATE TABLE cliente (
    id INT UNSIGNED PRIMARY KEY,
    nombre CHAR CHECK (saldo<=0)
);

START TRANSACTION;
INSERT INTO cliente VALUES (1, 'Pepe');
COMMIT;

-- 1. ¿Qué devolverá esta consulta?
SELECT *
FROM cliente;

SET AUTOCOMMIT=0;
INSERT INTO cliente VALUES (2, 'Maria');
INSERT INTO cliente VALUES (20, 'Juan');
DELETE FROM cliente WHERE nombre = 'Pepe';

-- 2. ¿Qué devolverá esta consulta?
SELECT *
FROM cliente;

ROLLBACK;

-- 3. ¿Qué devolverá esta consulta?
SELECT *
FROM cliente;

DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;

CREATE TABLE cuentas (
    id INTEGER UNSIGNED PRIMARY KEY,
    saldo DECIMAL(11,2) CHECK (saldo >= 0)
);

INSERT INTO cuentas VALUES (1, 1000);
INSERT INTO cuentas VALUES (2, 2000);
INSERT INTO cuentas VALUES (3, 0);

-- 1. Consultamos el estado actual de las cuentas
SELECT *
FROM cuentas;

-- 2. Suponga que queremos realizar una transferencia de dinero entre dos cuentas bancarias con la siguiente transacción:
START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

-- 3. ¿Qué devolverá esta consulta?
SELECT *
FROM cuentas;

-- 4. Suponga que queremos realizar una transferencia de dinero entre dos cuentas bancarias con la siguiente transacción y una de las dos cuentas no existe:
START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 9999;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

-- 5. ¿Qué devolverá esta consulta?
SELECT *
FROM cuentas;

-- 6. Suponga que queremos realizar una transferencia de dinero entre dos cuentas bancarias con la siguiente transacción y la cuenta origen no tiene saldo:
START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 3;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

-- 7. ¿Qué devolverá esta consulta?
SELECT *
FROM cuentas;

-- Dirty Read (Lectura sucia) --
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;	
SELECT saldo FROM cuentas WHERE id = 1;
ROLLBACK;

-- Non-Repeatable Read (Lectura No Repetible) --
SELECT saldo FROM cuentas WHERE id = 1;	
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
SELECT saldo FROM cuentas WHERE id = 1;	

--  Phantom Read (Lectura fantasma) --
SELECT SUM(saldo) FROM cuentas;	
INSERT INTO cuentas VALUES (3, 3000);
SELECT SUM(saldo) FROM cuentas;	
