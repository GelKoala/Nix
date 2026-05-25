{ config, lib, pkgs, ... }:

let
  cfg = config.modules.system.niritalia;
in
{
  options.modules.system.niritalia.enable =
    lib.mkEnableOption "Niri support packages and services";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      procps
      playerctl
      wl-clipboard
      cliphist
      brightnessctl
      pwvucontrol
      pavucontrol
      networkmanagerapplet
      upower
    ] ++ [
      config.programs.niri.package
    ];
    services.upower.enable = true;
    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true;
    services.power-profiles-daemon.enable = true;
  };
}
