# GRisc — Dashboard de Gestão de Riscos (SEEx)

## Novidades desta versão
- **Login real (Supabase Auth)**: botão "Entrar" no topo, com abas de Entrar / Criar conta.
- **Inserir, editar e excluir**: liberado em **todas as 48 tabelas**, mas só depois de logado. Sem login, tudo continua somente leitura.
- Formulários são gerados automaticamente a partir da estrutura de cada tabela (nome, tipo, obrigatoriedade, chave primária).
- A tabela `usuarios` (login antigo do Access, com senhas em texto puro) continua **totalmente bloqueada** — não é usada pelo novo sistema de login.

## Como criar o primeiro usuário
1. Abra o dashboard, clique em **Entrar** → aba **Criar conta**.
2. Informe e-mail e senha. Por padrão o Supabase pode pedir confirmação por e-mail antes do primeiro acesso — se isso travar o fluxo, no painel do Supabase vá em **Authentication → Providers → Email** e desative "Confirm email" (recomendado só enquanto o sistema estiver em fase interna/teste).
3. Depois de logado, os botões "Novo registro", "Editar" e "Excluir" aparecem em todas as tabelas do menu lateral.

## O que já está pronto
- Banco Supabase (projeto "GRisc", região sa-east-1) com as 48 tabelas do Access.
- RLS: leitura pública; escrita (insert/update/delete) restrita a usuários autenticados; `usuarios` totalmente bloqueada.
- Dashboard single-page (sem build) com navegação lateral, busca, paginação e CRUD completo.

## Importar o restante dos dados originais do Access
Alguns lotes já foram inseridos (glossário, ações a executar). Para o restante:
1. Abra o SQL Editor do projeto: https://supabase.com/dashboard/project/ksvdgszmivfrnjmbkynn/sql/new
2. Cole o conteúdo de `dados_completos_import.sql` e rode.

## Deploy no Netlify
1. Suba este conteúdo para https://github.com/netuno1126/GRisc:
   ```
   git init
   git add .
   git commit -m "GRisc dashboard com login e CRUD"
   git branch -M main
   git remote add origin https://github.com/netuno1126/GRisc.git
   git push -u origin main
   ```
2. No Netlify: "Add new site" → "Import from Git" → repositório `GRisc`. Sem build command, publish directory = raiz.

## Melhorias futuras sugeridas
1. **Perfis e permissões (RBAC)** — hoje qualquer usuário autenticado pode editar qualquer tabela. Próximo passo: níveis de permissão (ex.: leitor, gestor de OM, administrador), usando uma tabela `perfis` ligada a `auth.users` e políticas RLS por papel.
2. **Validação de formulário mais rica** — campos com opções fixas (ex. Classificação do Risco, Probabilidade) hoje são texto livre; dá para transformar em listas suspensas ligadas às tabelas de categorização.
3. **Relacionamentos visuais** — ligar Riscos → Planos de Ação → Controles em uma única tela (hoje são tabelas separadas).
4. **Painel de indicadores (BI)** — gráficos de risco por categoria, matriz de probabilidade x impacto, riscos por OM.
5. **Anexos/evidências** — usar o Supabase Storage para upload de arquivos (hoje só há campos de texto referenciando caminhos locais do Windows, ex. `C:\GRisk\...`, que não funcionam na web).
6. **Auditoria (log de alterações)** — registrar quem editou o quê e quando, útil para um sistema institucional.
7. **Substituir a tabela legada `usuarios`** — migrar de vez para o Supabase Auth e aposentar o login antigo do Access.
