{ input, config, lib, pkgs, ... }:
let cfg = config.modules.home.container;
in
{
  options.modules.home.container.enable = lib.mkEnableOption "container";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      docker
      lazydocker
      podman-desktop
      podman
      podman-compose
      kubectl
      dbeaver-bin
    ];

  };
}
