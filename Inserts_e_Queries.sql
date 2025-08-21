-- Inserts e Queries

-- Clientes
INSERT INTO Cliente (nome, endereco, telefone, email) VALUES
('João Silva', 'Rua A, 123', '11999999666', 'joao@email.com'),
('Amanda Cabral', 'Rua C, 156', '11999999888', 'amanda@email.com'),
('Flavio Oliveira', 'Rua E, 78', '11999999555', 'flavio@email.com'),
('Rodrigo Silva', 'Rua H, 236', '11999999444', 'rodrigo@email.com'),
('Maria Souza', 'Av. B, 77', '21988888888', 'maria@email.com');

-- Veículos
INSERT INTO Veiculo (placa, modelo, ano, cor, idCliente) VALUES
('ABC1234', 'Gol', 2015, 'Preto', 1),
('EFC1234', 'Audi', 2018, 'Azul', 3),
('ZWC1234', 'Gol', 2014, 'Braco', 5),
('RGC1234', 'Ferrari', 2019, 'Amarelo', 4),
('XYZ9876', 'Civic', 2020, 'Branco', 2);

-- Mecânicos
INSERT INTO Mecanico (codigo, nome, endereco, especialidade) VALUES
('M001', 'Carlos', 'Rua C, 789', 'Motor'),
('M005', 'Thiago', 'Rua G, 569', 'Motor'),
('M007', 'Sergio', 'Rua T, 439', 'Motor'),
('M006', 'Artur', 'Rua C, 129', 'Motor'),
('M002', 'Fernanda', 'Rua D, 321', 'Suspensão');

-- Equipes
INSERT INTO Equipe (nome_equipe) VALUES
('Equipe Alfa'),
('Equipe Beta');

-- Relação Equipe-Mecânico
INSERT INTO Equipe_Mecanico (idMecanico, idEquipe) VALUES
(1,1), (2,1), (2,2);

-- Ordens de Serviço
INSERT INTO Ordem_de_Servico (numero_os, data_emissao, data_entrega, valor_total, status, idVeiculo, idEquipe) VALUES
('OS001', '2025-08-01 10:00:00', '2025-08-03 18:00:00', 1500, 'Fechado', 1, 1),
('OS002', '2025-08-05 14:00:00', NULL, NULL, 'Aberto', 2, 2);

-- Peças
INSERT INTO Peca (descricao, valor) VALUES
('Pneu', 300),
('Parabrisa', 800),
('Freio', 500),
('Pneu', 300),
('Bateria', 450);

-- Relação OS-Peça
INSERT INTO OS_Peca (idOrdem, idPeca, quantidade) VALUES
(1,1,4), (1,2,1);

-- Serviços
INSERT INTO Servico (descricao, valor) VALUES
('Troca de óleo', 120),
('Alinhamento', 200);

-- Relação OS-Serviço
INSERT INTO OS_Servico (idOrdem, idServico, quantidade) VALUES
(1,1,1), (1,2,1), (2,1,1);


-- Consultas SQL 

-- Quais veículos pertencem a cada cliente?
SELECT c.nome, v.modelo, v.placa, v.ano
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente;

-- Quais serviços foram realizados em cada ordem de serviço?
SELECT o.numero_os, s.descricao, os.quantidade
FROM Ordem_de_Servico o
JOIN OS_Servico os ON o.idOrdem = os.idOrdem
JOIN Servico s ON os.idServico = s.idServico;

-- Quais peças foram utilizadas em cada ordem de serviço?
SELECT o.numero_os, p.descricao, op.quantidade
FROM Ordem_de_Servico o
JOIN OS_Peca op ON o.idOrdem = op.idOrdem
JOIN Peca p ON op.idPeca = p.idPeca;

-- Qual o valor total de cada ordem de serviço (peças + serviços)?
SELECT o.numero_os,
       SUM(p.valor * op.quantidade) + SUM(s.valor * os.quantidade) AS valor_total
FROM Ordem_de_Servico o
LEFT JOIN OS_Peca op ON o.idOrdem = op.idOrdem
LEFT JOIN Peca p ON op.idPeca = p.idPeca
LEFT JOIN OS_Servico os ON o.idOrdem = os.idOrdem
LEFT JOIN Servico s ON os.idServico = s.idServico
GROUP BY o.numero_os;

-- Quais mecânicos fazem parte de cada equipe?
SELECT e.nome_equipe, m.nome AS mecanico, m.especialidade
FROM Equipe e
JOIN Equipe_Mecanico em ON e.idEquipe = em.idEquipe
JOIN Mecanico m ON em.idMecanico = m.idMecanico;






