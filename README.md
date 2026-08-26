# Revachol

Configuração NixOS dendrítica baseada em `flake-parts` e `import-tree`.

## Organização

```text
modules/
├── flake/        # infraestrutura da flake e inventário
├── system/       # base, hardware e armazenamento
├── desktop/      # ambiente gráfico, Niri e aparência
├── development/  # ferramentas, containers, estudo e agentes
├── leisure/      # jogos e mídia
├── profiles/     # composição reutilizável de recursos
└── hosts/        # máquinas e configurações específicas
```

Cada arquivo público em `modules/` é descoberto automaticamente e registra um
módulo nomeado em `flake.modules`. Arquivos auxiliares ficam em diretórios cujo
nome começa com `_`, para que o `import-tree` não os importe diretamente.

O perfil `workstation` reúne os recursos compartilhados. O arquivo do host
seleciona esse perfil e injeta os dados definidos no inventário. Para adicionar
outra máquina, crie sua entrada no inventário e um novo arquivo em `hosts/`.

## Validação

```sh
nix flake check
nixos-rebuild build --flake .#desktop
```
