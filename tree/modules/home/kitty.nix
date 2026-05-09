{ config, lib, pkgs, ... }:
let cfg = config.modules.home.kitty;
in
{
  options.modules.home.kitty.enable =
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
