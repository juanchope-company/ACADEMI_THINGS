#Drop database AcademicThings;

CREATE DATABASE AcademicThings;

USE AcademicThings;

#USUARIO
CREATE TABLE USUARIO (
	id bigint PRIMARY KEY NOT NULL,
	nombre VARCHAR (45) NOT NULL,
	nombre_usuario VARCHAR (25) NOT NULL,
	correo_electronico VARCHAR (45) NOT NULL,
	genero VARCHAR (9),
	profesion VARCHAR (50) ,
	universidad VARCHAR (60) NOT NULL,
	descripcion_perfil VARCHAR (500) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	numero_celular INT NOT NULL,
	foto_perfil BLOB,
	contraseña VARCHAR (20) NOT NULL
);

#PUBLICACIÓN 
CREATE TABLE PUBLICACION ( 
	id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	contenido VARCHAR (400) NOT NULL,
	votos_positivos BIGINT  DEFAULT 0, 
	votos_negativos BIGINT DEFAULT 0,
	id_usuario BIGINT NOT NULL,
	CONSTRAINT fk_pb_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id)
);

#MANUSCRITO
CREATE TABLE MANUSCRITO (
	id BIGINT AUTO_INCREMENT  PRIMARY KEY NOT NULL,
	encabezado VARCHAR (40) NOT NULL,
	contenido VARCHAR (1000) NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	archivo BLOB,
    id_publicacion BIGINT NOT NULL,
    id_usuario BIGINT NOT NULL,
    CONSTRAINT fk_mc_publicacion FOREIGN KEY (id_publicacion) REFERENCES PUBLICACION(id),
    CONSTRAINT fk_mc_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id)
);

#ENCUESTA
CREATE TABLE ENCUESTA (
	id BIGINT AUTO_INCREMENT  PRIMARY KEY NOT NULL,
	titulo VARCHAR (40) NOT NULL,
	fecha_realizacion DATE NOT NULL,
	descripcion VARCHAR (200) NOT NULL,
    contesta VARCHAR(2) NOT NULL,
	id_usuario BIGINT NOT NULL,
	CONSTRAINT fk_enc_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO (id),
    CONSTRAINT ck_contesta CHECK (contesta = "si" or "no")
);

#PREGUNTA
CREATE TABLE PREGUNTA (
	consecutivo BIGINT AUTO_INCREMENT  PRIMARY KEY NOT NULL,
	id_encuesta BIGINT NOT NULL,
	tipo VARCHAR (15) NOT NULL,
	contenido  varchar(400) NOT NULL,
	banco_respuestas TINYTEXT NOT NULL,
	respuestas_correctas TINYTEXT,
    CONSTRAINT pr_id_encuesta FOREIGN KEY (id_encuesta) REFERENCES ENCUESTA(id), 
	CONSTRAINT pr_tipo CHECK ( tipo= "Opción multiple" or "abierta" )
);

#RESPUESTA 
CREATE TABLE RESPUESTA (
	id BIGINT AUTO_INCREMENT NOT NULL,
	consecutivo_pregunta BIGINT NOT NULL,
	respuesta_cerrada int,
    respuesta_abierta varchar(200),
	PRIMARY KEY (id,consecutivo_pregunta),
	CONSTRAINT fk_rs_consecutivo FOREIGN KEY (consecutivo_pregunta) REFERENCES PREGUNTA (consecutivo)
);

#COMENTARIO
CREATE TABLE COMENTARIO (
	id BIGINT AUTO_INCREMENT  PRIMARY KEY NOT NULL,
	contenido_comentario varchar(400) NOT NULL,
	fecha date NOT NULL,
	hora time NOT NULL,
	votos_positivos  int NOT NULL DEFAULT 0,
	votos_negativos   int NOT NULL DEFAULT 0,
    id_usuario BIGINT NOT NULL,
    id_publicacion BIGINT NOT NULL,
    CONSTRAINT fk_com_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id),
    CONSTRAINT fk_com_publicacion FOREIGN KEY (id_publicacion) REFERENCES PUBLICACION(id)
);

#PQR
CREATE TABLE PQR(
	id_solicitud BIGINT AUTO_INCREMENT  PRIMARY KEY NOT NULL,
	tipo CHAR NOT NULL,
	asunto VARCHAR (40) NOT NULL,
	cuerpo VARCHAR (500) NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
    id_usuario BIGINT NOT NULL,
	CONSTRAINT num_tipo CHECK (tipo = "P" or "Q" OR  "R" OR "S"),
    CONSTRAINT fk_pqr_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id)
);

#TEMATICA 
CREATE TABLE TEMATICA ( 
	id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (45) NOT NULL,
	descripcion VARCHAR (45) NOT NULL
);

#LIBRO 
CREATE TABLE LIBRO (
	id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (45) NOT NULL,
	autor VARCHAR (45) NOT NULL,
	fecha_publicacion DATE NOT NULL,
	direccion_descarga VARCHAR (45) NOT NULL,
	archivo BLOB NOT NULL
);

#ETIQUETA
CREATE TABLE ETIQUETA(
	id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_publicacion BIGINT,
    id_libro BIGINT,
    id_tematica BIGINT NOT NULL,
    CONSTRAINT fk_eti_publicacion FOREIGN KEY (id_publicacion) REFERENCES PUBLICACION(id),
    CONSTRAINT fk_eti_libro FOREIGN KEY (id_libro) REFERENCES LIBRO(id),
    CONSTRAINT fk_eti_tematica FOREIGN KEY (id_tematica) REFERENCES TEMATICA(id)
);

#LIBRO_INTERES 
CREATE TABLE LIBRO_INTERES ( 
	id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_usuario BIGINT,
	id_libro BIGINT,
	fecha_consulta DATE NOT NULL,
	CONSTRAINT fk_lbin_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO (id),
	CONSTRAINT fk_lbin_libro FOREIGN KEY (id_libro) REFERENCES LIBRO (id)
);
