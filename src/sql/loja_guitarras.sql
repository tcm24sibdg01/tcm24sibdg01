CREATE DATABASE IF NOT EXISTS loja_guitarras;
USE `loja_guitarras`;

-- Apagar tabelas se existirem (na ordem correta para evitar conflitos de FK)
DROP TABLE IF EXISTS GUITARRA;
DROP TABLE IF EXISTS STOCK;
DROP TABLE IF EXISTS VENDA;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS UTILIZADOR;

-- Tabela UTILIZADOR
CREATE TABLE IF NOT EXISTS UTILIZADOR (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  username VARCHAR(30) NOT NULL UNIQUE,
  tipo_perfil VARCHAR(20) NOT NULL DEFAULT 'normal'
);

-- Tabela CLIENTE
CREATE TABLE IF NOT EXISTS CLIENTE (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  NIF CHAR(9) NOT NULL UNIQUE,
  morada TEXT
);

-- Tabela VENDA
CREATE TABLE IF NOT EXISTS VENDA (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  data DATE NOT NULL DEFAULT (CURRENT_DATE),
  valor DECIMAL(8,2) NOT NULL,
  metodo_pagamento VARCHAR(30) NOT NULL DEFAULT 'dinheiro',
  clienteId BIGINT NOT NULL,
  utilizadorId BIGINT NOT NULL,
  FOREIGN KEY (clienteId) REFERENCES CLIENTE(id),
  FOREIGN KEY (utilizadorId) REFERENCES UTILIZADOR(id)
);

-- Tabela GUITARRA
CREATE TABLE IF NOT EXISTS GUITARRA (
  id INT AUTO_INCREMENT PRIMARY KEY,
  modelo VARCHAR(50) NOT NULL,
  tipo VARCHAR(30),
  cor VARCHAR(30),
  acabamento VARCHAR(30),
  ano SMALLINT,
  preco DECIMAL(8,2) NOT NULL,
  vendaId BIGINT,
  FOREIGN KEY (vendaId) REFERENCES VENDA(id)
);

-- Tabela STOCK
CREATE TABLE IF NOT EXISTS STOCK (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  modelo VARCHAR(50) NOT NULL,
  quantidade INT NOT NULL DEFAULT 0 CHECK (quantidade >= 0),
  utilizadorId BIGINT NOT NULL,
  FOREIGN KEY (utilizadorId) REFERENCES UTILIZADOR(id)
);

-- inserts utilizador

INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador1', 'user1', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador2', 'user2', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador3', 'user3', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador4', 'user4', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador5', 'user5', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador6', 'user6', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador7', 'user7', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador8', 'user8', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador9', 'user9', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil) 
VALUES ('Utilizador10', 'user10', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador11', 'user11', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador12', 'user12', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador13', 'user13', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador14', 'user14', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador15', 'user15', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador16', 'user16', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador17', 'user17', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador18', 'user18', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador19', 'user19', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador20', 'user20', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador21', 'user21', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador22', 'user22', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador23', 'user23', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador24', 'user24', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador25', 'user25', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil) 
VALUES ('Utilizador26', 'user26', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador27', 'user27', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador28', 'user28', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador29', 'user29', 'normal');
INSERT INTO UTILIZADOR (nome, username, tipo_perfil)
VALUES ('Utilizador30', 'user30', 'normal');

-- inserts cliente

INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente1', 'mail1@mail.com', '100000001', 'Rua 1');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente2', 'mail2@mail.com', '100000002', 'Rua 2');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente3', 'mail3@mail.com', '100000003', 'Rua 3');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente4', 'mail4@mail.com', '100000004', 'Rua 4');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente5', 'mail5@mail.com', '100000005', 'Rua 5');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente6', 'mail6@mail.com', '100000006', 'Rua 6');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente7', 'mail7@mail.com', '100000007', 'Rua 7');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente8', 'mail8@mail.com', '100000008', 'Rua 8');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente9', 'mail9@mail.com', '100000009', 'Rua 9');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente10', 'mail10@mail.com', '100000000', 'Rua 10');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente11', 'mail11@mail.com', '100000011', 'Rua 11');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente12', 'mail12@mail.com', '100000012', 'Rua 12');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente13', 'mail13@mail.com', '100000013', 'Rua 13');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente14', 'mail14@mail.com', '100000014', 'Rua 14');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente15', 'mail15@mail.com', '100000015', 'Rua 15');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente16', 'mail16@mail.com', '100000016', 'Rua 16');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente17', 'mail17@mail.com', '100000017', 'Rua 17');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente18', 'mail18@mail.com', '100000018', 'Rua 18');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente19', 'mail19@mail.com', '100000019', 'Rua 19');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente20', 'mail20@mail.com', '100000020', 'Rua 20');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente21', 'mail21@mail.com', '100000021', 'Rua 21');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente22', 'mail22@mail.com', '100000022', 'Rua 22');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente23', 'mail23@mail.com', '100000023', 'Rua 23');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente24', 'mail24@mail.com', '100000024', 'Rua 24');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente25', 'mail25@mail.com', '100000025', 'Rua 25');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente26', 'mail26@mail.com', '100000026', 'Rua 26');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente27', 'mail27@mail.com', '100000027', 'Rua 27');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente28', 'mail28@mail.com', '100000028', 'Rua 28');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente29', 'mail29@mail.com', '100000029', 'Rua 29');
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('Cliente30', 'mail30@mail.com', '100000030', 'Rua 30');

-- inserts venda

INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-02', 510, 'dinheiro', 1, 1);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-03', 520, 'dinheiro', 2, 2);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-04', 530, 'dinheiro', 3, 3);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-05', 540, 'dinheiro', 4, 4);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-06', 550, 'dinheiro', 5, 5);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-07', 560, 'dinheiro', 6, 6);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-08', 570, 'dinheiro', 7, 7);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-09', 580, 'dinheiro', 8, 8);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-10', 590, 'dinheiro', 9, 9);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-11', 600, 'dinheiro', 10, 10);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-12', 610, 'dinheiro', 11, 11);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-13', 620, 'dinheiro', 12, 12);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-14', 630, 'dinheiro', 13, 13);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-15', 640, 'dinheiro', 14, 14);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-16', 650, 'dinheiro', 15, 15);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-17', 660, 'dinheiro', 16, 16);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-18', 670, 'dinheiro', 17, 17);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-19', 680, 'dinheiro', 18, 18);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-20', 690, 'dinheiro', 19, 19);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-21', 700, 'dinheiro', 20, 20);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-22', 710, 'dinheiro', 21, 21);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-23', 720, 'dinheiro', 22, 22);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-24', 730, 'dinheiro', 23, 23);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-25', 740, 'dinheiro', 24, 24);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-26', 750, 'dinheiro', 25, 25);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-27', 760, 'dinheiro', 26, 26);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-28', 770, 'dinheiro', 27, 27);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-01', 780, 'dinheiro', 28, 28);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-02', 790, 'dinheiro', 29, 29);
INSERT INTO VENDA (data, valor, metodo_pagamento, clienteId, utilizadorId)
VALUES ('2024-06-03', 800, 'dinheiro', 30, 30);

-- inserts guitarra

INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo1', 'tipo1', 'cor1', 'acabamento1', 2000, 405, 1);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo2', 'tipo2', 'cor2', 'acabamento2', 2000, 410, 2);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo3', 'tipo3', 'cor3', 'acabamento3', 2000, 415, 3);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo4', 'tipo4', 'cor4', 'acabamento4', 2000, 420, 4);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo5', 'tipo5', 'cor5', 'acabamento5', 2000, 425, 5);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo6', 'tipo6', 'cor6', 'acabamento6', 2000, 430, 6);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo7', 'tipo7', 'cor7', 'acabamento7', 2000, 435, 7);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo8', 'tipo8', 'cor8', 'acabamento8', 2000, 440, 8);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo9', 'tipo9', 'cor9', 'acabamento9', 2000, 445, 9);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo10', 'tipo10', 'cor10', 'acabamento10', 2000, 450, 10);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo11', 'tipo11', 'cor11', 'acabamento11', 2000, 455, 11);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo12', 'tipo12', 'cor12', 'acabamento12', 2000, 460, 12);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo13', 'tipo13', 'cor13', 'acabamento13', 2000, 465, 13);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo14', 'tipo14', 'cor14', 'acabamento14', 2000, 470, 14);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo15', 'tipo15', 'cor15', 'acabamento15', 2000, 475, 15);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo16', 'tipo16', 'cor16', 'acabamento16', 2000, 480, 16);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo17', 'tipo17', 'cor17', 'acabamento17', 2000, 485, 17);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo18', 'tipo18', 'cor18', 'acabamento18', 2000, 490, 18);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo19', 'tipo19', 'cor19', 'acabamento19', 2000, 495, 19);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo20', 'tipo20', 'cor20', 'acabamento20', 2000, 500, 20);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo21', 'tipo21', 'cor21', 'acabamento21', 2000, 505, 21);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo22', 'tipo22', 'cor22', 'acabamento22', 2000, 510, 22);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo23', 'tipo23', 'cor23', 'acabamento23', 2000, 515, 23);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo24', 'tipo24', 'cor24', 'acabamento24', 2000, 520, 24);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo25', 'tipo25', 'cor25', 'acabamento25', 2000, 525, 25);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo26', 'tipo26', 'cor26', 'acabamento26', 2000, 530, 26);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo27', 'tipo27', 'cor27', 'acabamento27', 2000, 535, 27);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo28', 'tipo28', 'cor28', 'acabamento28', 2000, 540, 28);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo29', 'tipo29', 'cor29', 'acabamento29', 2000, 545, 29);
INSERT INTO GUITARRA (modelo, tipo, cor, acabamento, ano, preco, vendaId)
VALUES ('Modelo30', 'tipo30', 'cor30', 'acabamento30', 2000, 550, 30);

-- inserts stock

INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo1', 1, 1);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo2', 2, 2);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo3', 3, 3);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo4', 4, 4);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo5', 5, 5);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo6', 6, 6);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo7', 7, 7);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo8', 8, 8);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo9', 9, 9);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo10', 0, 10);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo11', 1, 11);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo12', 2, 12);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo13', 3, 13);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo14', 4, 14);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo15', 5, 15);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo16', 6, 16);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo17', 7, 17);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo18', 8, 18);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo19', 9, 19);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo20', 0, 20);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo21', 1, 21);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo22', 2, 22);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo23', 3, 23);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo24', 4, 24);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo25', 5, 25);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo26', 6, 26);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo27', 7, 27);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo28', 8, 28);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo29', 9, 29);
INSERT INTO STOCK (modelo, quantidade, utilizadorId)
VALUES ('Modelo30', 0, 30);

-- VIEW

CREATE VIEW vw_stock_baixo AS
SELECT modelo, quantidade
FROM STOCK
WHERE quantidade < 5;
