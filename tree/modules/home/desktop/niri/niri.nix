{ config, lib, pkgs, self, UserConfig, ... }:
let
  cfg = config.modules.home.niri;
  args = { inherit config lib pkgs self UserConfig; };
  # Cada fragmento retorna um pedaco de KDL nativo do niri. Sem niri-flake:
  # escrevemos ~/.config/niri/config.kdl diretamente, o que destrava qualquer
  # recurso do binario (ex.: background-effect/blur) sem depender do schema.
  configText = lib.concatStringsSep "\n\n" (map (f: import f args) [
    ./_niri/inputs.nix
    ./_niri/layout.nix
    ./_niri/window.nix
    ./_niri/binds.nix
    ./_niri/general.nix
  ]);
in
{
  options.modules.home.niri.enable =
    lib.mkEnableOption "Niri wayland compositor";

  config = lib.mkIf cfg.enable {
    xdg.configFile."niri/config.kdl".text = configText;
  };
}
