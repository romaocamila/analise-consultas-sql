# Análise e Consultas Avançadas em SQL

Projeto desenvolvido durante o módulo 17 - Manipulação de Dados com SQL do curso de Análise de Dados da EBAC.

O projeto utiliza um banco de dados de restaurante para explorar diferentes recursos do SQL, incluindo relacionamentos entre tabelas, criação de views, cálculos, funções, estruturas condicionais e análise do plano de execução de consultas.

## Objetivos

- Praticar consultas SQL envolvendo múltiplas tabelas;
- Relacionar informações por meio de JOIN;
- Criar e atualizar VIEWs;
- Realizar cálculos e agregações;
- Criar funções SQL reutilizáveis;
- Trabalhar com estruturas condicionais;
- Analisar o plano de execução de consultas utilizando EXPLAIN.

## Tecnologias e ferramentas

- SQL
- MySQL

## Conceitos aplicados

- INNER JOIN
- CREATE VIEW
- CREATE OR REPLACE VIEW
- SUM()
- AVG()
- Funções SQL
- DECLARE
- SELECT ... INTO
- IF / ELSEIF / ELSE
- EXPLAIN

## Principais consultas

### 1. View de resumo dos pedidos

Foi criada a VIEW `resumo_pedido` para consolidar informações relacionadas aos pedidos, clientes, funcionários e produtos.

Inicialmente, o valor total dos pedidos foi calculado durante a consulta. Posteriormente, a VIEW foi atualizada para incorporar esse campo de forma permanente.

### 2. Função para consulta de ingredientes

A função `BuscaIngredientesProduto()` recebe o ID de um produto e recupera seus respectivos ingredientes.

A função foi testada utilizando o produto de ID 10.

### 3. Função para análise do valor do pedido

A função `mediaPedido()` calcula o valor total de um pedido, compara o resultado com a média geral dos pedidos e retorna uma classificação de acordo com o resultado.

A função foi testada utilizando os pedidos de IDs 5 e 6.

### 4. Análise do plano de execução

Foi utilizado o comando `EXPLAIN` para analisar o plano de execução de uma consulta baseada na VIEW criada.

## Arquivo

- `consultas_avancadas.sql`

## Contexto do projeto

Este projeto foi desenvolvido como parte dos estudos de Análise de Dados, durante o módulo 17 de Manipulação de Dados com SQL.

## Aprendizados

O projeto permitiu avançar da utilização de consultas SQL básicas para a construção de consultas mais estruturadas e reutilizáveis, explorando recursos do MySQL para relacionamento, manipulação e análise de dados.