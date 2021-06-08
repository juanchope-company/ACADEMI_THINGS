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
	numero_celular varchar(15) NOT NULL,
	foto_perfil BLOB,
	contrasenna VARCHAR (20) NOT NULL
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

#SCRIPT SQL

#USUARIO

 INSERT INTO usuario  (id,nombre,nombre_usuario,correo_electronico,genero,profesion,universidad,descripcion_perfil,fecha_nacimiento,numero_celular,foto_perfil, contrasenna) VALUES (2,"andres","andres_jose","andres_jose.urbano@uao.edu.co","Masculino","ingeniero",
     "universidad autonoma","Estudiante 7 semestre","2020-08-06",5922356,null,
     "asda"
     );

#PUBLICACION
 INSERT INTO publicacion (id,fecha,hora,contenido,votos_positivos,votos_negativos,id_usuario) VALUES (2,"2020-06-10","10:00","pregunta asdadadadasd",null,null,2);

#COMENTARIO
 INSERT INTO comentario (id,contenido_comentario,fecha,hora,votos_positivos,votos_negativos,id_usuario, id_publicacion) VALUES (2,"dasdaddad","2020-10-12","12:00",3,1,2,2);
 
#PQR
 INSERT INTO pqr (id_solicitud,tipo,asunto,cuerpo,fecha,hora,id_usuario) VALUES (2,"P","peticion","dasdasdsadasdasd","2020-08-06","10:00",2);


#MANUSCRITO
 INSERT INTO manuscrito (id,encabezado,contenido,fecha,hora,archivo,id_publicacion,id_usuario) VALUES (2,"dasdasd","asdasdasdad","2020-06-09","9:00",null,2,2);


#ENCUESTA
  INSERT INTO encuesta (id,titulo,fecha_realizacion,descripcion,contesta,id_usuario) VALUES (2,"pregunta","2021-06-08","adasdadasd","si",2);

#PREGUNTA
INSERT INTO pregunta (id_encuesta,tipo,contenido,banco_respuestas,respuestas_correctas) VALUES (5,"abierta","as","asdasd","200","dasd");

#BIBLIOTECA 
 INSERT INTO biblioteca (id,id_usuario,id_libro,fecha_consulta) VALUES (4,2,3,"2020-06-08");

#LIBRO
 INSERT INTO libro (id,nombre,autor,fecha_publicacion,direccion_descarga,archivo) VALUES (2,"psicologia","Gabriel","2008-08-12","carrera 2232","archivo.jpg");

#TEMATICA
INSERT INTO tematica (id,nombre,descripcion) VALUES (2,"PSICOLOGIA","asdadsada");

#LIBRO INTERES
 INSERT INTO libro_interes (id,id_usuario,id_libro,fecha_consulta) VALUES (2,2,2,"2021-06-10");

#COMENTARIO
INSERT INTO comentario (id,contenido_comentario,fecha,hora,votos_positivos,votos_negativos,id_usuario,id_publicacion) 
VALUES (5,"contenido del comentario","2020-06-15","13:00",2,3,2,2);