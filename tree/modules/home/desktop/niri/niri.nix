{ config, lib, pkgs, ... }:
let
  cfg = config.modules.home.niri;
in
{
  options.modules.home.niri.enable =
    lib.mkEnableOption "Niri wayland compositor";

  config = lib.mkIf cfg.enable {
    xdg.configFile."niri/config.kdl".source =
      config.lib.file.mkOutOfStoreSymlink "/home/gelkola/.revachol/tree/modules/home/desktop/niri/config.kdl";

    home.packages = with pkgs; [
      xwayland-satellite
    ];
  };
}
