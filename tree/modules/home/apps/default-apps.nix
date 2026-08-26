{ config, lib, pkgs, UserConfig, ... }:

let
  cfg = config.modules.home.defaultApps;
  apps = UserConfig.apps;
  archiveManager = "org.kde.ark.desktop";
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
          #-------Archives-------
          "application/zip" = archiveManager;
          "application/x-zip-compressed" = archiveManager;
          "application/x-7z-compressed" = archiveManager;
          "application/vnd.rar" = archiveManager;
          "application/x-rar" = archiveManager;
          "application/x-tar" = archiveManager;
        };
        associations.removed."inode/directory" = [ "kitty-open.desktop" ];
      };
      configFile."xfce4/helpers.rc".text = ''
        TerminalEmulator=${apps.terminal.package}
      '';
      dataFile."xfce4/helpers/${apps.terminal.package}.desktop".text = ''
        [Desktop Entry]
        Version=1.0
        Type=X-XFCE-Helper
        Name=${apps.terminal.package}
        Icon=${apps.terminal.package}
        X-XFCE-Category=TerminalEmulator
        X-XFCE-Binaries=${apps.terminal.package};
        X-XFCE-Commands=${apps.terminal.package};
        X-XFCE-CommandsWithParameter=${apps.terminal.package} -e %s;
      '';
    };
  };
}
