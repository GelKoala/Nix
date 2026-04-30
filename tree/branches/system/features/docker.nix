{ config, lib, pkgs, UserConfig, ... }:
{
  options.modules.system.docker.enable = lib.mkEnableOption "docker";

  config = lib.mkIf config.modules.system.docker.enable {
    virtualisation.docker.enable = true;

    users.users.${UserConfig.username}.extraGroups = [ "docker" ];

    environment.systemPackages = with pkgs; [
      docker-desktop
    ];
  };
}
