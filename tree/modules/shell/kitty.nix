# tree/modules/home/kitty.nix
{ config, lib, pkgs, ... }:

let
  cfg = config.modules.shell.kitty;
in
{
  options.modules.shell.kitty.enable =
    lib.mkEnableOption "Kitty terminal";

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 11;
      };

      settings = {
        confirm_os_window_close = 0;
        window_padding_width = 8;
      };
    };
  };
}
