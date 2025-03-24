CREATE TABLE IF NOT EXISTS empleados_dev (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

INSERT INTO empleados_dev (nombre, puesto, salario) VALUES 
('Juan Perez', 'Desarrollador', 30000),
('Ana Gómez', 'Tester', 25000);