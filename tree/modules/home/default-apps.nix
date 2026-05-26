{ config, lib, pkgs, UserConfig, ... }:

let
  cfg = config.modules.home.defaultApps;
  apps = UserConfig.apps;
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
          "application/xhtml+xml" = apps.browser.desktop;
          "text/html" = apps.browser.desktop;
          "x-scheme-handler/http" = apps.browser.desktop;
          "x-scheme-handler/https" = apps.browser.desktop;
          #-------Image Viewer--------
          "image/png" = apps.imageViewer.desktop;
          "image/jpeg" = apps.imageViewer.desktop;
          "image/webp" = apps.imageViewer.desktop;
          "image/gif" = apps.imageViewer.desktop;
          #-------  PDF --------
          "application/pdf" = apps.pdf.desktop;
          #-------Directory-------
          "inode/directory" = apps.fileManager.desktop;
        };
      };
    };
  };
}
