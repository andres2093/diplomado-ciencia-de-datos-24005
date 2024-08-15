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

-- ///////////////// EJEMPLO 02 /////////////////
-- Encontrar los productos cuyo promedio de solicitudes (ventas) sea mayor a 2
select * from (
	select producto_id, AVG(cantidad) as cantidad_promedio from Detalles_Pedido group by producto_id
) as promedio_productos_vendidos where promedio_productos_vendidos.cantidad_promedio > 2; -- 0.194 sec / 0.00030 sec

select producto_id, AVG(cantidad) as cantidad_promedio from Detalles_Pedido group by producto_id having cantidad_promedio > 2; -- 0.182 sec / 0.00043 sec

-- ///////////////// RETO 02 /////////////////
-- Usando subconsultas dentro de la cláusula FROM, obten aquellas fechas donde la cantidad de pedidos haya sido mayor a 3
SELECT * FROM (
	SELECT fecha_pedido, COUNT(*) AS pedidos FROM Pedidos GROUP BY fecha_pedido
) AS subconsulta WHERE subconsulta.pedidos > 3;
-- comprobar
select count(*) from Pedidos where fecha_pedido = '2023-11-14';