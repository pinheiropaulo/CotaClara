# Plano de continuidade das telas

Este guia permite que outro agente continue o protótipo CotaClara sem alterar o escopo, o padrão visual ou a arquitetura adotada até aqui.

## Objetivo e limites

- O aplicativo é um protótipo Flutter com dados e ações locais simuladas.
- Implementar somente o tema escuro enquanto não houver pedido explícito para o tema claro.
- Priorizar o fluxo de cliente com login normal. As telas de **Acesso Restrito** serão tratadas em uma etapa própria.
- Avançar **uma tela ou melhoria visual por vez**. Não agrupar telas independentes na mesma alteração.
- Não incluir backend, Firebase Authentication, pagamentos, downloads, compartilhamento ou envio de lances reais.

## Referências de design

Use primeiro os PNGs exportados em `../CotaClara_Figma`, pois eles permitem comparar espaçamentos, hierarquia e conteúdo visual com precisão. Os SVGs na mesma pasta são complementares para cores, ícones e medidas, mas não devem ser usados como assets do aplicativo.

As imagens anteriores em `../stitch_cotaclara` são apenas uma referência histórica. Quando houver diferença, o PNG do Figma é a fonte de verdade. Caso uma exportação apresente um elemento claramente deslocado — por exemplo, uma barra superior no rodapé — não replique a anomalia sem pedir confirmação.

## Estado atual

### Fluxos já implementados

- Login;
- Início, incluindo a seção **Próximos vencimentos**;
- Minhas Cotas;
- Detalhes da cota de imóvel e de veículo;
- ajuda da cota em bottom sheet;
- Parcelas;
- Boleto da parcela;
- Assembleias;
- Detalhes da assembleia.

As telas usam dados simulados e podem ter ações que exibem uma `SnackBar` de “próxima etapa”. Isso é aceitável enquanto a tela de destino ainda não existir.

### Próximas telas sugeridas

Siga esta ordem, salvo uma nova prioridade do usuário:

1. Bottom sheet **Selecionar cota** da Home;
2. **Oferta de lance**;
3. **Revisar lance**;
4. **Lance enviado**;
5. **Extrato da cota**;
6. **Liberação de crédito**;
7. **Serviços**;
8. **Perfil**;
9. **Configurações**;
10. **Notificações**;
11. **Falar com atendimento**;
12. variações de **Início**, **Parcelas** e **Boleto** com Acesso Restrito.

Após cada tela nova, conectar somente as ações que já possuem um destino implementado. As demais permanecem em estado local simulado.

## Arquitetura a preservar

```text
lib/
  app/
    routes/                 # AppRoutes, GoRouter e helpers de navegação
    theme/                  # AppColors e AppTheme
  features/
    <domínio>/
      <tela>_screen.dart    # composição da tela, sem regras extensas
      data/                 # dados simulados quando a tela precisar deles
      models/               # modelos simples, quando fizer sentido
      widgets/              # cartões, linhas, bottom sheets e seções
  shared/widgets/           # componentes usados por mais de um domínio
```

Regras práticas:

- A tela deve compor widgets; não concentrar cartões, validações ou bottom sheets grandes no arquivo `*_screen.dart`.
- Se um padrão será usado em dois domínios, movê-lo para `lib/shared/widgets/`. Exemplos atuais: `AppTaskTopBar` e `QuotaSelectionCard`.
- Manter dados simulados separados da UI se houver lista, histórico ou mais de um estado possível.
- Usar `go_router`: adicionar a constante em `AppRoutes`, registrar a `GoRoute` em `app_router.dart` e navegar com `context.go` ou `context.push`.
- Para a volta de telas de detalhe, usar `context.goBackOr(fallbackLocation)`.
- Manter `Navigator` somente em fluxos locais, como `showModalBottomSheet`.

## Padrão visual obrigatório

Consulte [design-system.md](design-system.md). Em especial:

- largura mobile entre 360 e 430 px, com `SafeArea`;
- margem horizontal preferencial de 20 px;
- espaçamentos em múltiplos de 8 px;
- cartões com raio de 16 px e borda `AppColors.border`;
- cores e textos através de `AppColors`, sem repetir valores literais quando houver token;
- ícones do Material Icons; não adicionar assets do Figma ao `pubspec.yaml`;
- botões e itens interativos com área de toque mínima de 48 px;
- badges devem combinar texto e cor;
- não usar preto ou branco puro, sombras fortes, gradientes intensos ou linguagem de investimento.

Antes de criar um widget, procure um equivalente em `lib/shared/widgets` e nos widgets da feature atual.

## Roteiro para cada implementação

1. Ler o PNG correspondente em `../CotaClara_Figma` e identificar estrutura, estados, ações e conteúdo.
2. Conferir se a navegação de origem já existe. Caso não exista, criar apenas o caminho necessário para a tela em andamento.
3. Listar mentalmente os componentes que podem ser reutilizados e os que pertencem somente à feature.
4. Criar a tela e seus widgets fora do arquivo principal, com dados simulados coerentes com `design-system.md`.
5. Registrar a rota e conectar o botão de origem quando houver um fluxo claro.
6. Executar:

   ```powershell
   dart format <arquivos alterados>
   dart analyze
   ```

7. Informar ao usuário o que foi criado, quais ações continuam simuladas e quais arquivos foram modificados.

Não criar testes neste momento, salvo pedido explícito do usuário.

## Controle de mudanças e Git

- Há alterações locais em andamento; nunca usar `git reset --hard`, `git checkout --` ou apagar arquivos para limpar o diretório.
- Não criar commits sem autorização explícita. Quando solicitado, sugerir comandos de `git add` específicos aos arquivos da etapa, seguidos de `git diff --cached`.
- `telas.md` não entra no Git e já está excluído localmente. Não adicioná-lo ao staging.
- `.firebase/` é ignorado; a configuração de Hosting existente deve ser preservada.

## Pontos para revisão futura

- Revisar a fidelidade de espaçamentos das telas já criadas à medida que novos PNGs do Figma forem atualizados.
- Ao implementar o bottom sheet de seleção de cota, torná-lo reutilizável nas telas de Início, Parcelas e Assembleias.
- Só adicionar bibliotecas quando uma tela realmente precisar delas. `go_router` já está em uso; `intl`, `share_plus` e `url_launcher` são candidatos futuros, mas não devem ser incluídos antecipadamente.
