
## C3: Esquema Conceptual

### Entidades Principais

- **Guitarra**: nº de série, modelo, tipo, cor, acabamento, ano, preço.
- **Cliente**: ID, nome, email, NIF, morada.
- **Venda**: ID, data, valor, método de pagamento.
- **Utilizador**: ID, nome, username, tipo de perfil.
- **Stock**: ID, modelo, quantidade.

### Associações

- **Compra**: Cliente ↔ Venda.
- **Inclui**: Venda ↔ Guitarra.
- **Gerido por**: Venda ↔ Utilizador.
- **Inventariado por**: Stock ↔ Utilizador.

### Regras de Negócio

- Cada guitarra tem número de série único.
- Vendas só podem ocorrer se houver stock disponível.
- Cada venda deve estar associada a um cliente.
- Usernames devem ser únicos.
- Utilizadores não autorizados não podem alterar stock ou vendas.
- Vendas não são eliminadas, apenas canceladas.
- Stock não pode ser negativo.

| [< Previous](rei02.md) | [^ Inicio](../../README.md)
|:----------------------------------:|:----------------------------------:|