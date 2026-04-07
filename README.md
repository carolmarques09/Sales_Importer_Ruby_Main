# Sales Importer (Ruby)

Projeto de importação de vendas desenvolvido em Ruby, com interface web simples para upload de arquivos `.tab`. A aplicação realiza o parsing dos dados, normalização e armazenamento em banco de dados relacional, seguindo boas práticas de desenvolvimento.

---

## 📌 Funcionalidades

* Upload de arquivos no formato `.tab` (tab-separated)
* Leitura e interpretação dos dados (parsing)
* Normalização das informações
* Persistência em banco de dados relacional
* Cálculo do faturamento total (gross income)

---

## 🧱 Estrutura do Projeto

```bash
project/
│
├── app/
│   ├── controllers/
│   ├── models/
│   ├── services/
│
├── config/
│   └── database.yml
│
├── db/
│   └── setup.sql
│
├── lib/
│   └── parser.rb
│
├── spec/                 
│   ├── models/
│   │   └── item_spec.rb
│   ├── services/
│   │   └── import_sales_spec.rb
│
├── app.rb                
├── config.ru
├── Gemfile
├── README.md
└── LICENSE
```

## ⚙️ Tecnologias Utilizadas

* Ruby
* Sinatra
* ActiveRecord
* MySQL
* RSpec

---

## 🚀 Como Executar o Projeto

### 1. Clonar o repositório

```bash
git clone https://github.com/carolmarques09/Sales-Importer-Ruby.git
cd project
```

### 2. Instalar dependências

```bash
bundle install
```

### 3. Executar a aplicação

```bash
rackup
```

Acesse no navegador:

```
http://localhost:9292
```

---

## 🧪 Executar Testes

```bash
rspec
```

---

## 🧠 Decisões Técnicas

* Utilização de **Service Objects** para separar regras de negócio da camada de controle
* Aplicação do princípio **Single Responsibility Principle (SRP)**
* Uso de **ActiveRecord** para facilitar a manipulação do banco de dados
* Estrutura modular para facilitar manutenção e escalabilidade

---

## 📂 Formato do Arquivo de Entrada

O arquivo deve conter as seguintes colunas (separadas por TAB):

* purchaser name
* item description
* item price
* purchase count
* merchant address
* merchant name

---

## 📈 Resultado

Após o upload, a aplicação exibe o **faturamento bruto total** com base nos dados importados.

---

## 📄 Licença

Este projeto está sob a licença MIT.
