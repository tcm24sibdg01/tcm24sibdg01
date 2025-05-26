# C3 : SQL

## DDL

_(Apresentar o SQL para criação do esquema definido acima num SGBD MySQL.)_


```sql
USE `test`;

DROP TABLE IF EXISTS `tabela_a`;
DROP TABLE IF EXISTS `tabela_b`;

CREATE TABLE IF NOT EXISTS `tabela_a` (
  `model` int(4) unsigned NOT NULL,
  `speed` int(4) unsigned NOT NULL,
  `ram` int(3) unsigned NOT NULL,
  `hd` float unsigned NOT NULL,
  `screen` float unsigned NOT NULL,
  `price` int(7) NOT NULL,
  PRIMARY KEY (`model`)
);

CREATE TABLE IF NOT EXISTS `tabela_b` (
  `model` int(4) unsigned NOT NULL,
  `speed` int(4) unsigned NOT NULL,
  `ram` int(3) unsigned NOT NULL,
  `hd` float unsigned NOT NULL,
  `cd` varchar(3) COLLATE latin1_bin NOT NULL,
  `price` int(7) NOT NULL,
  PRIMARY KEY (`model`)
);
```

## DML

_(Apresentar exemplos dos pedidos SQL à base de dados que demonstrem o cumprimento dos requisitos identificados. Para cada query apresentar numa breve descrição do requisito que pretende resolver e do resultado espectável.)_

---
[< Previous](rebd04.md) | [^ Main](/../../) | Next >
:--- | :---: | ---: 
