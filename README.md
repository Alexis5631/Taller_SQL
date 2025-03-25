# Normalizacion

## Creación de la base de datos

```sql
CREATE DATABASE vtaszfs;
USE vtaszfs;
``` 

## Tabla Clientes

```CREATE TABLE Clientes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    email VARCHAR(85) UNIQUE NOT NULL
);
```
## Tabla Telefonos

```CREATE TABLE Telefonos(
    id INT PRIMARY KEY auto_increment,
    cliente_id INT NOT NULL,
    telefono varchar(20)
);
```
## Tabla UbicacionCliente

```CREATE TABLE UbicacionCliente (
    cliente_id INT NOT NULL,
    ciudad_id INT NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    PRIMARY KEY (cliente_id, ciudad_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (ciudad_id) REFERENCES Ciudad(id) ON DELETE CASCADE
);
```
## Tabla Pais

```CREATE TABLE Pais (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);
```

## Tabla Estado

```CREATE TABLE Estado (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais_id INT NOT NULL,
    FOREIGN KEY (pais_id) REFERENCES Pais(id) ON DELETE CASCADE
);
```

## Tabla ciudad

```CREATE TABLE Ciudad (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    estado_id INT NOT NULL,
    FOREIGN KEY (estado_id) REFERENCES Estado(id) ON DELETE CASCADE
);
```

## Tabla HistorialPedidos

```CREATE TABLE HistorialPedidos(
    id INT PRIMARY KEY auto_increment,
    fechaCambio Date,
    tipoCambio int
);
```

## Tabla Empleados

```CREATE TABLE Empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45)
);
```

## Tabla Puestos

```CREATE TABLE Puestos(
    idPuesto INT NOT NULL AUTO_INCREMENT,
    descripcion varchar (200),
    PRIMARY KEY (idPuesto)
);
```

## Tabla DatosEmpleados

```CREATE TABLE DatosEmpleados(
    idEmpleado INT NOT NULL,
    idPuesto INT NOT NULL,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE,
    PRIMARY KEY (idEmpleado, idPuesto),
    FOREIGN KEY (idPuesto) REFERENCES Puestos(idPuesto)
);
```

## Tabla Proveedores

```CREATE TABLE Proveedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80)
);
```

## Tabla COntactoProveedores

```CREATE TABLE ContactoProveedores(
    id INT auto_increment NOT NULL,
    proveedor_id INT NOT NULL,
    contacto VARCHAR(75),
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    PRIMARY KEY(id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id)
);
```

## Tabla TiposProductos

```CREATE TABLE TiposProductos (
id INT PRIMARY KEY AUTO_INCREMENT,
tipo_nombre VARCHAR(80),
descripcion TEXT,
parent_id INT NULL,   
FOREIGN KEY (parent_id) REFERENCES TiposProductos(id) ON DELETE CASCADE
);
```

## Tabla Productos

```CREATE TABLE Productos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(80),
precio DECIMAL(10, 2),
proveedor_id INT,
tipo_id INT,
FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id) ON DELETE CASCADE,
FOREIGN KEY (tipo_id) REFERENCES TiposProductos(id) ON DELETE CASCADE
);
```

## Tabla Pedidos 

```CREATE TABLE Pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
fecha DATE,
total DECIMAL(10, 2),
FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);
```

## Tabla DetallesPedido 

```CREATE TABLE DetallesPedido (
id INT PRIMARY KEY AUTO_INCREMENT,
pedido_id INT,
producto_id INT,
cantidad INT,
precio DECIMAL(10, 2),
FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
FOREIGN KEY (producto_id) REFERENCES Productos(id)
);
```

# 2. Joins

## 1.

```SELECT Pedidos.id, Clientes.nombre, Pedidos.fecha, Pedidos.total 
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id;
```

## 2.

```SELECT Productos.nombre AS producto, Proveedores.nombre AS proveedor
FROM Productos
INNER JOIN Proveedores ON Productos.proveedor_id = Proveedores.id;
```

## 3.

```SELECT Pedidos.id, Clientes.nombre, UbicacionCliente.direccion, UbicacionCliente.ciudad_id
FROM Pedidos
LEFT JOIN Clientes ON Pedidos.cliente_id = Clientes.id
LEFT JOIN UbicacionCliente ON Clientes.id = UbicacionCliente.cliente_id;
```

## 4.

```SELECT Empleados.id, Empleados.nombre, Pedidos.id AS pedido_id
FROM Empleados
LEFT JOIN Pedidos ON Empleados.id = Pedidos.cliente_id;
```

## 5.

```SELECT Productos.nombre AS producto, TiposProductos.tipo_nombre AS categoria
FROM Productos
INNER JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id;
```

## 6.

```SELECT Clientes.nombre, COUNT(Pedidos.id) AS numero_pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.id;
```

## 7.

```SELECT Pedidos.id AS pedido_id, Clientes.nombre AS cliente, Empleados.nombre AS empleado
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id
INNER JOIN DatosEmpleados ON Clientes.id = DatosEmpleados.idEmpleado
INNER JOIN Empleados ON DatosEmpleados.idEmpleado = Empleados.id;
```

## 8.

```SELECT Productos.id, Productos.nombre
FROM DetallesPedido
RIGHT JOIN Productos ON DetallesPedido.producto_id = Productos.id
WHERE DetallesPedido.producto_id IS NULL;
```

## 9.

```SELECT Clientes.nombre, Pedidos.id AS pedido_id, Pedidos.total AS total_pedido, 
       Ciudad.nombre AS ciudad, Estado.nombre AS estado, Pais.nombre AS pais
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
LEFT JOIN UbicacionCliente ON Clientes.id = UbicacionCliente.cliente_id
LEFT JOIN Ciudad ON UbicacionCliente.ciudad_id = Ciudad.id
LEFT JOIN Estado ON Ciudad.estado_id = Estado.id
LEFT JOIN Pais ON Estado.pais_id = Pais.id
ORDER BY Clientes.nombre, Pedidos.id;
```

## 10.

```SELECT Productos.nombre AS producto, Proveedores.nombre AS proveedor, TiposProductos.tipo_nombre AS categoria
FROM Productos
INNER JOIN Proveedores ON Productos.proveedor_id = Proveedores.id
INNER JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id;
```


# 3. Consultas Simples

## 1.

```SELECT nombre, precio
FROM Productos
WHERE precio > 50;
```

## 2.

```SELECT c.nombre AS cliente
FROM Clientes c
JOIN UbicacionCliente uc ON c.id = uc.cliente_id
JOIN Ciudad ci ON uc.ciudad_id = ci.id
WHERE ci.nombre = 'Bucaramanga';
```

## 3.

```SELECT e.nombre AS empleado, de.fecha_contratacion AS fecha_contratacion
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado;
```

## 4.

```SELECT p.nombre AS proveedor, COUNT(pr.id) AS cantidad_productos
FROM Proveedores p
JOIN Productos pr ON p.id = pr.proveedor_id
GROUP BY p.id
HAVING COUNT(pr.id) > 5;
```

## 5.

```SELECT c.nombre AS cliente
FROM Clientes c
LEFT JOIN UbicacionCliente uc ON c.id = uc.cliente_id
WHERE uc.cliente_id IS NULL;
```

## 6.

```SELECT c.nombre AS cliente, SUM(p.total) AS total_ventas
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.id;
```

## 7.

```SELECT AVG(salario) AS salario_promedio
FROM DatosEmpleados;
```

## 8.

```SELECT tipo_nombre, descripcion
FROM TiposProductos;
```

## 9.

```SELECT nombre, precio
FROM Productos
ORDER BY precio DESC
LIMIT 3;
```

## 10.

```SELECT c.nombre AS cliente, COUNT(p.id) AS cantidad_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.id
ORDER BY cantidad_pedidos DESC
LIMIT 1;
```


# 4. Consultas Multitabla

## 1.

```SELECT Pedidos.id AS pedido_id, Clientes.nombre AS cliente
FROM Pedidos
JOIN Clientes ON Pedidos.cliente_id = Clientes.id;
```

## 2.
```

```

## 3.

```SELECT Productos.nombre AS producto, Proveedores.nombre AS proveedor, TiposProductos.tipo_nombre AS tipo_producto
FROM Productos
JOIN Proveedores ON Productos.proveedor_id = Proveedores.id
JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id;
```

## 4.

```SELECT Empleados.nombre AS empleado, Pedidos.id AS pedido_id, Clientes.nombre AS cliente
FROM Empleados
JOIN Pedidos ON Empleados.id = Pedidos.empleado_id
JOIN Clientes ON Pedidos.cliente_id = Clientes.id
JOIN UbicacionCliente ON Clientes.id = UbicacionCliente.cliente_id
WHERE UbicacionCliente.ciudad_id = [1];
```

## 5.

```SELECT Productos.nombre AS producto, SUM(DetallesPedido.cantidad) AS cantidad_vendida
FROM DetallesPedido
JOIN Productos ON DetallesPedido.producto_id = Productos.id
GROUP BY Productos.id
ORDER BY cantidad_vendida DESC
LIMIT 5;
```

## 6.

```

```

## 7.

```

```

## 8.

```SELECT TiposProductos.tipo_nombre AS tipo_producto, SUM(DetallesPedido.cantidad * DetallesPedido.precio) AS total_ventas
FROM DetallesPedido
JOIN Productos ON DetallesPedido.producto_id = Productos.id
JOIN TiposProductos ON Productos.tipo_id = TiposProductos.id
GROUP BY TiposProductos.id;
```


# 5. Subconsultas

## 1.

```SELECT p.nombre, p.precio, tp.tipo_nombre
FROM Productos p
JOIN TiposProductos tp ON p.tipo_id = tp.id
WHERE p.precio = (
    SELECT MAX(precio)
    FROM Productos
    WHERE tipo_id = p.tipo_id
);
```

## 2.

```SELECT c.nombre, SUM(p.total) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.id
ORDER BY total_pedidos DESC
LIMIT 1;
```

## 3.

```SELECT e.nombre, de.salario
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
WHERE de.salario > (
    SELECT AVG(salario)
    FROM DatosEmpleados
);
```

## 4.

```SELECT p.nombre, COUNT(dp.id) AS cantidad_pedidos
FROM Productos p
JOIN DetallesPedido dp ON p.id = dp.producto_id
GROUP BY p.id
HAVING cantidad_pedidos > 5;
```

## 5.

```SELECT p.id, p.total
FROM Pedidos p
WHERE p.total > (
    SELECT AVG(total)
    FROM Pedidos
);
```

## 6.

```SELECT pr.nombre, COUNT(prod.id) AS cantidad_productos
FROM Proveedores pr
JOIN Productos prod ON pr.id = prod.proveedor_id
GROUP BY pr.id
ORDER BY cantidad_productos DESC
LIMIT 3;
```

## 7.

```SELECT p.nombre, p.precio, tp.tipo_nombre
FROM Productos p
JOIN TiposProductos tp ON p.tipo_id = tp.id
WHERE p.precio > (
    SELECT AVG(precio)
    FROM Productos
    WHERE tipo_id = p.tipo_id
);
```

## 8.

```SELECT c.nombre, COUNT(p.id) AS cantidad_pedidos
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
```

## 9.

```SELECT p.nombre, p.precio
FROM Productos p
WHERE p.precio > (
    SELECT AVG(precio)
    FROM Productos
);
```

## 10.

```SELECT e.nombre, de.salario, pu.descripcion AS puesto
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
JOIN Puestos pu ON de.idPuesto = pu.idPuesto
WHERE de.salario < (
    SELECT AVG(de2.salario)
    FROM DatosEmpleados de2
    WHERE de2.idPuesto = de.idPuesto
);
```