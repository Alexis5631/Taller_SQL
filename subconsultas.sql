-- Consultar el producto más caro en cada categoría.
SELECT p.nombre, p.precio, tp.tipo_nombre
FROM Productos p
JOIN TiposProductos tp ON p.tipo_id = tp.id
WHERE p.precio = (
    SELECT MAX(precio)
    FROM Productos
    WHERE tipo_id = p.tipo_id
);

-- Encontrar el cliente con mayor total en pedidos.
SELECT c.nombre, SUM(p.total) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.id
ORDER BY total_pedidos DESC
LIMIT 1;

-- Listar empleados que ganan más que el salario promedio.
SELECT e.nombre, de.salario
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
WHERE de.salario > (
    SELECT AVG(salario)
    FROM DatosEmpleados
);

-- Consultar productos que han sido pedidos más de 5 veces.
SELECT p.nombre, COUNT(dp.id) AS cantidad_pedidos
FROM Productos p
JOIN DetallesPedido dp ON p.id = dp.producto_id
GROUP BY p.id
HAVING cantidad_pedidos > 5;

-- Listar pedidos cuyo total es mayor al promedio de todos los pedidos.
SELECT p.id, p.total
FROM Pedidos p
WHERE p.total > (
    SELECT AVG(total)
    FROM Pedidos
);

-- Seleccionar los 3 proveedores con más productos.
SELECT pr.nombre, COUNT(prod.id) AS cantidad_productos
FROM Proveedores pr
JOIN Productos prod ON pr.id = prod.proveedor_id
GROUP BY pr.id
ORDER BY cantidad_productos DESC
LIMIT 3;

-- Consultar productos con precio superior al promedio en su tipo.
SELECT p.nombre, p.precio, tp.tipo_nombre
FROM Productos p
JOIN TiposProductos tp ON p.tipo_id = tp.id
WHERE p.precio > (
    SELECT AVG(precio)
    FROM Productos
    WHERE tipo_id = p.tipo_id
);

-- Mostrar clientes que han realizado más pedidos que la media.
SELECT c.nombre, COUNT(p.id) AS cantidad_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.id
HAVING cantidad_pedidos > (
    SELECT AVG(cantidad_pedidos)
    FROM (
        SELECT COUNT(id) AS cantidad_pedidos
        FROM Pedidos
        GROUP BY cliente_id
    ) AS pedidos_por_cliente
);

-- Encontrar productos cuyo precio es mayor que el promedio de todos los productos.
SELECT p.nombre, p.precio
FROM Productos p
WHERE p.precio > (
    SELECT AVG(precio)
    FROM Productos
);

-- Mostrar empleados cuyo salario es menor al promedio del departamento.
SELECT e.nombre, de.salario, pu.descripcion AS puesto
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
JOIN Puestos pu ON de.idPuesto = pu.idPuesto
WHERE de.salario < (
    SELECT AVG(de2.salario)
    FROM DatosEmpleados de2
    WHERE de2.idPuesto = de.idPuesto
);
