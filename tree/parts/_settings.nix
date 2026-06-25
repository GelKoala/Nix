{
    SystemConfig = {
      system   = "x86_64-linux";
      hostname = "gelkola";
      timezone = "America/Sao_Paulo";
      locale   = "pt_BR.UTF-8";
      host     = "desktop";
      gpu      = "amdgpu";
      session  = "niri";
    };

    UserConfig = {
      username = "gelkola";
      name     = "GelKola";

      apps = {
        browser = {
          package = "zen-browser";
          desktop = "zen.desktop";
        };
        fileManager = {
          package = "dolphin";
          desktop = "dolphin.desktop";
        };
        pdf = {
          package = "zen-browser";
          desktop = "zen.desktop";
        };
        imageViewer = {
          package = "qimgv";
          desktop = "qimgv.desktop";
        };
        musicPlayer = {
          package = "pear-desktop";
          desktop = "pear-desktop.desktop";
        };
        terminal = {
          package = "kitty";
          desktop = "kitty.desktop";
        };
      };
    };
}
