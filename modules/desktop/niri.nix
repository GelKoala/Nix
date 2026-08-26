{ inputs, ... }:
{
  flake.modules = {
    nixos.niri =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        host = config.revachol.host;
        user = config.revachol.user;
        sessionPath = "${
          lib.makeBinPath [
            pkgs.bash
            pkgs.coreutils
            pkgs.findutils
            pkgs.gawk
            pkgs.gnugrep
            pkgs.procps
            pkgs.systemd
            pkgs.util-linux
          ]
        }:/run/wrappers/bin:/run/current-system/sw/bin:/etc/profiles/per-user/${user.username}/bin:/home/${user.username}/.nix-profile/bin";
      in
      {
        programs.niri.enable = true;
        services.displayManager.defaultSession = host.session;
        environment.sessionVariables.XDG_MENU_PREFIX = "plasma-";

        environment.systemPackages = with pkgs; [
          procps
          playerctl
          wl-clipboard
          cliphist
          brightnessctl
          pwvucontrol
          pavucontrol
          networkmanagerapplet
          upower
          swaybg
        ];

        services = {
          upower.enable = true;
          power-profiles-daemon.enable = true;
        };
        hardware.bluetooth.enable = true;

        systemd.user.services.niri = {
          restartIfChanged = false;
          stopIfChanged = false;
          environment.PATH = lib.mkForce sessionPath;
        };
      };

    homeManager.niri =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        user = config.revachol.user;
        apps = user.apps;
      in
      {
        imports = [ inputs.noctalia.homeModules.default ];

        xdg.configFile."niri/config.kdl".source =
          config.lib.file.mkOutOfStoreSymlink "/home/${user.username}/.revachol/modules/desktop/_niri/config.kdl";

        home.packages = with pkgs; [
          xwayland-satellite
          (writeShellScriptBin "niri-browser" "exec ${lib.getExe pkgs.${apps.browser.package}} \"$@\"")
          (writeShellScriptBin "niri-terminal" "exec ${lib.getExe pkgs.${apps.terminal.package}} \"$@\"")
          (writeShellScriptBin "niri-filemanager" "exec ${
            lib.getExe pkgs.${apps.fileManager.package}
          } \"$@\"")
          (writeShellScriptBin "niri-musicplayer" "exec ${
            lib.getExe pkgs.${apps.musicPlayer.package}
          } \"$@\"")
          (writeShellScriptBin "niri-imageviewer" "exec ${
            lib.getExe pkgs.${apps.imageViewer.package}
          } \"$@\"")
        ];

        programs.noctalia = {
          enable = true;
          systemd.enable = false;
          package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
          settings = builtins.fromTOML (builtins.readFile ./_niri/settings.toml);
        };
      };
  };
}
