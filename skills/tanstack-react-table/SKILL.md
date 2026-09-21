---
name: tanstack-react-table
description: Diretrizes para TanStack Table para tabelas tipadas, colunas, sorting, filtering, pagination, seleção, estados controlados e integração com dados remotos.
---

# TanStack React Table

## Objetivo

Construir tabelas tipadas e previsíveis usando TanStack Table, mantendo separadas as responsabilidades de apresentação, estado e dados.

## Table Definition

- Defina colunas com tipos coerentes com o row model.
- Mantenha definições de coluna legíveis.
- Extraia colunas para arquivo separado quando o conjunto for grande ou reutilizado.
- Evite colocar regras complexas de negócio diretamente em `cell`.

## Tipagem

- Use o tipo de domínio da linha como referência.
- Evite `any` em `ColumnDef`.
- Garanta que accessors representem campos reais ou funções explicitamente tipadas.

## Sorting e Filtering

Determine se a operação é:

- Client-side.
- Server-side.

Não misture os dois modelos sem intenção.

Para server-side:

- Estado de filtros/ordenação deve participar da query.
- Query keys devem refletir parâmetros relevantes.
- A API deve ser a fonte de verdade da paginação/ordenação quando aplicável.

## Pagination

Para paginação server-side:

- Trate a página como parte do estado da consulta.
- Evite manter uma segunda fonte de verdade para a mesma paginação.
- Preserve a experiência do usuário durante mudanças de página quando apropriado.

## Row Selection

- Defina claramente o que a seleção representa.
- Considere persistência da seleção entre páginas quando necessário.
- Não assuma que o índice da linha é sua identidade.

## Performance

- Evite recriar estruturas pesadas sem necessidade.
- Não faça otimizações prematuras.
- Para grandes datasets, avalie paginação, virtualização ou processamento server-side.

## UI

A tabela deve tratar de apresentação e interação.

Regras de negócio e transformação de dados devem permanecer em camadas apropriadas.

## Revisão

Verifique tipagem, identidade das rows, controle de sorting/filtering/pagination, coerência entre estado da tabela e query, e separação entre tabela e regras de negócio.
