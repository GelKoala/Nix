{ config, lib, pkgs, ... }:

let
  cfg = config.modules.home.study-stuff;
in
{
  options.modules.home.study-stuff.enable =
    lib.mkEnableOption "Study";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
      zed-editor
      siyuan
      speedcrunch
      xournalpp
    ];
  };
}
