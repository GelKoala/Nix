{ config, lib, pkgs, SystemConfig, UserConfig, ... }:

let
  cfg = config.modules.system.games;
in
{
  options.modules.system.games.enable =
    lib.mkEnableOption "system gaming-stuff";

  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = [ SystemConfig.gpu ];
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
      gamemode.enable = true;
    };
    environment.systemPackages = with pkgs; [
      mangohud
      protonup-qt
      heroic
      gamescope
      vulkan-tools
      mesa-demos
      hydralauncher
    ];
  };
}
