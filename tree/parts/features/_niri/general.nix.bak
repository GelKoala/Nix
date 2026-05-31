{ lib, self', pkgs, ... }:
{
  xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
  spawn-at-startup = [
    (lib.getExe self'.packages.myNoctalia)
    (lib.getExe pkgs.vesktop)
  ];
}
