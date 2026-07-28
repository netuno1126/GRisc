# GRisc — Dashboard de Gestão de Riscos (SEEx)

## O que já está pronto
- **Banco Supabase criado**: projeto "GRisc" (região sa-east-1), com as 48 tabelas do Access replicadas em Postgres.
- **RLS habilitado** em todas as tabelas: leitura pública (sem login, conforme solicitado), exceto `usuarios` (bloqueada — guarda credenciais e só deverá ser usada quando a autenticação for implementada).
- **Dashboard (index.html)**: página única, sem build, conectada via Supabase JS (CDN). Navegação lateral com todas as 48 tabelas + painel geral com indicadores.

## Importar o restante dos dados
Alguns lotes de dados já foram inseridos (glossário, ações a executar). Para importar o restante:
1. Abra o SQL Editor do seu projeto Supabase (https://supabase.com/dashboard/project/ksvdgszmivfrnjmbkynn/sql/new)
2. Cole o conteúdo de `dados_completos_import.sql` e rode. Os INSERTs já usam nomes de tabela/coluna traduzidos para o schema Postgres.
3. Caso alguma linha já exista (chave duplicada), rode em blocos menores ou adicione `ON CONFLICT DO NOTHING` conforme necessário.

## Deploy no Netlify
1. Crie um repositório vazio no GitHub (você já tem: https://github.com/netuno1126/GRisc)
2. Suba este conteúdo:
   ```
   git init
   git add .
   git commit -m "GRisc dashboard inicial"
   git branch -M main
   git remote add origin https://github.com/netuno1126/GRisc.git
   git push -u origin main
   ```
3. No Netlify: "Add new site" → "Import from Git" → selecione o repositório `GRisc`. Não precisa de build command (é HTML estático) — publish directory: raiz (`/`).

## Credenciais do Supabase usadas no frontend
- URL: https://ksvdgszmivfrnjmbkynn.supabase.co
- Chave pública (publishable/anon): já embutida no `index.html` — é segura para uso público pois protegida por RLS.

## Próximos passos sugeridos
- Implementar Supabase Auth (login) e então liberar acesso à tabela `usuarios` e políticas de escrita (INSERT/UPDATE) por perfil.
- Adicionar formulários de cadastro/edição de Riscos e Planos de Ação (hoje o dashboard é somente leitura).
