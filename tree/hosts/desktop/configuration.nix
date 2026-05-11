{ inputs, self, ... }:

{
  imports = [
    ./hardware-configuration.nix
    self.nixosModules.niri
    (inputs."import-tree" ../../modules/system)
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  nixpkgs.config.allowUnfree = true;
  modules = {
    shell-extension.enable = true;
    system.docker.enable = true;
  };
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}
