-- Listar todos los pedidos y el cliente asociado.
SELECT Pedidos.id AS pedido_id, Clientes.nombre AS cliente
FROM Pedidos
JOIN Clientes ON Pedidos.cliente_id = Clientes.id;

-- Mostrar la ubicacion de cada cliente en sus pedidos.


-- Listar productos junto con el proveedor y tipo de producto.
SELECT Productos.nombre AS producto, Proveedores.nombre AS proveedor, TiposProductos.tipo_nombre AS tipo_producto
FROM Productos
JOIN Proveedores ON Productos.proveedor_id = Proveedores.id
JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id;

-- Consultar todos los empleados que gestionan pedidos de clientes en una ciudad específica.
SELECT Empleados.nombre AS empleado, Pedidos.id AS pedido_id, Clientes.nombre AS cliente
FROM Empleados
JOIN Pedidos ON Empleados.id = Pedidos.empleado_id
JOIN Clientes ON Pedidos.cliente_id = Clientes.id
JOIN UbicacionCliente ON Clientes.id = UbicacionCliente.cliente_id
WHERE UbicacionCliente.ciudad_id = [1];

-- Consultar los 5 productos más vendidos.
SELECT Productos.nombre AS producto, SUM(DetallesPedido.cantidad) AS cantidad_vendida
FROM DetallesPedido
JOIN Productos ON DetallesPedido.producto_id = Productos.id
GROUP BY Productos.id
ORDER BY cantidad_vendida DESC
LIMIT 5;

-- Obtener la cantidad total de pedidos por cliente y ciudad.


-- Listar clientes y proveedores en la misma ciudad.


-- Mostrar el total de ventas agrupado por tipo de producto.
SELECT TiposProductos.tipo_nombre AS tipo_producto, SUM(DetallesPedido.cantidad * DetallesPedido.precio) AS total_ventas
FROM DetallesPedido
JOIN Productos ON DetallesPedido.producto_id = Productos.id
JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id
GROUP BY TiposProductos.id;

-- Listar empleados que gestionan pedidos de productos de un proveedor específico.


-- Obtener el ingreso total de cada proveedor a partir de los productos vendidos.