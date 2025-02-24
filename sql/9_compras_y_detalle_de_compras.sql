-- COMPRAS
CREATE TABLE compras (
  id_compra INT AUTO_INCREMENT PRIMARY KEY,
  id_proveedor INT NOT NULL,
  id_persona INT NOT NULL,       -- Por si la persona que realiza la compra es un empleado, etc.
  descripcion TEXT,
  fecha_creacion DATETIME,
  fecha_modificacion DATETIME,
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DETALLE_COMPRAS (relación con COMPRAS y PRODUCTOS)
CREATE TABLE detalle_compras (
  id_detalle_compra INT AUTO_INCREMENT PRIMARY KEY,
  id_compra INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio DECIMAL(10,2),
  FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;