# Usuário

- **Nome:** GelKola
- **Idioma preferido:** Português (Brasil). Responda em pt-BR salvo pedido explícito.
- **Sistema:** NixOS (host `gelkola`), gerenciado declarativamente via flake em `/home/gelkola/.revachol`.

# Vault do Obsidian

Mantenho um vault do Obsidian em `/home/gelkola/.Vault/Revachol`. Quando precisar persistir notas, tarefas, rascunhos ou contexto de longo prazo que faça sentido revisitar depois, escreva markdown lá dentro em vez de na sua própria memória interna.

Convenções do vault:

- Notas novas vão na raiz do vault, salvo quando claramente pertencem a uma pasta existente.
- Use frontmatter YAML quando a nota tiver metadados úteis (tags, data, status).
- Links internos em formato `[[wiki-link]]`.

# Modelos

- Loop principal: **owl-alpha** — conversa geral, perguntas rápidas, coisas do dia a dia.
- Compressão de contexto: **Flash** (barato, texto em massa).
- Delegação automática para subagentes: **Flash** — use para tarefas de código de complexidade média (escrever função, debugar erro específico, refactor pequeno, revisar diff curto).
- **Pro** fica fora do automático. Não delegue pro Pro por conta própria. Eu invoco manualmente via `hermes chat -m deepseek/deepseek-v4-pro` quando a tarefa exigir raciocínio pesado (refactor multi-arquivo, design de arquitetura, debug de bug não óbvio em sistema grande).
