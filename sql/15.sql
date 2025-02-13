CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio_costo DECIMAL(10,2) NOT NULL,
  precio_venta DECIMAL(10,2) NOT NULL,
  unidad_medida VARCHAR(50),
  observaciones TEXT,
  id_categoria INT,
  id_subcategoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
  FOREIGN KEY (id_subcategoria) REFERENCES subcategorias(id_subcategoria)
) ENGINE = InnoDB;
