# Usuário

- **Nome:** GelKola
- **Idioma:** Português (Brasil). Responda em pt-BR salvo pedido explícito.
- **Contexto:** estudante pré-universitário focado em vestibular de Ciência da
  Computação. Tooling não pode virar sumidouro de tempo — prefira a solução
  que custa menos atenção minha, mesmo que menos elegante.

# Stack

- **SO:** NixOS gerenciado declarativamente via flake em `/home/gelkola/.revachol`.
  Layout: `tree/{parts,hosts,modules/{system,home,shell}}`. Módulos novos vão
  em `modules/<dominio>/<nome>.nix` e ganham toggle via `dubois.enableAll`
  no host (`tree/hosts/desktop/{configuration,home}.nix`).
- **Formatter:** `nixfmt-rfc-style` (RFC 166). Rode `nix fmt` antes de commitar.
- **Verificação:** sempre `nix flake check` e/ou `nixos-rebuild build --flake .#<host>`
  antes de propor `switch`. **Nunca** rode `nixos-rebuild switch` nem
  `home-manager switch` sem confirmação explícita minha — me mostre o diff e
  espere o ok.
- **Git:** o flake fica versionado. Commits pequenos, mensagem objetiva em
  inglês. Não faça `git add -A` cego.

# Modelos (OpenRouter)

- **Padrão para código sério:** `deepseek/deepseek-v4-pro` (1.6T total / 49B ativo,
  contexto 1M, líder open-source em code/math).
- **Tarefas leves** (renomear, summarize, lint-fix, edits triviais):
  `deepseek/deepseek-v4-flash` (284B / 13B ativo, ~12× mais barato).
- IDs antigos (`deepseek-chat`, `deepseek-reasoner`, V3/V3.2) aposentam em
  2026-07-24 — sempre use os IDs V4 explícitos.

# Vault compartilhado com o Hermes

O Hermes escreve notas em `/home/gelkola/.Vault/Revachol`. **Você (OpenCode)
não escreve no vault** — só leia, e apenas a pasta curada
`/home/gelkola/.Vault/Revachol/_opencode-context/` quando ela existir e for
relevante pra tarefa. Código e config são a fonte de verdade; uma nota nunca
substitui ler o arquivo atual.

# Hábitos de trabalho

- Para qualquer mudança não trivial: leia o módulo afetado inteiro antes de
  editar. Não infira layout pelo nome do arquivo.
- Prefira editar arquivo existente a criar novo. Não introduza abstração
  ("framework de módulos", helpers genéricos) sem eu pedir.
- Sem comentário óbvio. Comentário só pra *why* não óbvio (constraint
  escondida, workaround, invariante sutil).
- Loops de teste custam token: rode `nix flake check` uma vez no final, não
  depois de cada edit.
- Se uma tarefa exigir mais de ~5 edits ou tocar múltiplos hosts, pause e
  proponha o plano antes de executar.
