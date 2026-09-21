---
name: git
description: Define boas práticas para trabalhar com Git durante o desenvolvimento, protegendo alterações existentes e mantendo o escopo das mudanças controlado.
---

# Git

## Objetivo

Utilizar Git como mecanismo de segurança e inspeção durante o desenvolvimento, sem interferir indevidamente no trabalho existente.

## Antes de implementar

Sempre que possível, verificar o estado atual do repositório.

Identificar:

* alterações não commitadas;
* arquivos modificados;
* arquivos novos;
* alterações staged;
* branch atual.

Isso permite distinguir alterações preexistentes das alterações realizadas durante a task.

## Preservar alterações existentes

Nunca:

* sobrescrever alterações não relacionadas;
* descartar modificações existentes;
* executar comandos destrutivos sem autorização explícita;
* assumir que uma alteração existente foi criada pelo agente.

Se um arquivo já possuir alterações, preservá-las.

## Durante a implementação

Manter as alterações focadas na task.

Evitar:

* refatorações oportunistas;
* formatação de arquivos não relacionados;
* alterações em configurações sem necessidade;
* mudanças de dependências sem justificativa;
* limpeza de código fora do escopo.

## Revisão do diff

Após implementar, revisar:

```text
git status
git diff
```

Quando relevante, revisar também alterações staged.

Verificar:

* arquivos alterados;
* linhas modificadas;
* arquivos criados/removidos;
* alterações inesperadas;
* mudanças fora do escopo.

## Commits

Não criar commits automaticamente, salvo quando isso fizer parte explícita da task ou houver instrução específica para fazê-lo.

Quando solicitado a criar um commit:

* incluir somente alterações relacionadas;
* revisar o diff antes;
* utilizar uma mensagem clara e consistente com o projeto.

## Comandos destrutivos

Não executar automaticamente comandos que possam causar perda de trabalho.

Exemplos:

* `git reset --hard`;
* `git checkout -- <arquivo>`;
* `git restore <arquivo>`;
* remoção forçada de arquivos;
* operações equivalentes.

Se uma operação destrutiva for realmente necessária, solicitar confirmação antes.

## Conflitos

Se houver conflito entre alterações existentes e a implementação:

1. preservar o trabalho existente;
2. identificar a origem do conflito;
3. tentar adaptar a implementação sem descartar alterações;
4. solicitar orientação se não for possível resolver com segurança.

## Princípio

> O trabalho existente pertence ao usuário. O agente deve protegê-lo.

## Resultado esperado

Ao finalizar uma task, deve ser possível identificar claramente:

* quais alterações já existiam;
* quais alterações foram realizadas pelo agente;
* quais arquivos foram modificados;
* por que cada alteração faz parte da task.
