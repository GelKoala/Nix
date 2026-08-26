{ ... }:
{
  flake.modules.homeManager.daily-apps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        _7zz
        unar
        foot
        hello
        qimgv
        unzip
        thunar
        vesktop
        zathura
        jamesdsp
        keepassxc
        quicksand
        innoextract
        unstable.croc
        kdePackages.ark
        protonmail-bridge
        zen-browser
        unstable.vivaldi
      ];

      programs.kitty = {
        enable = true;
        font = {
          name = "JetBrainsMono Nerd Font";
          size = 12;
        };
        settings = {
          confirm_os_window_close = 0;
          window_padding_width = 8;
          background_opacity = "0.90";
        };
      };

      xdg.configFile."vivaldi-flags.conf".text = ''
        --ozone-platform-hint=auto
        --enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL
        --password-store=kwallet6
      '';
    };
}
