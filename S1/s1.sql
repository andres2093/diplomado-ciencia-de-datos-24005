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





