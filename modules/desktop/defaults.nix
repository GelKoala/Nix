{ ... }:
{
  flake.modules.homeManager.defaults =
    { config, lib, ... }:
    let
      apps = config.revachol.user.apps;
      archiveManager = "org.kde.ark.desktop";
    in
    {
      xdg = {
        configFile."mimeapps.list".force = true;
        mimeApps = {
          enable = true;
          defaultApplications = {
            "application/xhtml+xml" = apps.browser.desktop;
            "text/html" = apps.browser.desktop;
            "x-scheme-handler/http" = apps.browser.desktop;
            "x-scheme-handler/https" = apps.browser.desktop;
            "image/png" = apps.imageViewer.desktop;
            "image/jpeg" = apps.imageViewer.desktop;
            "image/webp" = apps.imageViewer.desktop;
            "image/gif" = apps.imageViewer.desktop;
            "application/pdf" = apps.pdf.desktop;
            "inode/directory" = apps.fileManager.desktop;
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
