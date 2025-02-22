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