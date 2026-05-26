-- atividade A
CREATE DATABASE empresa_veiculos;
use empresa_veiculos; 

-- atividade B
CREATE TABLE Marcas (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome_marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origem VARCHAR(50) NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE Vendedores (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    comissao DECIMAL(5,2) NOT NULL,
    telefone VARCHAR (20) UNIQUE 
);

CREATE TABLE Veiculos (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(30) NOT NULL,
    placa VARCHAR(8) NOT NULL UNIQUE,
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    status_venda VARCHAR(15) DEFAULT 'Disponivel',
    fk_id_marca INT,
    FOREIGN KEY (fk_id_marca) REFERENCES Marcas(id_marca)
);

CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE NOT NULL,
    valor_final DECIMAL(10,2) NOT NULL CHECK (valor_final > 0),
    fk_id_cliente INT,
    fk_id_vendedor INT,
    fk_id_veiculo INT,
    FOREIGN KEY (fk_id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (fk_id_vendedor) REFERENCES Vendedores(id_vendedor),
    FOREIGN KEY (fk_id_veiculo) REFERENCES Veiculos(id_veiculo)
);

-- atividade C
INSERT INTO Marcas (nome_marca, pais_origem) VALUES
('Toyota', 'Japão'),
('Chevrolet', 'Estados Unidos'),
('Volkswagen', 'Alemanha'),
('Ford', 'Estados Unidos'),
('Honda', 'Japão'),
('Hyundai', 'Coreia do Sul'),
('Fiat', 'Itália');

INSERT INTO Clientes (nome, cpf, telefone, cidade, estado) VALUES
('Carlos Silva', '111.111.111-11', '(41)99999-0001', 'Curitiba', 'PR'),
('Ana Souza', '222.222.222-22', '(41)99999-0002', 'Londrina', 'PR'),
('Bruno Lima', '333.333.333-33', '(11)99999-0003', 'São Paulo', 'SP'),
('Fernanda Costa', '444.444.444-44', '(11)99999-0004', 'Campinas', 'SP'),
('Rafael Oliveira', '555.555.555-55', '(21)99999-0005', 'Rio de Janeiro', 'RJ'),
('Juliana Pereira', '666.666.666-66', '(21)99999-0006', 'Niterói', 'RJ'),
('Diego Martins', '777.777.777-77', '(51)99999-0007', 'Porto Alegre', 'RS'),
('Camila Rocha', '888.888.888-88', '(51)99999-0008', 'Caxias do Sul', 'RS'),
('Lucas Ferreira', '999.999.999-99', '(71)99999-0009', 'Salvador', 'BA'),
('Mariana Alves', '101.010.101-01', '(71)99999-0010', 'Feira de Santana', 'BA'),
('Pedro Gomes', '121.212.121-21', '(81)99999-0011', 'Recife', 'PE'),
('Isabela Nunes', '131.313.131-31', '(81)99999-0012', 'Caruaru', 'PE'),
('Thiago Cardoso', '141.414.141-41', '(62)99999-0013', 'Goiânia', 'GO'),
('Letícia Melo', '151.515.151-51', '(62)99999-0014', 'Anápolis', 'GO'),
('Rodrigo Barbosa', '161.616.161-61', '(46)99999-0015', 'Capanema', 'PR');


INSERT INTO Vendedores (nome, comissao, telefone) VALUES
('João Vendas', 3.50, '(41)98888-0001'),
('Patricia Santos', 4.00, '(41)98888-0002'),
('Marcos Pinto', 3.00, '(41)98888-0003'),
('Renata Dias', 4.50, '(41)98888-0004');


INSERT INTO Veiculos (modelo, ano, cor, placa, valor, status_venda, fk_id_marca) VALUES
('Corolla', 2022, 'Prata', 'ABC1D23', 120000.00, 'Disponivel', 1),
('Hilux', 2021, 'Branco', 'ABC2D34', 210000.00, 'Vendido', 1),
('Yaris', 2023, 'Preto', 'ABC3D45', 95000.00, 'Disponivel', 1),
('Onix', 2022, 'Vermelho', 'BCD1E23', 75000.00, 'Vendido', 2),
('S10', 2021, 'Prata', 'BCD2E34', 180000.00, 'Disponivel', 2),
('Tracker', 2023, 'Azul', 'BCD3E45', 130000.00, 'Disponivel', 2),
('Gol', 2020, 'Branco', 'CDE1F23', 55000.00, 'Vendido', 3),
('T-Cross', 2022, 'Cinza', 'CDE2F34', 125000.00, 'Disponivel', 3),
('Polo', 2023, 'Preto', 'CDE3F45', 98000.00, 'Disponivel', 3),
('Ka', 2020, 'Prata', 'DEF1G23', 48000.00, 'Vendido', 4),
('EcoSport', 2021, 'Vermelho', 'DEF2G34', 105000.00, 'Disponivel', 4),
('Ranger', 2022, 'Branco', 'DEF3G45', 195000.00, 'Disponivel', 4),
('Civic', 2023, 'Azul', 'EFG1H23', 145000.00, 'Vendido', 5),
('HR-V', 2022, 'Cinza', 'EFG2H34', 130000.00, 'Disponivel', 5),
('Fit', 2020, 'Prata', 'EFG3H45', 72000.00, 'Disponivel', 5),
('HB20', 2022, 'Branco', 'FGH1I23', 80000.00, 'Vendido', 6),
('Creta', 2023, 'Preto', 'FGH2I34', 135000.00, 'Disponivel', 6),
('Argo', 2022, 'Vermelho', 'GHI1J23', 68000.00, 'Vendido', 7),
('Pulse', 2023, 'Cinza', 'GHI2J34', 110000.00, 'Disponivel', 7),
('Strada', 2021, 'Branco', 'GHI3J45', 115000.00, 'Disponivel', 7);


INSERT INTO Vendas (data_venda, valor_final, fk_id_cliente, fk_id_vendedor, fk_id_veiculo) VALUES
('2024-01-10', 208000.00, 1, 1, 2),
('2024-02-15', 74500.00, 2, 2, 4),
('2024-03-20', 54000.00, 3, 3, 7),
('2024-04-05', 47500.00, 4, 4, 10),
('2024-05-12', 143000.00, 5, 1, 13),
('2024-06-18', 79000.00, 6, 2, 16),
('2024-07-22', 67000.00, 7, 3, 18),
('2024-08-30', 119000.00, 8, 4, 2),
('2024-09-14', 208500.00, 9, 1, 4),
('2024-10-01', 96000.00, 10, 2, 7);

-- atividade D
SELECT * FROM Marcas;
SELECT * FROM Clientes;
SELECT * FROM Vendedores;
SELECT * FROM Veiculos;
SELECT * FROM Vendas;

-- atv E
SELECT modelo, ano, valor from Veiculos where (ano > 2000);
-- atv F
SELECT modelo, ano , placa from Veiculos where (ano between 2015 and 2020); 
-- atv G
SELECT modelo, placa, valor from Veiculos where cor = 'Branco'
order by valor desc;
-- atv H
SELECT modelo, placa from Veiculos where modelo like 'C%';
-- atv I
SELECT modelo, placa, valor from Veiculos where modelo like '_____';
-- atv J
SELECT count(*) as quantidade_clientes from Clientes;
-- atv K
SELECT count(*) from Veiculos where valor >
(SELECT avg(valor) from Veiculos); 
-- atv L
SELECT modelo, ano, placa, valor from Veiculos where valor >
(SELECT avg(valor) from Veiculos); 
-- atv M
SELECT modelo, valor from Veiculos where valor=
(SELECT max(valor) from Veiculos);
-- atv N
SELECT modelo, valor from Veiculos where valor <
(SELECT avg(valor) from Veiculos);
-- atv O
SELECT sum(valor) as valor_total from Veiculos; 
-- atv P
SELECT sum(valor) as valor_total_vendido from Veiculos where 
id_veiculo in (SELECT fk_id_veiculo from Vendas);