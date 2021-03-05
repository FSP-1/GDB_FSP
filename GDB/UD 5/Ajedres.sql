DROP DATABASE IF EXISTS ajedres;
CREATE DATABASE ajedres CHARACTER SET utf8mb4;
USE ajedres;
CREATE TABLE participante(
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 numero_asociado INT UNSIGNED NOT NULL, 
 nombre VARCHAR(100) NOT NULL,
 apellido1 VARCHAR(100) NOT NULL,
 apellido2 VARCHAR(100),
 direccion VARCHAR(300) NOT NULL,
 telefono VARCHAR(32) NOT NULL,
 tipo ENUM('Jugador','Árbitro') NOT NULL
);
CREATE TABLE jugador(
id INT UNSIGNED NOT NULL,
nivel TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (id) REFERENCES participante(id) 
);
CREATE TABLE arbitro(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
anyos_experiencia TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (id) REFERENCES participante(id) 
);
CREATE TABLE pais(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(100) NOT NULL,
numero_clubs SMALLINT UNSIGNED NOT NULL, 
id_pais_representante  INT UNSIGNED,
FOREIGN KEY (id_pais_representante) REFERENCES pais(id)
);
CREATE TABLE hotel(
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(200) NOT NULL,
direccion VARCHAR(300) NOT NULL,
telefono VARCHAR(32) NOT NULL
);
CREATE TABLE sala(
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(100) NOT NULL,
capacidad SMALLINT UNSIGNED NOT NULL, 
id_hotel INT UNSIGNED,
FOREIGN KEY (id_hotel) REFERENCES hotel(id)
);
CREATE TABLE medios(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(500) NOT NULL
);
CREATE TABLE sala_tiene_medios(
id_sala INT UNSIGNED NOT NULL, 
id_medio INT UNSIGNED NOT NULL,
FOREIGN KEY (id_sala) REFERENCES sala(id),
FOREIGN KEY (id_medio) REFERENCES medios(id)
);
CREATE TABLE participante_se_aloja_hotel(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
id_participante INT UNSIGNED NOT NULL, 
id_hotel INT UNSIGNED NOT NULL, 
fecha_entrada DATETIME NOT NULL, 
fecha_salida DATETIME NOT NULL,
FOREIGN KEY (id_hotel) REFERENCES hotel(id),
FOREIGN KEY (id_participante) REFERENCES participante(id)
);
CREATE TABLE jornada(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
dia TINYINT UNSIGNED NOT NULL, 
mes TINYINT UNSIGNED NOT NULL, 
anyo YEAR NOT NULL
);
CREATE TABLE partida(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
id_jugador_blancas INT UNSIGNED NOT NULL, 
id_jugador_negras INT UNSIGNED NOT NULL, 
id_arbitro INT UNSIGNED NOT NULL, 
id_sala INT UNSIGNED NOT NULL, 
id_jornada INT UNSIGNED NOT NULL,
FOREIGN KEY (id_jugador_blancas) REFERENCES jugador(id),
FOREIGN KEY (id_jugador_negras) REFERENCES jugador(id),
FOREIGN KEY (id_arbitro) REFERENCES arbitro(id),
FOREIGN KEY (id_sala) REFERENCES sala(id),
FOREIGN KEY (id_jornada) REFERENCES jornada(id)
);
CREATE TABLE movimiento(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
numero_movimiento SMALLINT UNSIGNED NOT NULL, 
posiciones VARCHAR(500), 
comentario VARCHAR(2048) NOT NULL, 
id_partida INT UNSIGNED NOT NULL,
FOREIGN KEY (id_partida) REFERENCES partida(id)
);

