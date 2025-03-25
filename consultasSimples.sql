-- Seleccionar todos los productos con precio mayor a $50.
SELECT nombre, precio
FROM Productos
WHERE precio > 50;

-- Consultar clientes registrados en una ciudad específica.
SELECT c.nombre AS cliente
FROM Clientes c
JOIN UbicacionCliente uc ON c.id = uc.cliente_id
JOIN Ciudad ci ON uc.ciudad_id = ci.id
WHERE ci.nombre = 'Bucaramanga';

-- Mostrar empleados contratados en los últimos 2 años.
SELECT e.nombre AS empleado, de.fecha_contratacion AS fecha_contratacion
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado;

-- Seleccionar proveedores que suministran más de 5 productos.
SELECT p.nombre AS proveedor, COUNT(pr.id) AS cantidad_productos
FROM Proveedores p
JOIN Productos pr ON p.id = pr.proveedor_id
GROUP BY p.id
HAVING COUNT(pr.id) > 5;


-- Listar clientes que no tienen dirección registrada en UbicacionCliente .
SELECT c.nombre AS cliente
FROM Clientes c
LEFT JOIN UbicacionCliente uc ON c.id = uc.cliente_id
WHERE uc.cliente_id IS NULL;


-- Calcular el total de ventas por cada cliente.
SELECT c.nombre AS cliente, SUM(p.total) AS total_ventas
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.id;

-- Mostrar el salario promedio de los empleados.
SELECT AVG(salario) AS salario_promedio
FROM DatosEmpleados;

-- Consultar el tipo de productos disponibles en TiposProductos.
SELECT tipo_nombre, descripcion
FROM TiposProductos;

-- Seleccionar los 3 productos más caros.
SELECT nombre, precio
FROM Productos
ORDER BY precio DESC
LIMIT 3;

-- Consultar el cliente con el mayor número de pedidos.
SELECT c.nombre AS cliente, COUNT(p.id) AS cantidad_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.id
ORDER BY cantidad_pedidos DESC
LIMIT 1;
