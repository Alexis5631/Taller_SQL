-- Crear un procedimiento para actualizar el precio de todos los productos de un proveedor.
DELIMITER $$

CREATE PROCEDURE ActualizarPrecioProveedor(
    IN proveedor_id INT, 
    IN nuevo_precio DECIMAL(10,2)
)
BEGIN
    UPDATE Productos
    SET precio = nuevo_precio
    WHERE proveedor_id = proveedor_id;
END $$

DELIMITER ;

-- Un procedimiento que devuelva la dirección de un cliente por ID.
DELIMITER $$

CREATE PROCEDURE ObtenerDireccionCliente(
    IN cliente_id INT
)
BEGIN
    SELECT u.direccion
    FROM UbicacionCliente u
    WHERE u.cliente_id = cliente_id;
END $$

DELIMITER ;

