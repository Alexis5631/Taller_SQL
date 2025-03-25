--Obtener la lista de todos los pedidos con los nombres de clientes usando INNER JOIN .
SELECT Pedidos.id, Clientes.nombre, Pedidos.fecha, Pedidos.total 
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id;

-- INNER JOIN: Listar los productos y proveedores que los suministran
SELECT Productos.nombre AS producto, Proveedores.nombre AS proveedor
FROM Productos
INNER JOIN Proveedores ON Productos.proveedor_id = Proveedores.id;

-- LEFT JOIN: Mostrar los pedidos y las ubicaciones de los clientes
SELECT Pedidos.id, Clientes.nombre, UbicacionCliente.direccion, UbicacionCliente.ciudad_id
FROM Pedidos
LEFT JOIN Clientes ON Pedidos.cliente_id = Clientes.id
LEFT JOIN UbicacionCliente ON Clientes.id = UbicacionCliente.cliente_id;

-- LEFT JOIN: Consultar empleados que han registrado pedidos, incluyendo empleados sin pedidos
SELECT Empleados.id, Empleados.nombre, Pedidos.id AS pedido_id
FROM Empleados
LEFT JOIN Pedidos ON Empleados.id = Pedidos.cliente_id;

-- INNER JOIN: Obtener el tipo de producto y los productos asociados
SELECT Productos.nombre AS producto, TiposProductos.tipo_nombre AS categoria
FROM Productos
INNER JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id;

-- COUNT y GROUP BY: Listar todos los clientes y el número de pedidos realizados
SELECT Clientes.nombre, COUNT(Pedidos.id) AS numero_pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.id;

-- INNER JOIN: Combinar Pedidos y Empleados para mostrar qué empleados gestionaron pedidos específicos
SELECT Pedidos.id AS pedido_id, Clientes.nombre AS cliente, Empleados.nombre AS empleado
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id
INNER JOIN DatosEmpleados ON Clientes.id = DatosEmpleados.idEmpleado
INNER JOIN Empleados ON DatosEmpleados.idEmpleado = Empleados.id;

-- RIGHT JOIN: Mostrar productos que no han sido pedidos
SELECT Productos.id, Productos.nombre
FROM DetallesPedido
RIGHT JOIN Productos ON DetallesPedido.producto_id = Productos.id
WHERE DetallesPedido.producto_id IS NULL;


-- Múltiples JOIN: Mostrar el total de pedidos y ubicación de clientes
SELECT Clientes.nombre, Pedidos.id AS pedido_id, Pedidos.total AS total_pedido, 
       Ciudad.nombre AS ciudad, Estado.nombre AS estado, Pais.nombre AS pais
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
LEFT JOIN UbicacionCliente ON Clientes.id = UbicacionCliente.cliente_id
LEFT JOIN Ciudad ON UbicacionCliente.ciudad_id = Ciudad.id
LEFT JOIN Estado ON Ciudad.estado_id = Estado.id
LEFT JOIN Pais ON Estado.pais_id = Pais.id
ORDER BY Clientes.nombre, Pedidos.id;

-- INNER JOIN: Unir Proveedores, Productos y TiposProductos para un listado completo de inventario
SELECT Productos.nombre AS producto, Proveedores.nombre AS proveedor, TiposProductos.tipo_nombre AS categoria
FROM Productos
INNER JOIN Proveedores ON Productos.proveedor_id = Proveedores.id
INNER JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id;