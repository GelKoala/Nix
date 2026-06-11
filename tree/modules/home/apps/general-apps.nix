{ input, config, lib, pkgs, ... }:
let cfg = config.modules.home.generalApps;
in
{
  options.modules.home.generalApps.enable = lib.mkEnableOption "general-apps";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hello
      unstable.spotify
      unstable.pear-desktop
      keepassxc
      unstable.claude-code
      vesktop
      qimgv
      protonmail-bridge
      nodejs_24
      pnpm
      yarn
      prismlauncher
      osu-lazer
    ];
  };
}
