# Publicação da versão web

O CotaClara pode ser compilado como aplicação Flutter Web e publicado no Firebase Hosting. Essa configuração é usada somente para hospedar os arquivos estáticos do protótipo; ela não adiciona autenticação, banco de dados, funções ou backend ao projeto.

## Arquivos de configuração

- `web/`: arquivos-base usados pelo Flutter para gerar a aplicação web;
- `.firebaserc`: seleciona o projeto Firebase `cota-clara` como padrão;
- `firebase.json`: publica o conteúdo gerado em `build/web`;
- `.gitignore`: mantém `build/` e o cache local `.firebase/` fora do Git.

O redirecionamento configurado em `firebase.json` envia rotas desconhecidas para `index.html`. Isso permite que a navegação da aplicação continue funcionando quando uma URL é aberta diretamente ou a página é recarregada.

## Pré-requisitos

- Flutter SDK configurado com suporte à plataforma web;
- Node.js instalado;
- Firebase CLI instalada;
- acesso autorizado ao projeto Firebase `cota-clara`.

Para instalar a Firebase CLI:

```bash
npm install -g firebase-tools
```

Faça a autenticação antes da primeira publicação:

```bash
firebase login
firebase use cota-clara
```

## Executar localmente

Instale as dependências e abra a aplicação no Chrome:

```bash
flutter pub get
flutter run -d chrome
```

Essa execução usa o servidor de desenvolvimento do Flutter e não publica nenhuma alteração.

## Gerar a versão de produção

Na raiz do projeto, execute:

```bash
flutter build web --release
```

O resultado será criado em `build/web`. Essa pasta é gerada automaticamente e não deve ser adicionada ao Git.

## Publicar no Firebase Hosting

Depois de gerar a versão de produção:

```bash
firebase deploy --only hosting
```

O comando utiliza o projeto definido em `.firebaserc` e a pasta pública definida em `firebase.json`. Antes de publicar, confirme se a conta autenticada possui acesso ao projeto correto.

## Fluxo recomendado

1. Atualizar as dependências com `flutter pub get`.
2. Verificar a aplicação localmente com `flutter run -d chrome`.
3. Gerar os arquivos com `flutter build web --release`.
4. Conferir se não há alterações inesperadas com `git status`.
5. Publicar com `firebase deploy --only hosting`.

## Arquivos que não entram no Git

- `build/`, incluindo `build/web`;
- `.firebase/`, que armazena cache local da ferramenta;
- credenciais, tokens ou arquivos pessoais de autenticação.

Os arquivos `firebase.json`, `.firebaserc` e `web/` fazem parte da configuração do projeto e devem permanecer versionados.
