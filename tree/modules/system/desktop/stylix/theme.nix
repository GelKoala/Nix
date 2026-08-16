{ config, lib, pkgs, UserConfig, ... }:

let
  cfg = config.modules.system.stylix;
  colors = config.lib.stylix.colors;
  hex = color: "#${color}";

  noctaliaPalette = {
    dark = {
      mPrimary = hex colors.base0D;
      mOnPrimary = hex colors.base00;
      mSecondary = hex colors.base0B;
      mOnSecondary = hex colors.base00;
      mTertiary = hex colors.base08;
      mOnTertiary = hex colors.base00;
      mError = hex colors.base08;
      mOnError = hex colors.base00;
      mSurface = hex colors.base00;
      mOnSurface = hex colors.base05;
      mSurfaceVariant = hex colors.base01;
      mOnSurfaceVariant = hex colors.base04;
      mOutline = hex colors.base03;
      mShadow = hex colors.base00;
      mHover = hex colors.base02;
      mOnHover = hex colors.base05;

      terminal = {
        background = hex colors.base00;
        foreground = hex colors.base05;
        cursor = hex colors.base05;
        cursorText = hex colors.base00;
        selectionBg = hex colors.base02;
        selectionFg = hex colors.base05;

        normal = {
          black = hex colors.base00;
          red = hex colors.base08;
          green = hex colors.base0B;
          yellow = hex colors.base0A;
          blue = hex colors.base0D;
          magenta = hex colors.base0E;
          cyan = hex colors.base0C;
          white = hex colors.base05;
        };

        bright = {
          black = hex colors.base03;
          red = hex colors.base08;
          green = hex colors.base0B;
          yellow = hex colors.base0A;
          blue = hex colors.base0D;
          magenta = hex colors.base0E;
          cyan = hex colors.base0C;
          white = hex colors.base07;
        };
      };
    };
  };
in
{
  options.modules.system.stylix.enable =
    lib.mkEnableOption "system-wide Stylix theming";

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      base16Scheme = ./themes/emperor.yaml;

      cursor = {
        name = "Vanilla-DMZ";
        package = pkgs.vanilla-dmz;
        size = 24;
      };

      fonts = {
        monospace = {
          name = "JetBrainsMono Nerd Font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        };
        sansSerif = {
          name = "Inter";
          package = pkgs.inter;
        };
        serif = {
          name = "Noto Serif";
          package = pkgs.noto-fonts;
        };
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };

        sizes = {
          applications = 10;
          desktop = 10;
          popups = 10;
          terminal = 12;
        };
      };

      targets.chromium.enable = false;
    };

    home-manager.users.${UserConfig.username} = {
      stylix.targets = {
        firefox.enable = false;
        kitty = {
          fonts.enable = false;
          opacity.enable = false;
        };
        qt.platform = "qtct";
        zen-browser.enable = false;
      };

      programs.noctalia.settings.theme = lib.mkForce {
        mode = "dark";
        source = "custom";
        custom_palette = "Emperor";
        pure_black_dark = true;
      };

      xdg.configFile = {
        "noctalia/palettes/Emperor.json".text =
          builtins.toJSON noctaliaPalette;

        "niri/stylix.kdl".text = ''
          layout {
              focus-ring {
                  active-color "${hex colors.base0D}"
                  inactive-color "${hex colors.base03}"
                  urgent-color "${hex colors.base08}"
              }
              border {
                  active-color "${hex colors.base0D}"
                  inactive-color "${hex colors.base03}"
                  urgent-color "${hex colors.base08}"
              }
              shadow {
                  color "${hex colors.base00}70"
              }
              tab-indicator {
                  active-color "${hex colors.base0D}"
                  inactive-color "${hex colors.base03}"
                  urgent-color "${hex colors.base08}"
              }
              insert-hint {
                  color "${hex colors.base0D}80"
              }
          }

          overview {
              backdrop-color "${hex colors.base00}"
          }
        '';
      };
    };
  };
}
