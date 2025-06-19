# C6 : API

---

## Escolhas de Implementação

- Datas e horas definidas como `string` com a finalidade de evitar problemas de compatibilidade **baseado em indicação direta do professor**.

- `@belongsTo` e `@hasOne` usados para modelar relações foco em manter estrutura coerente e simples para testes e manutenção.

## SQL Migrate

| original | migrate |
|-------|-------|
| <img src="../img/sql_print.png" alt="" width="550" /> | <img src="../img/migrate_print.png" alt="" width="550" /> |

**Comparação entre CREATE TABLE do MySQL e o CREATE TABLE do SQL Loopback**

- Pela falta de especificação de tamanho de domínios o LoopBack converteu para VARCHAR(512) todos os strings.

---

| [< Previous](rpf05.md) | [^ Início](rpf00.md) | [Next >](rpf07.md) |
| :---------------------- | :-------------------: | ------------------: |
