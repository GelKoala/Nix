{ self, ... }:
{
  flake.modules = {
    nixos.core =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        host = config.revachol.host;
        user = config.revachol.user;
        aliases = {
          ll = "ls -l";
          ".." = "cd ..";
          nix-rebuild = "sudo nixos-rebuild switch --flake .#${host.flakeName}";
          revachol = "cd /home/${user.username}/.revachol";
          "configuration.nix" = "sudo nvim modules/hosts/${host.flakeName}.nix";
          "home.nix" = "sudo nvim modules/hosts/${host.flakeName}.nix";
          sleep = "shutdown 120";
          "hermes.default" = "hermes chat -m openrouter/owl-alpha";
          "hermes.pro" = "hermes chat -m deepseek/deepseek-v4-pro";
          "hermes.flash" = "hermes chat -m deepseek/deepseek-v4-flash";
        };
      in
      {
        options.revachol = {
          host = lib.mkOption { type = lib.types.attrs; };
          user = lib.mkOption { type = lib.types.attrs; };
        };

        config = {
          environment.systemPackages = with pkgs; [
            vim
            neovim
            wget
            git
            cachix
            zip
            unzip
            ncdu
            btop
            nvtopPackages.amd
          ];

          environment.shells = with pkgs; [
            zsh
            fish
            bash
          ];

          users = {
            defaultUserShell = pkgs.zsh;
            users.${user.username} = {
              isNormalUser = true;
              description = user.name;
              extraGroups = [
                "networkmanager"
                "wheel"
              ];
              packages = with pkgs; [ kdePackages.kate ];
            };
          };

          programs = {
            zsh = {
              enable = true;
              shellAliases = aliases;
            };
            bash = {
              enable = true;
              shellAliases = aliases;
            };
          };

          boot = {
            loader = {
              timeout = 2;
              systemd-boot = {
                enable = true;
                configurationLimit = 10;
              };
              efi.canTouchEfiVariables = true;
            };
            kernelPackages = pkgs.linuxPackages_zen;
            initrd.verbose = false;
            plymouth.enable = true;
            consoleLogLevel = 3;
            kernelParams = [
              "quiet"
              "splash"
              "loglevel=3"
              "udev.log_priority=3"
            ];
          };

          networking = {
            hostName = host.hostname;
            networkmanager.enable = true;
          };

          time.timeZone = host.timezone;
          i18n = {
            defaultLocale = "en_US.UTF-8";
            extraLocaleSettings = {
              LC_ADDRESS = host.locale;
              LC_IDENTIFICATION = host.locale;
              LC_MEASUREMENT = host.locale;
              LC_MONETARY = host.locale;
              LC_NAME = host.locale;
              LC_NUMERIC = host.locale;
              LC_PAPER = host.locale;
              LC_TELEPHONE = host.locale;
              LC_TIME = host.locale;
            };
          };
          services.xserver.xkb = {
            layout = "br";
            variant = "";
          };
          console.keyMap = "br-abnt2";

          nix = {
            gc = {
              automatic = true;
              dates = "weekly";
              options = "--delete-older-than 7d";
            };
            optimise = {
              automatic = true;
              dates = [ "weekly" ];
            };
            settings = {
              auto-optimise-store = true;
              experimental-features = [
                "nix-command"
                "flakes"
              ];
              substituters = [ "https://nix-gaming.cachix.org" ];
              trusted-public-keys = [
                "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
              ];
            };
          };

          nixpkgs = {
            overlays = [ self.overlays.default ];
            config.allowUnfree = true;
          };

          system.stateVersion = "25.11";
        };
      };

    homeManager.core =
      { config, lib, ... }:
      let
        user = config.revachol.user;
      in
      {
        options.revachol.user = lib.mkOption { type = lib.types.attrs; };

        config = {
          programs.home-manager.enable = true;
          home = {
            username = user.username;
            homeDirectory = "/home/${user.username}";
            stateVersion = "25.11";
          };
        };
      };
  };
}
