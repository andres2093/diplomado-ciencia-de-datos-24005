-- ///////////////// EJEMPLO 01 /////////////////
-- Mostrar bases de datos
show databases;
-- Seleccionar base de datos "tienda"
use tienda;
-- Mostrar tablas
show tables;
-- Mostrar estructura de una tabla
describe Usuarios;
-- ///////////////// RETO 01 /////////////////
describe Pedidos;
describe Productos;
describe Detalles_Pedido;
-- ///////////////// EJEMPLO 02 /////////////////
-- Mostrar solo algunas columnas de una tabla
select nombre, correo_electronico from Usuarios;
-- Mostrar todas las columnas de una tabla
select * from Usuarios;
-- ///////////////// RETO 02 ///////////////// 
select * from Pedidos;
select * from Productos;
-- ///////////////// EJEMPLO 03 /////////////////
-- Mostrar todas las columnas de una tabla pero aplicando un filtro
select * from Usuarios where edad > 30;
select * from Productos where precio < 100;
select * from Pedidos where (fecha_pedido >= "2023-01-01" and fecha_pedido <= "2023-12-31") and total_pedido > 100;
select * from Usuarios where edad > 18 or edad < 65;
select * from Productos where not stock_disponible > 0;
-- ///////////////// RETO 03 ///////////////// 
-- Obten todos los pedidos realizados dentro del año 2024.
SELECT * FROM Pedidos WHERE fecha_pedido BETWEEN '2024-01-01' AND '2024-12-31';
-- Selecciona todos los usuarios cuya edad esté en los veintes.
SELECT * FROM Usuarios WHERE EDAD BETWEEN 20 AND 29;
-- Selecciona todos los usuarios cuyo registro no haya sido durante el año 2020. No puedes usar el operador `!=`.
SELECT * FROM Usuarios WHERE fecha_registro NOT BETWEEN '2020-01-01' AND '2020-12-31';
-- Selecciona todos todos los pedidos realizados dentro del año 2023 o aquellos cuyo total_pedido sea mayor a 1000.
SELECT * FROM Pedidos WHERE (fecha_pedido BETWEEN '2023-01-01' AND '2023-12-31') OR total_pedido > 1000;
-- Selecciona todos los usuarios cuya edad sea mayor o igual a 18 años y cuya fecha de registro sea en octubre de 
-- cualquier año.
SELECT * FROM Usuarios WHERE edad >= 18 AND month(fecha_registro) = 10;
-- ///////////////// EJEMPLO 04 /////////////////
-- Ordenamientos
select * from Productos order by precio asc;
select * from Productos order by precio desc;
select * from Pedidos order by fecha_pedido desc;
select * from Usuarios order by edad asc, fecha_registro desc;

