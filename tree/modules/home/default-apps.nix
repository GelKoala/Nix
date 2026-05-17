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
           "applications/xhtml+xml" = "${UserConfig.browser}";
          "text/html" = "${UserConfig.browser}";
          "x-scheme-handler/http" = "${UserConfig.browser}";
          "x-scheme-handler/https" = "${UserConfig.browser}";
          #-------Image Viewer--------
          "image/png" = "${UserConfig.imageViewer}";
          "image/jpeg" = "${UserConfig.imageViewer}";
          "image/webp" = "${UserConfig.imageViewer}";
          "image/gif" = "${UserConfig.imageViewer}";
          #-------  PDF --------
          "application/pdf" = "${UserConfig.pdf}";
          #-------Directory-------
          "inode/directory" = "${UserConfig.fileManager}";
        };
      };
    };
  };
}
