CREATE TABLE producto_tipo_molienda (
  id_producto INT NOT NULL,
  id_tipo_molienda INT NOT NULL,
  PRIMARY KEY (id_producto, id_tipo_molienda),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_tipo_molienda) REFERENCES tipos_molienda(id_tipo_molienda)
) ENGINE = InnoDB;
