-- PROMOCION_PRODUCTOS (relación entre promociones y descuentos)
CREATE TABLE promocion_productos (
  id_promocion_productos INT AUTO_INCREMENT PRIMARY KEY,
  id_promociones INT NOT NULL,
  id_descuentos INT NOT NULL,
  FOREIGN KEY (id_promociones) REFERENCES promociones(id_promociones),
  FOREIGN KEY (id_descuentos) REFERENCES descuentos(id_descuentos)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;