-- ////////////////////////////////// SESIÓN 03 //////////////////////////////////
use tienda;
-- ///////////////// EJEMPLO 01 /////////////////
-- mostrar el nombre y correo electrónico de los usuarios junto con el total de pedidos que han realizado
select u.nombre, u.correo_electronico, (
	select count(*) from Pedidos p where p.user_id = u.user_id
) as total_pedidos from Usuarios u;

-- ///////////////// RETO 01 /////////////////
-- Mostrar el nombre de cada producto junto con su precio unitario y la cantidad total vendida de ese producto en todos los pedidos
select p.producto_id, p.nombre_producto, (
	select MAX(dp.precio_unitario) from Detalles_Pedido dp where dp.producto_id = p.producto_id
) as precio_unitario_maximo, (
	select SUM(dp.cantidad) from Detalles_Pedido dp where dp.producto_id = p.producto_id
) as cantidad_total_vendida from Productos p;
-- Comprobar
select MAX(dp.precio_unitario) as precio_unitario_maximo from Detalles_Pedido dp where dp.producto_id = 3;
select SUM(dp.cantidad) as cantidad_total_vendida from Detalles_Pedido dp where dp.producto_id = 3;