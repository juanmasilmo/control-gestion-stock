CREATE TABLE proveedores (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  tel VARCHAR(20),
  id_direccion INT,   -- FK a direcciones
  observaciones TEXT,
  FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
) ENGINE = InnoDB;
