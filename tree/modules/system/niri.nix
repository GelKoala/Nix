{ lib, pkgs, UserConfig, ... }:
let
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
  programs.niri.enable = true;
  services.displayManager.defaultSession = "niri";
  systemd.user.services.niri = {
    restartIfChanged = false;
    stopIfChanged = false;
    environment.PATH = lib.mkForce sessionPath;
  };
}
