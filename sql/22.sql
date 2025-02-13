CREATE TABLE pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_cliente INT NOT NULL,
  total_pedido DECIMAL(10,2) NOT NULL DEFAULT 0,
  id_forma_pago INT,
  id_estado_pedido INT,
  observaciones TEXT,
  fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATETIME ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_forma_pago) REFERENCES formas_pago(id_forma_pago),
  FOREIGN KEY (id_estado_pedido) REFERENCES estado_pedido(id_estado_pedido)
) ENGINE = InnoDB;
