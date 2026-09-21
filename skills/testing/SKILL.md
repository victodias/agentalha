---
name: testing
description: Diretrizes para testes frontend focados em comportamento, regras de negócio, integração e prevenção de regressões.
---

# Testing

## Objetivo

Criar testes que forneçam confiança real no comportamento do sistema.

## Princípios

- Teste comportamento, não implementação.
- Priorize caminhos críticos.
- Cubra regras de negócio relevantes.
- Cubra casos extremos importantes.
- Evite testes frágeis.
- Siga o framework e convenções existentes no projeto.

## Unit Tests

Use para lógica isolada que possui comportamento relevante e determinístico.

Não crie testes unitários para cada função trivial apenas para aumentar cobertura.

## Component Tests

Prefira testar:

- O que o usuário vê.
- O que o usuário pode fazer.
- Estados de loading/error/empty/success.
- Interações importantes.
- Validações.

Evite depender excessivamente da estrutura interna do componente.

## Integration Tests

Use quando o comportamento depende da interação entre:

- Componentes.
- Hooks.
- API layer.
- Query cache.
- Form state.
- Stores.

## Mocks

Mocke dependências externas quando necessário, mas não esconda o comportamento que realmente precisa ser validado.

Evite mocks excessivos que façam o teste validar apenas a própria implementação.

## Async

Trate corretamente:

- Loading.
- Success.
- Error.
- Refetch.
- Race conditions relevantes.

## Testes de Regressão

Quando corrigir um bug, considere adicionar um teste que falharia antes da correção.

## Qualidade

Um teste ruim pode aumentar o custo de manutenção sem aumentar a confiança.

Prefira poucos testes significativos a muitos testes redundantes.
