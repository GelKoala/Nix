{ config, lib, pkgs, ... }:

let
  cfg = config.modules.home.vivaldi;
in
{
  options.modules.home.vivaldi.enable =
    lib.mkEnableOption "vivaldi";

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.unstable.vivaldi
    ];

    xdg.configFile."vivaldi-flags.conf".text = ''
      --ozone-platform-hint=auto
      --enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL
    '';
  };
}
