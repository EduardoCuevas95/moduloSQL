--b) Explorar la tabla “menu_items” para conocer los productos del menú.
SELECT * FROM MENU_ITEMS

-- 1.- Realizar consultas para contestar las siguientes preguntas:

--Encontrar el número de artículos en el menú
SELECT COUNT(MENU_ITEM_ID) AS NUMERO_ARTICULOS FROM MENU_ITEMS; 
--Existen 32 articulos en el menu

-- ¿Cuál es el artículo menos caro y el más caro en el menú?
SELECT ITEM_NAME, PRICE FROM MENU_ITEMS
	ORDER BY 2 DESC
	LIMIT 1;
-- El articulo mas caro en el menu es: Shrimp Scampi
SELECT ITEM_NAME, PRICE FROM MENU_ITEMS
	ORDER BY 2 ASC
	LIMIT 1;
-- El articulo menos caro en el menu es: Edamame

--¿Cuántos platos americanos hay en el menú?
SELECT ITEM_NAME, CATEGORY FROM MENU_ITEMS
	WHERE CATEGORY = 'American';
--Existen 6 platos americanos en el menu.

--¿Cuál es el precio promedio de los platos?
SELECT ROUND(AVG(PRICE),2) AS PRECIO_PROMEDIO FROM MENU_ITEMS;
--El precio promedio es de 13.29

-- c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
SELECT * FROM ORDER_DETAILS;

-- 1.- Realizar consultas para contestar las siguientes preguntas:
-- ¿Cuántos pedidos únicos se realizaron en total?
SELECT COUNT(DISTINCT(ORDER_ID)) AS NUMERO_PEDIDOS_UNICOS FROM ORDER_DETAILS;
--El numero de pedidos unicos es de 5,370.

-- ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
SELECT ORDER_ID AS CLIENTE, COUNT(ORDER_ID) AS NUMERO_PEDIDOS FROM ORDER_DETAILS
	GROUP BY 1
	ORDER BY NUMERO_PEDIDOS DESC
	LIMIT 5;
--Los 5 pedidos que tuvieron mas articulos son el 440, 2675, 3473, 4305 y 443.
	
-- ¿Cuándo se realizó el primer pedido y el último pedido?
SELECT ORDER_DATE, ORDER_TIME FROM ORDER_DETAILS
	ORDER BY 1, 2;
--El primer pedido se realizo el 2023-01-01 a las 11:38:36
SELECT ORDER_DATE, ORDER_TIME FROM ORDER_DETAILS
	ORDER BY 1 DESC, 2 DESC;
--El ultimo pedido se realizo el 2023-03-31 a las 22:15:48

-- ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT COUNT(ORDER_ID) AS NUMERO_ORDENES FROM ORDER_DETAILS
	WHERE ORDER_DATE BETWEEN '2023-01-01' AND '2023-01-05';
--Existen 702 ordenes entre esas fechas

--d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.

/*1.- Realizar un left join entre entre order_details y menu_items con el identificador 
item_id(tabla order_details) y menu_item_id(tabla menu_items).*/

SELECT *
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

/* Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
utiliza los resultados obtenidos para llegar a estas conclusiones. */

--El platillo mas popular
SELECT 
  mi.item_name,
  mi.price,
  COUNT(od.item_id) AS total_pedidos
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.price
ORDER BY total_pedidos DESC
LIMIT 10;

-- El platillo menos popular: 
SELECT 
  mi.item_name,
  mi.price,
  COUNT(od.item_id) AS total_pedidos
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.price
ORDER BY total_pedidos ASC
LIMIT 10;

-- Ganancias totales del periodo: $159,217.90
SELECT
	SUM(mi.price)
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id

-- Numero total de platillos por categoria, cual es la categoria mas popular? 

SELECT
	mi.category,
	COUNT(mi.item_name) AS numero_pedidos
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY numero_pedidos DESC;

-- Cuantas veces se vendio el platillo mas caro? 239 veces
SELECT
	mi.item_name,
	COUNT(od.item_id) AS numero_pedidos
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
HAVING mi.item_name = 'Shrimp Scampi';

-- Cuantas veces se vendio el platillo mas barato? 620
SELECT
	mi.item_name,
	COUNT(od.item_id) AS numero_pedidos
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
HAVING mi.item_name = 'Edamame';


/* CONCLUSIONES / RECOMENDACIONES

Los tres platillos más populares del restaurante son la Hamburguesa (622 pedidos), el Edamame (620) y el Korean Beef Bowl (588). Aunque el platillo más vendido es de cocina americana, la categoría más solicitada es la comida asiática, lo que sugiere una fuerte preferencia por este tipo de cocina.

Los platillos con menor demanda son los Chicken Tacos (123 pedidos), los Potstickers (205) y la Cheese Lasagna (207), lo cual puede indicar una menor aceptación o visibilidad de estos productos.

Las ganancias totales durante el periodo fueron de $159,217.90. Para incrementar los ingresos, se recomienda considerar un ajuste de precios entre $0.50 y $1.00 en los platillos más populares, ya que su alta demanda podría tolerar un leve aumento sin afectar significativamente el volumen de ventas.

La categoría de comida asiática es la más popular del menú, acumulando un total de 3,470 pedidos. Esto representa una oportunidad para ampliar la oferta de platillos de esta categoría, respondiendo así a las preferencias del cliente.

El platillo más caro del menú se vendió 239 veces, mientras que el más económico —el segundo más vendido del restaurante— alcanzó 620 pedidos. Esto sugiere que los clientes pueden ser sensibles al precio, por lo que es importante considerar este factor al definir la estrategia de precios.

*/
