-- PRODUCTOS (depende de UNIDADES_MEDIDAS, CATEGORIA, SUBCATEGORIA)
CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  observaciones TEXT,
  id_unidad_medida INT NOT NULL,
  id_categoria INT NOT NULL,
  id_subcategoria INT NOT NULL,
  FOREIGN KEY (id_unidad_medida) REFERENCES unidades_medidas(id_unidad_medida),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  FOREIGN KEY (id_subcategoria) REFERENCES subcategoria(id_subcategoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PRODUCTO_TIPO_MOLIENDA (relación N:N entre productos y tipos_molienda)
CREATE TABLE producto_tipo_molienda (
  id_producto INT NOT NULL,
  id_tipo_molienda INT NOT NULL,
  PRIMARY KEY (id_producto, id_tipo_molienda),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_tipo_molienda) REFERENCES tipos_molienda(id_tipo_molienda)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PRODUCTO_PROVEEDOR (relación N:N entre productos y proveedores)
CREATE TABLE producto_proveedor (
  id_producto_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  id_proveedor INT NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;