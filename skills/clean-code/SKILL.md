---
name: clean-code
description: Diretrizes de Clean Code para nomes, funções, responsabilidades, complexidade, duplicação, abstrações e legibilidade.
---

# Clean Code

## Objetivo

Produzir código fácil de ler, entender, alterar e revisar.

## Nomes

Nomes devem comunicar intenção.

Prefira:

- `customerId` em vez de `id`.
- `isSubmitting` em vez de `loading`.
- `calculateTotal` em vez de `process`.

Evite nomes genéricos quando o domínio permite maior precisão.

## Funções

Prefira funções:

- Pequenas.
- Focadas.
- Com responsabilidade clara.
- Com poucos efeitos colaterais.
- Com argumentos compreensíveis.

Não divida uma função apenas porque ela possui várias linhas; divida quando existir uma responsabilidade conceitual clara.

## Condicionais

Prefira fluxo simples.

Use early returns quando reduzirem nesting e melhorarem a leitura.

Evite condicionais profundamente aninhadas.

## Duplicação

Nem toda repetição é duplicação arquitetural.

Antes de abstrair, confirme que:

- O comportamento representa o mesmo conceito.
- A abstração terá consumidores reais.
- A abstração não tornará o código mais difícil de entender.

## Abstrações

Não abstraia por antecipação.

Uma abstração deve resolver um problema real de:

- Reutilização.
- Complexidade.
- Consistência.
- Isolamento de responsabilidade.

## Comentários

Comentários devem explicar principalmente:

- Por que algo é necessário.
- Uma limitação externa.
- Uma decisão não óbvia.

Não use comentários para explicar código que poderia ser tornado mais claro por meio de nomes e estrutura.

## Complexidade

Procure reduzir:

- Nesting.
- Branches desnecessários.
- Funções gigantes.
- Dependências implícitas.
- Estado duplicado.

## Revisão

Pergunte:

- Outro engenheiro entenderia isso rapidamente?
- O nome comunica intenção?
- Existe uma abstração desnecessária?
- Existe responsabilidade demais neste módulo?
- Existe estado duplicado?
- A solução é mais complexa do que o problema exige?
