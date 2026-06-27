{ config, lib, pkgs, UserConfig, ... }:
let
  app = name: lib.getExe pkgs.${UserConfig.apps.${name}.package};

  # Reproduz o helper antigo: ["noctalia" "msg"] ++ palavras do comando.
  noctalia = c:
    "spawn "
    + lib.concatMapStringsSep " " (a: ''"${a}"'')
      ([ "noctalia" "msg" ] ++ lib.splitString " " c);

  workspaceBinds = lib.concatStringsSep "\n" (lib.concatMap (n: [
    "    Mod+${toString n} { focus-workspace ${toString n}; }"
    "    Mod+Shift+${toString n} { move-column-to-workspace ${toString n}; }"
  ]) (lib.range 1 9));
in
''
  binds {
  ${workspaceBinds}

      // Windows/Columns
      Mod+Q repeat=false { close-window; }
      Mod+Left { focus-column-left; }
      Mod+Right { focus-column-right; }
      Mod+Down { focus-window-down; }
      Mod+Up { focus-window-up; }
      Mod+Equal { set-column-width "+10%"; }
      Mod+Minus { set-column-width "-10%"; }
      Mod+Shift+F { maximize-column; }
      Mod+Control+F { fullscreen-window; }
      Mod+Control+Up { switch-preset-column-width; }
      Mod+Control+Down { switch-preset-window-height; }
      Mod+Control+Left { consume-or-expel-window-left; }
      Mod+Control+Right { consume-or-expel-window-right; }
      Mod+Shift+T { toggle-window-floating; }
      Mod+Shift+R { switch-focus-between-floating-and-tiling; }
      Mod+Shift+Minus { set-window-height "-10%"; }
      Mod+Shift+Equal { set-window-height "+10%"; }
      Mod+Shift+Left { move-column-left; }
      Mod+Shift+Right { move-column-right; }

      // Workspace
      Mod+Page_Up { focus-workspace-up; }
      Mod+Page_Down { focus-workspace-down; }
      Mod+Shift+Down { move-column-to-workspace-down; }
      Mod+Shift+Up { move-column-to-workspace-up; }
      Mod+Tab { toggle-overview; }

      // Spawn
      Mod+D { spawn "${lib.getExe pkgs.vesktop}"; }
      Mod+B { spawn "${app "browser"}"; }
      Mod+M { spawn "${app "musicPlayer"}"; }
      Mod+O { spawn "${lib.getExe pkgs.obsidian}"; }
      Mod+T { spawn "${app "terminal"}"; }
      Mod+E { spawn "${app "fileManager"}"; }
      Mod+I { spawn "${app "imageViewer"}"; }

      // Noctalia
      Mod5+KP_4 { ${noctalia "media previous"}; }
      Mod5+KP_5 { ${noctalia "media toggle"}; }
      Mod5+KP_6 { ${noctalia "media next"}; }
      Mod5+KP_Begin { ${noctalia "media toggle"}; }
      Mod5+KP_Left { ${noctalia "media previous"}; }
      Mod5+KP_Right { ${noctalia "media next"}; }
      Mod+Space { ${noctalia "panel-toggle launcher"}; }
      Mod5+KP_8 { ${noctalia "volume-up 10"}; }
      Mod5+KP_2 { ${noctalia "volume-down 10"}; }
      Mod5+KP_Up { ${noctalia "volume-up 10"}; }
      Mod5+KP_Down { ${noctalia "volume-down 10"}; }
      Mod5+Shift+KP_Add { ${noctalia "mic-volume-up 10%"}; }
      Mod5+Shift+KP_Subtract { ${noctalia "mic-volume-down 10%"}; }
      Mod5+M { ${noctalia "mic-mute"}; }
      Mod5+KP_Subtract { ${noctalia "brightness-down 10"}; }
      Mod5+KP_Add { ${noctalia "brightness-up 10"}; }
      Print { ${noctalia "screenshot-region"}; }
  }
''
