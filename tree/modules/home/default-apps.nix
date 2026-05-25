{ config, lib, pkgs, UserConfig, ... }:

let
  cfg = config.modules.home.defaultApps;
in
{
  options.modules.home.defaultApps.enable =
    lib.mkEnableOption "Default Apps";

  config = lib.mkIf cfg.enable {
    xdg = {
      configFile."mimeapps.list".force = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          #-------Browser--------
           "applications/xhtml+xml" = "${UserConfig.browser}.desktop";
          "text/html" = "${UserConfig.browser}.desktop";
          "x-scheme-handler/http" = "${UserConfig.browser}.desktop";
          "x-scheme-handler/https" = "${UserConfig.browser}.desktop";
          #-------Image Viewer--------
          "image/png" = "${UserConfig.imageViewer}.desktop";
          "image/jpeg" = "${UserConfig.imageViewer}.desktop";
          "image/webp" = "${UserConfig.imageViewer}.desktop";
          "image/gif" = "${UserConfig.imageViewer}.desktop";
          #-------  PDF --------
          "application/pdf" = "${UserConfig.pdf}.desktop";
          #-------Directory-------
          "inode/directory" = "${UserConfig.fileManager}.desktop";
        };
      };
    };
  };
}
