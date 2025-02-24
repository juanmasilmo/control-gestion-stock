-- tablas sin dependencias directas

-- ROLES
CREATE TABLE roles (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PAISES
CREATE TABLE paises (
  id_pais INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- FORMAS_PAGO
CREATE TABLE formas_pago (
  id_formas_pago INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- UNIDADES_MEDIDAS
CREATE TABLE unidades_medidas (
  id_unidad_medida INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CATEGORIAS
CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- SUBCATEGORIA
CREATE TABLE subcategoria (
  id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TIPOS_MOLIENDA
CREATE TABLE tipos_molienda (
  id_tipo_molienda INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ESTADO_PEDIDO
CREATE TABLE estado_pedido (
  id_estado_pedido INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DESCUENTOS
CREATE TABLE descuentos (
  id_descuentos INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(50),
  valor DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PROMOCIONES
CREATE TABLE promociones (
  id_promociones INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255),
  fecha_inicio DATE,
  fecha_fin DATE,
  activo BOOLEAN DEFAULT 1,
  fecha_creacion DATETIME,
  fecha_modificacion DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TRANSPORTE
CREATE TABLE transporte (
  id_transporte INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255),
  cuit VARCHAR(50),
  descripcion TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Tablas de ubicación geográfica

-- PROVINCIAS (depende de PAISES)
CREATE TABLE provincias (
  id_provincias INT AUTO_INCREMENT PRIMARY KEY,
  id_pais INT NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- LOCALIDADES (depende de PROVINCIAS)
CREATE TABLE localidades (
  id_localidades INT AUTO_INCREMENT PRIMARY KEY,
  id_provincias INT NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  cp VARCHAR(10),
  FOREIGN KEY (id_provincias) REFERENCES provincias(id_provincias)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--Personas y entidades que las referencian

-- PERSONAS (depende de LOCALIDADES)
CREATE TABLE personas (
  id_persona INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255),
  domicilio VARCHAR(255),
  dni VARCHAR(20),
  observaciones TEXT,
  telefono VARCHAR(50),
  mail VARCHAR(255),
  id_localidades INT,
  FOREIGN KEY (id_localidades) REFERENCES localidades(id_localidades)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CLIENTES (depende de PERSONAS)
CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  id_persona INT NOT NULL,
  cuit VARCHAR(50),
  observaciones TEXT,
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- EMPLEADOS (depende de PERSONAS)
CREATE TABLE empleados (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  id_persona INT NOT NULL,
  observaciones TEXT,
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PROVEEDORES (depende de PERSONAS)
CREATE TABLE proveedores (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  id_persona INT NOT NULL,
  cuit VARCHAR(50),
  observaciones TEXT,
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--Productos y sus relaciones

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

--Pedidos y despachos

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

--Promociones y descuentos

-- PROMOCION_PRODUCTOS (relación entre promociones y descuentos)
CREATE TABLE promocion_productos (
  id_promocion_productos INT AUTO_INCREMENT PRIMARY KEY,
  id_promociones INT NOT NULL,
  id_descuentos INT NOT NULL,
  FOREIGN KEY (id_promociones) REFERENCES promociones(id_promociones),
  FOREIGN KEY (id_descuentos) REFERENCES descuentos(id_descuentos)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--Ventas y detalle de ventas

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

--Compras y detalle de compras

-- COMPRAS
CREATE TABLE compras (
  id_compra INT AUTO_INCREMENT PRIMARY KEY,
  id_proveedor INT NOT NULL,
  id_persona INT NOT NULL,       -- Por si la persona que realiza la compra es un empleado, etc.
  descripcion TEXT,
  fecha_creacion DATETIME,
  fecha_modificacion DATETIME,
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DETALLE_COMPRAS (relación con COMPRAS y PRODUCTOS)
CREATE TABLE detalle_compras (
  id_detalle_compra INT AUTO_INCREMENT PRIMARY KEY,
  id_compra INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio DECIMAL(10,2),
  FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
