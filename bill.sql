-- En el Desafio Evaluado se piden las siguientes tareas:

--1. Cargar el respaldo de la base de datos unidad2.sql. (2 Puntos)
-- Se cargo el respaldo de datos 

--2. El cliente usuario01 ha realizado la siguiente compra:
---● producto: producto9.
---● cantidad: 5.
---● fecha: fecha del sistema.
---Mediante el uso de transacciones, realiza las consultas correspondientes para este
---requerimiento y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock. (3 Puntos)

--ELECT * FROM cliente;
--SELECT * FROM compra;
--SELECT * FROM producto;
--SELECT * FROM detalle_compra;

BEGIN TRANSACTION;
INSERT INTO compra (id, cliente_id, fecha)
VALUES (31, 1, CURRENT_DATE);
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES (39, 9, 31, 5);
UPDATE producto SET stock = stock - 5 WHERE id = 9; 
COMMIT;
-- A continuacion se consulta las siguientes  tabla para ver el resulado de la transacción.
SELECT * FROM producto;
SELECT * FROM compra;

-- -- 3. El cliente usuario02 ha realizado la siguiente compra:
-- -- ● producto: producto1, producto 2, producto 8.
-- -- ● cantidad: 3 de cada producto.
-- -- ● fecha: fecha del sistema.
-- -- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra. (3 Puntos)

BEGIN TRANSACTION;
INSERT INTO compra(id, cliente_id, fecha)
VALUES(34, 2, CURRENT_DATE);
       -- PRODUCT1
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES(44, 1, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 1;
       -- PRODUCT2
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES(45, 2, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 2;
       -- PRODUCT8
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES(46, 8, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 8;
ROLLBACK TO primera_compra;
COMMIT;



---4. Realizar las siguientes consultas (2 Puntos):
---a. Deshabilitar el AUTOCOMMIT.
       \set AUTOCOMMIT off
---b. Insertar un nuevo cliente.
INSERT INTO cliente(id, nombre, email)
VALUES(11, 'usuario11', 'usuario11@hotmail.com');
---c. Confirmar que fue agregado en la tabla cliente.
SELECT * FROM cliente;
---d. Realizar un ROLLBACK.
--Cuando desabilite  el AUTOCOMMIT alli abajo en la terminal se aprecia cuando se hace el Rollback
---e. Confirmar que se restauró la información, sin considerar la inserción del punto b.
SELECT * FROM cliente;
---f. Habilitar de nuevo el AUTOCOMMIT.
       \echo :AUTOCOMMIT

-- OJO AL FINAL DEBO HABILITAR NUEVAMENTE EL AUTOCOMMIT, ADEMAS HACER EL REPOSITORIO PARA CARGAR EN LA PAGINA DE HIT.