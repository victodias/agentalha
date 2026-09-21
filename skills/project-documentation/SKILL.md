---
name: project-documentation
description: Define como criar, atualizar e organizar a documentação persistente do projeto, incluindo estrutura, inconsistências, melhorias, aprendizados e decisões técnicas.
---

# Project Documentation

## Objetivo

Orientar a criação e manutenção da documentação persistente do projeto, garantindo que informações relevantes para futuras tarefas sejam preservadas de forma organizada e objetiva.

## Princípios

* Documente somente informações relevantes para futuras tarefas.
* Prefira atualizar documentação existente a criar documentos duplicados.
* Não documente informações óbvias que podem ser descobertas diretamente no código.
* Não invente padrões que não foram observados no projeto.
* Diferencie fatos observados, decisões tomadas e hipóteses.
* Mantenha a documentação próxima da realidade atual do projeto.
* Evite documentação excessivamente detalhada que aumente o custo de consulta sem gerar benefício proporcional.

## Classificação

Antes de criar ou atualizar um documento, determine a natureza da informação.

| Informação                                 | Local                                    |
| ------------------------------------------ | ---------------------------------------- |
| Estrutura e organização do projeto         | `.claude/docs/structure/`                |
| Inconsistências entre padrões              | `.claude/docs/analysis/inconsistencies/` |
| Oportunidades de melhoria                  | `.claude/docs/analysis/improvements/`    |
| Conhecimentos e comportamentos descobertos | `.claude/docs/learnings/`                |
| Decisões técnicas                          | `.claude/docs/decisions/`                |

Não misture informações de naturezas diferentes apenas para reduzir a quantidade de arquivos.

## Project Structure

A documentação de estrutura deve funcionar como um índice de navegação do projeto.

O objetivo principal é permitir responder rapidamente:

> "Onde devo procurar para implementar esta tarefa?"

Quando relevante, documente:

* responsabilidade dos principais diretórios;
* organização das features;
* localização de páginas;
* localização de componentes;
* componentes compartilhados;
* hooks;
* services/API;
* gerenciamento de estado;
* formulários e validação;
* tipos e schemas;
* testes;
* configurações relevantes;
* relações entre áreas do sistema;
* convenções importantes.

Não descreva toda a árvore de arquivos indiscriminadamente.

Priorize informações que reduzam a necessidade de exploração futura.

## Inconsistencies

Registre quando diferentes partes do projeto utilizam padrões diferentes para resolver necessidades semelhantes.

Documente:

* o que foi encontrado;
* onde foi encontrado;
* quais padrões diferentes existem;
* a frequência ou abrangência quando relevante.

Não classifique automaticamente uma abordagem como errada.

Uma inconsistência pode representar código legado, evolução do projeto ou uma decisão contextual.

## Improvements

Registre oportunidades de melhoria somente quando houver evidência suficiente no código.

As sugestões devem:

* ser incrementais;
* respeitar a estrutura atual;
* ter benefício prático;
* indicar as áreas afetadas;
* evitar mudanças arquiteturais abrangentes.

Priorize melhorias relacionadas a:

* duplicação;
* responsabilidades excessivas;
* dificuldade de manutenção;
* inconsistências recorrentes;
* testabilidade;
* legibilidade;
* reutilização claramente necessária.

Não sugira uma melhoria apenas porque existe uma abordagem diferente ou considerada mais moderna.

Não implemente a melhoria durante a documentação.

## Learnings

Registre conhecimentos descobertos durante a análise ou implementação que possam evitar investigação futura.

Exemplos:

* comportamento não óbvio de uma API;
* dependência entre módulos;
* regra técnica descoberta no código;
* comportamento legado;
* particularidade de uma biblioteca;
* fluxo que não é evidente pela estrutura;
* comportamento inesperado relevante.

Um learning deve responder, sempre que possível:

* O que foi descoberto?
* Onde isso acontece?
* Por que isso é relevante?
* O que uma futura implementação deve considerar?

## Decisions

Registre decisões técnicas relevantes que tenham impacto em futuras implementações.

Uma decisão deve conter, quando aplicável:

* contexto;
* problema;
* decisão;
* justificativa;
* alternativas consideradas;
* consequências.

Não transforme uma simples observação do código em uma decisão formal.

Quando uma decisão existente for inferida a partir do código, deixe claro que ela foi observada ou inferida.

Decisões tomadas durante o desenvolvimento devem ser registradas somente quando tiverem relevância futura.

## Atualização

Antes de criar um novo documento:

1. Procure documentação existente sobre o assunto.
2. Verifique se o conteúdo deve ser atualizado em vez de duplicado.
3. Escolha a categoria correta.
4. Atualize ou crie o documento.
5. Remova ou corrija informações que tenham ficado desatualizadas.

Não crie documentação simplesmente porque uma tarefa foi concluída.

## Qualidade

A documentação deve ser:

* objetiva;
* factual;
* específica;
* fácil de consultar;
* suficientemente contextualizada;
* consistente com o código atual.

Evite:

* textos genéricos;
* explicações óbvias;
* documentação duplicada;
* especulação apresentada como fato;
* histórico desnecessário;
* detalhes que não terão utilidade futura.
