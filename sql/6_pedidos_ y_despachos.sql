-- PEDIDOS (posible tabla para manejar pedidos)
CREATE TABLE pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_estado_pedido INT NOT NULL,
  fecha_pedido DATE,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_estado_pedido) REFERENCES estado_pedido(id_estado_pedido)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DESPACHOS (depende de PEDIDOS, a veces también de TRANSPORTE)
CREATE TABLE despachos (
  id_despacho INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  direccion_envio VARCHAR(255),
  metodo_envio VARCHAR(255),
  fecha_estimada DATE,
  costo_envio DECIMAL(10,2),
  id_transporte INT,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_transporte) REFERENCES transporte(id_transporte)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;