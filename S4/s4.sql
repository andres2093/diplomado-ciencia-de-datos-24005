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