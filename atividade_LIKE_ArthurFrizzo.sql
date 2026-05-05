create database escola3;
use escola3;

CREATE TABLE alunos (
id INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
cidade VARCHAR(50),
idade INT CHECK (idade >= 0)
);

CREATE TABLE professores (
id INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
disciplina VARCHAR(50),
email VARCHAR(100) UNIQUE
);

CREATE TABLE cursos (
id INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
carga_horaria INT CHECK (carga_horaria > 0)
);

CREATE TABLE disciplinas (
id INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
area VARCHAR(50)
);

CREATE TABLE turmas (
id INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
periodo VARCHAR(20)
);

INSERT INTO alunos VALUES
(1, 'Ana Silva', 'ana@gmail.com', 'Curitiba', 18),
(2, 'Bruno Souza', 'bruno@gmail.com', 'Londrina', 20),
(3, 'Carlos Pereira', 'carlos@gmail.com', 'Maringá', 17),
(4, 'Amanda Costa', 'amanda@gmail.com', 'Curitiba', 19),
(5, 'Beatriz Lima', 'beatriz@gmail.com', 'Cascavel', 18);

INSERT INTO professores VALUES
(1, 'João Santos', 'Banco de Dados', 'joao@ifpr.edu.br'),
(2, 'Maria Oliveira', 'Programação', 'maria@ifpr.edu.br'),
(3, 'José Ferreira', 'Redes', 'jose@ifpr.edu.br'),
(4, 'Juliana Rocha', 'Web', 'juliana@ifpr.edu.br'),
(5, 'Marcos Lima', 'Algoritmos', 'marcos@ifpr.edu.br');

INSERT INTO cursos VALUES
(1, 'Informática', 1200),
(2, 'Administração', 1000),
(3, 'Agropecuária', 1100),
(4, 'Eletrotécnica', 1300),
(5, 'Logística', 900);

INSERT INTO disciplinas VALUES
(1, 'Banco de Dados', 'Tecnologia'),
(2, 'Programação Web', 'Tecnologia'),
(3, 'Redes de Computadores', 'Tecnologia'),
(4, 'Matemática', 'Exatas'),
(5, 'Português', 'Linguagens');

INSERT INTO turmas VALUES
(1, '3º Info A', 'Matutino'),
(2, '2º Adm B', 'Vespertino'),
(3, '1º Agro', 'Matutino'),
(4, '3º Eletro', 'Noturno'),
(5, '2º Log', 'Vespertino');

select * from alunos where nome like "A%";
select *  from alunos where nome like "%a"; 
select *  from alunos where nome like "%an%";
select *  from professores where nome like "M%";
select *  from professores where email like "%.br";
select * from cursos where nome like "%o%";
select * from disciplinas where nome like "P%";
select * from disciplinas where nome like "%a";
select * from turmas where nome like "%2º%";
select * from turmas where periodo like "V%";
select * from alunos where nome like "____ %";
select * from alunos where nome like "A__ %";
select * from alunos where nome like "_____ %";
select * from professores where nome like "J____ %";
select * from professores where nome like "M_r%";
select * from cursos where nome like "__________";
select * from disciplinas where nome like "P________"; 
select * from turmas where nome like "_º_____ _";
select * from alunos where email like "_%@gmail.com";
select * from professores where email like "_____@%";


