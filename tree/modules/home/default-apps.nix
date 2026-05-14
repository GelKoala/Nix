{ config, lib, pkgs, UserConfig, ... }:

let
  cfg = config.modules.home.default-apps;
in
{
  options.modules.home.default-apps.enable =
    lib.mkEnableOption "Default Apps";

  config = lib.mkIf cfg.enable {
    xdg.mime = {
      enable = true;
      defaultApplications = {
        "text/html" = "${UserConfig.browser}";
        "x-scheme-handler/http" = "${UserConfig.browser}";
        "x-scheme-handler/https" = "${UserConfig.browser}";
      };
    };
  };
}
