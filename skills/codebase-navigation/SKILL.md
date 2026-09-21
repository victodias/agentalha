--- 
name: codebase-navigation 
description: Orienta a exploração eficiente do código existente para encontrar implementações, padrões, dependências e pontos de extensão antes de criar ou modificar código.
---

# Codebase Navigation

## Objetivo

Explorar o código existente de forma sistemática antes de implementar.

A primeira opção deve ser sempre entender e reutilizar padrões existentes antes de criar uma nova solução.

## Estratégia

### 1. Começar pela área mais próxima

Ao receber uma task, localizar primeiro:

* feature relacionada;
* página relacionada;
* componente mencionado;
* hook relacionado;
* service/API relacionado;
* testes existentes.

Evitar explorar o projeto inteiro sem necessidade.

### 2. Procurar implementações semelhantes

Antes de criar algo novo, buscar casos semelhantes.

Exemplos:

* outro formulário;
* outra tabela;
* outra query;
* outra mutation;
* outro modal;
* outro filtro;
* outro componente reutilizável;
* outro teste da mesma natureza.

Utilizar esses exemplos como referência de implementação.

### 3. Seguir dependências

Quando necessário, navegar pela cadeia:

```text
Page
 ↓
Feature
 ↓
Component
 ↓
Hook
 ↓
Service/API
 ↓
Types/Schemas
```

Entender apenas o nível necessário para realizar a alteração com segurança.

### 4. Identificar reutilização

Antes de criar:

* componente;
* hook;
* utilitário;
* service;
* type;
* schema;

verificar se já existe algo equivalente.

Evitar duplicar abstrações existentes.

### 5. Diferenciar reutilização de acoplamento

Não reutilizar algo apenas porque parece semelhante.

Avaliar:

* responsabilidade;
* contexto;
* dependências;
* comportamento;
* possibilidade de mudança independente.

Se dois contextos possuem responsabilidades diferentes, preferir abstrações separadas a uma abstração excessivamente genérica.

## Busca eficiente

Priorizar buscas específicas:

1. Nome da feature;
2. Nome do componente;
3. Termos de domínio;
4. Nome de hooks/services;
5. Padrões de implementação;
6. Testes semelhantes.

Evitar abrir grandes quantidades de arquivos sem relação direta com a task.

## Antes de modificar

Identificar:

* quem utiliza o código;
* quais dependências existem;
* se o componente é compartilhado;
* se há testes;
* se existe comportamento implícito;
* se a alteração pode afetar outros contextos.

## Regra de ouro

> Antes de criar algo, procure. Antes de alterar algo compartilhado, entenda seus consumidores.

## Resultado esperado

Ao finalizar a exploração, o agente deve conseguir explicar:

* onde implementar;
* quais arquivos precisam ser alterados;
* quais arquivos não precisam ser alterados;
* quais implementações existentes servem de referência;
* quais componentes podem ser reutilizados;
* quais riscos existem na alteração.
