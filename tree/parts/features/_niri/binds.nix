{ pkgs, lib, self', inputs, ... }:
{
  binds = {
    "Mod+T".spawn-sh = lib.getExe pkgs.kitty;
    "Mod+Q".close-window = _: {};
    "Mod+Left".focus-column-left = _: {};
    "Mod+Right".focus-column-right = _: {};
    "Mod+Shift+Left".move-column-left = _: {};
    "Mod+Shift+Right".move-column-right = _: {};
    "Mod+D".spawn-sh = lib.getExe pkgs.vesktop;
    "Mod+B".spawn-sh = lib.getExe inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    "Mod+S".spawn-sh = "spotify";
  };
}
