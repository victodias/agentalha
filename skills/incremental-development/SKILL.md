---
name: incremental-development
description: Desenvolve tarefas em etapas com checkpoints e autorização do usuário entre subtasks. Use quando o usuário solicitar modo incremental, desenvolvimento por etapas, checkpoints, uma subtask por vez ou aprovação antes de continuar. Não use para tarefas que devem ser implementadas integralmente no mesmo turno.
---

# Incremental Development

## Objetivo

Esta skill é um fluxo completo e alternativo à `feature-development`.

Ela é responsável por análise, planejamento, implementação incremental,
validação e finalização.

Não carregue `feature-development` durante esta execução.

## Planejamento

Antes de editar o código:

1. Leia a descrição completa da tarefa.
2. Identifique o objetivo, o comportamento esperado e as regras de negócio.
3. Inspecione a estrutura relevante do projeto.
4. Procure implementações semelhantes.
5. Identifique arquivos, componentes, hooks, services, APIs, stores, queries,
   tipos e testes relacionados.
6. Identifique convenções, riscos, dependências e possíveis efeitos colaterais.
7. Determine quais skills técnicas adicionais são relevantes.
8. Divida a implementação em subtasks pequenas, ordenadas e verificáveis.
9. Crie `.claude/tasks/<identificador>.md`.
10. Registre o objetivo, o TODO, os critérios de conclusão e o próximo passo.
11. Não altere o código da aplicação durante o planejamento.
12. Apresente o plano e encerre o turno aguardando aprovação.

## Execução

Após a aprovação:

1. Leia o arquivo da tarefa.
2. Implemente exatamente uma subtask pendente.
3. Execute as validações relevantes para essa subtask.
4. Atualize o progresso no arquivo.
5. Informe:
   - o que foi implementado;
   - os arquivos alterados;
   - as validações executadas;
   - a próxima subtask.
6. Encerre o turno.

Não inicie outra subtask sem autorização explícita do usuário.

Se a subtask atual for grande demais, subdivida-a antes de implementar e
apresente o plano atualizado.

## Arquivo de acompanhamento

Após analisar a tarefa e antes de alterar o código da aplicação, crie um
arquivo temporário em:

`.claude/tasks/<identificador>.md`

Use a pasta `.claude/tasks/` do harness. Não crie o arquivo dentro da pasta
`.claude/` do repositório da aplicação.

### Nome do arquivo

Determine o nome nesta ordem:

1. Se o usuário informar explicitamente o número da task, use somente esse
   número como nome.

   Exemplos:

   - Task `1234` → `.claude/tasks/1234.md`
   - US `9876` → `.claude/tasks/9876.md`
   - `#456` → `.claude/tasks/456.md`

2. Não interprete datas, números de versão ou outros valores numéricos como
   identificador da task.

3. Se nenhum número de task for informado, crie um identificador curto em
   kebab-case baseado no objetivo principal.

   Exemplos:

   - Implementar filtro de atendimentos
     → `.claude/tasks/filtro-atendimentos.md`
   - Adicionar envio de anexos no chat
     → `.claude/tasks/envio-anexos-chat.md`

4. Se o arquivo já existir e representar a mesma tarefa, reutilize-o e
   continue a partir do progresso registrado.

5. Se houver colisão de nome com uma tarefa diferente, acrescente um
   qualificador curto ao nome em vez de sobrescrever o arquivo existente.

### Data

No início do arquivo, registre:

- a data em que o desenvolvimento incremental foi iniciado;
- a data da última atualização.

Use o formato ISO `YYYY-MM-DD`.

Preserve a data de início durante toda a tarefa e atualize somente a data da
última atualização.

## TODO da tarefa

O arquivo de acompanhamento deve conter um TODO ordenado com todas as
subtasks necessárias para concluir a tarefa.

Cada item deve:

- representar uma entrega pequena e verificável;
- ter um critério claro de conclusão;
- poder ser implementado e validado isoladamente;
- refletir seu estado atual.

Use os seguintes estados:

- `[ ]` pendente;
- `[~]` em andamento;
- `[x]` concluída;
- `[!]` bloqueada.

Implemente somente uma subtask por turno.

Antes de iniciar uma subtask, marque-a como em andamento. Após implementar
e validar, marque-a como concluída. Registre bloqueios e alterações no plano
no mesmo arquivo.

Se uma subtask se mostrar grande demais, substitua-a por subtasks menores
antes de editar o código.

## Finalização

Quando todas as subtasks estiverem concluídas:

1. Execute a validação final apropriada.
2. Apresente o resultado completo.
3. Aguarde a confirmação final do usuário.
4. Remova o arquivo temporário somente após essa confirmação.