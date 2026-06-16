{ config, lib, pkgs, ... }:
let noctalia = cmd: [
  "noctalia" "msg"
] ++ (pkgs.lib.splitString " " cmd);
in
{
  binds = with config.lib.niri.actions; {
    # Windows/Columns
    "Mod+Q" = {
      repeat = false;
      action = close-window;
    };
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Return".action = maximize-column;
    "Mod+Control+Up".action = switch-preset-column-width;
    "Mod+Control+Down".action = switch-preset-window-height;
    "Mod+Shift+T".action = toggle-window-floating;
    "Mod+Shift+R".action = switch-focus-between-floating-and-tiling;
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;

    #Workspace
    "Mod+Page_Up".action = focus-workspace-up;
    "Mod+Page_Down".action = focus-workspace-down;
    "Mod+Shift+Down".action = move-column-to-workspace-down;
    "Mod+Shift+Up".action = move-column-to-workspace-up;
    #"Mod+Control+Page_Up".action = move-workspace-up;
    #"Mod+Control+Page_Down".action = move-workspace-down;
    "Mod+Tab".action = toggle-overview;


    # Spawn
    "Mod+D".action = spawn (lib.getExe pkgs.vesktop);
    "Mod+B".action = spawn (lib.getExe pkgs.vivaldi);
    "Mod+S".action = spawn (lib.getExe pkgs.spotify);
    "Mod+O".action = spawn (lib.getExe pkgs.obsidian);
    "Mod+T".action = spawn (lib.getExe pkgs.kitty);

    #Noctalia
    "Mod5+KP_4".action.spawn = noctalia "media previous";
    "Mod5+KP_5".action.spawn = noctalia "media toggle";
    "Mod5+KP_6".action.spawn = noctalia "media next";
    "Mod5+KP_Begin".action.spawn = noctalia "media toggle";
    "Mod5+KP_Left".action.spawn = noctalia "media previous";
    "Mod5+KP_Right".action.spawn = noctalia "media next";
    "Mod+Space".action.spawn = noctalia "panel-toggle launcher";
    "Mod5+KP_8".action.spawn = noctalia "volume-up 10";
    "Mod5+KP_2".action.spawn = noctalia "volume-down 10";
    "Mod5+KP_Up".action.spawn = noctalia "volume-up 10";
    "Mod5+KP_Down".action.spawn = noctalia "volume-down 10";
    "Mod5+Shift+KP_Add".action.spawn = noctalia "mic-volume-up 10%";
    "Mod5+Shift+KP_Subtract".action.spawn = noctalia "mic-volume-down 10%";
    "Mod5+M".action.spawn = noctalia "mic-mute";
    "Mod5+KP_Add".action.spawn = noctalia "brightness-down 10";
    "Mod5+KP_Subtract".action.spawn = noctalia "brightness-up 10";
    "Print".action.spawn = noctalia "screenshot-region";
  };
}
