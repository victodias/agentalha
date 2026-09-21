---
name: verification
description: Valida implementações após alterações, verificando comportamento, tipos, lint, testes, build e escopo das mudanças.
---

# Verification

## Objetivo

Garantir que a implementação atende à task sem introduzir regressões ou alterações desnecessárias.

A implementação não deve ser considerada concluída apenas porque o código foi escrito.

## Processo

Após implementar:

### 1. Revisar a task

Confirmar:

* todos os requisitos foram atendidos;
* casos relevantes foram considerados;
* nenhum requisito foi interpretado incorretamente;
* não houve alteração desnecessária de escopo.

### 2. Revisar o diff

Inspecionar as alterações realizadas.

Verificar:

* arquivos modificados;
* código removido;
* código adicionado;
* alterações acidentais;
* mudanças de formatação sem relação com a task;
* alterações fora do escopo.

### 3. Typecheck

Executar o mecanismo de verificação de tipos disponível no projeto quando aplicável.

Corrigir erros introduzidos pela implementação.

Não mascarar erros utilizando `any`, casts ou outras soluções apenas para fazer o typecheck passar.

### 4. Lint e formatação

Executar as ferramentas configuradas pelo projeto.

Respeitar as configurações existentes em vez de impor novas regras.

### 5. Testes

Executar os testes relevantes para a alteração.

Priorizar:

1. testes diretamente relacionados;
2. testes da feature;
3. testes de integração relevantes;
4. suíte completa quando apropriado.

Se um comportamento novo ou bug corrigido justificar um teste, adicioná-lo.

### 6. Build

Executar o build quando:

* houver alteração estrutural relevante;
* houver alteração de configuração;
* a task puder afetar o processo de build;
* o projeto normalmente exigir build como validação.

Não executar comandos caros ou demorados sem necessidade quando validações menores forem suficientes.

## Falhas

Se alguma validação falhar:

1. identificar se a falha foi causada pela alteração;
2. corrigir quando estiver dentro do escopo;
3. executar novamente a validação;
4. se não for causada pela alteração, registrar claramente a falha.

Nunca afirmar que uma implementação foi completamente validada quando uma validação relevante não foi executada ou falhou.

## Verificação final

Antes de finalizar, confirmar:

```text
[ ] Task atendida
[ ] Diff revisado
[ ] Typecheck executado, quando aplicável
[ ] Lint executado, quando aplicável
[ ] Testes relevantes executados
[ ] Build executado, quando aplicável
[ ] Nenhuma alteração acidental
[ ] Nenhum arquivo fora do escopo alterado sem justificativa
```

## Princípio

> Código implementado não é código concluído. Código concluído é código implementado, validado e revisado.
