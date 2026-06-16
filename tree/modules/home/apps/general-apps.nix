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
      osu-lazer
      pnpm
      prismlauncher
      protonmail-bridge
      qimgv
      unstable.claude-code
      unstable.pear-desktop
      unstable.spotify
      vesktop
      yarn
    ];
  };
}
