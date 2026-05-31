{ pkgs, lib, self', inputs, ... }:
{
  binds = {
    # Windows/Columns
    "Mod+Q".close-window = _: {};
    "Mod+Left".focus-column-left = _: {};
    "Mod+Right".focus-column-right = _: {};
    "Mod+Down".focus-window-down = _: {};
    "Mod+Up".focus-window-up = _: {};
    "Mod+Shift+Left".move-column-left = _: {};
    "Mod+Shift+Right".move-column-right = _: {};
    "Mod+Equal".set-column-width = "+10";
    "Mod+Minus".set-column-width = "-10";
    "Mod+F".maximize-column = _: {};
    "Mod+Shift+Up".switch-preset-column-width = _: {};
    "Mod+Shift+Down".switch-preset-window-height = _: {};

    "Print".screenshot = _: {};
    #   Spawn
    "Mod+D".spawn = [ (lib.getExe pkgs.vesktop) ];
    "Mod+B".spawn = [ (lib.getExe pkgs.vivaldi) ];
    "Mod+S".spawn = [ (lib.getExe pkgs.spotify) ];
    "Mod+O".spawn = [ (lib.getExe pkgs.obsidian) ];
    "Mod+T".spawn = [ (lib.getExe pkgs.kitty) ];
    "Mod+KP_4".spawn = [ (lib.getExe pkgs.playerctl) "previous" ];
    "Mod+KP_5".spawn = [ (lib.getExe pkgs.playerctl) "play-pause" ];
    "Mod+KP_6".spawn = [ (lib.getExe pkgs.playerctl) "next" ];
    "Mod+KP_Begin".spawn = [ (lib.getExe pkgs.playerctl) "play-pause" ];
    "Mod+KP_Left".spawn = [ (lib.getExe pkgs.playerctl) "previous" ];
    "Mod+KP_Right".spawn = [ (lib.getExe pkgs.playerctl) "next" ];
    "Mod+Space".spawn = [ (lib.getExe pkgs.noctalia-qs) "-c" "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
  };
}
