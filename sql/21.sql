CREATE TABLE promocion_productos (
  id_promocion_producto INT AUTO_INCREMENT PRIMARY KEY,
  id_promocion INT NOT NULL,
  id_descuento INT,
  id_producto INT NOT NULL,
  fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATETIME ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_promocion) REFERENCES promociones(id_promocion),
  FOREIGN KEY (id_descuento) REFERENCES descuentos(id_descuento),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
) ENGINE = InnoDB;
