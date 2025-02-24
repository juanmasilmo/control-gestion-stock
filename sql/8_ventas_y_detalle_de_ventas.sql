-- VENTAS
CREATE TABLE ventas (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  fecha_compra DATE,
  id_cliente INT NOT NULL,
  total_pedido DECIMAL(10,2),
  id_formas_pago INT NOT NULL,
  observaciones TEXT,
  fecha_creacion DATETIME,
  fecha_modificacion DATETIME,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_formas_pago) REFERENCES formas_pago(id_formas_pago)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DETALLE_VENTAS (relación con VENTAS y PRODUCTO_PROVEEDOR, y opcional con PROMOCION_PRODUCTOS)
CREATE TABLE detalle_ventas (
  id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  id_producto_proveedor INT NOT NULL,
  cantidad INT NOT NULL,
  id_promocion_productos INT,
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
  FOREIGN KEY (id_producto_proveedor) REFERENCES producto_proveedor(id_producto_proveedor),
  FOREIGN KEY (id_promocion_productos) REFERENCES promocion_productos(id_promocion_productos)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;