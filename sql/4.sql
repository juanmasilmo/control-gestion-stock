CREATE TABLE localidades (
  id_localidad INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  cp VARCHAR(10),
  id_provincia INT NOT NULL,
  FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
) ENGINE = InnoDB;
