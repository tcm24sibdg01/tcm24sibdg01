# C4 : Esquema Relacional  <!-- omit in toc -->

- [Relações](#relações)
  - [GUITARRA](#guitarra)
  - [CLIENTE](#cliente)
  - [UTILIZADOR](#utilizador)
  - [VENDA](#venda)
  - [STOCK](#stock)
  - [VENDA_GUITARRA](#venda_guitarra)
- [Vistas](#vistas)

## Relações

### GUITARRA

#### DESCRIÇÃO <!-- omit in toc -->
Registo individual de cada guitarra disponível, com identificação única por número de série.

#### COLUNAS <!-- omit in toc -->

| Nome        | Descrição                       | Domínio     | por Omissão | Automático | Nulo |
| :---------- | :------------------------------ | :---------- | :---------- | :--------- | :--- |
| n_serie     | Número de série da guitarra     | VARCHAR(30) | -           | Não        | Não  |
| modelo      | Nome do modelo                  | VARCHAR(50) | -           | Não        | Não  |
| tipo        | Tipo do corpo                   | VARCHAR(30) | -           | Não        | Sim  |
| cor         | Cor da guitarra                 | VARCHAR(30) | -           | Não        | Sim  |
| acabamento  | Tipo de acabamento              | VARCHAR(30) | -           | Não        | Sim  |
| ano         | Ano de fabrico                  | SMALLINT    | -           | Não        | Sim  |
| preco       | Preço                           | DECIMAL(8,2)| -           | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE <!-- omit in toc -->

- **Chave Primária**:

| Coluna(s) |
| --------- |
| n_serie   |

- **Unicidade** (valores únicos)*: _(Não aplicável)_

- **Referencial**: _(Não aplicável)_

- **Atributos (check)**: _(Opcional: ano > 1950, preco ≥ 0)_

- **Outros Indices***: _(Não aplicável)_

---

### CLIENTE

#### DESCRIÇÃO <!-- omit in toc -->
Registo dos clientes que realizam compras na loja.

#### COLUNAS <!-- omit in toc -->

| Nome     | Descrição            | Domínio       | por Omissão | Automático | Nulo |
| :------- | :------------------- | :------------ | :---------- | :--------- | :--- |
| id       | ID do cliente        | BIGINT        | -           | Sim        | Não  |
| nome     | Nome completo        | VARCHAR(60)   | -           | Não        | Não  |
| email    | Email                | VARCHAR(100)  | -           | Não        | Não  |
| NIF      | Número de contribuinte | CHAR(9)     | -           | Não        | Não  |
| morada   | Morada completa      | TEXT          | -           | Não        | Sim  |

#### RESTRIÇÕES DE INTEGRIDADE <!-- omit in toc -->

- **Chave Primária**:

| Coluna(s) |
| --------- |
| id        |

- **Unicidade**:

| Nome       | Coluna(s) | Indexar |
| ---------- | --------- | ------- |
| email_uk   | email      | Sim     |
| nif_uk     | NIF        | Sim     |

- **Referêncial**: _(Não aplicável)_

---

### UTILIZADOR

#### DESCRIÇÃO <!-- omit in toc -->
Funcionários ou responsáveis que interagem com o sistema (gestão de vendas e stock).

#### COLUNAS <!-- omit in toc -->

| Nome        | Descrição            | Domínio       | por Omissão | Automático | Nulo |
| :---------- | :------------------- | :------------ | :---------- | :--------- | :--- |
| id          | ID do utilizador     | BIGINT        | -           | Sim        | Não  |
| nome        | Nome completo        | VARCHAR(60)   | -           | Não        | Não  |
| username    | Nome de utilizador   | VARCHAR(30)   | -           | Não        | Não  |
| tipo_perfil | Tipo de acesso       | VARCHAR(20)   | 'normal'    | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE <!-- omit in toc -->

- **Chave Primária**:

| Coluna(s) |
| --------- |
| id        |

- **Unicidade**:

| Nome         | Coluna(s) | Indexar |
| ------------ | --------- | ------- |
| username_uk  | username  | Sim     |

---

### VENDA

#### DESCRIÇÃO <!-- omit in toc -->
Registo de uma transação de venda.

#### COLUNAS <!-- omit in toc -->

| Nome              | Descrição                     | Domínio      | por Omissão | Automático | Nulo |
| :---------------- | :---------------------------- | :----------- | :---------- | :--------- | :--- |
| id                | ID da venda                   | BIGINT       | -           | Sim        | Não  |
| data              | Data da venda                 | DATE         | now()       | Não        | Não  |
| valor             | Valor total                   | DECIMAL(8,2) | -           | Não        | Não  |
| metodo_pagamento  | Método de pagamento usado     | VARCHAR(30)  | 'dinheiro'  | Não        | Não  |
| id_cliente        | Cliente associado              | BIGINT       | -           | Não        | Não  |
| id_utilizador     | Funcionário responsável        | BIGINT       | -           | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE <!-- omit in toc -->

- **Chave Primária**:

| Coluna(s) |
| --------- |
| id        |

- **Referêncial**:

| Nome         | Coluna(s)     | Tabela referenciada | Coluna(s) referenciada(s) | Indexar |
| ------------ | ------------- | ------------------- | ------------------------- | ------- |
| fk_cliente   | id_cliente     | CLIENTE             | id                        | Sim     |
| fk_utilizador| id_utilizador  | UTILIZADOR          | id                        | Sim     |

---

### STOCK

#### DESCRIÇÃO <!-- omit in toc -->
Gestão da quantidade disponível por modelo.

#### COLUNAS <!-- omit in toc -->

| Nome         | Descrição                      | Domínio      | por Omissão | Automático | Nulo |
| :----------- | :----------------------------- | :----------- | :---------- | :--------- | :--- |
| id           | ID do registo de stock         | BIGINT       | -           | Sim        | Não  |
| modelo       | Modelo de guitarra             | VARCHAR(50)  | -           | Não        | Não  |
| quantidade   | Quantidade disponível          | INTEGER      | 0           | Não        | Não  |
| id_utilizador| Funcionário responsável        | BIGINT       | -           | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE <!-- omit in toc -->

- **Chave Primária**:

| Coluna(s) |
| --------- |
| id        |

- **Referêncial**:

| Nome         | Coluna(s)     | Tabela referenciada | Coluna(s) referenciada(s) | Indexar |
| ------------ | ------------- | ------------------- | ------------------------- | ------- |
| fk_userstock | id_utilizador | UTILIZADOR          | id                        | Sim     |

- **Atributos (check)**:

| Nome         | Coluna(s)   | condição     |
| ------------ | ----------- | ------------ |
| check_stock  | quantidade  | quantidade >= 0 |

---

### VENDA_GUITARRA

#### DESCRIÇÃO <!-- omit in toc -->
Tabela associativa que relaciona vendas com guitarras vendidas.

#### COLUNAS <!-- omit in toc -->

| Nome      | Descrição                      | Domínio     | por Omissão | Automático | Nulo |
| :-------- | :----------------------------- | :---------- | :---------- | :--------- | :--- |
| id_venda  | ID da venda                    | BIGINT      | -           | Não        | Não  |
| n_serie   | Número de série da guitarra    | VARCHAR(30) | -           | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE <!-- omit in toc -->

- **Chave Primária**:

| Coluna(s)        |
| ---------------- |
| id_venda, n_serie|

- **Referêncial**:

| Nome           | Coluna(s)  | Tabela referenciada | Coluna(s) referenciada(s) | Indexar |
| -------------- | ---------- | ------------------- | ------------------------- | ------- |
| fk_venda       | id_venda   | VENDA               | id                        | Sim     |
| fk_guitarra    | n_serie    | GUITARRA            | n_serie                   | Sim     |

---

## Vistas

Exemplo: `vw_stock_baixo` – mostra guitarras com quantidade inferior a 5 unidades.

```sql
CREATE VIEW vw_stock_baixo AS
SELECT modelo, quantidade
FROM STOCK
WHERE quantidade < 5;

[< Previous](rebd03.md) | [^ Inicio](/../../) | [Next >](rebd05.md)
:--- | :---: | ---: 
