{ inputs, ... }:
{
  flake.modules.nixos.hermes =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      user = config.revachol.user;
    in
    {
      imports = [ inputs.hermes-agent.nixosModules.default ];

      config = {
        # Pacote: troque .default por .messaging (~+33MB, Discord/Telegram/Slack)
        # ou .full (~+700MB, tudo) e rode `nixos-rebuild switch`.
        services.hermes-agent = {
          enable = true;
          package = (
            inputs.hermes-agent.packages.${pkgs.stdenv.hostPlatform.system}.default.override (old: {
              callPackage =
                fn: args:
                let
                  orig = (old.callPackage or pkgs.callPackage) fn args;
                in
                if lib.hasSuffix "tui.nix" (toString fn) then
                  (old.callPackage or pkgs.callPackage) fn (
                    args
                    // {
                      hermesNpmLib = args.hermesNpmLib // {
                        mkNpmPassthru =
                          passthruArgs:
                          args.hermesNpmLib.mkNpmPassthru (
                            passthruArgs
                            // {
                              dirs =
                                if builtins.elem "ui-tui" passthruArgs.dirs then
                                  passthruArgs.dirs ++ [ "apps/shared" ]
                                else
                                  passthruArgs.dirs;
                            }
                          );
                      };
                    }
                  )
                else
                  orig;
            })
          );
          addToSystemPackages = true;

          # Container persistente compartilhado com o usuário host.
          container.enable = true;
          container.hostUsers = [ user.username ];

          # Segredos: crie /var/lib/hermes/secrets.env manualmente, fora do Nix store.
          # Conteúdo esperado:
          #   OPENROUTER_API_KEY=sk-or-...
          environmentFiles = [ "/var/lib/hermes/secrets.env" ];

          documents."USER.md" = ./_hermes/USER.md;

          settings = {
            # Loop principal: owl-alpha (uso geral / conversa).
            # Slugs no formato `provider/modelo` do catálogo do OpenRouter.
            model = {
              default = "openrouter/owl-alpha";
              provider = "openrouter";
            };

            # Compressão de contexto: Flash — texto em massa, barato resolve.
            auxiliary.compression = {
              provider = "openrouter";
              model = "deepseek/deepseek-v4-flash";
            };

            # Delegação para subagentes: Flash (tarefas de código de complexidade
            # média). Pro fica fora do automático — invocar manualmente com
            # `hermes chat -m deepseek/deepseek-v4-pro` quando precisar do pesado.
            delegation = {
              provider = "openrouter";
              model = "deepseek/deepseek-v4-flash";
              orchestrator_enabled = true;
              max_concurrent_children = 3;
              max_spawn_depth = 1;
            };

            compression = {
              enabled = true;
              threshold = 0.50;
              target_ratio = 0.20;
              protect_last_n = 20;
              protect_first_n = 3;
            };

            terminal = {
              backend = "local";
              timeout = 180;
              persistent_shell = true;
            };

            memory = {
              memory_enabled = true;
              user_profile_enabled = true;
            };

            # Toolsets ativos por plataforma — apenas o que é útil no uso local.
            # Desativados: browser, computer_use, cronjob, image_gen, kanban, messaging, tts.
            platform_toolsets = {
              cli = [
                "clarify" # perguntas ao usuário quando a tarefa é ambígua
                "code_execution" # execute_code em sandbox isolado
                "file" # read_file, write_file, patch, search_files
                "terminal" # terminal + process (shell persistente)
                "memory" # memória persistente entre sessões
                "session_search" # busca full-text em conversas passadas
                "skills" # skills auto-aprimoráveis
                "web" # web_search + web_extract
                "delegation" # subagentes isolados (Flash gera, Pro audita)
                "vision" # vision_analyze para screenshots de código/erro
                "todo" # planejamento de tarefas multi-passo
                "browse"
              ];
            };

            security.redact_secrets = true;
          };
        };

        # Container mode roda como root via docker; usuários host precisam de
        # NOPASSWD pra invocar o CLI sem prompt (o flag -n do hermes hangs no prompt).
        security.sudo.extraRules = [
          {
            users = [ user.username ];
            commands = [
              {
                command = "/etc/profiles/per-user/${user.username}/bin/docker";
                options = [ "NOPASSWD" ];
              }
            ];
          }
        ];
      };
    };
}
