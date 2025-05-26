
# C3 : Normalização

## Relações
GUITARRA(n_serie PK, modelo, tipo, cor, acabamento, ano, preco)

CLIENTE(id_cliente PK, nome, email, NIF, morada)

VENDA(id_venda PK, data, valor, metodo_pagamento, id_cliente FK, id_utilizador FK)

UTILIZADOR(id_utilizador PK, nome, username UNIQUE, tipo_perfil)

STOCK(id_stock PK, modelo, quantidade, id_utilizador FK)

VENDA_GUITARRA(id_venda FK, n_serie FK, PRIMARY KEY(id_venda, n_serie))


## Normalização do Esquema Relacional
Todas as relações encontram-se na 3FN.

- Atributos atómicos (1FN verificada).
- Não existem dependências parciais (2FN).
- Não há dependências transitivas (3FN).

---
[< Previous](rebd02.md) | [^ Inicio](/../../) | [Next >](rebd04.md)
:--- | :---: | ---: 
