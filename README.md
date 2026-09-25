# CotaClara

Protótipo mobile em Flutter para demonstrar uma experiência mais clara e organizada de acompanhamento de consórcios. O projeto redesenha fluxos comuns de uma administradora, com identidade própria, para apresentar navegação, hierarquia de informações e estados visuais.

O CotaClara é uma demonstração de conceito. Seus dados, ações e jornadas serão simulados localmente; não há integração com backend, banco de dados ou serviços financeiros.

## Objetivo

Permitir que uma pessoa visualize, em um único aplicativo, as principais informações e ações associadas a uma cota de consórcio:

- consultar cotas e detalhes da carta de crédito;
- acompanhar parcelas, boletos e movimentações;
- consultar assembleias e enviar ofertas de lance simuladas;
- acompanhar a liberação de crédito;
- acessar serviços, notificações e preferências da conta.

## Escopo do protótipo

As telas representam dados fictícios e interações de interface. Elementos como CPF, valores, datas, boletos, documentos e estados de uma cota existem apenas para tornar a demonstração realista.

O protótipo poderá simular:

- login e recuperação de senha;
- seleção entre cotas fictícias;
- visualização ou ocultação de valores;
- filtros, chips, abas e estados de telas;
- navegação entre fluxos;
- alternância entre tema claro e escuro, quando implementada.

## Fluxo de acesso restrito

O acesso às áreas de cota e conta é uma restrição visual baseada em sessão simulada local. A jornada foi dividida em etapas — acesso inicial, login, áreas liberadas, recuperação de senha e encerramento da sessão — em [docs/acesso-restrito.md](docs/acesso-restrito.md).

## Fora do escopo

O projeto não terá:

- API, backend ou banco de dados;
- autenticação, biometria ou recuperação de senha reais;
- controle de acesso, sessão persistente ou proteção de dados reais;
- emissão, pagamento, download ou compartilhamento real de boletos;
- envio de documentos ou análise de crédito;
- envio de lances, participação em assembleias ou operações financeiras reais;
- notificações push, e-mail, SMS ou armazenamento de dados do usuário.

## Telas e fluxos

O MVP cobre os seguintes fluxos visuais:

| Área | Telas principais |
| --- | --- |
| Navegação | Início, Minhas Cotas, Serviços e Perfil |
| Cotas | Detalhes da Cota, Parcelas, Boleto da Parcela e Extrato da Cota |
| Assembleias e lances | Assembleias, Detalhes da Assembleia, Oferta de Lance, Revisar Lance e Lance Enviado |
| Crédito | Liberação de Crédito |
| Conta | Notificações, Configurações, Login e Recuperar Senha |

As versões em tema escuro preservam conteúdo, estrutura, espaçamentos e ações das telas claras. A documentação do design system está em [docs/design-system.md](docs/design-system.md).

## Princípios de interface

- Linguagem clara e objetiva para informações de consórcio.
- Dados financeiros apresentados com contexto, sem caracterizar a cota como investimento.
- Atualização acumulada da carta exibida somente em **Detalhes da Cota**.
- Sem área genérica de “Documentos da Cota”; comprovantes, boletos, atas e pendências pertencem aos fluxos específicos.
- Layout exclusivamente mobile, com atenção a telas entre 360 e 430 px.
- Fonte Roboto, áreas de toque adequadas e contraste legível nos dois temas.

## Executar o projeto

Pré-requisitos: Flutter SDK compatível com Dart `^3.13.3` e um emulador, dispositivo Android ou navegador Chrome configurado.

```bash
flutter pub get
flutter run
```

Para executar a versão web:

```bash
flutter run -d chrome
```

Para verificar a qualidade estática do código:

```bash
flutter analyze
```

## Publicação web

O projeto possui configuração para gerar a versão Flutter Web e publicá-la no Firebase Hosting. O Firebase é utilizado somente como hospedagem dos arquivos estáticos e não altera o escopo local e simulado do protótipo.

O processo completo de configuração, build e publicação está documentado em [docs/publicacao-web.md](docs/publicacao-web.md).

## Organização prevista

A estrutura sugerida para separar dados simulados, tema, componentes reutilizáveis e fluxos de navegação está em [docs/organizacao-do-projeto.md](docs/organizacao-do-projeto.md). Ela é uma orientação arquitetural, não a estrutura já implementada.

## Referências

- [Design system e decisões de interface](docs/design-system.md)
- [Fluxo de acesso restrito](docs/acesso-restrito.md)
- [Organização prevista do projeto](docs/organizacao-do-projeto.md)
- [Inventário de componentes e assets](docs/inventario-de-interface.md)
- [Plano de continuidade das telas](docs/plano-continuidade-telas.md)
- [Publicação da versão web](docs/publicacao-web.md)
- [Flutter documentation](https://docs.flutter.dev/)
