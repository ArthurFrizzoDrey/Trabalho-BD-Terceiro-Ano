create database empresa;

use empresa;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    valor_total DECIMAL(10,2) GENERATED ALWAYS AS (quantidade * valor) STORED
);

INSERT INTO produtos (nome, marca, quantidade, valor) VALUES
('Notebook', 'Dell', 5, 3500.00),
('Mouse', 'Logitech', 20, 80.00),
('Teclado', 'Microsoft', 15, 120.00),
('Monitor', 'Samsung', 10, 900.00),
('Impressora', 'HP', 4, 750.00),
('Cadeira Gamer', 'DXRacer', 3, 1500.00),
('Mesa Escritório', 'Multimóveis', 6, 600.00),
('Headset', 'HyperX', 12, 250.00),
('Pen Drive 32GB', 'SanDisk', 30, 40.00),
('HD Externo 1TB', 'Seagate', 8, 350.00),
('SSD 480GB', 'Kingston', 10, 280.00),
('Placa de Vídeo', 'Nvidia', 2, 2500.00),
('Processador', 'Intel', 5, 1800.00),
('Memória RAM 8GB', 'Corsair', 14, 200.00),
('Fonte 500W', 'EVGA', 7, 300.00),
('Gabinete', 'Cooler Master', 9, 400.00),
('Webcam', 'Logitech', 11, 220.00),
('Roteador', 'TP-Link', 13, 180.00),
('Switch 8 Portas', 'TP-Link', 6, 160.00),
('Notebook Gamer', 'Acer', 3, 5500.00);

CREATE TABLE promocao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    valor_promocional DECIMAL(10,2)
);

CREATE TABLE estoque_baixo (
    id INT,
    nome VARCHAR(100),
    marca VARCHAR(100),
    quantidade INT,
    valor DECIMAL(10,2)
);

-- Produtos com valor acima da média
SELECT nome, valor
FROM produtos
WHERE valor > 
(SELECT AVG(valor) FROM produtos);

-- Produto com a maior quantidade em estoque
SELECT nome, quantidade
FROM produtos
WHERE quantidade = 
(SELECT MAX(quantidade) FROM produtos);

-- Produtos com valor igual ao maior valor da marca Logitech
SELECT nome, marca, valor
FROM produtos
WHERE valor =
(SELECT MAX(valor) FROM produtos WHERE marca = 'Logitech');

-- Inserir produtos caros na tabela de promoção
INSERT INTO promocao (nome_produto, valor_promocional)
SELECT nome, valor * 0.9
FROM produtos
WHERE valor > (
    SELECT AVG(valor)
    FROM produtos
);

-- Inserir produtos com baixo estoque na tabela estoque baixo
INSERT INTO estoque_baixo
SELECT id, nome, marca, quantidade, valor
FROM produtos
WHERE quantidade < (
    SELECT AVG(quantidade)
    FROM produtos
);
-- Aumentar em 10% o valor dos produtos abaixo da média
UPDATE produtos
SET valor = valor * 1.10
WHERE valor < (
    SELECT media
    FROM (
        SELECT AVG(valor) AS media
        FROM produtos
    ) AS temp
);

-- Atualizar produtos da mesma marca do “Notebook”
UPDATE produtos
SET valor = valor * 0.95
WHERE marca = (
    SELECT marca
    FROM (
        SELECT marca
        FROM produtos
        WHERE nome = 'Notebook'
    ) AS temp
);

-- Excluir produtos da mesma marca do “Roteador”
DELETE FROM produtos
WHERE marca IN (
    SELECT marca
    FROM (
        SELECT marca
        FROM produtos
        WHERE nome = 'Roteador'
    ) AS marcas
);

-- Excluir produtos com valor maior que o do “Monitor”
DELETE FROM produtos
WHERE valor > (
    SELECT valor
    FROM (
        SELECT valor
        FROM produtos
        WHERE nome = 'Monitor'
    ) AS referencia
);


