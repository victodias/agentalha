---
name: typescript
description: Diretrizes para TypeScript seguro, expressivo e sustentável, incluindo tipos de domínio, generics, unions, narrowing e fronteiras de dados.
---

# TypeScript

## Objetivo

Usar o sistema de tipos para aumentar a segurança e comunicar claramente as regras do domínio.

## Princípios

- Prefira tipos precisos.
- Permita que o TypeScript expresse invariantes importantes.
- Use inferência quando ela melhorar a legibilidade.
- Explicite tipos nas fronteiras públicas e onde o domínio exigir clareza.
- Evite tipos genéricos sem significado.

## Evite

- `any`.
- `as` para silenciar erros.
- Non-null assertions (`!`) sem necessidade.
- Tipos duplicados.
- Objetos excessivamente permissivos.
- Casts para contornar problemas de modelagem.

Se um cast parece necessário, investigue primeiro se o tipo ou a fronteira de dados está incorreta.

## Unions

Prefira discriminated unions quando estados diferentes possuírem estruturas diferentes.

Use unions para representar estados impossíveis de forma explícita.

## Narrowing

Prefira narrowing seguro por:

- `typeof`.
- `instanceof`.
- Checks explícitos.
- Type predicates quando realmente necessários.
- Discriminantes de unions.

## Dados Externos

Trate dados de API, URL, storage e inputs externos como dados potencialmente inválidos.

Tipos TypeScript não validam dados em runtime.

Quando necessário, use validação runtime com a biblioteca adotada pelo projeto.

## Generics

Use generics quando eles preservarem uma relação de tipos real.

Evite generics apenas para tornar uma função aparentemente reutilizável.

## Utility Types

Use utility types quando melhorarem a clareza:

- `Pick`
- `Omit`
- `Partial`
- `Required`
- `Record`
- `Readonly`

Não transforme tipos simples em construções excessivamente complexas.

## API e Domínio

Evite espalhar formatos crus de API por toda a UI quando uma transformação explícita para um modelo de domínio trouxer benefício real.

## Nullability

Modele `null` e `undefined` conscientemente.

Não elimine nullability com assertions apenas para satisfazer o compilador.

## Objetivo

O TypeScript deve tornar o código mais seguro e compreensível, não mais burocrático.
