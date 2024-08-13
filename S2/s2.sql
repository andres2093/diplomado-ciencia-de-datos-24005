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

-- ///////////////// RETO 01 /////////////////
-- Calcular la suma total de los subtotales de todos los pedidos.
SELECT SUM(subtotal) AS subtotal_pedido FROM Detalles_Pedido;
-- Precio promedio de los productos en stock.
SELECT AVG(precio) AS precio_promedio FROM Productos WHERE stock_disponible > 0;
-- Número total de productos vendidos.
SELECT SUM(cantidad) AS productos_vendidos FROM Detalles_Pedido;
-- Número de pedidos del usuario 10.
SELECT COUNT(*) AS numero_pedidos FROM Pedidos WHERE user_id = 10;
-- Precio máximo de pedidos hechos el 29 de mayo de 2023. 
SELECT MAX(total_pedido) AS precio_máximo FROM Pedidos WHERE fecha_pedido LIKE '2023-05-29';