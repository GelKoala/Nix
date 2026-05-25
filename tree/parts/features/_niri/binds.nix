{ pkgs, lib, self', inputs, ... }:
{
  binds = {
    # Windows/Columns
    "Super+Q".close-window = _: {};
    "Super+Left".focus-column-left = _: {};
    "Super+Right".focus-column-right = _: {};
    "Super+Down".focus-window-down = _: {};
    "Super+Up".focus-window-up = _: {};
    "Super+Shift+Left".move-column-left = _: {};
    "Super+Shift+Right".move-column-right = _: {};
    "Super+Equal".set-column-width = "+10";
    "Super+Minus".set-column-width = "-10";
    "Super+F".maximize-column = _: {};
    "Super+Shift+Up".switch-preset-column-width = _: {};
    "Super+Shift+Down".switch-preset-window-height = _: {};

    "Print".screenshot = _: {};
    #   Spawn
    "Super+D".spawn = [ (lib.getExe pkgs.vesktop) ];
    "Super+B".spawn = [ (lib.getExe pkgs.vivaldi) ];
    "Super+S".spawn = [ (lib.getExe pkgs.spotify) ];
    "Super+O".spawn = [ (lib.getExe pkgs.obsidian) ];
    "Super+T".spawn = [ (lib.getExe pkgs.kitty) ];
    "Super+KP_4".spawn = [ (lib.getExe pkgs.playerctl) "previous" ];
    "Super+KP_5".spawn = [ (lib.getExe pkgs.playerctl) "play-pause" ];
    "Super+KP_6".spawn = [ (lib.getExe pkgs.playerctl) "next" ];
    "Super+KP_Begin".spawn = [ (lib.getExe pkgs.playerctl) "play-pause" ];
    "Super+KP_Left".spawn = [ (lib.getExe pkgs.playerctl) "previous" ];
    "Super+KP_Right".spawn = [ (lib.getExe pkgs.playerctl) "next" ];
  };
}
