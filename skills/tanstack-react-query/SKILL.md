---
name: tanstack-react-query
description: Diretrizes para TanStack Query para server state, queries, mutations, cache, invalidação, sincronização e tratamento de estados assíncronos.
---

# TanStack React Query

## Objetivo

Gerenciar server state de forma previsível, evitando duplicação desnecessária entre cache, componentes e stores globais.

## Server State

Use TanStack Query para:

- Dados vindos de APIs.
- Cache.
- Loading/error state de requests.
- Refetching.
- Sincronização de dados remotos.
- Mutations.

Evite copiar dados do Query Cache para Zustand ou `useState` sem uma necessidade clara.

## Query Keys

- Query keys devem ser estáveis e representar a identidade dos dados.
- Inclua parâmetros relevantes na key.
- Siga o padrão de query keys já utilizado pelo projeto.
- Evite strings soltas e inconsistentes.

## Queries

Considere:

- `enabled`.
- `staleTime`.
- `gcTime`.
- Retry.
- Paginação.
- Dependent queries.
- Prefetching.

Não configure esses valores arbitrariamente; considere o comportamento esperado dos dados.

## Mutations

Após uma mutation:

- Determine quais queries ficaram potencialmente obsoletas.
- Invalide as queries necessárias.
- Atualize diretamente o cache quando isso for simples, seguro e coerente com o projeto.
- Considere optimistic updates apenas quando o benefício justificar a complexidade.

## Loading e Error

Trate adequadamente:

- Initial loading.
- Refetching.
- Error.
- Empty result.
- Success.

Não confunda "não há dados" com "a requisição falhou".

## Cache

Entenda a diferença entre:

- Dados stale.
- Query invalidada.
- Refetch.
- Dados presentes no cache.
- Garbage collection.

Evite invalidar grandes grupos de queries sem necessidade.

## Paginação

Para listas paginadas:

- Inclua parâmetros relevantes na query key.
- Preserve UX de troca de páginas quando apropriado.
- Considere filtros e ordenação como parte da identidade da query.

## Forms e URL

Filtros de página podem viver na URL, enquanto os resultados permanecem no Query Cache.

Evite sincronizar desnecessariamente o mesmo estado entre URL, React state, Zustand e Query Cache.

## Revisão

Procure por query keys incorretas, cache duplicado, invalidations excessivas, requests duplicadas, estado remoto duplicado e uso de React Query como se fosse apenas um wrapper de `fetch`.
