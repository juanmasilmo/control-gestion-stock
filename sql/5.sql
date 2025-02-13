CREATE TABLE direcciones (
  id_direccion INT AUTO_INCREMENT PRIMARY KEY,
  calle VARCHAR(100),
  numero VARCHAR(10),
  piso VARCHAR(10),
  departamento VARCHAR(10),
  id_localidad INT,
  observaciones TEXT,
  FOREIGN KEY (id_localidad) REFERENCES localidades(id_localidad)
) ENGINE = InnoDB;
