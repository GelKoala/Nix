{ config, lib, pkgs, SystemConfig, UserConfig, ... }:
let
  cfg = config.modules.system.niri;
  isNiriSession = SystemConfig.session == "niri";
  sessionPath =
    "${lib.makeBinPath [
      pkgs.bash
      pkgs.coreutils
      pkgs.findutils
      pkgs.gawk
      pkgs.gnugrep
      pkgs.procps
      pkgs.systemd
      pkgs.util-linux
    ]}:/run/wrappers/bin:/run/current-system/sw/bin:/etc/profiles/per-user/${UserConfig.username}/bin:/home/${UserConfig.username}/.nix-profile/bin";
in
{
  options.modules.system.niri.enable =
    lib.mkEnableOption "Niri session and support packages";

  config = lib.mkIf (cfg.enable || isNiriSession) {
    programs.niri.enable = true;
    services.displayManager.defaultSession = SystemConfig.session;
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
    hardware.bluetooth.enable = true;
    services.power-profiles-daemon.enable = true;

    systemd.user.services.niri = {
      restartIfChanged = false;
      stopIfChanged = false;
      environment.PATH = lib.mkForce sessionPath;
    };
  };
}
