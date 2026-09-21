---
name: project-context 
description: Analisa o contexto, a arquitetura, a stack, as convenções e os padrões existentes do projeto antes de implementar ou modificar código.
---

# Project Context

## Objetivo

Entender o projeto antes de tomar decisões de implementação.

O código existente e as convenções do projeto devem ser tratados como fonte primária de contexto. Não assumir que uma preferência pessoal ou um padrão genérico é necessariamente adequado ao projeto.

## Quando utilizar

Utilize esta skill antes de implementar uma funcionalidade relevante, alterar arquitetura ou modificar uma área do sistema que ainda não foi suficientemente compreendida.

## Processo

### 1. Identificar a stack

Investigar, quando relevante:

* `package.json`
* configurações de TypeScript
* configurações de build
* framework utilizado
* bibliotecas principais
* ferramentas de testes
* ferramentas de lint/format
* gerenciamento de estado
* gerenciamento de dados/server state
* estrutura de estilos

Não assumir versões ou configurações sem verificar o projeto.

### 2. Entender a estrutura

Identificar:

* organização das pastas;
* fronteiras entre features/domínios;
* componentes compartilhados;
* hooks;
* services/API;
* schemas/types;
* testes;
* utilitários;
* configurações relevantes.

### 3. Encontrar padrões existentes

Antes de criar uma nova implementação, procurar exemplos semelhantes no projeto.

Observar especialmente:

* nomenclatura;
* organização de arquivos;
* composição de componentes;
* criação de hooks;
* chamadas de API;
* gerenciamento de estado;
* tratamento de erros;
* loading e empty states;
* testes;
* validações;
* estilização.

### 4. Identificar convenções

Determinar quais padrões parecem ser estabelecidos pelo projeto.

Exemplos:

* `features` vs organização por tipo de arquivo;
* hooks locais vs compartilhados;
* Zustand vs Context;
* TanStack Query para server state;
* React Hook Form para formulários;
* componentes controlados vs não controlados;
* convenções de nomenclatura;
* estratégia de testes.

### 5. Prioridade das regras

Quando houver conflito entre preferências, utilizar esta prioridade:

1. Regras explícitas da task;
2. Regras e documentação do projeto;
3. Padrões existentes e consistentes do projeto;
4. Skills técnicas;
5. Preferências pessoais ou padrões genéricos.

Não introduzir uma tecnologia ou padrão diferente apenas porque ele é considerado uma "boa prática" em outros projetos.

## Princípios

### Não impor arquitetura

Não reestruturar o projeto para adequá-lo a uma arquitetura preferida.

### Não refatorar sem necessidade

Se uma implementação existente funciona e atende ao contexto atual, não refatorá-la apenas por preferência.

### Preferir consistência

Quando houver múltiplas soluções tecnicamente válidas, preferir aquela que mantém consistência com o código existente.

### Questionar inconsistências

Se houver padrões conflitantes ou uma decisão existente aparentemente problemática, sinalizar isso antes de realizar uma grande mudança.

## Resultado esperado

Ao finalizar a análise, o agente deve possuir contexto suficiente para responder:

* Onde essa funcionalidade pertence?
* Quais padrões existentes devo seguir?
* Quais componentes/hooks/services posso reutilizar?
* Quais tecnologias o projeto utiliza para esse problema?
* Quais restrições arquiteturais devo respeitar?
* Quais decisões não devo tomar sem confirmação?
