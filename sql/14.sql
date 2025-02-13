CREATE TABLE subcategorias (
  id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(100),
  id_categoria INT NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
) ENGINE = InnoDB;
