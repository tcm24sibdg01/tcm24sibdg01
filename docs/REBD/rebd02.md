# C2 : Esquema conceptual

# Modelo Entidade-Associação (E/A)

## Entidades Principais

### **Guitarra**
- **Atributos**:
  - `nº de série` (PK)
  - `modelo`
  - `tipo`
  - `cor`
  - `acabamento`
  - `ano`
  - `preço`

### **Cliente**
- **Atributos**:
  - `ID` (PK)
  - `nome`
  - `email`
  - `NIF`
  - `morada`

### **Venda**
- **Atributos**:
  - `ID` (PK)
  - `data`
  - `valor`
  - `método de pagamento`

### **Utilizador**
- **Atributos**:
  - `ID` (PK)
  - `nome`
  - `username` (único)
  - `tipo de perfil`

### **Stock**
- **Atributos**:
  - `ID` (PK)
  - `modelo`
  - `quantidade`

---

## Associações

### **Compra**
- **Relaciona**: `Cliente (1)` ↔ `Venda (N)`
- **Restrição**: Cada venda deve estar associada a um cliente.

### **Inclui**
- **Relaciona**: `Venda (1)` ↔ `Guitarra (N)`
- **Restrição**: Uma venda pode incluir várias guitarras.

### **Gerido por**
- **Relaciona**: `Venda (N)` ↔ `Utilizador (1)`
- **Restrição**: Apenas utilizadores autorizados podem gerir vendas.

### **Inventariado por**
- **Relaciona**: `Stock (N)` ↔ `Utilizador (1)`
- **Restrição**: Apenas utilizadores autorizados podem atualizar stock.

---

## Regras de Negócio

1. Cada guitarra tem um **número de série único**.
2. **Vendas só podem ocorrer se houver stock disponível**.
3. Cada venda **deve estar associada a um cliente**.
4. **Usernames devem ser únicos**.
5. **Utilizadores não autorizados não podem alterar stock ou vendas**.
6. Vendas **não são eliminadas**, apenas **marcadas como canceladas**.
7. O **stock não pode ter valores negativos**.


---
[< Previous](rebd01.md) | [^ Inicio](rebd00.md) | [Next >](rebd03.md)
:--- | :---: | ---: 
