CREATE TABLE vendedores (
  id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  tel VARCHAR(20),
  id_direccion INT,       -- FK a direcciones
  observaciones TEXT,
  id_usuario INT,         -- FK a usuarios (si deseas vincularlo)
  FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
) ENGINE = InnoDB;
