-- ////////////////////////////////// SESIÓN 02 //////////////////////////////////
-- ///////////////// EJEMPLO 01 /////////////////
-- Seleccionar base de datos
use tienda;
-- Contar registros
select COUNT(*) as total_usuarios from Usuarios;
-- Sumar registros
select SUM(precio) as total_precio_productos from Productos;
-- Maximo
select MAX(precio) as precio_maximo_producto from Productos;
-- Minimo
select MIN(precio) as precio_maximo_producto from Productos;
-- AVG
select AVG(edad) as promedio_edad_usuarios from Usuarios;