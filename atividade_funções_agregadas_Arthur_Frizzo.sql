create database academia;
use academia;



CREATE TABLE planos (
id INT AUTO_INCREMENT PRIMARY KEY,
aluno VARCHAR(100),
plano VARCHAR(50),
meses INT,
valor_mensal DECIMAL(10,2),
valor_total DECIMAL(10,2) GENERATED ALWAYS AS (meses * valor_mensal)
STORED
);


INSERT INTO planos (aluno, plano, meses, valor_mensal) VALUES
('Ana Souza', 'Básico', 3, 80.00),
('Carlos Lima', 'Premium', 6, 120.00),
('Fernanda Alves', 'Básico', 12, 75.00),
('João Pedro', 'Intermediário', 6, 100.00),
('Mariana Costa', 'Premium', 3, 130.00),
('Lucas Rocha', 'Básico', 2, 90.00),
('Juliana Martins', 'Intermediário', 12, 95.00),
('Rafael Gomes', 'Premium', 1, 150.00),
('Patrícia Silva', 'Básico', 6, 85.00),
('Bruno Oliveira', 'Intermediário', 3, 110.00),
('Camila Ferreira', 'Premium', 12, 115.00),
('Diego Santos', 'Básico', 4, 70.00),
('Aline Barbosa', 'Intermediário', 8, 105.00),
('Gustavo Pereira', 'Premium', 6, 125.00),
('Larissa Mendes', 'Básico', 10, 80.00),
('Felipe Costa', 'Intermediário', 5, 100.00),
('Renata Teixeira', 'Premium', 2, 140.00),
('Eduardo Nunes', 'Básico', 7, 85.00),
('Beatriz Ribeiro', 'Intermediário', 9, 95.00),
('Thiago Fernandes', 'Premium', 12, 120.00);

select count(aluno) as alunos_cadastrados from planos;
select max(valor_mensal) as maior_valor_mensal from planos;
select min(valor_mensal) as menor_valor_mensal from planos;
select avg(valor_mensal) as media_mensalidades from planos;
select sum(valor_total) as total_arrecadado from planos;
select count(aluno) as alunos_premium from planos where plano="Premium";
select count(aluno) as planos_caros from planos where valor_mensal > 100;
select sum(meses) as total_meses from planos;
select max(valor_total) as maior_valor_pago from planos;
select min(valor_total) as menor_valor_pago from planos;

