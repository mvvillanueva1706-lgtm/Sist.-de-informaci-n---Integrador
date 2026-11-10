CREATE DATABASE Club_deportivo;
USE Club_deportivo;

CREATE TABLE socio (
    id_socio INT AUTO_INCREMENT PRIMARY KEY,
    nombreSocio VARCHAR(50) NOT NULL,
    dni VARBINARY(50) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE entrenador (
    id_entrenador INT AUTO_INCREMENT PRIMARY KEY,
    nombreEntrenador VARCHAR(50) NOT NULL
);

CREATE TABLE actividad (
    id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    nombreActividad VARCHAR(50) NOT NULL,
    arancel DECIMAL(10,2) NOT NULL,
    id_entrenador INT NOT NULL,
    FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador)
);

CREATE TABLE inscripcion (
    id_socio INT NOT NULL,
    id_actividad INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    PRIMARY KEY (id_socio, id_actividad),
    FOREIGN KEY (id_socio) REFERENCES socio(id_socio),
    FOREIGN KEY (id_actividad) REFERENCES actividad(id_actividad)
);

INSERT INTO socio (nombreSocio, dni, fecha_nacimiento) VALUES
('Juan Pérez', DES_ENCRYPT('35123456', 'dniSocio'), '1990-05-12'),
('María Gómez', DES_ENCRYPT('38987654', 'dniSocio'), '1995-08-22'),
('Carlos López', DES_ENCRYPT('40111222', 'dniSocio'), '1997-01-30'),
('Ana Martínez', DES_ENCRYPT('42333444', 'dniSocio'), '2000-11-15');


INSERT INTO entrenador (nombreEntrenador) VALUES
('Roberto Carlos'),
('Laura Pausini');


INSERT INTO actividad (nombreActividad, arancel, id_entrenador) VALUES
('Fútbol', 4500.00, 1),
('Natación', 6000.00, 2),
('Básquet', 4000.00, 1);

INSERT INTO inscripcion (id_socio, id_actividad, fecha_inscripcion) VALUES
(1, 1, '2026-03-01'),
(2, 2, '2026-03-02'),
(3, 3, '2026-03-05'),
(4, 1, '2026-03-10');

/*
SELECT (dni) FROM socio;
SELECT DES_DECRYPT(dni, 'dniSocio') 
FROM socio;
*/