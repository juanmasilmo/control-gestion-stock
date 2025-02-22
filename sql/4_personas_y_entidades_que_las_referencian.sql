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