---
name: tailwindcss
description: Diretrizes para Tailwind CSS para estilização consistente, responsiva, acessível e alinhada ao design system existente.
---

# Tailwind CSS

## Objetivo

Usar Tailwind CSS para criar interfaces consistentes e fáceis de manter dentro das convenções do projeto.

## Princípios

- Prefira tokens e utilities existentes.
- Respeite o design system do projeto.
- Reutilize componentes existentes quando apropriado.
- Evite valores arbitrários quando um token existente resolve o problema.
- Evite duplicação extensa de classes quando uma abstração clara trouxer benefício.

## Responsividade

- Siga os breakpoints existentes.
- Pense primeiro na estrutura responsiva.
- Não trate desktop e mobile como duas interfaces completamente independentes sem necessidade.

## Estados

Considere:

- Hover.
- Focus.
- Focus-visible.
- Disabled.
- Loading.
- Error.
- Selected.
- Active.

Não remova indicadores de foco sem fornecer uma alternativa acessível.

## Acessibilidade

Estilo não deve substituir semântica.

Garanta:

- Contraste adequado.
- Focus visível.
- Tamanho de áreas interativas.
- Estados perceptíveis sem depender exclusivamente de cor.

## Class Names

Quando uma composição de utilities se tornar difícil de ler:

1. Verifique se existe componente de design system.
2. Considere uma abstração apropriada.
3. Não crie abstrações apenas para reduzir algumas classes.

## Revisão

Procure por valores arbitrários desnecessários, inconsistência de spacing/colors, responsividade quebrada, estados de foco ausentes e duplicação de padrões visuais.
