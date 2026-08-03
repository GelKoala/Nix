{ config, lib, pkgs, SystemConfig, UserConfig, inputs, ... }:

let
  cfg = config.modules.system.games;
in
{
  options.modules.system.games.enable =
    lib.mkEnableOption "system gaming-stuff";

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [
        inputs.nix-gaming.packages.${pkgs.system}.low-latency-layer
        inputs.nix-gaming.packages.${pkgs.system}.dxvk-nvapi-vkreflex-layer
      ];
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
      steamtinkerlaunch
      prismlauncher
      osu-lazer
      protontricks
      wine
      mission-center
      htop
    ];
  };
}
