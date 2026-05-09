{ inputs, self, lib, ... }:
let dubois = import ../../modules/home/_helpers.nix { inherit lib; };
in
{
  imports = [
    (inputs."import-tree" ../../modules/home)
    self.modules.home
  ];

  modules.home = dubois.enableAll [
    "obsidian"
    "zen-browser"
    "kitty"
  ];
  modules.user = {
    kde-extensions.enable = true;
    general-apps.enable = true;
  };
}
