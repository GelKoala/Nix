{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    (inputs."import-tree" ../../branches/system)
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  modules = {
    shell-extension.enable = true;
    system.docker.enable = true;
  };
}
