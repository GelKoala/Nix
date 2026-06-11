{ config, lib, pkgs, ... }:
let noctalia = cmd: [
  "noctalia" "msg"
] ++ (pkgs.lib.splitString " " cmd);
in
{
  binds = with config.lib.niri.actions; {
    # Windows/Columns
    "Mod+Q".action = close-window;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Minus".action = set-column-width "-10%";
    "Mod+F".action = maximize-column;
    "Mod+Shift+Up".action = switch-preset-column-width;
    "Mod+Shift+Down".action = switch-preset-window-height;

    "Print".action.screenshot = { };

    # Spawn
    "Mod+D".action = spawn (lib.getExe pkgs.vesktop);
    "Mod+B".action = spawn (lib.getExe pkgs.vivaldi);
    "Mod+S".action = spawn (lib.getExe pkgs.spotify);
    "Mod+O".action = spawn (lib.getExe pkgs.obsidian);
    "Mod+T".action = spawn (lib.getExe pkgs.kitty);
    "Mod+KP_4".action = spawn (lib.getExe pkgs.playerctl) "previous";
    "Mod+KP_5".action = spawn (lib.getExe pkgs.playerctl) "play-pause";
    "Mod+KP_6".action = spawn (lib.getExe pkgs.playerctl) "next";
    "Mod+KP_Begin".action = spawn (lib.getExe pkgs.playerctl) "play-pause";
    "Mod+KP_Left".action = spawn (lib.getExe pkgs.playerctl) "previous";
    "Mod+KP_Right".action = spawn (lib.getExe pkgs.playerctl) "next";
    "Mod+Space".action.spawn = noctalia "panel-toggle launcher";

    # Media keys
    "Mod5+Down" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "call" "audio" "decrement" "3";
    };
    "Mod5+Up" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "call" "audio" "increment" "3";
    };
    "Alt+M" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "call" "audio" "micmute";
    };
    "Mod5+M" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "call" "audio" "mute";
    };
    "Mod5+KP_Add" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "call" "brightness" "increment" "5";
    };
    "Mod5+KP_Subtract" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "call" "brightness" "decrement" "5";
    };
  };
}
