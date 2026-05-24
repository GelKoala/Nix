{ pkgs, lib, self', inputs, ... }:
{
  binds = {

    "Mod+T".spawn-sh = "kitty";
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
    "Mod+KP_4".spawn = [ "playerctl" "previous" ];
    "Mod+KP_5".spawn = [ "playerctl" "play-pause" ];
    "Mod+KP_6".spawn = [ "playerctl" "next" ];
    "Mod+KP_Begin".spawn = [ "playerctl" "play-pause" ];
    "Mod+KP_Left".spawn = [ "playerctl" "previous" ];
    "Mod+KP_Right".spawn = [ "playerctl" "next" ];

    # Spawn
    "Mod+D".spawn-sh = lib.getExe pkgs.vesktop;
    "Mod+B".spawn-sh = "vivaldi";
    "Mod+S".spawn-sh = "spotify";
    "Mod+O".spawn-sh = "obsidian";
  };
}
