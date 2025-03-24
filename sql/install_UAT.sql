CREATE TABLE IF NOT EXISTS empleados_uat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

INSERT INTO empleados_uat (nombre, puesto, salario) VALUES 
('Carlos Ruiz', 'Analista', 28000),
('María López', 'Scrum Master', 35000);