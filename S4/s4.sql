-- ////////////////////////////////// SESIÓN 04 //////////////////////////////////
use tienda;
-- ///////////////// EJEMPLO 01 /////////////////
-- Supongamos que tenemos una tienda en línea y queremos obtener información sobre los pedidos 
-- realizados por nuestros usuarios, incluyendo sus nombres y detalles de los productos que compraron.
select 
u.nombre, u.apellido, p.fecha_pedido, p.total_pedido
from Usuarios u
-- INNER JOIN Pedidos p -- INNER es opcional
JOIN Pedidos p
ON u.user_id = p.user_id;

-- ///////////////// RETO 01 /////////////////
-- Realiza un análisis de los productos comprados por cada usuario
SELECT u.nombre, pr.nombre_producto, p.pedido_id
FROM Detalles_Pedido dp
JOIN Pedidos p
  ON dp.pedido_id = p.pedido_id
JOIN Productos pr
  ON dp.producto_id = pr.producto_id
JOIN Usuarios u
  ON p.user_id = u.user_id
--  where p.user_id = 10000 -- Comprobar
ORDER BY u.nombre;
-- Comprobar
select * from Detalles_Pedido where pedido_id in(
	select pedido_id from Pedidos where user_id = 10000
);

-- ///////////////// EJEMPLO 02 /////////////////
-- Realiza un análisis de los pedidos y los productos vendidos en nuestra tienda en línea. 
--  -> LEFT JOIN para analizar pedidos y usuarios
select u.nombre, u.apellido, p.fecha_pedido, p.total_pedido
from Usuarios u
LEFT JOIN Pedidos p
	ON u.user_id = p.user_id
    -- where p.fecha_pedido is null -- Mostrar usuario que no han realizado pedidos
;

--  -> RIGHT JOIN para analizar pedidos y productos
select p.nombre_producto, dp.cantidad, dp.precio_unitario
from Productos p
RIGHT JOIN Detalles_Pedido dp
	ON p.producto_id = dp.producto_id;

-- ///////////////// RETO 02 /////////////////
SELECT u.nombre, p.fecha_pedido, SUM(dp.cantidad) AS cantidad, SUM(dp.subtotal) AS subtotal, pr.nombre_producto
FROM Usuarios u
LEFT JOIN Pedidos p
  ON u.user_id = p.user_id
LEFT JOIN Detalles_Pedido dp 
  ON p.pedido_id = dp.pedido_id
LEFT JOIN Productos pr
  ON dp.producto_id = pr.producto_id
  -- where u.nombre = "Nombre10000" -- Comprobar
GROUP BY u.nombre, p.fecha_pedido, pr.nombre_producto;
-- Comprobar $362.61
select sum(dp.subtotal) as total from Detalles_Pedido dp where dp.pedido_id in(
	select pedido_id from Pedidos p where p.user_id = 10000
);

