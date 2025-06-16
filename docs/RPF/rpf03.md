# C3 : Normalização

## Relações

* GUITARRA(id PK, modelo, tipo, cor, acabamento, ano, preco, vendaId FK)

* CLIENTE(id PK, nome, email, NIF, morada)

* VENDA(id PK, data, valor, metodo_pagamento, clienteId FK, utilizadorId FK)

* UTILIZADOR(id PK, nome, username UNIQUE, tipo_perfil)

* STOCK(id PK, modelo, quantidade, utilizadorId FK)

---

## Normalização do Esquema Relacional

Todas as relações apresentadas encontram-se na **Terceira Forma Normal (3FN)**, respeitando os princípios fundamentais de integridade e não redundância.

### 1ª Forma Normal (1FN)

* Todos os atributos são atómicos.
* Não existem grupos repetitivos ou listas dentro de atributos.

### 2ª Forma Normal (2FN)

* Todas as relações têm chave primária simples.
* Todos os atributos dependem funcionalmente da chave primária inteira e não de parte dela (não existem dependências parciais).

### 3ª Forma Normal (3FN)

* Não existem **dependências transitivas**: todos os atributos não-chave dependem **diretamente da chave primária**.
---

| [< Previous](rpf02.md) | [^ Início](rpf00.md) | [Next >](rpf04.md) |
| :---------------------- | :-------------------: | ------------------: |
