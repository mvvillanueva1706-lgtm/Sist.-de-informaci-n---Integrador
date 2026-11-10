CREATE DATABASE Club_deportivo;
USE Club_deportivo;

CREATE TABLE socio (
    id_socio INT AUTO_INCREMENT PRIMARY KEY,
    nombreSocio VARBINARY(50) NOT NULL,
    dni VARBINARY(50) NOT NULL UNIQUE
);

-- VARBINARY sirve para almacenar cadenas d bytes binarios d longitud variable, VARCHAR almacena cadenas d texto

CREATE TABLE entrenador (
    id_entrenador INT AUTO_INCREMENT PRIMARY KEY,
    nombreEntrenador VARBINARY(50) NOT NULL
);

CREATE TABLE actividad (
    id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    nombreActividad VARBINARY(50) NOT NULL,
    id_entrenador INT NOT NULL,
    FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador)
);

CREATE TABLE socioActividad (
    id_socio INT NOT NULL,
    id_actividad INT NOT NULL,
    PRIMARY KEY (id_socio, id_actividad),
    FOREIGN KEY (id_socio) REFERENCES socio(id_socio),
    FOREIGN KEY (id_actividad) REFERENCES actividad(id_actividad)
);

INSERT INTO socio (nombreSocio, DNI) VALUES
(DES_ENCRYPT ('Juan Pérez', 'nombreSocio'), DES_ENCRYPT('35123456', 'dniSocio')),
(DES_ENCRYPT ('María Gómez', 'nombreSocio'), DES_ENCRYPT('38987654', 'dniSocio')),
(DES_ENCRYPT ('Carlos López', 'nombreSocio'), DES_ENCRYPT('40111222', 'dniSocio')),
(DES_ENCRYPT ('Ana Martínez', 'nombreSocio'), DES_ENCRYPT('42333444', 'dniSocio'));


INSERT INTO entrenador (nombreEntrenador) VALUES
(DES_ENCRYPT ('Roberto Carlos', 'nombreEntrenador')),
(DES_ENCRYPT ('Laura Pausini', 'nombreEntreanador'));


INSERT INTO actividad (nombreActividad, id_entrenador) VALUES
(DES_ENCRYPT ('Fútbol', 'nombreActividad'), 1),
(DES_ENCRYPT ('Natación', 'nombreActividad'), 2),
(DES_ENCRYPT ('Básquet', 'nombreActiviad'), 1);

INSERT INTO socioActividad (id_socio, id_actividad) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);
