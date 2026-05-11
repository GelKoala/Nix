{ config, lib, pkgs, ... }:

let
  cfg = config.modules.home.gaming;
in
{
  options.modules.home.gaming.enable =
    lib.mkEnableOption "Gaming";

  config = lib.mkIf cfg.enable {
      home.packages = with pkgs; [

      ];
    };
}
