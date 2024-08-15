-- ////////////////////////////////// SESIÓN 03 //////////////////////////////////
use tienda;
-- ///////////////// EJEMPLO 01 /////////////////
-- mostrar el nombre y correo electrónico de los usuarios junto con el total de pedidos que han realizado
select u.nombre, u.correo_electronico, (
	select count(*) from Pedidos p where p.user_id = u.user_id
) as total_pedidos from Usuarios u;