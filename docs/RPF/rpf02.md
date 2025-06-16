# C2 : Esquema Conceptual

# Modelo Entidade–Associação (E/A)

## Entidades Principais

### **Guitarra**

* **Atributos**:

  * `id` (PK) — identificador único da guitarra (substitui o número de série)
  * `modelo`
  * `tipo`
  * `cor`
  * `acabamento`
  * `ano`
  * `preço`
  * `vendaId` (FK) — identifica a venda a que esta guitarra foi associada (se aplicável)

### **Cliente**

* **Atributos**:

  * `id` (PK)
  * `nome`
  * `email`
  * `NIF`
  * `morada`

### **Venda**

* **Atributos**:

  * `id` (PK)
  * `data`
  * `valor`
  * `método de pagamento`
  * `clienteId` (FK)
  * `utilizadorId` (FK)

### **Utilizador**

* **Atributos**:

  * `id` (PK)
  * `nome`
  * `username` (único)
  * `tipo de perfil`

### **Stock**

* **Atributos**:

  * `id` (PK)
  * `modelo`
  * `quantidade`
  * `utilizadorId` (FK)

---

## Associações

### **Compra**

* **Relaciona**: `Cliente (1)` ↔ `Venda (N)`
* **Descrição**: Um cliente pode realizar várias compras (vendas).

### **Contém**

* **Relaciona**: `Venda (1)` ↔ `Guitarra (N)`
* **Descrição**: Cada venda pode incluir várias guitarras. Esta associação é representada pela chave estrangeira `vendaId` na entidade `Guitarra`.

### **Efetuada por**

* **Relaciona**: `Venda (N)` ↔ `Utilizador (1)`
* **Descrição**: Cada venda é registada por um utilizador autorizado.

### **Gerido por**

* **Relaciona**: `Stock (N)` ↔ `Utilizador (1)`
* **Descrição**: O stock de cada modelo é registado ou atualizado por um utilizador responsável.

---

## Regras de Negócio

1. Cada guitarra tem um **identificador único (`id`)**, correspondente ao número de série.
2. **Uma guitarra só pode ser vendida uma vez**.
3. Vendas **só podem ser registadas se existirem guitarras disponíveis no stock**.
4. Cada venda deve ser associada a **um cliente e um utilizador**.
5. **Usernames de utilizadores são únicos**.
6. **Utilizadores não podem modificar vendas nem stock para os quais não têm permissões**.
7. O **stock nunca pode assumir valores negativos**.
8. **Guitarras não vendidas** devem manter `vendaId` a `NULL`.

---

| [< Previous](rpf01.md) | [^ Início](rpf00.md) | [Next >](rpf03.md) |
| :---------------------- | :-------------------: | ------------------: |
