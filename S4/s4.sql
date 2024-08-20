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
JOIN Detalles_Pedidos dp
ON u.user_id = p.user_id
ON p.user_id = dp.user_id;

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
