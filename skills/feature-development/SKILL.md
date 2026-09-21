---
name: feature-development
description: Fluxo padrão para analisar, planejar, implementar integralmente e documentar uma task de desenvolvimento no mesmo ciclo de execução. Use quando o usuário solicitar uma implementação normal ou completa. Não use quando ele solicitar modo incremental, desenvolvimento por etapas, checkpoints, uma subtask por vez ou aprovação antes de continuar.
---

# Feature Development

## Objetivo

Use esta skill como fluxo padrão para tarefas que devem ser implementadas
integralmente.

Não use quando o usuário solicitar modo incremental, desenvolvimento por
etapas, checkpoints, uma subtask por vez ou aprovação antes de continuar.
Nesses casos, utilize `incremental-development`.

## 1. Análise

Antes de editar:

1. Leia a descrição completa da task.
2. Identifique objetivo, comportamento esperado e regras de negócio.
3. Inspecione a estrutura relevante do projeto.
4. Procure implementações semelhantes.
5. Identifique componentes, hooks, services, APIs, stores, queries, tipos e testes relacionados.
6. Identifique convenções existentes.
7. Identifique riscos, dependências e possíveis efeitos colaterais.
8. Determine quais skills técnicas precisam ser carregadas.

Não pergunte ao usuário algo que possa ser descoberto razoavelmente por inspeção do projeto.

## 2. Planejamento

Depois da análise, crie um TODO de implementação.

O TODO deve ser:

- Concreto.
- Ordenado.
- Pequeno o suficiente para ser executado incrementalmente.
- Relacionado diretamente à task.

Exemplo:

```text
TODO
- [ ] Identificar contrato da API e tipos necessários.
- [ ] Implementar query seguindo a convenção existente.
- [ ] Implementar o estado de filtros.
- [ ] Implementar a tabela e seus estados.
- [ ] Integrar a página.
- [ ] Adicionar testes.
- [ ] Validar typecheck, lint e testes.
- [ ] Registrar decisões e aprendizados.
```

Não crie TODOs vagos como `Implementar feature`.

## 3. Implementação

Execute o TODO incrementalmente.

Para cada item:

1. Entenda o que precisa mudar.
2. Faça a menor mudança necessária.
3. Valide o resultado quando possível.
4. Atualize o progresso.
5. Continue para o próximo item.

Não pule diretamente para uma grande implementação quando a task puder ser dividida em passos verificáveis.

## 4. Controle de Escopo

Não transforme a task em uma refatoração ampla.

Se encontrar problemas não relacionados:

- Não os corrija silenciosamente.
- Registre-os como observações ou aprendizados quando forem relevantes.
- Só altere o código se for necessário para concluir a task ou se o usuário solicitar.

## 5. Documentações

Se o projeto possuir uma convenção explícita para registrar decisões, aprendizados ou documentação técnica, siga essa convenção. Caso contrário, não crie automaticamente uma estrutura de documentação.

## 6. Finalização

Antes de concluir a task:

- Resolva todos os itens do TODO.
- Revise o diff.
- Verifique se mudanças não relacionadas foram introduzidas.
- Registre decisões relevantes.
- Registre aprendizados reutilizáveis.
- Deixe o repositório em um estado consistente para a próxima task.

A documentação deve registrar conhecimento útil para o futuro, não narrar cada passo executado.

## Princípio

O objetivo deste fluxo é transformar uma task em um processo reproduzível:

**entender → investigar → planejar → implementar → validar → registrar conhecimento**.
