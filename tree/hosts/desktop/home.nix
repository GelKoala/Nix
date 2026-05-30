{ inputs, self, lib, UserConfig, ... }:
let dubois = import ../../modules/home/_helpers.nix { inherit lib; };
in
{
  imports = [ self.modules.home self.modules.shell ];
  programs.home-manager.enable = true;
  home = {
    username = UserConfig.username;
    homeDirectory = "/home/${UserConfig.username}";
    stateVersion = "25.11";
  };

  modules = {
    home = dubois.enableAll [
      "study-stuff"
      "zen-browser"
      "vivaldi"
      "kitty"
      "generalApps"
      "kdeExtensions"
      "defaultApps"
      "container"
    ];
    shell = dubois.enableAll [
      "direnv"
    ];
  };
}
