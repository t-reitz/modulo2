INSERT INTO pessoa (Nome, Idade, Email, Telefone, Endereco, Descricao)
VALUES ('Thomas Reitzfeld', 23, 'thomas.reitzfeld@sou.inteli.edu.br', '11992541986', 'Av Prof Almeida Prado 520', 'Aluno do Inteli');

INSERT INTO formacao_academica (ID_Pessoa, Nome_fundacao, Nome_curso, Data_inicio, Data_fim, Descricao)
VALUES (1, 'Universidade de São Paulo', 'Ciência da Computação', '2018-03-01', '2022-02-28', 'Bacharelado em Ciência da Computação');

INSERT INTO habilidades (ID_Pessoa, Nome_habilidade, Nivel_atingido, Descricao)
VALUES (1, 'Programação em Python', 8, 'Desenvolvimento de aplicações Python com Django e Flask.');

INSERT INTO conquistas (ID_Pessoa, Nome_conquista, Data_conquista, Descricao)
VALUES (1, 'Projeto de conclusão de curso', '2022-02-28', 'Desenvolvimento de uma plataforma de e-commerce com integração de pagamentos online.');

INSERT INTO personalidade (ID_Pessoa, Nome_personalidade, Nivel, Descricao)
VALUES (1, 'Proativo', 9, 'Busco sempre me antecipar a possíveis problemas e trabalhar de forma proativa para solucioná-los.');

INSERT INTO experiencia_profissional (ID_Pessoa, Nome_empresa, Nome_cargo, Data_inicio, Data_fim, Descricao)
VALUES (1, 'Empresa XYZ', 'Desenvolvedor Python', '2022-03-01', NULL, 'Desenvolvimento de soluções Python para clientes corporativos.');

CREATE VIEW curriculo AS 
SELECT p.Nome, p.Idade, p.Email, p.Telefone, p.Endereco, p.Descricao,
       f.Nome_fundacao, f.Nome_curso, f.Data_inicio, f.Data_fim, f.Descricao AS formacao_descricao,
       h.Nome_habilidade, h.Nivel_atingido, h.Descricao AS habilidades_descricao,
       c.Nome_conquista, c.Data_conquista, c.Descricao AS conquistas_descricao,
       ps.Nome_personalidade, ps.Nivel, ps.Descricao AS personalidade_descricao,
       e.Nome_empresa, e.Nome_cargo, e.Data_inicio AS experiencia_inicio, e.Data_fim AS experiencia_fim, e.Descricao AS experiencia_descricao
FROM pessoa p
LEFT JOIN formacao_academica f ON p.ID_Pessoa = f.ID_Pessoa
LEFT JOIN habilidades h ON p.ID_Pessoa = h.ID_Pessoa
LEFT JOIN conquistas c ON p.ID_Pessoa = c.ID_Pessoa
LEFT JOIN personalidade ps ON p.ID_Pessoa = ps.ID_Pessoa
LEFT JOIN experiencia_profissional e ON p.ID_Pessoa = e.ID_Pessoa
WHERE p.Nome = 'Thomas Reitzfeld';

SELECT Nome, Idade, Email, Telefone, Endereco, Descricao, 
       Nome_fundacao, Nome_curso, Data_inicio, Data_fim, formacao_descricao,
       Nome_habilidade, Nivel_atingido, habilidades_descricao,
       Nome_conquista, Data_conquista, conquistas_descricao,
       Nome_personalidade, Nivel, personalidade_descricao,
       Nome_empresa, Nome_cargo, experiencia_inicio, experiencia_fim, experiencia_descricao
FROM curriculo;

