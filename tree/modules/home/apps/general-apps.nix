{ input, config, lib, pkgs, ... }:
let cfg = config.modules.home.generalApps;
in
{
  options.modules.home.generalApps.enable = lib.mkEnableOption "general-apps";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hello
      keepassxc
      nodejs_24
      pnpm
      protonmail-bridge
      qimgv
      unstable.claude-code
      unstable.pear-desktop
      unstable.spotify
      vesktop
      yarn
      thunar
      zathura
      quicksand
      jamesdsp
    ];
  };
}
