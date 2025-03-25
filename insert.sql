-- Inserción de datos para la tabla Pais
INSERT INTO Pais (nombre) VALUES ('Colombia'), ('México'), ('Argentina');

-- Inserción de datos para la tabla Estado
INSERT INTO Estado (nombre, pais_id) VALUES ('Santander', 1), ('Jalisco', 2), ('Buenos Aires', 3);

-- Inserción de datos para la tabla Ciudad
INSERT INTO Ciudad (nombre, estado_id) VALUES ('Bucaramanga', 1), ('Guadalajara', 2), ('La Plata', 3);

-- Inserción de datos para la tabla Clientes
INSERT INTO Clientes (nombre, email) VALUES ('Juan Pérez', 'juanperez@example.com'), ('Ana Gómez', 'anagomez@example.com'), ('Carlos López', 'carloslopez@example.com');

-- Inserción de datos para la tabla UbicacionCliente
INSERT INTO UbicacionCliente (cliente_id, ciudad_id, direccion, codigo_postal) VALUES (1, 1, 'Calle 123', '680001'), (2, 2, 'Av. Reforma 456', '44100');

-- Inserción de datos para la tabla Telefonos
INSERT INTO Telefonos (cliente_id, telefono) VALUES (1, '3001234567'), (2, '3117654321'), (3, '3209876543');

-- Inserción de datos para la tabla Empleados
INSERT INTO Empleados (nombre) VALUES ('Pedro Martínez'), ('Sofía Ramírez'), ('Miguel Torres');

-- Inserción de datos para la tabla Puestos
INSERT INTO Puestos (descripcion) VALUES ('Gerente'), ('Vendedor'), ('Contador');

-- Inserción de datos para la tabla DatosEmpleados
INSERT INTO DatosEmpleados (idEmpleado, idPuesto, salario, fecha_contratacion) VALUES (1, 1, 5000.00, '2023-01-15'), (2, 2, 3000.00, '2022-07-20'), (3, 3, 4000.00, '2021-05-10');

-- Inserción de datos para la tabla Proveedores
INSERT INTO Proveedores (nombre) VALUES ('Proveedor A'), ('Proveedor B'), ('Proveedor C');

-- Inserción de datos para la tabla ContactoProveedores
INSERT INTO ContactoProveedores (proveedor_id, contacto, telefono, direccion) VALUES (1, 'Luis Fernández', '3151234567', 'Calle 50 #12-34'), (2, 'Mariana Duarte', '3227654321', 'Av. Principal 789'), (3, 'José Rojas', '3149876543', 'Zona Industrial 456');

-- Inserción de datos para la tabla TiposProductos
INSERT INTO TiposProductos (tipo_nombre, descripcion) VALUES ('Electrónica', 'Productos electrónicos'), ('Ropa', 'Vestimenta para todas las edades'), ('Alimentos', 'Comida y productos comestibles');


-- Inserción de datos para la tabla Productos
INSERT INTO Productos (nombre, precio, proveedor_id, tipo_id) 
VALUES 
('Laptop', 2500.00, 1, 1), 
('Televisor', 500.00, 1, 1), 
('Camiseta', 20.00, 2, 2), 
('Pantalones', 40.00, 2, 2), 
('Cereal', 5.50, 3, 3), 
('Leche', 2.00, 3, 3), 
('Pan', 1.50, 3, 3), 
('Zapatos', 60.00, 2, 2), 
('Silla de oficina', 150.00, 1, 1), 
('Juguete de peluche', 15.00, 2, 2),
('Agua mineral', 0.75, 3, 3);


-- Inserción de datos para la tabla Pedidos
INSERT INTO Pedidos (cliente_id, fecha, total) VALUES (1, '2024-03-01', 2505.50), (2, '2024-03-05', 50.00), (3, '2024-03-10', 10.50);

-- Inserción de datos para la tabla DetallesPedido
INSERT INTO DetallesPedido (pedido_id, producto_id, cantidad, precio) VALUES (1, 1, 1, 2500.00), (2, 2, 2, 25.00), (3, 3, 2, 5.50);



