-- Omar Y Diego

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;

-- Crear tabla clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos de ejemplo
INSERT INTO clientes (nombre, apellido, telefono, email) VALUES
('Omar', 'Guevara', '8126262931', 'omar@email.com'),
('Diego', 'Medellin', '8136262942', 'diego@email.com'),
('Nicolas', 'Nolazco', '8146262953', 'N1co@email.com'),
('Ivan', 'Silverio', '8156262964', 'ivan@email.com'),
('Demian', 'Quiroga', '8166262975', 'dkalil@email.com');

-- Crear tabla reservas
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_reserva DATE,
    hora_reserva TIME,
    num_personas INT,
    estado ENUM('Confirmada', 'Cancelada', 'Pendiente'),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Insertar reservas
INSERT INTO reservas (id_cliente, fecha_reserva, hora_reserva, num_personas, estado) VALUES
(1, '2025-09-19', '19:30:00', 4, 'Confirmada'),
(2, '2025-09-20', '20:00:00', 2, 'Pendiente'),
(3, '2025-09-20', '20:45:00', 4, 'Confirmada'),
(4, '2025-09-23', '21:00:00', 2, 'Confirmada'),
(5, '2025-09-25', '22:30:00', 2, 'Pendiente');

-- Crear tabla mesas
CREATE TABLE mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT,
    capacidad INT,
    ubicacion ENUM('Interior', 'Terraza')
);

-- Insertar mesas
INSERT INTO mesas (numero_mesa, capacidad, ubicacion) VALUES
(1, 4, 'Interior'),
(2, 2, 'Terraza'),
(3, 4, 'Interior'),
(4, 2, 'Terraza'),
(5, 4, 'terraza');

-- Crear tabla asignaciones_mesas
CREATE TABLE asignaciones_mesas (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    id_mesa INT,
    hora_asignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
    FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa)
);

-- Insertar asignaciones
INSERT INTO asignaciones_mesas (id_reserva, id_mesa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);