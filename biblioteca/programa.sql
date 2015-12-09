BEGIN;
CREATE TABLE "libros_tipo_usuario" (
    "id" integer NOT NULL PRIMARY KEY,
    "nombre" varchar(100) NOT NULL
)
;

CREATE TABLE "libros_espacio" (
    "id" integer NOT NULL PRIMARY KEY,
    "nombre_espacio" varchar(200) NOT NULL,
    "codigo" integer NOT NULL,
    "estado" varchar(200) NOT NULL,
    "disponibilidad" bool NOT NULL,
    "fecha_adquisicion" date NOT NULL,
    "fecha_publicacion" date NOT NULL
)
;

CREATE TABLE "libros_usuario" (
    "id" integer NOT NULL PRIMARY KEY,
    "nombre" varchar(100) NOT NULL,
    "apellido" varchar(100) NOT NULL,
    "tipo_id" varchar(100) NOT NULL,
    "identificacion" varchar(100) NOT NULL,
    "fecha_nac" date NOT NULL,
    "telefono" varchar(100) NOT NULL,
    "direccion" varchar(100) NOT NULL,
    "genero" varchar(200) NOT NULL,
    "tipo_usuario_id" integer NOT NULL REFERENCES "libros_tipo_usuario" ("id"),
    "user_id" integer NOT NULL UNIQUE,
    "photo" varchar(100)
)
;
CREATE TABLE "libros_bibliotecario" (
    "id" integer NOT NULL PRIMARY KEY,
    "nombre" varchar(200) NOT NULL,
    "apellidos" varchar(200) NOT NULL,
    "telefono" varchar(200) NOT NULL,
    "direcccion" varchar(200) NOT NULL,
    "correo" varchar(200) NOT NULL,
    "genero" varchar(200) NOT NULL
)
;
CREATE TABLE "libros_prestamo" (
    "id" integer NOT NULL PRIMARY KEY,
    "fecha_prestamo" date NOT NULL,
    "fecha_devolucion" date NOT NULL,
    "espacio_id" integer NOT NULL REFERENCES "libros_espacio" ("id"),
    "bibliotecario" varchar(100),
    "usuario_id" integer NOT NULL REFERENCES "libros_usuario" ("id"),
    "estado_prestamo" varchar(200) NOT NULL
)
;


CREATE INDEX "libros_usuario_b74f55c2" ON "libros_usuario" ("tipo_usuario_id");
CREATE INDEX "libros_prestamo_dd67b109" ON "libros_prestamo" ("espacio_id");
CREATE INDEX "libros_prestamo_c69e2c81" ON "libros_prestamo" ("usuario_id");

COMMIT;
