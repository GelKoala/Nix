{ config, lib, ... }:
let
  inherit (lib) mkOption types;

  appType = types.submodule {
    options = {
      package = mkOption { type = types.str; };
      desktop = mkOption { type = types.str; };
    };
  };

  hostType = types.submodule {
    options = {
      flakeName = mkOption { type = types.str; };
      system = mkOption { type = types.str; };
      hostname = mkOption { type = types.str; };
      timezone = mkOption { type = types.str; };
      locale = mkOption { type = types.str; };
      gpu = mkOption { type = types.str; };
      session = mkOption { type = types.str; };
      user = mkOption { type = types.str; };
    };
  };

  userType = types.submodule {
    options = {
      username = mkOption { type = types.str; };
      name = mkOption { type = types.str; };
      apps = mkOption { type = types.attrsOf appType; };
    };
  };
in
{
  options.revachol.inventory = {
    hosts = mkOption { type = types.attrsOf hostType; };
    users = mkOption { type = types.attrsOf userType; };
  };

  config = {
    systems = lib.unique (map (host: host.system) (lib.attrValues config.revachol.inventory.hosts));

    revachol.inventory = {
      hosts.desktop = {
        flakeName = "desktop";
        system = "x86_64-linux";
        hostname = "gelkola";
        timezone = "America/Sao_Paulo";
        locale = "pt_BR.UTF-8";
        gpu = "amdgpu";
        session = "niri";
        user = "gelkola";
      };

      users.gelkola = {
        username = "gelkola";
        name = "GelKola";

        apps = {
          browser = {
            package = "vivaldi";
            desktop = "vivaldi.desktop";
          };
          fileManager = {
            package = "dolphin";
            desktop = "org.kde.dolphin.desktop";
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
    };
  };
}
