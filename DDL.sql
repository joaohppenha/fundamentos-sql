CREATE SCHEMA escola
OPTIONS (
  location = 'southamerica-east1'
);

CREATE TABLE escola.alunos (
  aluno_id INT64 NOT NULL,
  nome STRING NOT NULL,
  data_nascimento DATE,
  genero STRING,
  email STRING,
  data_cadastro DATE
);


CREATE TABLE escola.disciplinas (
  disciplina_id INT64 NOT NULL,
  nome STRING NOT NULL,
  carga_horaria INT64,
  professor_id INT64
);


CREATE TABLE escola.turmas (
  turma_id INT64 NOT NULL,
  disciplina_id INT64,
  ano INT64,
  semestre INT64,
  turno STRING
);


CREATE TABLE escola.matriculas (
  matricula_id INT64 NOT NULL,
  aluno_id INT64,
  turma_id INT64,
  data_matricula DATE,
  status STRING
);


CREATE TABLE escola.avaliacoes (
  avaliacao_id INT64 NOT NULL,
  matricula_id INT64,
  tipo STRING,
  nota FLOAT64,
  data_avaliacao DATE
);

CREATE SCHEMA escola
OPTIONS (
  location = 'southamerica-east1'
);

CREATE TABLE escola.alunos (
  aluno_id INT64 NOT NULL,
  nome STRING NOT NULL,
  data_nascimento DATE,
  genero STRING,
  email STRING,
  data_cadastro DATE
);

CREATE TABLE escola.professores (
  professor_id INT64 NOT NULL,
  nome STRING NOT NULL,
  email STRING,
  data_admissao DATE
);

CREATE TABLE escola.disciplinas (
  disciplina_id INT64 NOT NULL,
  nome STRING NOT NULL,
  carga_horaria INT64,
  professor_id INT64
);

CREATE TABLE escola.turmas (
  turma_id INT64 NOT NULL,
  disciplina_id INT64,
  ano INT64,
  semestre INT64,
  turno STRING
);

CREATE TABLE escola.matriculas (
  matricula_id INT64 NOT NULL,
  aluno_id INT64,
  turma_id INT64,
  data_matricula DATE,
  status STRING
);

CREATE TABLE escola.avaliacoes (
  avaliacao_id INT64 NOT NULL,
  matricula_id INT64,
  tipo STRING,
  nota FLOAT64,
  data_avaliacao DATE
);

CREATE TABLE escola.salas (
  sala_id INT64 NOT NULL,
  nome_sala STRING,
  capacidade INT64
);

DROP TABLE escola.salas;

ALTER TABLE escola.turmas
RENAME COLUMN turno TO periodo;

ALTER TABLE escola.professores
ADD COLUMN email_institucional STRING;

ALTER TABLE escola.avaliacoes
ALTER COLUMN nota
SET OPTIONS (description = "Nota do aluno na avaliação");

ALTER TABLE escola.avaliacoes
SET OPTIONS (description = "Registra todas as avaliações dos alunos");

TRUNCATE TABLE escola.matriculas;


