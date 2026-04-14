create database clinica_medica; #comando cria a base de dados clinica_medica
use clinica_medica; #comando seleciona nossa base de dados

create table pacientes #comando para abrir a criação da tabela pacientes
(
id_paciente INT PRIMARY KEY AUTO_INCREMENT, 
nome varchar (40) not null, 
cpf_paciente varchar (11) not null unique, 
rg_paciente varchar(11) not null unique,
data_nascimento date not null,
telefone varchar(12) not null,
email varchar(100) not null unique
); 


create table medicos #comando para abrir a criação da tabela medicos
(
id_medico int primary key auto_increment,
nome varchar(100) not null,
crm varchar(13) not null unique,
cpf_medico varchar(14) not null unique,
telefone varchar(9) not null,
email_medico varchar(100) not null,
salario decimal(9) not null
); 

create table especialidades #comando que abre a criação da tabela especialidades
(
id_especialidade int primary key auto_increment,
nome_especialidade varchar(100) not null
); 

create table medico_especialidades #tabela que cria um relacionamento MUITOS PARA MUITOS entre as tabelas medicos e especialidades. 
(
    id_medico int,
    id_especialidade int,
    primary key (id_medico, id_especialidade),
    foreign key (id_medico) references medicos(id_medico),
    foreign key (id_especialidade) references especialidades(id_especialidade)
);

create table consultas #comando que abre a criação da tabela consultas
(
id_consulta int primary key auto_increment,
data_consulta date not null,
horario_consulta time not null,
valor decimal not null,
id_medico int not null,
foreign key (id_medico) references medicos (id_medico),
id_paciente int not null,
foreign key (id_paciente) references pacientes (id_paciente),
status_consulta varchar(17) default "Consulta Agendada"
);


create table receitas #comando que abre a criação da tabela receitas
(
id_receita int primary key auto_increment,
medicamento varchar(100),
qtd_medicamento varchar(300),
descricao_uso varchar(200),
id_consulta int,
foreign key (id_consulta) references consultas (id_consulta)
);

create table exames #comando que abre a criação da tabela exames
(
id_exame int primary key auto_increment,
data_exame date not null,
horario_exame time not null,
id_paciente int not null,
foreign key (id_paciente) references pacientes (id_paciente)
); 

# - inserindo dados na tabela pacientes - 
insert into pacientes(nome,cpf_paciente,rg_paciente,data_nascimento,telefone,email) values
("Arthur Frizzo Mattos Drey","08957898921","18297898312","2009-04-23","46991170721","arthurdrey10@gmail.com"),
("Arthur Filipe Schmitt","68943671892","90189784916","2009-10-17","468197898","arthurschmitt@gmail.com"),
("Eduardo Garcia gomes","75894781928","17845617281","2009-05-17","468197463","eduardogomes@gmail.com"),
("Erik Bryan Altenhofen","86718456789","18757869403","2009-12-10","468197354","erikbryan@gmail.com"),
("Gandolf Vieira Santos","85768982712","88855647281","1999-12-12","468197182","gandolfobrabo@gmail.com"),
('João Silva', '12345678901', '1234567', '1990-05-10', '46999990', 'joao.silva@email.com'),
('Maria Oliveira', '23456789012', '2345678', '1985-08-22', '46999990', 'maria.oliveira@email.com'),
('Carlos Souza', '34567890123', '3456789', '2000-01-15', '46999990', 'carlos.souza@email.com'),
('Ana Pereira', '45678901234', '4567890', '1995-12-03', '46999990', 'ana.pereira@email.com');

# - Inserindo dados na tabela medicos -
insert into medicos(nome,crm,cpf_medico,telefone,email_medico,salario) values
('Carlos Silva', 'CRM12345', '123.456.789-01', '46999112', 'carlos.silva@email.com', 12000.00),
('Mariana Souza', 'CRM23456', '234.567.890-12', '46999223', 'mariana.souza@email.com', 13500.00),
('João Pereira', 'CRM34567', '345.678.901-23', '46999334', 'joao.pereira@email.com', 11000.00),
('Fernanda Lima', 'CRM45678', '456.789.012-34', '46999445', 'fernanda.lima@email.com', 14000.00),
('Ricardo Alves', 'CRM56789', '567.890.123-45', '46999556', 'ricardo.alves@email.com', 12500.00),
('Juliana Rocha', 'CRM67890', '678.901.234-56', '46999667', 'juliana.rocha@email.com', 15000.00),
('Paulo Mendes', 'CRM78901', '789.012.345-67', '46999778', 'paulo.mendes@email.com', 11800.00),
('Aline Costa', 'CRM89012', '890.123.456-78', '46999889', 'aline.costa@email.com', 13200.00),
('Bruno Martins', 'CRM90123', '901.234.567-89', '46999990', 'bruno.martins@email.com', 12800.00);

# - Inserindo dados na tabela especialidades, como o atributo id_especialidade é auto_increment, cada insert vai ter o ID automatico
insert into especialidades(nome_especialidade) values
('Cardiologia'),
('Dermatologia'),
('Neurologia'),
('Ortopedia');

# - Inserindo os dados na tabela medico_especialidades para relacionamento muitos para muitos 
insert into medico_especialidades(id_medico, id_especialidade) values
(1,1), 
(1,3), 
(2,2),
(3,4),
(4,1),
(4,3),
(5,2),
(5,4),
(6,1),
(6,2),
(6,3),
(7,4),
(8,1);

# - Inserindo os dados na tabela consultas, relacionando medicos e pacientes as consultas tambem. 
insert into consultas(data_consulta,horario_consulta,valor,id_medico,id_paciente) values
("2026-04-23","14:00:00",200.00,1,8),
("2026-10-24","14:00:00",250.00,1,8),
("2026-10-11","13:30:00",350.00,1,1),
("2026-11-12","15:00:00",150.00,2,2),
("2026-09-03","17:00:00",200.00,3,3),
("2026-04-12","18:00:00",350.00,4,4),
("2026-02-05","19:00:00",400.00,5,5),
("2026-01-17","20:00:00",370.00,6,6),
("2026-05-18","16:30:00",150.00,7,7),
("2026-06-30","17:00:00",200.00,8,8); 

# - Inserindo os dados na tabela receitas, relacionando as consultas junto
insert into receitas(medicamento,qtd_medicamento,descricao_uso,id_consulta) values
("Ibuprofeno","10 comprimidos","1 Comprimido a cada 12 horas",1),
("Dipirona","12 comprimidos","1 Comprimido a cada 8 horas",2),
("Allegra D","12 comprimidos","1 Comprimido a cada 12 horas",3), 
("Novalgina","10 comprimidos","1 Comprimido a cada 10 horas",4),
("Allegra D","10 comprimidos","1 Comprimido a cada 12 horas",5),
("Enalapril","8 comprimidos","1 Comprimido a cada 24 horas",6),
("Paracetamol","12 comprimidos","1 Comprimido a cada 12 horas",7),
("Losartana","12 comprimidos","1 Comprimido a cada 24 horas",8),
("Paracetamol","12 comprimidos","1 Comprimido a cada 12 horas",9),
("Anlodipina","8 comprimidos","1 comprimido a cada 24 horas",10);

# - Inserindo os dados na tabela exames, relacionando os pacientes junto
insert into exames(data_exame,horario_exame,id_paciente) values
("2026-10-12","14:00:00",1),
("2026-11-12","13:00:00",2),
("2026-01-06","17:00:00",3),
("2026-03-01","18:00:00",4),
("2026-05-17","12:30:00",5),
("2026-12-12","16:00:00",6),
("2026-02-18","14:30:00",7),
("2026-06-14","19:00:00",8),
("2026-07-16","15:15:00",9); 


# - Consultas DQL
-- Seleciona nome, CPF e RG de todos os pacientes
select nome, cpf_paciente, rg_paciente from pacientes;

-- Seleciona todos os dados da tabela pacientes
select * from pacientes;

-- Seleciona nome e CRM de todos os médicos
select nome, crm from medicos;

-- Mostra nomes sem repetição
select distinct nome from medicos;

-- Mostra nome e salário com aumento de 10%
select nome, salario*1.10 from medicos;

-- Mostra nome e metade do salário
select nome, salario/2 from medicos;

-- Filtra médicos com salário igual a 15000
select nome, salario from medicos where salario = 15000.00;

-- Busca paciente pelo nome específico
select nome, data_nascimento from pacientes where nome = 'Arthur Frizzo Mattos Drey';

-- Filtra médicos com salário maior que 10000
select nome, salario from medicos where salario > 10000.00;

-- Filtra médicos com salário entre 10000 e 15000
select nome, salario from medicos where salario > 10000.00 and salario < 15000.00;

-- Filtra pacientes nascidos entre duas datas
select nome, data_nascimento from paciente where data_nascimento > '2015-01-01' and data_nascimento < '2025-01-01';

-- Filtra médicos com salário alto OU pacientes nascidos após 1980 
select nome, salario from medicos where salario >= 10000.00 or data_nascimento > '1980-01-01';

-- Mostra consultas que NÃO são de uma data específica
select data_consulta, horario_consulta from consultas where not data_consulta = '2026-10-01';

-- Filtra receitas com medicamento específico
select medicamento, qtd_medicamento from receitas where medicamento = 'Dipirona';

-- Filtra médicos com salário fora do intervalo 13000 a 15000
select nome, salario from medicos where salario not between 13000.00 and 15000.00;

-- Ordena médicos por nome (a-z)
select nome, salario from medicos where salario > 10000.00 order by nome asc;

-- Ordena médicos por salário (maior para menor)
select nome, salario from medicos where salario > 12000.00 order by salario desc;














