# C5 : SQL

## DDL

```sql
USE `loja_guitarras`;

-- Apagar tabelas se existirem
DROP TABLE IF EXISTS VENDA_GUITARRA;
DROP TABLE IF EXISTS STOCK;
DROP TABLE IF EXISTS VENDA;
DROP TABLE IF EXISTS GUITARRA;
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

-- Tabela GUITARRA
CREATE TABLE IF NOT EXISTS GUITARRA (
  n_serie VARCHAR(30) PRIMARY KEY,
  modelo VARCHAR(50) NOT NULL,
  tipo VARCHAR(30),
  cor VARCHAR(30),
  acabamento VARCHAR(30),
  ano SMALLINT,
  preco DECIMAL(8,2) NOT NULL
);

-- Tabela VENDA
CREATE TABLE IF NOT EXISTS VENDA (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  data DATE NOT NULL DEFAULT CURRENT_DATE,
  valor DECIMAL(8,2) NOT NULL,
  metodo_pagamento VARCHAR(30) NOT NULL DEFAULT 'dinheiro',
  id_cliente BIGINT NOT NULL,
  id_utilizador BIGINT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id),
  FOREIGN KEY (id_utilizador) REFERENCES UTILIZADOR(id)
);

-- Tabela STOCK
CREATE TABLE IF NOT EXISTS STOCK (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  modelo VARCHAR(50) NOT NULL,
  quantidade INT NOT NULL DEFAULT 0 CHECK (quantidade >= 0),
  id_utilizador BIGINT NOT NULL,
  FOREIGN KEY (id_utilizador) REFERENCES UTILIZADOR(id)
);

-- Tabela VENDA_GUITARRA
CREATE TABLE IF NOT EXISTS VENDA_GUITARRA (
  id_venda BIGINT NOT NULL,
  n_serie VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_venda, n_serie),
  FOREIGN KEY (id_venda) REFERENCES VENDA(id),
  FOREIGN KEY (n_serie) REFERENCES GUITARRA(n_serie)
);
```

## DML

### 1. Adicionar um cliente

```sql
INSERT INTO CLIENTE (nome, email, NIF, morada)
VALUES ('João Costa', 'joao.costa@email.com', '123456789', 'Rua das Guitarras, Porto');
```

**Requisito**: Registar um novo cliente no sistema.

---

### 2. Registar uma nova guitarra

```sql
INSERT INTO GUITARRA (n_serie, modelo, tipo, cor, acabamento, ano, preco)
VALUES ('SN12345678', 'Stratocaster', 'solid', 'sunburst', 'brilhante', 2022, 999.99);
```

**Requisito**: Adicionar uma nova guitarra ao catálogo da loja.

---

### 3. Registar stock de modelo

```sql
INSERT INTO STOCK (modelo, quantidade, id_utilizador)
VALUES ('Stratocaster', 5, 1);
```

**Requisito**: Indicar o stock disponível de determinado modelo.

---

### 4. Realizar uma venda

```sql
INSERT INTO VENDA (valor, metodo_pagamento, id_cliente, id_utilizador)
VALUES (999.99, 'MBWay', 1, 1);
```

**Requisito**: Registar uma venda associada a um cliente e utilizador.

---

### 5. Associar guitarras vendidas a uma venda

```sql
INSERT INTO VENDA_GUITARRA (id_venda, n_serie)
VALUES (1, 'SN12345678');
```

**Requisito**: Registar que uma guitarra foi vendida numa determinada venda.

---

### 6. Ver guitarras com stock inferior a 5

```sql
SELECT modelo, quantidade
FROM STOCK
WHERE quantidade < 5;
```

**Requisito**: Listar modelos com baixo stock.

---

### 7. Ver total vendido por funcionário

```sql
SELECT u.nome, SUM(v.valor) AS total_vendas
FROM UTILIZADOR u
JOIN VENDA v ON u.id = v.id_utilizador
GROUP BY u.id;
```

**Requisito**: Consultar as vendas realizadas por cada funcionário.

---

| [< Previous](rebd04.md) | [^ Main](/../../) |
| :---------------------- | :------------------------------------------------------: |
