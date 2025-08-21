-- Database Oficina Mecânica

CREATE DATABASE Oficina;
USE Oficina;

-- Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(45),
    telefone VARCHAR(15),
    email VARCHAR(45) UNIQUE
);

-- Veículo
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(20) NOT NULL UNIQUE,
    modelo VARCHAR(45) NOT NULL,
    ano INT,
    cor VARCHAR(15),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Mecânico
CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(20) NOT NULL,
    endereco VARCHAR(45),
    especialidade VARCHAR(45)
);

-- Equipe
CREATE TABLE Equipe (
    idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    nome_equipe VARCHAR(20) NOT NULL
);

-- Relação Equipe-Mecânico 
CREATE TABLE Equipe_Mecanico (
    idMecanico INT,
    idEquipe INT,
    PRIMARY KEY (idMecanico, idEquipe),
    FOREIGN KEY (idMecanico) REFERENCES Mecanico(idMecanico),
    FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Ordem de Serviço
CREATE TABLE Ordem_de_Servico (
    idOrdem INT PRIMARY KEY AUTO_INCREMENT,
    numero_os VARCHAR(15) NOT NULL UNIQUE,
    data_emissao DATETIME NOT NULL,
    data_entrega DATETIME,
    valor_total FLOAT,
    status VARCHAR(10) NOT NULL DEFAULT 'Aberto',
    idVeiculo INT,
    idEquipe INT,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Peça
CREATE TABLE Peca (
    idPeca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Relação OS-Peça 
CREATE TABLE OS_Peca (
    idOrdem INT,
    idPeca INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idOrdem, idPeca),
    FOREIGN KEY (idOrdem) REFERENCES Ordem_de_Servico(idOrdem),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);

-- Serviço
CREATE TABLE Servico (
    idServico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    valor FLOAT NOT NULL
);

-- Relação OS-Serviço 
CREATE TABLE OS_Servico (
    idOrdem INT,
    idServico INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idOrdem, idServico),
    FOREIGN KEY (idOrdem) REFERENCES Ordem_de_Servico(idOrdem),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);
