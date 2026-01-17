-- Seleção simples de todas as tabelas
SELECT * FROM escola.alunos;

SELECT * FROM escola.professores;

SELECT * FROM escola.disciplinas;

SELECT * FROM escola.turmas;

SELECT * FROM escola.matriculas;

SELECT * FROM escola.avaliacoes;

-- Seleção com filtros
SELECT nome, email
FROM escola.alunos
WHERE genero = 'F';

SELECT nome, carga_horaria
FROM escola.disciplinas
WHERE carga_horaria > 70;

SELECT aluno_id, status
FROM escola.matriculas
WHERE status = 'ativa';

-- Agregações
SELECT disciplina_id, COUNT(*) AS total_turmas
FROM escola.turmas
GROUP BY disciplina_id;

SELECT turma_id, AVG(nota) AS media_nota
FROM escola.avaliacoes
GROUP BY turma_id;

SELECT genero, COUNT(*) AS total_alunos
FROM escola.alunos
GROUP BY genero;

-- Ordenações
SELECT nome, data_nascimento
FROM escola.alunos
ORDER BY data_nascimento ASC;

SELECT nota, matricula_id
FROM escola.avaliacoes
ORDER BY nota DESC;

-- Joins entre tabelas
SELECT a.nome AS aluno, t.periodo, d.nome AS disciplina
FROM escola.alunos a
JOIN escola.matriculas m ON a.aluno_id = m.aluno_id
JOIN escola.turmas t ON m.turma_id = t.turma_id
JOIN escola.disciplinas d ON t.disciplina_id = d.disciplina_id;

SELECT p.nome AS professor, d.nome AS disciplina, t.ano, t.semestre
FROM escola.professores p
JOIN escola.disciplinas d ON p.professor_id = d.professor_id
JOIN escola.turmas t ON d.disciplina_id = t.disciplina_id;

SELECT a.nome AS aluno, AVG(av.nota) AS media
FROM escola.alunos a
JOIN escola.matriculas m ON a.aluno_id = m.aluno_id
JOIN escola.avaliacoes av ON m.matricula_id = av.matricula_id
GROUP BY a.nome
ORDER BY media DESC;

-- Consultas com condições mais complexas
SELECT a.nome, t.periodo, d.nome AS disciplina, av.nota
FROM escola.alunos a
JOIN escola.matriculas m ON a.aluno_id = m.aluno_id
JOIN escola.turmas t ON m.turma_id = t.turma_id
JOIN escola.disciplinas d ON t.disciplina_id = d.disciplina_id
JOIN escola.avaliacoes av ON m.matricula_id = av.matricula_id
WHERE av.nota >= 9
ORDER BY av.nota DESC;

SELECT disciplina_id, COUNT(*) AS total_matriculas
FROM escola.turmas t
JOIN escola.matriculas m ON t.turma_id = m.turma_id
GROUP BY disciplina_id
HAVING COUNT(*) >= 1;
