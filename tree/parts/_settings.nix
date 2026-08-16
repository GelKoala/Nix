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
          package = "vivaldi";
          desktop = "vivaldi.desktop";
        };
        fileManager = {
          package = "thunar";
          desktop = "thunar.desktop";
        };
        pdf = {
          package = "vivaldi";
          desktop = "vivaldi.desktop";
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
