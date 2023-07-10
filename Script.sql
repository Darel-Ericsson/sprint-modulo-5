CREATE DATABASE TELOVEN2;

# Creación de tabla Cliente
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    edad INT NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    usos_soporte INT DEFAULT 1
);

# Creación de tabla Operador
CREATE TABLE operadores(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(45) NOT NULL,
    apellido varchar(45) NOT NULL,
    edad INT NOT NULL,
    correo_electronico varchar(50) NOT NULL,
    soportes_relizados INT DEFAULT 1
);

# Creación de tabla Operaciones
CREATE TABLE registros_soporte(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_operador INT NOT NULL,
    fk_id_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    evaluacion INT,
    FOREIGN KEY (fk_id_operador) references operadores(id),
    FOREIGN KEY (fk_id_cliente) references clientes(id)
);

# Clientes
INSERT INTO clientes
VALUES
    (default, "Pedro", "Tapia", 37, "ptapia@bmail.com", 7),
    (default, "Juan", "Valencia", 23, "jvalencia@bmail.com", 3),
    (default, "Beatriz", "Lorca", 24, "blorca@bmail.com", 4),
    (default, "Marcelo", "Acevedo", 26, "macevedo@bmail.com", 1),
    (default, "Luna", "Gutierrez", 19, "lgutierrez@example.com", 5);
    
# Operadores
INSERT INTO operadores
VALUES
	(default, "Valentina", "Avalos", 28, "vavalos@bmail.com", 3),
    (default, "Carlos", "Pinto", 64, "cpinto@bmail.com", 6),
    (default, "Pamela", "Astudillo", 36, "pastudillo@bmail.com", 4),
    (default, "Hector", "Molina", 32, "hmolina@bmail.com", 4),
    (default, "Ismael", "Pozo", 19, "ipozo@bmail.com", 3);

# Registros Soportes
INSERT INTO registros_soporte
VALUES
	(default, 2, 3, "2020-11-01", 7),
	(default, 4, 3, "2021-08-19", 6),
	(default, 3, 4, "2022-09-21", 2),
	(default, 4, 1, "2022-12-03", 3),
	(default, 1, 1, "2023-01-17", 5),
	(default, 2, 1, "2023-03-02", 7),
	(default, 1, 2, "2023-04-08", 7),
	(default, 3, 1, "2023-07-02", 5),
	(default, 5, 5, "2023-09-25", 1),
	(default, 5, 5, "2023-10-31", 4);

# Seleccione las 3 operaciones con mejor evaluación
SELECT *
FROM registros_soporte
ORDER BY evaluacion DESC
LIMIT 3;

# Selecione las 3 operaciones con menos evaluación
SELECT *
FROM registros_soporte
ORDER BY evaluacion ASC
LIMIT 3;

# Seleccione el operario que mas soportes ha realizado
	# OPCION 1: Elegir el operador que tenga el valor mas alto en soportes_realizados
SELECT *
FROM operadores
WHERE soportes_relizados = (
    SELECT MAX(soportes_relizados)
    FROM operadores
);

	# OPCION 2: Soportes registrados en la tabla registros_soporte
SELECT fk_id_operador, COUNT(*) AS total_soportes
FROM registros_soporte
GROUP BY fk_id_operador
ORDER BY total_soportes DESC
LIMIT 1;

# Seleccione al cliente que menos veces ha utilizado la aplicación.
SELECT *
FROM clientes
ORDER BY usos_soporte ASC
LIMIT 1;

# Agregue 10 años a los tres primeros usuarios registrados.
UPDATE clientes
SET edad = edad + 10
ORDER BY id
LIMIT 3;

# Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.
ALTER TABLE clientes
CHANGE COLUMN `correo_electronico` `email` VARCHAR(50);
ALTER TABLE operadores
CHANGE COLUMN `correo_electronico` `email` VARCHAR(50);

# Seleccione solo los operarios mayores de 20 años.
SELECT * FROM operadores WHERE edad > 20;

#revision
select * from clientes;
