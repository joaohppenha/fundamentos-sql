CREATE SCHEMA IF NOT EXISTS escola
OPTIONS (location = 'southamerica-east1');

CREATE TABLE IF NOT EXISTS escola.alunos (
  aluno_id INT64 NOT NULL,
  nome STRING NOT NULL,
  data_nascimento DATE,
  genero STRING,
  email STRING,
  data_cadastro DATE
);

CREATE TABLE IF NOT EXISTS escola.professores (
  professor_id INT64 NOT NULL,
  nome STRING NOT NULL,
  email STRING,
  data_admissao DATE,
  email_institucional STRING
);

CREATE TABLE IF NOT EXISTS escola.disciplinas (
  disciplina_id INT64 NOT NULL,
  nome STRING NOT NULL,
  carga_horaria INT64,
  professor_id INT64
);

CREATE TABLE IF NOT EXISTS escola.turmas (
  turma_id INT64 NOT NULL,
  disciplina_id INT64,
  ano INT64,
  semestre INT64,
  periodo STRING,
  sala_id INT64
);

CREATE TABLE IF NOT EXISTS escola.matriculas (
  matricula_id INT64 NOT NULL,
  aluno_id INT64,
  turma_id INT64,
  data_matricula DATE,
  status STRING
);

CREATE TABLE IF NOT EXISTS escola.avaliacoes (
  avaliacao_id INT64 NOT NULL,
  matricula_id INT64,
  tipo STRING,
  nota FLOAT64,
  data_avaliacao DATE
);

ALTER TABLE escola.avaliacoes
ALTER COLUMN nota
SET OPTIONS (description = "Nota do aluno na avaliação");

ALTER TABLE escola.avaliacoes
SET OPTIONS (description = "Registra todas as avaliações dos alunos");

INSERT INTO escola.alunos (aluno_id, nome, data_nascimento, genero, email, data_cadastro)
VALUES
(1, 'Maria Silva', '2005-03-10', 'F', 'maria.silva@gmail.com', '2023-01-15'),
(2, 'João Pereira', '2004-07-22', 'M', 'joao.pereira@gmail.com', '2023-01-16'),
(3, 'Ana Costa', '2005-11-05', 'F', 'ana.costa@gmail.com', '2023-01-17');

INSERT INTO escola.professores (professor_id, nome, email, data_admissao, email_institucional)
VALUES
(1, 'Carlos Souza', 'carlos.souza@gmail.com', '2015-02-10', 'carlos@escola.com'),
(2, 'Fernanda Lima', 'fernanda.lima@gmail.com', '2018-08-22', 'fernanda@escola.com');

INSERT INTO escola.disciplinas (disciplina_id, nome, carga_horaria, professor_id)
VALUES
(1, 'Matemática', 80, 1),
(2, 'História', 60, 2),
(3, 'Português', 70, 1);

INSERT INTO escola.turmas (turma_id, disciplina_id, ano, semestre, periodo, sala_id)
VALUES
(1, 1, 2023, 1, 'Manhã', 101),
(2, 2, 2023, 1, 'Tarde', 102),
(3, 3, 2023, 2, 'Manhã', 103);

INSERT INTO escola.matriculas (matricula_id, aluno_id, turma_id, data_matricula, status)
VALUES
(1, 1, 1, '2023-02-01', 'ativa'),
(2, 1, 2, '2023-02-01', 'ativa'),
(3, 2, 1, '2023-02-02', 'ativa'),
(4, 3, 3, '2023-02-03', 'ativa');

INSERT INTO escola.avaliacoes (avaliacao_id, matricula_id, tipo, nota, data_avaliacao)
VALUES
(1, 1, 'Prova', 8.5, '2023-03-15'),
(2, 2, 'Trabalho', 9.0, '2023-03-16'),
(3, 3, 'Prova', 7.0, '2023-03-17'),
(4, 4, 'Atividade', 10.0, '2023-03-18');

UPDATE escola.alunos
SET email = 'maria.silva@escola.com'
WHERE aluno_id = 1;

UPDATE escola.matriculas
SET status = 'concluída'
WHERE matricula_id = 2;

UPDATE escola.disciplinas
SET carga_horaria = 75
WHERE disciplina_id = 3;

DELETE FROM escola.matriculas
WHERE status = 'cancelada';

DELETE FROM escola.alunos
WHERE aluno_id = 3;

TRUNCATE TABLE escola.matriculas;

TRUNCATE TABLE escola.avaliacoes;
