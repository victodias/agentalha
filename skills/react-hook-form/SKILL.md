---
name: react-hook-form
description: Diretrizes para React Hook Form para formulários performáticos, tipados, validação, erros, campos controlados e integração com schemas.
---

# React Hook Form

## Objetivo

Construir formulários previsíveis, tipados e fáceis de validar e manter.

## Form State

Use React Hook Form para:

- Values.
- Dirty state.
- Touched state.
- Validation.
- Submission.
- Field errors.

Evite duplicar os mesmos valores do formulário em `useState` ou Zustand sem uma necessidade clara.

## Tipagem

Defina um tipo para os valores do formulário.

Quando o projeto utilizar uma biblioteca de schemas, mantenha o schema e o tipo coerentes.

## register vs Controller

Prefira `register` para inputs compatíveis diretamente com React Hook Form.

Use `Controller` quando o componente externo exigir controle explícito de `value`/`onChange`.

Não use `Controller` indiscriminadamente.

## Validação

Valide regras no nível apropriado.

Para regras complexas ou compartilhadas, prefira schema validation quando o projeto já utilizar esse padrão.

Mensagens de erro devem ser claras para o usuário.

## Submission

- Trate estados de submissão.
- Evite submissões duplicadas.
- Trate erros da API.
- Diferencie erros de validação local de erros do backend.

## Reset e Defaults

Defina `defaultValues` de forma consistente.

Ao carregar dados assíncronos para edição, trate explicitamente a atualização dos valores do formulário.

Não dependa de re-render acidental para sincronizar dados.

## URL e Filtros

Quando filtros precisam ser refletidos na URL:

- O formulário representa a interação do usuário.
- A URL representa o estado navegável/compartilhável.
- Evite criar múltiplas fontes de verdade sem necessidade.
- Faça parsing e serialização de forma tipada.

## Revisão

Procure por estado duplicado, `Controller` desnecessário, valores não tipados, reset incorreto, submissão duplicada e tratamento inadequado de erros.

Para componentes de formulário que ainda não estão adaptados ao React Hook Form, não refatore o componente original diretamente, pois ele pode estar sendo utilizado em outros contextos do sistema.

Em vez disso, abstraia ou componha o componente existente e crie uma adaptação específica para o contexto que está sendo desenvolvido no momento, integrando-a ao React Hook Form sem alterar o comportamento dos consumidores existentes.
