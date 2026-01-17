BEGIN TRANSACTION;

INSERT INTO escola.alunos (aluno_id, nome, data_nascimento, genero, email, data_cadastro)
VALUES (4, 'Pedro Santos', '2005-05-12', 'M', 'pedro.santos@gmail.com', '2023-01-20');

INSERT INTO escola.matriculas (matricula_id, aluno_id, turma_id, data_matricula, status)
VALUES (5, 4, 2, '2023-02-05', 'ativa');

UPDATE escola.avaliacoes
SET nota = 8.8
WHERE matricula_id = 5 AND tipo = 'Prova';

DECLARE nota_valida BOOL DEFAULT (SELECT nota >= 0 AND nota <= 10 FROM escola.avaliacoes WHERE matricula_id = 5);

IF NOT nota_valida THEN
  ROLLBACK;
ELSE
  COMMIT;
END IF;
