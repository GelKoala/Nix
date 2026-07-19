{ config, lib, pkgs, ... }:
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
      unstable.antigravity-cli
      unstable.pear-desktop
      unstable.spotify
      vesktop
      unzip
      yarn
      thunar
      zathura
      quicksand
      jamesdsp
      _7zip-zstd
      unar
      innoextract
      foot
    ];
  };
}
