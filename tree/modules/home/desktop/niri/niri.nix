{ config, lib, pkgs, UserConfig, ... }:
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
      (writeShellScriptBin "niri-browser" "exec ${lib.getExe pkgs.${UserConfig.apps.browser.package}} \"$@\"")
      (writeShellScriptBin "niri-terminal" "exec ${lib.getExe pkgs.${UserConfig.apps.terminal.package}} \"$@\"")
      (writeShellScriptBin "niri-filemanager" "exec ${lib.getExe pkgs.${UserConfig.apps.fileManager.package}} \"$@\"")
      (writeShellScriptBin "niri-musicplayer" "exec ${lib.getExe pkgs.${UserConfig.apps.musicPlayer.package}} \"$@\"")
      (writeShellScriptBin "niri-imageviewer" "exec ${lib.getExe pkgs.${UserConfig.apps.imageViewer.package}} \"$@\"")
    ];
  };
}
