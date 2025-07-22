# Sales Analytics Service

![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)
![FastAPI](https://img.shields.io/badge/FastAPI-0.100+-green.svg)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14+-blue.svg)

API robusta construída com FastAPI para servir como um backend para ferramentas de Business Intelligence, como o Power BI. O projeto demonstra a integração de uma API segura com um banco de dados PostgreSQL, utilizando SQL puro para consultas e Pydantic para validação de dados.

## ✨ Features

* **API RESTful** com FastAPI, otimizada para alta performance.
* **Conexão com PostgreSQL** utilizando a biblioteca `psycopg2` e SQL puro para total controle sobre as queries.
* **Validação de Dados** na entrada e saída com Pydantic, garantindo a integridade dos dados.
* **Autenticação Segura** baseada em API Key para proteger os endpoints.
* **Documentação Automática e Interativa** gerada pelo FastAPI (via Swagger UI e ReDoc).
* **Gerenciamento de Configuração** profissional com `pydantic-settings` para carregar variáveis de ambiente de um arquivo `.env`.
* **Integração com Power BI** demonstrando um pipeline de dados completo, do banco à visualização.

## 🛠️ Tech Stack

* **Backend:** FastAPI, Uvicorn, Gunicorn
* **Banco de Dados:** PostgreSQL
* **Validação:** Pydantic
* **Driver do Banco:** Psycopg2
* **BI Tool:** Power BI
* **Gerenciamento de Configuração:** Pydantic-Settings

## 📂 Estrutura do Projeto

A estrutura do projeto foi organizada para garantir a separação de responsabilidades e a escalabilidade.

```
sales_analytics_service/
│
├── app/
│   ├── api/
│   │   ├── endpoints/
│   │   │   └── sales.py
│   │   └── deps.py
│   ├── core/
│   │   └── config.py
│   ├── crud/
│   │   └── crud_sale.py
│   ├── db/
│   │   └── database.py
│   ├── schemas/
│   │   └── venda.py
│   └── main.py
│
├── database/
│   └── schema.sql
│
├── .env.example
├── .gitignore
└── requirements.txt
```

## ⚙️ Configuração e Instalação

Siga os passos abaixo para executar o projeto localmente.

### 1. Clonar o Repositório

```bash
git clone [https://github.com/seu-usuario/sales_analytics_service.git](https://github.com/seu-usuario/sales_analytics_service.git)
cd sales_analytics_service
```

### 2. Criar e Ativar o Ambiente Virtual

```bash
# Criar o ambiente
python -m venv venv

# Ativar no Windows
.venv\Scripts\activate

# Ativar no Linux/macOS
source venv/bin/activate
```

### 3. Instalar as Dependências

Com o ambiente virtual ativado, instale todas as bibliotecas necessárias:

```bash
pip install -r requirements.txt
```

### 4. Configurar o Banco de Dados PostgreSQL

1.  Certifique-se de que você tem o PostgreSQL instalado e rodando.
2.  Crie um novo banco de dados. Por exemplo, `sales_analytics_service`.
3.  Conecte-se a este banco de dados usando uma ferramenta como DBeaver ou pgAdmin e execute o script contido em `database/schema.sql` para criar a tabela `sales` e populá-la com dados de exemplo.

### 5. Configurar as Variáveis de Ambiente

Este projeto usa um arquivo `.env` para gerenciar segredos e configurações.

1.  Crie uma cópia do arquivo `.env.example` e renomeie-a para `.env`.
2.  Abra o arquivo `.env` e preencha com as suas credenciais do banco de dados e uma chave de API de sua escolha.

**Conteúdo do `.env.example`:**

```ini
POSTGRES_USER=seu_usuario_postgres
POSTGRES_PASSWORD=sua_senha_postgres
POSTGRES_SERVER=localhost
POSTGRES_PORT=5432
POSTGRES_DB=sales_analytics_service
API_KEY="coloque_aqui_uma_chave_secreta_forte"
```

## 🚀 Rodando a Aplicação

Com tudo configurado, inicie o servidor FastAPI:

```bash
uvicorn app.main:app --reload
```

A API estará disponível em `http://127.0.0.1:8000`.

* **Endpoint Raiz:** `http://127.0.0.1:8000/`
* **Documentação Interativa:** `http://127.0.0.1:8000/docs`

## 🔌 Usando a API

### Endpoint Principal

* **URL:** `GET /kpi/sales`
* **Descrição:** Retorna todos os dados de vendas.
* **Autenticação:** Requer uma API Key no cabeçalho da requisição.

### Autenticação

Todas as requisições para o endpoint `/kpi/sales` devem incluir o cabeçalho `X-API-Key` com o valor que você definiu no seu arquivo `.env`.

**Exemplo com cURL:**

```bash
curl -X 'GET' \
  '[http://127.0.0.1:8000/kpi/sales](http://127.0.0.1:8000/kpi/sales)' \
  -H 'accept: application/json' \
  -H 'X-API-Key: seu_token_aqui'
```

## 📊 Integração com Power BI

1.  No Power BI Desktop, vá em **Obter dados > Da Web**.
2.  Selecione a opção **Avançado**.
3.  Em "Partes da URL", insira `http://127.0.0.1:8000/kpi/sales`.
4.  Em "Parâmetros de cabeçalho...", adicione:
    * **Nome:** `X-API-Key`
    * **Valor:** A sua chave de API
5.  Clique em "OK". Na tela seguinte de credenciais, selecione **Anônimo**.
6.  Trate os dados no Power Query e crie seus visuais.

## Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.