---
name: zustand
description: Diretrizes para Zustand para client state compartilhado, stores focadas, seletores, ações e integração segura com React.
---

# Zustand

## Objetivo

Usar Zustand para client state compartilhado quando o estado realmente precisar existir fora do ciclo de vida de um único componente.

## Quando usar

Bom para:

- Estado global de UI.
- Preferências da aplicação.
- Estado compartilhado entre features.
- Fluxos de interação que atravessam componentes.

Evite usar Zustand para server state que pode ser gerenciado por TanStack Query.

## Store

Mantenha stores focadas.

Uma store deve possuir uma responsabilidade coerente.

Evite stores gigantes que se tornam um depósito de qualquer estado da aplicação.

## Estado e Ações

Organize claramente:

- Estado.
- Ações.
- Derivações necessárias.

Evite colocar toda a lógica de negócio da aplicação dentro da store.

## Seletores

Prefira selecionar apenas o estado necessário ao componente.

Evite subscrever componentes a uma store inteira quando apenas uma pequena parte é utilizada.

## Imutabilidade

Use os padrões suportados pela store e pelos middlewares adotados pelo projeto.

Evite mutações externas que dificultem prever mudanças de estado.

## Server State

Não copie automaticamente respostas de APIs para Zustand.

Se o dado é remoto, cacheável e sincronizado com backend, TanStack Query normalmente é a ferramenta adequada.

## Persistência

Ao persistir estado:

- Defina explicitamente o que precisa ser persistido.
- Não persista dados sensíveis sem justificativa e segurança adequada.
- Considere migração de versões do estado persistido.

## Revisão

Procure por global state desnecessário, stores grandes, seletores amplos, duplicação de server state e lógica de negócio excessivamente acoplada à store.
