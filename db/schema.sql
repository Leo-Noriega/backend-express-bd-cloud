CREATE DATABASE IF NOT EXISTS countries_db;
USE countries_db;
CREATE TABLE IF NOT EXISTS paises (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  CONSTRAINT pk_paises PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS estados (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  pais_id INT(11) NOT NULL,
  CONSTRAINT pk_estados PRIMARY KEY (id),
  CONSTRAINT fk_estados_paises FOREIGN KEY (pais_id) REFERENCES paises(id)
);

CREATE TABLE IF NOT EXISTS municipios (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  estado_id INT(11) NOT NULL,
  CONSTRAINT pk_municipios PRIMARY KEY (id),
  CONSTRAINT fk_municipios_estados FOREIGN KEY (estado_id) REFERENCES estados(id)
);

-- Inserts de Paises
INSERT INTO paises (nombre) VALUES ('México');
INSERT INTO paises (nombre) VALUES ('Estados Unidos');
INSERT INTO paises (nombre) VALUES ('Canadá');
-- Inserts de Estados
INSERT INTO estados (nombre, pais_id) VALUES ('Jalisco', 1);
INSERT INTO estados (nombre, pais_id) VALUES ('Nuevo León', 1);
INSERT INTO estados (nombre, pais_id) VALUES ('California', 2);
INSERT INTO estados (nombre, pais_id) VALUES ('Texas', 2);
INSERT INTO estados (nombre, pais_id) VALUES ('Ontario', 3);
INSERT INTO estados (nombre, pais_id) VALUES ('Quebec', 3);
-- Inserts de Municipios
INSERT INTO municipios (nombre, estado_id) VALUES ('Guadalajara', 1);
INSERT INTO municipios (nombre, estado_id) VALUES ('Zapopan', 1);
INSERT INTO municipios (nombre, estado_id) VALUES ('Monterrey', 2);
INSERT INTO municipios (nombre, estado_id) VALUES ('San Nicolás', 2);
INSERT INTO municipios (nombre, estado_id) VALUES ('Los Angeles', 3);
INSERT INTO municipios (nombre, estado_id) VALUES ('San Francisco', 3);
INSERT INTO municipios (nombre, estado_id) VALUES ('Houston', 4);
INSERT INTO municipios (nombre, estado_id) VALUES ('Dallas', 4);
INSERT INTO municipios (nombre, estado_id) VALUES ('Toronto', 5);
INSERT INTO municipios (nombre, estado_id) VALUES ('Ottawa', 6);