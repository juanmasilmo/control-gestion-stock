CREATE TABLE promociones (
  id_promocion INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(100),
  fecha_inicio DATE,
  fecha_fin DATE,
  activo TINYINT(1) DEFAULT 1,
  fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATETIME ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB;
