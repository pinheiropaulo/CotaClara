# Fluxo de acesso restrito

Este documento descreve a jornada visual de acesso do protótipo CotaClara. A restrição é simulada localmente: não há backend, persistência, validação de credenciais ou proteção real de dados.

## Etapa 1 — Acesso inicial

Ao abrir o aplicativo sem uma sessão simulada, a pessoa é direcionada para **Login**. As áreas que exibem dados da cota e ações da conta permanecem indisponíveis.

## Etapa 2 — Login

Na tela de **Login**, a pessoa informa dados de acesso fictícios e confirma a entrada. Quando a entrada simulada é concluída, o aplicativo cria uma sessão apenas no estado local da interface.

## Etapa 3 — Áreas liberadas

Com a sessão simulada ativa, ficam disponíveis:

- **Início**;
- **Minhas Cotas** e seus detalhes;
- **Serviços**;
- **Perfil** e configurações;
- fluxos relacionados, como parcelas, assembleias, lances e liberação de crédito.

Essas telas não devem ser acessíveis por atalhos de interface quando não houver sessão simulada.

## Etapa 4 — Recuperação de senha

Quando a pessoa seleciona **Recuperar Senha**, a jornada segue nesta ordem:

1. identificação;
2. validação de código;
3. criação de nova senha;
4. confirmação da conclusão.

Ao finalizar, a pessoa retorna ao **Login** para entrar com a nova senha simulada.

## Etapa 5 — Encerramento da sessão

Ao encerrar a sessão simulada, ou ao reiniciar o estado local do protótipo, as áreas restritas voltam a ficar indisponíveis e o **Login** é exibido novamente.

## Limites do protótipo

Este fluxo é exclusivamente uma representação de interface. Ele não protege dados, não verifica credenciais e não deve ser usado como mecanismo de segurança em produção.
