-- -----------------------------------------------------
-- CREAR BASE DE DATOS FILMS
-- -----------------------------------------------------

CREATE DATABASE Netflix;

-- -----------------------------------------------------
-- LUEGO DE ESTAR CREADA SE SELECCIONA PARA TRABAJAR EN ELLA
-- -----------------------------------------------------

USE Netflix;

-- -----------------------------------------------------
-- CREACION DE LA TABLA ROL
-- -----------------------------------------------------

CREATE TABLE rol (
id_Rol INT NOT NULL,
nombre_Rol VARCHAR(25) NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA ROL PARA DEFINIR LA LLAVE PRIMARIA
-- -----------------------------------------------------

ALTER TABLE rol ADD PRIMARY KEY (id_Rol);

-- -----------------------------------------------------
-- CREACION DE TABLA TIPO DE DOCUMENTO
-- -----------------------------------------------------

CREATE TABLE tipo_Documento (
id_Documento TINYINT NOT NULL,
sigla VARCHAR(5) NOT NULL,
nombre_Tipo_Documento VARCHAR(30) NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA ROL PARA DEFINIR LA LLAVE PRIMARIA
-- -----------------------------------------------------

ALTER TABLE tipo_Documento ADD PRIMARY KEY (id_Documento);

-- -----------------------------------------------------
-- CREACION DE TABLA PLAN
-- -----------------------------------------------------

CREATE TABLE plan (
id_Plan INT NOT NULL,
nombre_Plan VARCHAR(25) NOT NULL,
costo  INT NOT NULL,
caracteristicas_Plan TEXT NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PLAN PARA DEFINIR LA LLAVE PRIMARIA
-- -----------------------------------------------------

ALTER TABLE plan ADD PRIMARY KEY (id_Plan);

-- -----------------------------------------------------
-- CREACION DE TABLA TIPO DE PAGO
-- -----------------------------------------------------

CREATE TABLE tipo_Pago (
id_Tipo_Pago INT NOT NULL,
nombre_Pago VARCHAR(20) NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA TIPO DE PAGO PARA DEFINIR LA LLAVE PRIMARIA
-- -----------------------------------------------------

ALTER TABLE tipo_Pago ADD PRIMARY KEY (id_Tipo_Pago);

-- -----------------------------------------------------
-- CREACION DE TABLA CATEGORIA
-- -----------------------------------------------------

CREATE TABLE categoria (
id_Cate INT NOT NULL,
nom_Cate VARCHAR(75) NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CATEGORIA PARA DEFINIR LA LLAVE PRIMARIA
-- -----------------------------------------------------

ALTER TABLE categoria ADD PRIMARY KEY (id_Cate);

-- -----------------------------------------------------
-- CREACION DE TABLA PELICULAS
-- -----------------------------------------------------

CREATE TABLE peliculas (
 id_Pelicula INT NOT NULL,
 nombre_Pelicula VARCHAR(100) NOT NULL,
 duracion TIME NOT NULL,
 año YEAR NOT NULL,
 sinopsis TEXT NOT NULL,
 estado TINYINT NOT NULL
 );

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PELICULAS PARA DEFINIR LA LLAVE PRIMARIA
-- -----------------------------------------------------

ALTER TABLE peliculas ADD PRIMARY KEY (id_Pelicula);

-- -----------------------------------------------------
-- CREACION DE TABLA CATEGORIA PELICULAS
-- -----------------------------------------------------

CREATE TABLE categoria_peliculas (
 fk_id_Peliculas INT NOT NULL,
 fk_id_Cate INT NOT NULL
 );

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CATEGORIA PELICULAS PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS PELICULAS PARA REFERENCIARLA CON UNA O MAS CATEGORIAS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA
-- -----------------------------------------------------

ALTER TABLE categoria_peliculas  ADD CONSTRAINT id_Peliculas_categorias FOREIGN KEY (fk_id_Peliculas) REFERENCES peliculas (id_Pelicula) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CATEGORIA PELICULAS PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS CATEGORIAS PARA REFERENCIARLA CON UNA O MAS PELICULAS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE categoria_peliculas ADD CONSTRAINT id_Cate_Peliculas FOREIGN KEY (fk_id_Cate) REFERENCES categoria (id_Cate) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CATEGORIA PELICULAS PARA DEFINIR LOS DOS CAMPOS 
-- CREADOS COMO LLLAVES PRIMARIAS
-- -----------------------------------------------------

ALTER TABLE categoria_peliculas ADD PRIMARY KEY (fk_id_Peliculas, fk_id_Cate);

-- -----------------------------------------------------
-- CREACION DE TABLA SERIES
-- -----------------------------------------------------
CREATE TABLE series (
id_Series INT NOT NULL,
nombre_Series VARCHAR(100) NOT NULL,
numero_Temporadas TINYINT NOT NULL,
año YEAR NOT NULL,
sinopsis TEXT NOT NULL,
calificacion FLOAT NOT NULL,
estado ENUM('Activo', 'Inactivo') NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA SERIES PARA DEFINIR LA LLAVE PRIMARIA
-- -----------------------------------------------------

ALTER TABLE series ADD PRIMARY KEY (id_Series);

-- -----------------------------------------------------
-- CREACION DE TABLA CATEGORIA SERIES
-- -----------------------------------------------------

CREATE TABLE categoria_serie (
fk_id_Cate INT NOT NULL,
fk_id_Series INT NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CATEGORIA SERIES PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS CATEGORIAS PARA REFERENCIARLA CON UNA O MAS SERIES
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE categoria_serie ADD CONSTRAINT id_Cate_Series FOREIGN KEY (fk_id_Cate) REFERENCES categoria (id_Cate) ON UPDATE CASCADE; 

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CATEGORIA SERIES PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS SERIES PARA REFERENCIARLA CON UNA O MAS CATEGORIAS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE categoria_serie ADD CONSTRAINT id_Series_Cate FOREIGN KEY (fk_id_Series) REFERENCES series (id_Series) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CATEGORIA SERIES PARA DEFINIR LOS DOS CAMPOS 
-- CREADOS COMO LLLAVES PRIMARIAS
-- -----------------------------------------------------

ALTER TABLE categoria_serie ADD PRIMARY KEY (fk_id_Cate, fk_id_Series);

-- -----------------------------------------------------
-- CREACION DE TABLA IDIOMA
-- -----------------------------------------------------

CREATE TABLE idioma (
id_Idioma INT NOT NULL,
nombre_Idioma VARCHAR(12) NOT NULL,
PRIMARY KEY (id_Idioma)
);

-- -----------------------------------------------------
-- CREACION DE TABLA PELICULA IDIOMA
-- -----------------------------------------------------

CREATE TABLE pelicula_idioma (
fk_id_Idioma INT NOT NULL,
fk_id_Pelicula INT NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PELICULAS IDIOMAS PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LOS IDIOMAS  PARA REFERENCIARLA CON UNA O MAS PELICULAS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE pelicula_idioma ADD CONSTRAINT id_Idioma_Pelicula FOREIGN KEY (fk_id_Idioma) REFERENCES idioma (id_Idioma) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PELICULAS IDIOMAS PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS PELICULAS   PARA REFERENCIARLA CON UNO O MAS IDIOMAS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE pelicula_idioma ADD CONSTRAINT id_Pelicula_Idioma FOREIGN KEY (fk_id_Pelicula) REFERENCES peliculas (id_Pelicula) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PELICULA IDIOMA PARA DEFINIR LOS DOS CAMPOS 
-- CREADOS COMO LLLAVES PRIMARIAS
-- -----------------------------------------------------

ALTER TABLE pelicula_idioma ADD PRIMARY KEY (fk_id_Pelicula, fk_id_Idioma);

-- -----------------------------------------------------
-- CREACION DE TABLA USUARIO
-- -----------------------------------------------------

CREATE TABLE usuario (
numero_Documento VARCHAR(15) NOT NULL,
p_Nombre VARCHAR(25) NOT NULL,
s_Nombre VARCHAR(25),
p_Apellido VARCHAR(25) NOT NULL,
s_Apellido VARCHAR(25),
email VARCHAR(100) NOT NULL,
contraseña VARCHAR(60) NOT NULL,
fk_id_Documento TINYINT NOT NULL,
fk_id_Rol INT NOT NULL,
FOREIGN KEY (fk_id_Documento) REFERENCES tipo_documento (id_Documento),
FOREIGN KEY (fk_id_Rol) REFERENCES rol (id_Rol),
PRIMARY KEY (numero_Documento, fk_id_Documento)
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA USUARIO PARA AGREGAR UN NUEVO CAMPO PARA
-- ALMACENAR EL IDENTIFICADOR DEL PLAN CONTRATADO POR EL USUARIO
-- -----------------------------------------------------
 
ALTER TABLE usuario ADD fk_id_Plan INT NOT NULL;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA USUARIO PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LOS PLANES  PARA REFERENCIAR UN PLAN CON UN USUARIO
--  DETERMINADO 
-- -----------------------------------------------------

ALTER TABLE usuario add FOREIGN KEY (fk_id_Plan) REFERENCES plan (id_Plan);

-- -----------------------------------------------------
-- CREACION DE TABLA FACTURA
-- -----------------------------------------------------

CREATE TABLE factura (
id_Factura INT NOT NULL,
fecha DATE NOT NULL,
hora TIME NOT NULL,
fk_numero_Documento VARCHAR(15) NOT NULL, 
fk_id_Documento TINYINT NOT NULL,
fk_id_tipo_Pago INT NOT NULL,
fk_id_Plan INT NOT NULL,
FOREIGN KEY (fk_numero_Documento, fk_id_Documento) REFERENCES usuario (numero_Documento, fk_id_Documento),
FOREIGN KEY (fk_id_tipo_Pago) REFERENCES tipo_Pago (id_tipo_Pago),
FOREIGN KEY (fk_id_Plan) REFERENCES plan (id_Plan),
PRIMARY KEY (id_Factura, fk_numero_Documento, fk_id_Documento)
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA FACTURA PARA MODIFICAR LA ESTRUCTURA DE LA  
-- COLUMNA ID FACTURA Y DE ESTE MODO ESTE SE INCREMENTE AUTOMATICAMENTE
-- -----------------------------------------------------

ALTER TABLE factura MODIFY COLUMN id_Factura INT NOT NULL AUTO_INCREMENT;

-- -----------------------------------------------------
-- CREACION DE TABLA PERFIL
-- -----------------------------------------------------

CREATE TABLE perfil (
id_Perfil INT NOT NULL,
nombre_Perfil VARCHAR(15) NOT NULL,
avatar BLOB NOT NULL,
fk_numero_Documento VARCHAR(15) NOT NULL,
fk_id_Documento TINYINT NOT NULL,
FOREIGN KEY (fk_numero_Documento, fk_id_Documento) REFERENCES usuario (numero_Documento, fk_id_Documento),
PRIMARY KEY (id_Perfil)
);

-- -----------------------------------------------------
-- CREACION DE TABLA PERFIL PELICULA
-- -----------------------------------------------------

CREATE TABLE perfil_pelicula (
fk_id_Pelicula INT NOT NULL,
fk_id_Perfil INT NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PERFIL PELICULAS PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS PELICULAS  PARA REFERENCIARLA CON UNO O MAS PERFILES
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------
 
ALTER TABLE perfil_pelicula ADD CONSTRAINT id_Pelicula_Perfil FOREIGN KEY (fk_id_Pelicula) REFERENCES peliculas (id_Pelicula) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PERFIL PELICULAS PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LOS PERFILES  PARA REFERENCIARLA CON UNA O MAS PELICULAS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE perfil_pelicula ADD CONSTRAINT id_Perfil_Pelicula FOREIGN KEY (fk_id_Perfil) REFERENCES perfil (id_Perfil) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA PERFIL PELICULA PARA DEFINIR LOS DOS CAMPOS 
-- CREADOS COMO LLLAVES PRIMARIAS
-- -----------------------------------------------------

ALTER TABLE perfil_pelicula ADD PRIMARY KEY (fk_id_Pelicula, fk_id_Perfil);

-- -----------------------------------------------------
-- CREACION DE TABLA SERIE PERFIL
-- -----------------------------------------------------

CREATE TABLE serie_perfil (
fk_id_Series INT NOT NULL,
fk_id_Perfil INT NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA SERIE PERFIL PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS SERIES  PARA REFERENCIARLA CON UNO O MAS PERFILES
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE serie_perfil ADD CONSTRAINT id_Serie_Perfil FOREIGN KEY (fk_id_Series) REFERENCES series (id_Series) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA SERIE PERFIL PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LAS SERIES  PARA REFERENCIARLA CON UNO O MAS PERFILES
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE serie_perfil ADD CONSTRAINT id_Perfil_Serie FOREIGN KEY (fk_id_Perfil) REFERENCES perfil (id_Perfil) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA SERIE PERFIL PARA DEFINIR LOS DOS CAMPOS 
-- CREADOS COMO LLLAVES PRIMARIAS
-- -----------------------------------------------------

ALTER TABLE serie_perfil ADD PRIMARY KEY (fk_id_Series, fk_id_Perfil);

-- -----------------------------------------------------
-- CREACION DE TABLA TEMPORADAS
-- -----------------------------------------------------

CREATE TABLE temporadas (
id_Temporada INT NOT NULL,
num_Temporada TINYINT NOT NULL,
fk_id_Series INT NOT NULL,
FOREIGN KEY (fk_id_Series) REFERENCES series (id_Series),
PRIMARY KEY (id_Temporada)
);

-- -----------------------------------------------------
-- CREACION DE TABLA CAPITULOS
-- -----------------------------------------------------

CREATE TABLE capitulos (
id_Capitulos INT NOT NULL,
nom_Capitulo VARCHAR(85) NOT NULL,
num_Capitulo TINYINT NOT NULL,
duracion TIME NOT NULL,
fk_id_Temporadas INT NOT NULL,
FOREIGN KEY (fk_id_Temporadas) REFERENCES temporadas (id_Temporada),
PRIMARY KEY (id_Capitulos)
);

-- -----------------------------------------------------
-- CREACION DE TABLA CAPITULO IDIOMA
-- -----------------------------------------------------

CREATE TABLE capitulo_idioma (
fk_id_Capitulos INT NOT NULL,
fk_id_Idioma INT NOT NULL
);

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CAPITULO IDIOMA PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LOS CAPITULOS  PARA REFERENCIARLA CON UNO O MAS IDIOMAS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------

ALTER TABLE capitulo_idioma ADD CONSTRAINT id_Capitulos_Idioma FOREIGN KEY (fk_id_Capitulos) REFERENCES capitulos (id_Capitulos) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CAPITULO IDIOMA PARA AGREGAR LA LLAVE FORANEA 
-- DE EL ID DE LOS IDIOMAS  PARA REFERENCIARLA CON UNO O MAS CAPITULOS
-- SE AGREGA LA FUNCIONALIDAD DE ACTUALIZACIÓN EN CASCADA 
-- -----------------------------------------------------



ALTER TABLE capitulo_idioma ADD CONSTRAINT id_Idioma_Capitulos FOREIGN KEY (fk_id_Idioma) REFERENCES  idioma (id_Idioma) ON UPDATE CASCADE;

-- -----------------------------------------------------
-- SE ALTERA LA TABLA CAPITULO IDIOMA PARA DEFINIR LOS DOS CAMPOS 
-- CREADOS COMO LLLAVES PRIMARIAS
-- -----------------------------------------------------

ALTER TABLE capitulo_idioma ADD PRIMARY KEY (fk_id_Capitulos, fk_id_Idioma);

-- -----------------------------------------------------
-- CREACION DE TABLA SERVIDOR CORREO
-- -----------------------------------------------------

CREATE TABLE servidor_correo (
id_Servidor_Correo INT NOT NULL,
nom_Servidor_Correo VARCHAR(45) NOT NULL,
PRIMARY KEY (id_Servidor_Correo)
);

-- -----------------------------------------------------
-- CREACION DE TABLA LOG ERROR
-- -----------------------------------------------------

CREATE TABLE log_error (
id_Error INT NOT NULL,
descripcion_error VARCHAR(200) NOT NULL,
fecha_hora_error DATETIME NOT NULL,
PRIMARY KEY (id_Error)
);

