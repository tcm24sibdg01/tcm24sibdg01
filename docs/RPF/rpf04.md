# C4 : Esquema Relacional

* [Relações](#relações)

  * [GUITARRA](#guitarra)
  * [CLIENTE](#cliente)
  * [UTILIZADOR](#utilizador)
  * [VENDA](#venda)
  * [STOCK](#stock)
* [Vistas](#vistas)

## Relações

---

### GUITARRA

* DESCRIÇÃO

Registo individual de cada guitarra disponível, com identificação única (`id`) correspondente ao número de série.

* COLUNAS

| Nome       | Descrição                      | Domínio      | por Omissão | Automático | Nulo |
| ---------- | ------------------------------ | ------------ | ----------- | ---------- | ---- |
| id         | Identificador único (nº série) | VARCHAR(30)  | -           | Não        | Não  |
| modelo     | Nome do modelo                 | VARCHAR(50)  | -           | Não        | Não  |
| tipo       | Tipo do corpo                  | VARCHAR(30)  | -           | Não        | Sim  |
| cor        | Cor da guitarra                | VARCHAR(30)  | -           | Não        | Sim  |
| acabamento | Tipo de acabamento             | VARCHAR(30)  | -           | Não        | Sim  |
| ano        | Ano de fabrico                 | SMALLINT     | -           | Não        | Sim  |
| preco      | Preço                          | DECIMAL(8,2) | -           | Não        | Não  |
| vendaId    | Venda associada (se aplicável) | BIGINT       | NULL        | Não        | Sim  |

#### RESTRIÇÕES DE INTEGRIDADE

* **Chave Primária**: `id`
* **Referencial**:

  * `vendaId` → `VENDA(id)`

* **Check (opcional)**:

  * `ano > 1950`, `preco >= 0`

---

### CLIENTE

* DESCRIÇÃO

Registo dos clientes que realizam compras na loja.

* COLUNAS

| Nome   | Descrição              | Domínio      | por Omissão | Automático | Nulo |
| ------ | ---------------------- | ------------ | ----------- | ---------- | ---- |
| id     | ID do cliente          | BIGINT       | -           | Sim        | Não  |
| nome   | Nome completo          | VARCHAR(60)  | -           | Não        | Não  |
| email  | Email                  | VARCHAR(100) | -           | Não        | Não  |
| NIF    | Número de contribuinte | CHAR(9)      | -           | Não        | Não  |
| morada | Morada completa        | TEXT         | -           | Não        | Sim  |

#### RESTRIÇÕES DE INTEGRIDADE

* **Chave Primária**: `id`
* **Unicidade**:

  * `NIF` (nif\_uk)

---

### UTILIZADOR

* DESCRIÇÃO

Funcionários ou responsáveis que interagem com o sistema.

* COLUNAS

| Nome         | Descrição          | Domínio     | por Omissão | Automático | Nulo |
| ------------ | ------------------ | ----------- | ----------- | ---------- | ---- |
| id           | ID do utilizador   | BIGINT      | -           | Sim        | Não  |
| nome         | Nome completo      | VARCHAR(60) | -           | Não        | Não  |
| username     | Nome de utilizador | VARCHAR(30) | -           | Não        | Não  |
| tipo\_perfil | Tipo de perfil     | VARCHAR(20) | 'normal'    | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE

* **Chave Primária**: `id`
* **Unicidade**:

  * `username` (username\_uk)

---

### VENDA

* DESCRIÇÃO

Registo de uma transação de venda.

* COLUNAS

| Nome              | Descrição                 | Domínio      | por Omissão   | Automático | Nulo |
| ----------------- | ------------------------- | ------------ | ------------- | ---------- | ---- |
| id                | ID da venda               | BIGINT       | -             | Sim        | Não  |
| data              | Data da venda             | DATE         | current\_date | Não        | Não  |
| valor             | Valor total da venda      | DECIMAL(8,2) | -             | Não        | Não  |
| metodo\_pagamento | Método de pagamento usado | VARCHAR(30)  | 'dinheiro'    | Não        | Não  |
| clienteId         | Cliente associado         | BIGINT       | -             | Não        | Não  |
| utilizadorId      | Funcionário responsável   | BIGINT       | -             | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE

* **Chave Primária**: `id`
* **Referencial**:

  * `clienteId` → `CLIENTE(id)`
  * `utilizadorId` → `UTILIZADOR(id)`

---

### STOCK

* DESCRIÇÃO

Gestão da quantidade disponível por modelo de guitarra.

* COLUNAS

| Nome         | Descrição               | Domínio     | por Omissão | Automático | Nulo |
| ------------ | ----------------------- | ----------- | ----------- | ---------- | ---- |
| id           | ID do registo de stock  | BIGINT      | -           | Sim        | Não  |
| modelo       | Modelo de guitarra      | VARCHAR(50) | -           | Não        | Não  |
| quantidade   | Quantidade disponível   | INTEGER     | 0           | Não        | Não  |
| utilizadorId | Funcionário responsável | BIGINT      | -           | Não        | Não  |

#### RESTRIÇÕES DE INTEGRIDADE

* **Chave Primária**: `id`
* **Referencial**:

  * `utilizadorId` → `UTILIZADOR(id)`

* **Check**:

  * `quantidade >= 0`

---

## Vistas

### `vw_stock_baixo`

Mostra guitarras com stock inferior a 5 unidades.

```sql
CREATE VIEW vw_stock_baixo AS
SELECT modelo, quantidade
FROM STOCK
WHERE quantidade < 5;
```

---

| [< Previous](rpf03.md) | [^ Início](rpf00.md) | [Next >](rpf05.md) |
| :---------------------- | :-------------------: | ------------------: |
