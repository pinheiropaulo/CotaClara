# Inventário de interface

Este inventário consolida a análise das referências em `stitch_cotaclara`. A implementação deve avançar uma tela por vez, usando componentes compartilhados sempre que o padrão se repetir.

## Componentes reutilizáveis

### Base

- `AppScaffold`: fundo escuro, largura mobile de até 430 px e áreas seguras;
- `AppTopBar`: voltar, título centralizado e ação contextual;
- `BottomNavigation`: Início, Cotas, Serviços e Perfil;
- botões primário e secundário, com altura mínima de 52 px;
- `StatusBadge`: positivo, atenção, erro e acesso restrito;
- `AppTextField`: rótulo, ícone, erro e foco;
- `InfoCard`: cartão de superfície escura, borda e raio de 16 px.

### Domínio de consórcios

- `QuotaIdentityCard`: categoria, grupo, número e estado;
- `QuotaValueCard`: valor da carta e controle de visibilidade;
- `InstallmentSummaryCard` e `InstallmentRow`;
- `TimelineItem`: assembleia e liberação de crédito;
- `TransactionRow`: lançamentos do extrato;
- `NoticeCard`: avisos e instruções;
- `RestrictedAccessCard`: bloqueio para boleto e ações semelhantes.

### Autenticação

- `BrandMark`: marca geométrica do CotaClara;
- `LoginField`: campo de CPF/CNPJ ou senha;
- `SecurityNotice`: selo no rodapé;
- `AuthenticationFooter`: termos, privacidade e versão;
- recuperação de senha em identificação, código, nova senha e conclusão.

## Assets necessários

| Recurso | Uso | Situação |
| --- | --- | --- |
| Marca CotaClara | Login e cabeçalhos institucionais | Implementada como componente Flutter; não requer arquivo externo agora. |
| Ícones de interface | Navegação, campos, estados e ações | Usar `Material Icons`, já incluído pelo Flutter. |
| Avatar de perfil | Cabeçalhos de Início e Minhas Cotas | Referências usam URLs externas; substituir por imagem licenciada em `assets/images/avatar-perfil.*` antes dessas telas. |
| Screenshots do Stitch | Referência visual | Permanecem em `../stitch_cotaclara`; não devem ser empacotados no app. |

Não há ilustrações, fontes ou outros arquivos locais nas referências. Roboto é a fonte padrão do Flutter; Roboto Flex pode ser incorporada posteriormente para maior equivalência tipográfica.

## Ordem sugerida

1. Login — implementada nesta etapa;
2. Recuperação de senha;
3. Início;
4. Minhas Cotas;
5. Detalhes da Cota;
6. Parcelas e Boleto;
7. Assembleias e Lances;
8. Serviços, Perfil, Notificações, Configurações e Liberação de Crédito.
