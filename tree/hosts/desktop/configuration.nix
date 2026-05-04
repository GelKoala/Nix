{ inputs, self, ... }:

{
  imports = [
    ./hardware-configuration.nix
    self.nixosModules.niri
    (inputs."import-tree" ../../branches/system)
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  modules = {
    shell-extension.enable = true;
    system.docker.enable = true;
  };
}
