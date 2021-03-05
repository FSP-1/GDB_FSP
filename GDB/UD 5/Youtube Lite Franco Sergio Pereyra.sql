DROP DATABASE IF EXISTS youtube_lite;
CREATE DATABASE youtube_lite CHARSET utf8mb4;
USE youtube_lite;
CREATE TABLE usuario(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
email  VARCHAR(100) NOT NULL,
contraseña CHAR(9)  NOT NULL , 
username VARCHAR(50) NOT NULL, 
fecha_nacimiento DATE NOT NULL, 
sexo ENUM('H', 'M') NOT NULL,
pais  VARCHAR(50) NOT NULL, 
codigo_postal  VARCHAR(13) NOT NULL
);
CREATE TABLE video(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
id_usuario INT UNSIGNED NOT NULL, 
titulo VARCHAR(100) NOT NULL, 
descripcion VARCHAR(1024) NOT NULL, 
tamanyo LONGTEXT NOT NULL,
nombre_archivo VARCHAR(100) NOT NULL, 
duracion TIME NOT NULL,
thumbnail LONGTEXT NOT NULL,
reproducciones BIGINT NOT NULL,
likes BIGINT NOT NULL,
dislikes BIGINT NOT NULL,
estado ENUM('Publico','Oculto','Privado') NOT NULL,
fecha_publicacion DATE NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);
CREATE TABLE etiqueta(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL
);
CREATE TABLE video_tiene_etiqueta(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_video INT UNSIGNED NOT NULL, 
id_etiqueta INT UNSIGNED NOT NULL,
FOREIGN KEY (id_video) REFERENCES video(id),
FOREIGN KEY (id_etiqueta) REFERENCES etiqueta(id)
);
CREATE TABLE canal(
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_usuario INT UNSIGNED NOT NULL, 
nombre  VARCHAR(50) NOT NULL, 
descripcion  VARCHAR(1024) NOT NULL, 
fecha_creacion  DATE NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);
CREATE TABLE  usuario_suscribe_canal(
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_usuario INT UNSIGNED NOT NULL, 
id_canal INT UNSIGNED NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_canal) REFERENCES canal(id)
);
CREATE TABLE usuario_valora_video(
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_usuario INT UNSIGNED NOT NULL, 
id_video INT UNSIGNED NOT NULL, 
valoracion  CHAR(9)  NOT NULL, 
fecha_hora DATETIME NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_video) REFERENCES video(id)
);
CREATE TABLE playlist(
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_usuario INT UNSIGNED NOT NULL,  
nombre  VARCHAR(50) NOT NULL, 
fecha_creacion DATE NOT NULL,
estado ENUM('Publica','Privado') NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);
CREATE TABLE playlist_contiene_video(
id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_playlist INT UNSIGNED NOT NULL, 
id_video INT UNSIGNED NOT NULL,
FOREIGN KEY (id_playlist) REFERENCES playlist(id),
FOREIGN KEY (id_video) REFERENCES video(id)
);
CREATE TABLE video_relacionado(
id_video INT UNSIGNED NOT NULL,
id_video_relacionado  INT UNSIGNED NOT NULL,
PRIMARY KEY (id_video,id_video_relacionado),
FOREIGN KEY (id_video) REFERENCES video(id),
FOREIGN KEY (id_video_relacionado) REFERENCES video(id)
);
CREATE TABLE comentario(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_usuario INT UNSIGNED NOT NULL, 
id_video INT UNSIGNED NOT NULL,
texto  VARCHAR(1024) NOT NULL, 
fecha_hora DATETIME NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_video) REFERENCES video(id)
);
CREATE TABLE usuario_valora_comentario(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_usuario INT UNSIGNED NOT NULL,  
id_comentario INT UNSIGNED NOT NULL,  
valoracion  CHAR(9)  NOT NULL, 
fecha_hora DATETIME NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_comentario) REFERENCES comentario(id)
);