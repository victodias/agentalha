---
name: project-analysis
description: Orienta a análise estrutural de projetos existentes, identificando organização, padrões, convenções, responsabilidades e inconsistências sem impor uma arquitetura ideal.
---

# Análise do Projeto

## Objetivo

Analisar um projeto existente para compreender como ele está atualmente organizado.

O objetivo é produzir um mapa prático do projeto que possa ser utilizado por outros agentes durante o desenvolvimento de novas funcionalidades.

A análise deve representar o projeto **como ele é atualmente**, e não como ele deveria ser.

---

# Princípios

## 1. Observe antes de concluir

Não determine a responsabilidade de uma pasta ou arquivo apenas pelo nome.

Examine seu conteúdo, imports, exports e utilização antes de concluir qual é sua finalidade.

Por exemplo, uma pasta chamada `components/` pode conter:

- componentes reutilizáveis;
- componentes específicos de uma funcionalidade;
- componentes utilizados por apenas uma página;
- componentes que poderiam estar em outra localização, mas seguem o padrão atual do projeto.

A documentação deve representar o comportamento observado.

---

## 2. Não imponha uma arquitetura

O objetivo desta análise não é propor uma nova arquitetura.

Não reorganize ou modifique o projeto para seguir padrões considerados ideais.

Não presuma que o projeto deve utilizar:

- Feature-based Architecture;
- Atomic Design;
- Clean Architecture;
- Hexagonal Architecture;
- DDD;
- Repository Pattern;
- Service Layer;
- ou qualquer outro padrão arquitetural.

Esses padrões somente devem ser documentados quando houver evidências de que já são utilizados no projeto.

---

## 3. Identifique padrões existentes

Procure padrões que aparecem repetidamente no código.

Exemplos:

- organização de páginas;
- organização de componentes;
- localização de hooks;
- localização de chamadas de API;
- gerenciamento de estado;
- criação de formulários;
- validação;
- nomenclatura de arquivos;
- nomenclatura de componentes;
- organização de testes;
- roteamento;
- tratamento de erros.

Quando um padrão aparecer repetidamente, documente-o como uma convenção existente.

---

## 4. Não generalize a partir de uma única ocorrência

Uma única ocorrência não é suficiente para determinar uma convenção do projeto.

Por exemplo, encontrar:

`components/campaign/CampaignDialog.tsx`

não significa necessariamente que todos os componentes de uma funcionalidade devem ficar em uma subpasta dentro de `components/`.

Procure exemplos adicionais antes de estabelecer uma regra.

---

## 5. Documente inconsistências

Projetos existentes podem possuir diferentes padrões ao longo do código.

Isso é informação importante para futuros agentes.

Por exemplo:

- algumas páginas possuem hooks próprios;
- outras utilizam hooks compartilhados;
- alguns componentes específicos ficam em `components/`;
- outros ficam próximos da página;
- algumas APIs são acessadas através de services;
- outras são acessadas diretamente por hooks.

Não tente corrigir essas inconsistências.

Documente-as quando forem relevantes para orientar futuras implementações.

---

## 6. Diferencie fato de interpretação

Sempre que possível, baseie as conclusões em evidências observadas no código.

Prefira:

> `pages/` contém componentes que centralizam a composição das telas.

Em vez de:

> `pages/` é a camada de apresentação da aplicação.

A primeira afirmação descreve o que foi observado.

A segunda pode representar uma interpretação arquitetural que talvez não seja verdadeira.

---

# Processo de análise

## 1. Reconhecer a estrutura geral

Comece identificando os principais diretórios e arquivos do projeto.

Observe especialmente:

- diretório principal da aplicação;
- diretórios de código-fonte;
- páginas;
- componentes;
- componentes de UI;
- hooks;
- serviços;
- API;
- estado;
- tipos;
- schemas;
- utilitários;
- estilos;
- assets;
- testes;
- configuração;
- roteamento;
- autenticação e autorização.

Não é necessário documentar todos os arquivos individualmente.

Priorize estruturas que sejam úteis para localizar código durante o desenvolvimento.

---

## 2. Analisar arquivos representativos

Depois de identificar os diretórios importantes, examine arquivos representativos de cada estrutura.

Para cada arquivo relevante, observe:

- imports;
- exports;
- dependências;
- quem utiliza o arquivo;
- quem o arquivo utiliza;
- responsabilidade;
- padrões de implementação;
- relação com outras partes do sistema.

O objetivo é compreender não apenas onde os arquivos estão, mas **por que eles estão naquela localização**.

---

## 3. Analisar as páginas

Identifique como as páginas são construídas.

Procure entender:

- onde ficam os arquivos de página;
- como os componentes da tela são organizados;
- se páginas possuem componentes auxiliares;
- onde ficam formulários;
- onde ficam tabelas;
- onde ficam filtros;
- onde ficam hooks relacionados;
- como as páginas acessam dados.

Documente o padrão realmente observado.

---

## 4. Analisar os componentes

Identifique:

- componentes compartilhados;
- componentes específicos de funcionalidades;
- componentes de UI;
- componentes utilizados por poucas partes do sistema;
- padrões de composição;
- convenções de nomenclatura.

Não assuma que um componente é compartilhado apenas porque está em uma pasta chamada `components`.

Verifique seus usos quando necessário.

---

## 5. Analisar componentes de UI

Caso exista uma estrutura como:

`components/ui/`

analise seu conteúdo e determine sua responsabilidade real.

Por exemplo, pode conter:

- inputs;
- selects;
- botões;
- modais;
- componentes de formulário;
- componentes visuais genéricos.

Documente o que realmente for encontrado.

---

## 6. Analisar gerenciamento de estado

Identifique:

- estado local;
- estado global;
- estado de servidor;
- bibliotecas utilizadas;
- localização dos stores;
- padrões de criação e consumo.

Caso existam diferentes mecanismos de estado, documente cada um e onde são utilizados.

---

## 7. Analisar comunicação com APIs

Identifique como o frontend se comunica com o backend.

Procure por:

- clients HTTP;
- services;
- hooks;
- React Query ou outras bibliotecas;
- funções de request;
- interceptors;
- tratamento de erros;
- transformação de dados.

Documente os padrões encontrados.

---

## 8. Analisar formulários e validação

Identifique:

- biblioteca utilizada para formulários;
- schemas;
- validações;
- componentes de formulário;
- onde ficam as regras;
- como os dados são enviados.

Procure exemplos reais antes de determinar o padrão.

---

## 9. Analisar roteamento

Identifique:

- biblioteca de roteamento;
- localização das rotas;
- organização dos arquivos;
- layouts;
- rotas protegidas;
- parâmetros;
- convenções utilizadas.

---

## 10. Analisar testes

Identifique:

- ferramentas utilizadas;
- localização dos testes;
- nomenclatura;
- testes unitários;
- testes de integração;
- testes end-to-end;
- relação entre testes e código de produção.

---

## 11. Identificar convenções

Procure padrões relacionados a:

### Nomenclatura

- arquivos;
- componentes;
- hooks;
- funções;
- variáveis;
- tipos;
- interfaces.

### Organização

- localização de componentes;
- localização de hooks;
- localização de services;
- localização de tipos;
- localização de testes.

### Implementação

- gerenciamento de estado;
- chamadas de API;
- formulários;
- validação;
- tratamento de erros;
- composição de componentes.

Documente apenas convenções sustentadas por exemplos suficientes.

# Análise de inconsistências

Ao encontrar diferentes abordagens para o mesmo problema, registre a inconsistência.

Exemplo:

```text
Alguns componentes específicos de páginas estão localizados em
`components/`, enquanto outros permanecem próximos aos arquivos
responsáveis pela página.

Não foi identificada uma regra consistente que determine quando cada
abordagem deve ser utilizada.
```

# Sugerir melhorias

Durante a análise, identifique oportunidades de melhoria que possam trazer benefícios relevantes para manutenção, reutilização, legibilidade, consistência ou evolução do código.

As sugestões devem:

- ser baseadas em problemas ou padrões observados no código;
- considerar o contexto e os padrões atuais do projeto;
- ser incrementais e compatíveis com a estrutura existente;
- evitar mudanças arquiteturais abrangentes sem necessidade;
- explicar brevemente o benefício esperado;
- indicar os arquivos ou trechos envolvidos sempre que possível.

Não proponha mudanças apenas porque existe uma arquitetura ou padrão considerado mais moderno ou ideal.

Evite sugestões como:

- "migrar toda a aplicação para Feature-based Architecture";
- "refatorar toda a tela para uma nova estrutura de componentes";
- "mover todos os componentes para suas respectivas features";
- "substituir a biblioteca atual por outra".

Prefira melhorias incrementais e contextualizadas, como:

- No arquivo `Atendimento.tsx`, existem regras de negócio relacionadas a X e Y diretamente no componente. Considere abstraí-las para um hook específico, caso essas regras continuem crescendo ou precisem ser reutilizadas.

- A modal `XModal.tsx` possui responsabilidades de apresentação e regras específicas de negócio. Considere separar essas responsabilidades para facilitar sua composição e reutilização em outros fluxos.

- A formatação de datas é realizada manualmente em diferentes arquivos. Considere criar um helper compartilhado para centralizar esse comportamento e evitar duplicação.

- Existem múltiplas implementações semelhantes de um determinado comportamento. Considere avaliar se uma abstração compartilhada reduziria duplicação sem aumentar desnecessariamente a complexidade.

### Critério para sugerir uma melhoria

Não sugira uma melhoria simplesmente porque o código poderia ser escrito de outra forma.

Priorize sugestões quando houver evidências de que a mudança pode:

- reduzir duplicação relevante;
- melhorar a reutilização;
- reduzir responsabilidades excessivas em um arquivo;
- facilitar testes;
- melhorar legibilidade;
- corrigir uma inconsistência recorrente;
- facilitar futuras alterações;
- reduzir risco de comportamento divergente.

Quando a melhoria depender de uma evolução futura, deixe isso explícito.

Exemplo:

> `Atendimento.tsx` concentra atualmente as regras X e Y. Enquanto o componente ainda possui baixa complexidade, a abstração pode não ser necessária. Caso novas regras sejam adicionadas, um hook específico pode ajudar a separar a lógica da apresentação.

Não transforme toda oportunidade identificada em uma recomendação obrigatória.