CREATE TABLE denunciante (
  id SERIAL PRIMARY KEY,
  nome VARCHAR (100) NOT NULL,
  email VARCHAR (100) NULL,
  telefone VARCHAR (30) NULL
);

CREATE TABLE buraco (
  id SERIAL PRIMARY KEY,
  denunciante_id INT NULL,
  endereco VARCHAR (100) NOT NULL,
  referencia VARCHAR (100) NULL,
  cidade VARCHAR (50) NOT NULL,
  estado VARCHAR (50) NOT NULL,
  cep VARCHAR (10) NULL,
  data_ocorrencia DATE NOT NULL,
  observacao VARCHAR (255) NULL,
  gravidade VARCHAR (20) NOT NULL,
  tratado BOOLEAN NOT NULL,
  FOREIGN KEY (denunciante_id) REFERENCES denunciante (id)
);