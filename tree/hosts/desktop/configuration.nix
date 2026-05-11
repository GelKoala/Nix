{ inputs, self, lib, ... }:
let dubois = import ../../modules/home/_helpers.nix { inherit lib; };
in {
  imports = [
    ./hardware-configuration.nix
    self.nixosModules.niri
    self.modules.system
  ];

  nixpkgs.config.allowUnfree = true;
  modules.system = dubois.enableAll [
    "shell-extension"
    "gaming"
  ];
  programs = {
    direnv = { enable = true; nix-direnv.enable = true; };
  };


  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}
