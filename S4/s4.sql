-- ////////////////////////////////// SESIÓN 05 //////////////////////////////////
-- Crear base de datos
CREATE SCHEMA andres_ramirez;
-- Seleccionar base de datos
USE andres_ramirez;
-- Crear tabla
-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo_electronico VARCHAR(100),
    fecha_registro DATE
);
-- Creación de la tabla Pedidos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    fecha_pedido DATE,
    total_pedido DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Usuarios(user_id)
);
-- Creación de la tabla Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock_disponible INT
);
-- Creación de la tabla Detalles_Pedido
CREATE TABLE Detalles_Pedido (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
-- Insertar registros
INSERT INTO Usuarios(nombre, apellido, edad, correo_electronico, fecha_registro)
VALUES ("Juan", "Pérez", 30, "juan@gamil.com", "2024-08-15");
INSERT INTO Usuarios(nombre, apellido, edad, correo_electronico, fecha_registro)
VALUES ("Jose", "Lopez", 35, "jose@gmail.com", "2024-08-16");
INSERT INTO Usuarios(nombre)
VALUES ("Lore");
-- Consultar usuarios
SELECT * FROM Usuarios;

-- ///////////////// RETO 02 /////////////////
CREATE TABLE Alumnos (
    matricula VARCHAR(11) PRIMARY KEY,
    nombre VARCHAR(45),
    apellido VARCHAR(45)
);
CREATE TABLE Tareas (
   id_tarea INT PRIMARY KEY,
   matricula VARCHAR(11),
   numero_tarea INT,
   calificacion DOUBLE,
   FOREIGN KEY (matricula) REFERENCES Alumnos(matricula)
);
CREATE TABLE Examenes (
  id_examen INT PRIMARY KEY,
   matricula VARCHAR(11),
   numero_examen INT,
   calificacion DOUBLE,
   FOREIGN KEY (matricula) REFERENCES Alumnos(matricula)
);


