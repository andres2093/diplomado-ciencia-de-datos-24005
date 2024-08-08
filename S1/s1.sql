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

