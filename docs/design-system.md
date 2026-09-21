# Design system do CotaClara

Este documento registra as decisões de interface para manter as telas do protótipo consistentes durante a implementação em Flutter.

## Diretrizes gerais

- Plataforma mobile Android e iOS, com referência de largura entre 360 e 430 px.
- Família tipográfica: Roboto.
- Espaçamentos em múltiplos de 8 px e margem horizontal preferencial de 20 px.
- Cantos de cartões e campos: 16 px, salvo componentes compactos.
- Ícones lineares do Material Symbols.
- Áreas interativas com pelo menos 48 px de altura ou largura.
- Respeitar as áreas seguras superior e inferior.

## Tema claro

| Token | Cor | Uso |
| --- | --- | --- |
| Fundo | `#F6F8FB` | Fundo geral |
| Superfície | `#FFFFFF` | Cartões e campos |
| Primária | `#244A64` | Cartões financeiros e identidade |
| Destaque | `#2A9D8F` | Ação principal e item ativo |
| Texto principal | `#17212B` | Títulos e valores |
| Texto secundário | `#66727D` | Rótulos e informações auxiliares |
| Sucesso | `#238A63` | Estados confirmados |
| Alerta | `#D98B24` | Pendências e atenção |
| Erro | `#C94B4B` | Erros e vencimentos |

## Tema escuro

| Token | Cor | Uso |
| --- | --- | --- |
| Fundo | `#090D11` | Fundo geral |
| Superfície | `#111820` | Cartões comuns |
| Superfície elevada | `#18222B` | Ícones, seleção e painéis auxiliares |
| Superfície sutil | `#0D1319` | Navegação inferior |
| Borda | `#25313B` | Separação de superfícies |
| Texto principal | `#F0F4F7` | Títulos e valores |
| Texto secundário | `#9EACB8` | Rótulos e informações auxiliares |
| Ícones e links | `#8DBDDC` | Ícones e ações secundárias |
| Cartão financeiro | `#173B52` | Carta de crédito e destaques financeiros |
| Ação principal | `#4FC6B6` | Botões e item ativo |
| Texto sobre ação | `#062B26` | Texto de botão principal |
| Sucesso | `#63C79D` sobre `#122C24` | Estado positivo |
| Alerta | `#F3B75C` sobre `#302516` | Estado pendente ou de atenção |
| Erro | `#FF8A8A` sobre `#351D20` | Estado vencido ou de erro |

No tema escuro, não usar preto puro, branco puro, neon, gradientes intensos ou sombras fortes.

## Componentes recorrentes

### Cabeçalhos

As telas principais usam título, texto auxiliar, notificações e avatar. Telas de detalhe usam voltar, título centralizado e uma ação contextual, como ajuda, download ou menu. No tema escuro, o cabeçalho se integra ao fundo geral.

### Cartão de identificação da cota

Exibe ícone da categoria, nome da cota, grupo, número e badge de estado. Quando a troca de cota for permitida, inclui uma seta e abre um seletor inferior simulado.

### Cartão de carta de crédito

É o principal destaque financeiro. Apresenta o valor da carta com rótulo claro, controle visual de ocultar ou exibir e um estado contextual. No escuro usa `#173B52`; não deve usar brilho ou gradiente intenso.

### Badges de estado

Badges sempre exibem texto, além da cor:

- positivo: Ativa, Paga, Confirmada, Contemplada ou Concluída;
- alerta: Pendente, Em análise ou Documentação pendente;
- erro: Vencida, Erro ou Ação indisponível.

### Navegação inferior

Contém Início, Cotas, Serviços e Perfil. O item ativo é destacado por cor e peso, sem cápsulas grandes. Deve respeitar a área segura inferior.

## Regras de conteúdo

- Não chamar a atualização da carta de “rendimento”, “lucro” ou “rentabilidade”.
- Mostrar “Atualização da carta” somente em Detalhes da Cota, como valor acumulado desde a contratação.
- O Extrato reúne pagamentos, ajustes, estornos e outros lançamentos registrados, sem gráfico ou rendimento mensal.
- “Documentos da Cota” não é uma funcionalidade do MVP. Boletos, comprovantes, atas e documentos pendentes continuam em seus fluxos próprios.
- Não inserir conteúdo comercial, promocional ou gráficos sem finalidade definida.

## Dados simulados de referência

Para manter coerência entre telas, os exemplos podem usar a cota fictícia abaixo:

- Cota: Cota de imóvel
- Grupo: 012160
- Número: 6503
- Valor contratado: R$ 80.000,00
- Valor atual da carta: R$ 84.280,00
- Atualização acumulada: R$ 4.280,00 (5,35%)
- Parcela de referência: R$ 842,50

Esses dados são ilustrativos e não representam condições de uma administradora ou contrato real.
