# 🚀 Projeto Completo de Teste de Performance com JMeter + Docker + Tugboat

Este projeto executa um teste de performance completo no site BlazeDemo, simulando um usuário real comprando uma passagem aérea.
<p align="center">
  <img src="imagens/logo.jpg" alt="Logo JMeter" width="200">
</p>
## 🌐 Sistema testado

* BlazeDemo (site de testes de voo)
* Fluxo testado:

  * Home
  * Busca de voo
  * Seleção
  * Compra

---

# 🧰 1. PRÉ-REQUISITOS

Instale os seguintes itens:

## ✔ Java

https://www.java.com/

Verificar instalação:

```bash
java -version
```

---

## ✔ Apache JMeter

https://jmeter.apache.org/

Executar:

```bash
bin/jmeter.bat
```

---

## ✔ Docker

https://www.docker.com/

Testar:

```bash
docker run hello-world
```

---

## ✔ Git

https://git-scm.com/

Testar:

```bash
git --version
```

---

# 🧪 2. CRIAÇÃO DO TESTE NO JMETER

## 📌 Estrutura do teste

```
Thread Group
 ├── HTTP Request (Home)
 ├── HTTP Request (Buscar voo)
 ├── Regex Extractor
 ├── HTTP Request (Compra)
 ├── Response Assertion
```

---

## 🔹 1. Thread Group

* Number of Threads: 1
* Loop Count: 1

---

## 🔹 2. Requisição HOME

```
Method: GET
Server Name: blazedemo.com
Path: /
```

---

## 🔹 3. Buscar voos

```
Method: POST
Path: /reserve.php
```

Parâmetros:

```
fromPort = Paris
toPort = London
```

---

## 🔹 4. Extração dinâmica (Regex)

```
Field to check: Body
Regex: name="flight" value="(.+?)"
Variable Name: voo_escolhido
Match No: 1
```

---

## 🔹 5. Compra

```
Method: POST
Path: /purchase.php
```

Parâmetro:

```
flight = ${voo_escolhido}
```

---

## 🔹 6. Validação

```
Response Assertion:
Contains: Thank you for your purchase
```

---

## 💾 Salvar arquivo

```
Completo.jmx
```

---

# ▶️ 3. EXECUÇÃO LOCAL (JMETER)

## Executar via interface

* Abrir JMeter
* Clicar em ▶️ Start

---

## Executar via terminal (modo profissional)

```bash
jmeter -n -t Completo.jmx -l result.jtl -e -o relatorio
```

---

# 📊 4. RELATÓRIO

Abrir:

```
relatorio/index.html
```

---

# 🐳 5. EXECUÇÃO COM DOCKER

## Criar pasta do projeto

```bash
mkdir projeto-blazedemo
cd projeto-blazedemo
```

Coloque o arquivo:

```
Completo.jmx
```

---

## Executar com Docker

```bash
docker run -v %cd%:/tests justb4/jmeter \
-n -t /tests/Completo.jmx \
-l /tests/result.jtl \
-e -o /tests/relatorio
```

---

# 📁 6. ESTRUTURA DO PROJETO

```
projeto-blazedemo/
 ├── Completo.jmx
 ├── .tugboat/
 │    └── config.yml
```

---

# ⚙️ 7. CONFIGURAÇÃO DO TUGBOAT

Criar arquivo:

```
.tugboat/config.yml
```

---

## Conteúdo:

```yaml
services:
  docker:
    image: docker:stable

tasks:
  build:
    commands:
      - echo "Executando teste BlazeDemo"
      - docker run -v $(pwd):/tests justb4/jmeter -n -t /tests/Completo.jmx -l /tests/result.jtl -e -o /tests/relatorio
```

---

# 🔄 8. SUBIR PARA O GITHUB

```bash
git init
git add .
git commit -m "Projeto completo JMeter BlazeDemo"
```

---

## Conectar repositório

```bash
git remote add origin SEU_REPO
git branch -M main
git push -u origin main
```

---

# ☁️ 9. EXECUTAR NO TUGBOAT

1. Acessar Tugboat
2. Adicionar repositório
3. Selecionar projeto

---

## Resultado esperado

* Execução automática
* Logs disponíveis
* Teste rodando via Docker

---

# 📈 10. RESULTADOS

Arquivos gerados:

```
result.jtl
relatorio/index.html
```

---

# 🎯 OBJETIVO DO PROJETO

Este projeto demonstra:

* Teste de performance com JMeter
* Uso de dados dinâmicos (Regex)
* Execução via linha de comando
* Containerização com Docker
* Automação com Tugboat
* Geração de relatório HTML

---

# 🏆 CONCLUSÃO

Projeto completo cobrindo:

✔ Teste real de fluxo
✔ Execução profissional
✔ Automação
✔ DevOps básico

---

# 🚀 PRÓXIMOS PASSOS

* Aumentar usuários (load test)
* Integrar com CI/CD
* Testar APIs com autenticação
* Monitoramento de performance

---
