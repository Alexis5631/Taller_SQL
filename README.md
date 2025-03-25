# Normalizacion

## Creación de la base de datos

```sql
CREATE DATABASE vtaszfs;
USE vtaszfs;
``` 

Tabla Clientes

```CREATE TABLE Clientes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    email VARCHAR(85) UNIQUE NOT NULL
);
```
Tabla Telefonos

```CREATE TABLE Telefonos(
    id INT PRIMARY KEY auto_increment,
    cliente_id INT NOT NULL,
    telefono varchar(20)
);
```