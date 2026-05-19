CREATE DATABASE loja;
USE loja;

CREATE TABLE produtos (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
quantidade INT NOT NULL,
valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE vendas (
id INT AUTO_INCREMENT PRIMARY KEY,
produto_id INT,
quantidade_vendida INT,
data_venda DATE,
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO produtos (nome, categoria, quantidade, valor) VALUES
('Notebook Dell', 'Informática', 5, 3500.00),
('Mouse Logitech', 'Informática', 20, 80.00),
('Teclado Gamer', 'Informática', 12, 250.00),
('Monitor Samsung', 'Informática', 8, 1200.00),
('Cadeira Escritório', 'Móveis', 10, 650.00),
('Mesa Escritório', 'Móveis', 6, 900.00),
('Impressora HP', 'Informática', 4, 750.00),
('HD Externo', 'Armazenamento', 15, 400.00),
('SSD 1TB', 'Armazenamento', 9, 650.00),
('Pen Drive 64GB', 'Armazenamento', 30, 60.00);

INSERT INTO vendas (produto_id, quantidade_vendida, data_venda) VALUES
(1, 2, '2026-05-01'),
(2, 5, '2026-05-02'),
(3, 3, '2026-05-02'),
(4, 2, '2026-05-03'),
(5, 1, '2026-05-03'),
(8, 4, '2026-05-04'),
(9, 2, '2026-05-05'),
(2, 3, '2026-05-06');

SELECT nome, valor
FROM produtos
WHERE valor > 
(SELECT AVG(valor) FROM produtos);

SELECT nome, quantidade
FROM produtos
WHERE quantidade > 
(SELECT MAX(quantidade) FROM produtos where nome = 'Monitor Samsung');

SELECT *
FROM produtos
WHERE categoria = (
    SELECT categoria
    FROM produtos
    WHERE nome = 'SSD 1TB'
);

SELECT nome, valor
FROM produtos
WHERE valor =
(SELECT min(valor) from produtos);

SELECT nome, valor
FROM produtos
WHERE id NOT IN (
    SELECT produto_id FROM vendas
); 

SELECT nome, valor
FROM produtos
WHERE valor >
	(SELECT valor from produtos where nome = 'Mesa Escritório');

SELECT *
FROM produtos
WHERE quantidade = (
    SELECT MAX(quantidade)
    FROM produtos
);

SELECT nome, valor
FROM produtos
WHERE valor <
	(SELECT avg(valor) from produtos where categoria = 'Informática');