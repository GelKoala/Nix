{ config, lib, pkgs, ... }:
{
  xwayland-satellite = {
    enable = true;
    path = lib.getExe pkgs.xwayland-satellite;
  };
  spawn-at-startup = [
    { command = [ (lib.getExe config.programs.noctalia.package) ]; }
    { command = [ (lib.getExe pkgs.vesktop) ]; }
    #{ command = [ (lib.getExe pkgs.swaybg) "-i" "/storage/Media/sky.jpg" "-m" "fill" ]; }
  ];
}
