{ config, lib, pkgs, UserConfig, ... }:

let
  cfg = config.modules.system.opencode;
  userHome = "/home/${UserConfig.username}";
  configDir = "${userHome}/.config/opencode";
in
{
  options.modules.system.opencode.enable =
    lib.mkEnableOption "opencode (sst/opencode) CLI agent";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.opencode ];

    # Config global e AGENTS.md ficam em /etc, imutáveis (gerenciados pelo Nix).
    # Symlinkamos pra ~/.config/opencode/ via tmpfiles — opencode lê dali.
    environment.etc = {
      "opencode/opencode.json".source = ./_opencode/opencode.json;
      "opencode/AGENTS.md".source     = ./_opencode/AGENTS.md;
    };

    systemd.tmpfiles.rules = [
      "d ${configDir} 0755 ${UserConfig.username} users - -"
      "L+ ${configDir}/opencode.json - - - - /etc/opencode/opencode.json"
      "L+ ${configDir}/AGENTS.md     - - - - /etc/opencode/AGENTS.md"
    ];

    # OPENROUTER_API_KEY: rode `opencode auth login` uma vez (grava em
    # ~/.local/share/opencode/auth.json, fora do Nix store, fora do git).
    # Não exporto a chave via environment.variables pra não cair no /etc/profile.
  };
}
