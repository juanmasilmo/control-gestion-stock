CREATE TABLE transporte (
  id_transporte INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(100),
  tel VARCHAR(20),
  id_direccion INT,
  FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
) ENGINE = InnoDB;
