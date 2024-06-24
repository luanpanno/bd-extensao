CREATE TABLE denunciante (
  id SERIAL PRIMARY KEY,
  nome VARCHAR (100) NOT NULL,
  email VARCHAR (100) NULL,
  telefone VARCHAR (30) NULL
);

CREATE TABLE ocorrencia (
  id SERIAL PRIMARY KEY,
  denunciante_id INT NULL,
  endereco VARCHAR (100) NOT NULL,
  referencia VARCHAR (100) NOT NULL,
  cidade VARCHAR (50) NOT NULL,
  estado VARCHAR (50) NOT NULL,
  cep VARCHAR (10) NOT NULL,
  data_ocorrencia DATE NOT NULL,
  observacao VARCHAR (255) NULL,
  FOREIGN KEY (denunciante_id) REFERENCES denunciante (id)
);