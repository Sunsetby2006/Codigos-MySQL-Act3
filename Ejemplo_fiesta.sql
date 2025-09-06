CREATE DATABASE fiesta_db;
USE fiesta_db;

CREATE TABLE personas (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invitados (
    id_invitado INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT,
    fecha_invitacion DATE,
    metodo_invitacion ENUM('WhatsApp', 'Email', 'Llamada', 'En persona'),
    FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE confirmaciones (
    id_confirmacion INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT,
    fecha_confirmacion DATE,
    estado ENUM('Confirma', 'No puede', 'Tal vez'),
    FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE asistentes (
    id_asistente INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT,
    hora_llegada TIME,
    acompaantes INT DEFAULT 0,
    FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

-- Insertar personas
INSERT INTO personas (nombre, apellido, telefono, email) VALUES
('Miguel', 'González', '81-1234-5678', 'miguel.gonzalez@email.com'),
('María', 'López', '81-2345-6789', 'maria.lopez@email.com'),
('José', 'Martínez', '81-3456-7890', 'jose.martinez@email.com'),
('Ana', 'Hernández', '81-4567-8901', 'ana.hernandez@email.com'),
('Carlos', 'García', '81-5678-9012', 'carlos.garcia@email.com'),
('Laura', 'Rodríguez', '81-6789-0123', 'laura.rodriguez@email.com'),
('Roberto', 'Pérez', '81-7890-1234', 'roberto.perez@email.com'),
('Sofía', 'Sánchez', '81-8901-2345', 'sofia.sanchez@email.com'),
('Diego', 'Ramírez', '81-9012-3456', 'diego.ramirez@email.com'),
('Valentina', 'Torres', '81-0123-4567', 'valentina.torres@email.com'),
('Alejandro', 'Flores', '81-1111-2222', 'alejandro.flores@email.com'),
('Camila', 'Morales', '81-3333-4444', 'camila.morales@email.com'),
('Fernando', 'Jiménez', '81-5555-6666', 'fernando.jimenez@email.com'),
('Isabella', 'Vargas', '81-7777-8888', 'isabella.vargas@email.com'),
('Ricardo', 'Castro', '81-9999-0000', 'ricardo.castro@email.com');

-- Insertar INVITADOS (10 personas fueron invitadas)
INSERT INTO invitados (id_persona, fecha_invitacion, metodo_invitacion) VALUES
(1, '2024-08-15', 'WhatsApp'),    
(2, '2024-08-15', 'WhatsApp'),    
(3, '2024-08-16', 'Email'),       
(4, '2024-08-16', 'WhatsApp'),    
(5, '2024-08-17', 'Llamada'),     
(6, '2024-08-17', 'WhatsApp'),   
(7, '2024-08-18', 'En persona'),  
(8, '2024-08-18', 'Email'),   
(9, '2024-08-19', 'WhatsApp'), 
(10, '2024-08-19', 'Email'); 

-- Insertar CONFIRMACIONES (9 personas confirmaron)
INSERT INTO confirmaciones (id_persona, fecha_confirmacion, estado) VALUES
(1, '2024-08-20', 'Confirma'),    
(2, '2024-08-21', 'Confirma'),   
(3, '2024-08-22', 'No puede'),   
(4, '2024-08-20', 'Confirma'),    
(5, '2024-08-23', 'Tal vez'),     
(6, '2024-08-21', 'Confirma'),    
(8, '2024-08-24', 'Confirma'),    
(11, '2024-08-25', 'Confirma'),   
(12, '2024-08-25', 'Confirma'); 

-- Insertar ASISTENTES (9 personas llegaron)
INSERT INTO asistentes (id_persona, hora_llegada, acompaantes) VALUES
(1, '19:30:00', 1), 
(2, '19:45:00', 0),  
(4, '20:00:00', 0),  
(6, '20:15:00', 2),   
(7, '20:30:00', 0),   
(8, '19:50:00', 1),   
(11, '21:00:00', 0),  
(13, '21:15:00', 0),  
(15, '20:45:00', 1);  


