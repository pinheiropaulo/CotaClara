# Organização prevista do projeto

Este documento descreve uma organização sugerida para o código à medida que as telas do CotaClara forem implementadas. Não corresponde, necessariamente, à estrutura atual do repositório.

## Estrutura sugerida

```text
lib/
  app/
    app.dart
    routes.dart
    theme/
  data/
    mock/
  features/
    auth/
    home/
    quotas/
    installments/
    assemblies/
    credit_release/
    services/
    profile/
  shared/
    widgets/
    models/
```

## Responsabilidades

- `app/`: inicialização, rotas e tema da aplicação;
- `data/mock/`: dados fictícios usados nas demonstrações;
- `features/`: telas, estado e regras de apresentação agrupados por fluxo;
- `shared/widgets/`: componentes reutilizáveis entre funcionalidades;
- `shared/models/`: modelos compartilhados pela interface.

## Evolução

A estrutura pode ser ajustada conforme os fluxos forem implementados, desde que dados simulados, tema, componentes reutilizáveis e navegação permaneçam separados de forma clara.
