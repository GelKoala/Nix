{ config, lib, pkgs, SystemConfig, UserConfig, ... }:

let
  cfg = config.modules.system.gaming;
in
{
  options.modules.system.gaming.enable =
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
      };
      gamemode.enable = true;
    };
    environment = {
      systemPackages = with pkgs; [
        mangohud
        protonup-qt
        heroic
        bottles
      ];
      sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS =
          "/home/${UserConfig.username}/.steam/root/compatibilitytools.d";
      };
    };
  };
}
