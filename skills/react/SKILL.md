---
name: react
description: Boas práticas para desenvolvimento de interfaces React, componentes, hooks, estado, efeitos, composição, performance e acessibilidade.
---

# React

## Objetivo

Fornecer orientação para desenvolver e revisar aplicações React modernas, priorizando composição, previsibilidade, legibilidade, acessibilidade e comportamento correto.

## Componentes

- Prefira componentes funcionais.
- Mantenha componentes com uma responsabilidade clara.
- Separe componentes de apresentação de lógica complexa quando isso melhorar a compreensão.
- Prefira composição a componentes excessivamente configuráveis.
- Evite componentes monolíticos.
- Evite abstrair componentes antes de existir reutilização ou uma responsabilidade clara.

## Props e Estado

- Mantenha o estado no menor nível possível.
- Eleve o estado somente quando múltiplos consumidores realmente precisarem dele.
- Evite armazenar valores que podem ser derivados de props ou estado existente.
- Prefira nomes de props que expressem intenção.
- Evite APIs de componentes com excesso de boolean flags.

## Hooks

- Siga rigorosamente as Rules of Hooks.
- Extraia hooks quando houver lógica reutilizável ou uma responsabilidade claramente separada.
- Evite hooks que apenas encapsulem uma única operação trivial sem benefício de abstração.
- Evite `useEffect` para calcular valores derivados.
- Evite `useEffect` para sincronizações que podem ser resolvidas pelo fluxo normal de renderização.
- Mantenha efeitos realmente relacionados a side effects externos.

## Efeitos

Antes de criar um `useEffect`, pergunte:

1. Existe um side effect externo real?
2. A lógica pode acontecer durante renderização?
3. A lógica pode acontecer diretamente em um event handler?
4. O estado poderia ser modelado de forma diferente?

Evite cadeias de efeitos que atualizam estado para produzir outro estado.

## Eventos e Forms

- Mantenha handlers focados.
- Coloque regras de negócio complexas fora do JSX quando isso melhorar a legibilidade.
- Utilize a abstração de formulário adotada pelo projeto.

## Listas

- Use `key` estável e relacionada à identidade do item.
- Evite índice do array como key quando a lista puder mudar de ordem ou sofrer inserções/remoções.

## Performance

- Não use `memo`, `useMemo` ou `useCallback` por padrão.
- Use memoização quando houver custo relevante, identidade referencial importante ou uma necessidade demonstrável.
- Investigue a causa de renders antes de adicionar otimizações.

## Acessibilidade

Considere:

- Elementos semânticos.
- Navegação por teclado.
- Focus management.
- Labels.
- Estados disabled/loading.
- Mensagens de erro.
- ARIA apenas quando a semântica nativa não for suficiente.

## Revisão

Ao revisar React, procure especialmente por efeitos desnecessários, estado derivado, keys instáveis, componentes monolíticos, stale closures e APIs de componentes excessivamente complexas.
