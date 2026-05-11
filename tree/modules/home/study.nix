{ config, lib, pkgs, ... }:

let
  cfg = config.modules.home.obsidian;
in
{
  options.modules.home.obsidian.enable =
    lib.mkEnableOption "Obsidian";

  config = lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        obsidian
	      zed-editor
      ];
    };
}
