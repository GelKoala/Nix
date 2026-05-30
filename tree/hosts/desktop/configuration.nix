{ self, lib, ... }:
let dubois = import ../../modules/home/_helpers.nix { inherit lib; };
in {
  imports = [
    ./hardware-configuration.nix
    self.nixosModules.niri
    self.modules.system
  ];

  modules = {
    system = dubois.enableAll [
      "shell-extension"
      "games"
    ];
  };

  virtualisation.podman.enable = true;
  virtualisation.containers.registries.search = [ "docker.io" ];
}
