DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;
CREATE TABLE fpn(
numeroF FLOAT(4,2),
numeroD DOUBLE,
numeroDec DECIMAL(4,2),
numeroNum numeric(4,2)
);
SELECT*
FROM experimento;
insert INTO experimento VALUES (4.99,4.99,4.99,4.99);

SELECT*
FROM experimento;