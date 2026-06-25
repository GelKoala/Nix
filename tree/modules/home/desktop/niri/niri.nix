{ config, lib, pkgs, self, UserConfig, ... }:
let
  cfg = config.modules.home.niri;
  args = { inherit config lib pkgs self UserConfig; };
  settings = lib.foldl' lib.recursiveUpdate { } (map (f: import f args) [
    ./_niri/inputs.nix
    ./_niri/layout.nix
    ./_niri/binds.nix
    ./_niri/window.nix
    ./_niri/general.nix
  ]);
in
{
  options.modules.home.niri.enable =
    lib.mkEnableOption "Niri wayland compositor";

  config = lib.mkIf cfg.enable {
    programs.niri.settings = settings;
  };
}
