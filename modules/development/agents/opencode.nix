{ ... }:
{
  flake.modules.nixos.opencode =
    { config, pkgs, ... }:
    let
      user = config.revachol.user;
      userHome = "/home/${user.username}";
      configDir = "${userHome}/.config/opencode";
    in
    {
      environment.systemPackages = [ pkgs.opencode ];

      # Config global e AGENTS.md ficam em /etc, imutáveis (gerenciados pelo Nix).
      # Symlinkamos pra ~/.config/opencode/ via tmpfiles — opencode lê dali.
      environment.etc = {
        "opencode/opencode.json".source = ./_opencode/opencode.json;
        "opencode/AGENTS.md".source = ./_opencode/AGENTS.md;
      };

      systemd.tmpfiles.rules = [
        "d ${configDir} 0755 ${user.username} users - -"
        "L+ ${configDir}/opencode.json - - - - /etc/opencode/opencode.json"
        "L+ ${configDir}/AGENTS.md     - - - - /etc/opencode/AGENTS.md"
      ];

      # OPENROUTER_API_KEY: rode `opencode auth login` uma vez (grava em
      # ~/.local/share/opencode/auth.json, fora do Nix store, fora do git).
      # Não exporto a chave via environment.variables pra não cair no /etc/profile.
    };
}
