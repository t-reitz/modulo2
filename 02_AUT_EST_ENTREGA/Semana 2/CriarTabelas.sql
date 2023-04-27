-- cria a tabela pessoa
CREATE TABLE pessoa (
  ID_Pessoa INTEGER PRIMARY KEY,
  Nome TEXT,
  Idade INTEGER,
  Email TEXT,
  Telefone TEXT,
  Endereco TEXT,
  Descricao TEXT
);

-- cria a tabela formacao_academica
CREATE TABLE formacao_academica (
  ID_Formacao INTEGER PRIMARY KEY AUTOINCREMENT,
  ID_Pessoa INTEGER,
  Nome_fundacao TEXT,
  Nome_curso TEXT,
  Data_inicio DATE,
  Data_fim DATE,
  Descricao TEXT,
  FOREIGN KEY (ID_Pessoa) REFERENCES pessoa(ID_Pessoa)
);

-- cria a tabela habilidades
CREATE TABLE habilidades (
  ID_Habilidade INTEGER PRIMARY KEY AUTOINCREMENT,
  ID_Pessoa INTEGER,
  Nome_habilidade TEXT,
  Nivel_atingido INTEGER,
  Descricao TEXT,
  FOREIGN KEY (ID_Pessoa) REFERENCES pessoa(ID_Pessoa)
);

-- cria a tabela conquistas
CREATE TABLE conquistas (
  ID_Conquista INTEGER PRIMARY KEY AUTOINCREMENT,
  ID_Pessoa INTEGER,
  Nome_conquista TEXT,
  Data_conquista DATE,
  Descricao TEXT,
  FOREIGN KEY (ID_Pessoa) REFERENCES pessoa(ID_Pessoa)
);

-- cria a tabela personalidade
CREATE TABLE personalidade (
  ID_Personalidade INTEGER PRIMARY KEY AUTOINCREMENT,
  ID_Pessoa INTEGER,
  Nome_personalidade TEXT,
  Nivel INTEGER,
  Descricao TEXT,
  FOREIGN KEY (ID_Pessoa) REFERENCES pessoa(ID_Pessoa)
);

-- cria a tabela experiencia_profissional
CREATE TABLE experiencia_profissional (
  ID_Experiencia INTEGER PRIMARY KEY AUTOINCREMENT,
  ID_Pessoa INTEGER,
  Nome_empresa TEXT,
  Nome_cargo TEXT,
  Data_inicio DATE,
  Data_fim DATE,
  Descricao TEXT,
  FOREIGN KEY (ID_Pessoa) REFERENCES pessoa(ID_Pessoa)
);