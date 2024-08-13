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
-- Precio promedio de los productos en stock. Redondeo
SELECT ROUND(AVG(precio)) AS precio_promedio_1, ROUND(AVG(precio), 2) AS precio_promedio_2
FROM Productos WHERE stock_disponible > 0;
-- Número total de productos vendidos.
SELECT SUM(cantidad) AS productos_vendidos FROM Detalles_Pedido;
-- Número de pedidos del usuario 10.
SELECT COUNT(*) AS numero_pedidos FROM Pedidos WHERE user_id = 10;
-- Precio máximo de pedidos hechos el 29 de mayo de 2023. 
SELECT MAX(total_pedido) AS precio_máximo FROM Pedidos WHERE fecha_pedido LIKE '2023-05-29';

-- ///////////////// EJEMPLO 02 /////////////////
-- Total de pedidos realizados por cada usuario
select user_id, COUNT(*) as total_pedidos from Pedidos group by user_id;
-- Total de ventas por producto
select producto_id, SUM(cantidad) as total_ventas from Detalles_Pedido group by producto_id;
-- Promedio de edad de los usuarios por mes de registro
select MONTH(fecha_registro) as mes_registro, ROUND(AVG(edad)) as promedio_edad from Usuarios 
group by MONTH(fecha_registro) order by 1 asc;
-- Cantidad de pedidos por día de la semana.
select DAYOFWEEK(fecha_pedido) as dia_semana, count(*) as total_pedidos from Pedidos
group by DAYOFWEEK(fecha_pedido) order by dia_semana asc;

-- ///////////////// RETO 02 /////////////////
-- Obtén el subtotal promedio por pedido.
SELECT pedido_id AS pedido, ROUND(AVG(subtotal)) AS subtotal_promedio FROM Detalles_Pedido
GROUP BY pedido_id ORDER BY 1;
-- Obtén la cantidad máxima y mínima de pedidos de un producto.
SELECT producto_id AS producto_vendido, max(cantidad) AS cantidad_maxima, min(cantidad) AS cantidad_minima
FROM Detalles_Pedido GROUP BY producto_id ORDER BY 1;	
-- Obtén el número de usuarios registrados por año
SELECT year(fecha_registro) AS anio_registro, COUNT(*) AS usuarios FROM Usuarios
GROUP BY year(fecha_registro) ORDER BY 1;
-- Obtén la cantidad de pedidos realizados por mes
SELECT month(fecha_pedido) AS mes_pedido, COUNT(*) AS cantidad FROM Pedidos
GROUP BY month(fecha_pedido) ORDER BY 1;

-- ///////////////// EJEMPLO 03 /////////////////
-- Total de pedidos realizados por cada usuario
select user_id, COUNT(*) as total_pedidos from Pedidos group by user_id
having total_pedidos > 0;
-- Meses de registro donde el promedio de edad fue de personas en sus veintes.
select MONTH(fecha_registro) as mes_registro, ROUND(AVG(edad)) as promedio_edad from Usuarios
group by MONTH(fecha_registro) having AVG(edad) between 20 and 29;
-- Días de la semana con cuatro pedidos o más.
select DAYOFWEEK(fecha_pedido) as dia_semana, count(*) as total_pedidos from Pedidos
group by DAYOFWEEK(fecha_pedido) having total_pedidos > 1400 order by dia_semana;
