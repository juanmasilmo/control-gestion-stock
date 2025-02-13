CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  dni VARCHAR(20),
  cuit VARCHAR(20),
  tel VARCHAR(20),
  mail VARCHAR(100),
  id_direccion INT,   -- FK a direcciones
  observaciones TEXT,
  FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
) ENGINE = InnoDB;

