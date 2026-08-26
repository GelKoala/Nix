{ config, lib, pkgs, ... }:
let cfg = config.modules.home.generalApps;
in
{
  options.modules.home.generalApps.enable = lib.mkEnableOption "general-apps";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pnpm
      yarn
      _7zz
      unar
      foot
      hello
      qimgv
      unzip
      thunar
      vesktop
      zathura
      jamesdsp
      keepassxc
      nodejs_24
      quicksand
      innoextract
      unstable.croc
      unstable.codex
      kdePackages.ark
      protonmail-bridge
    ];
  };
}
