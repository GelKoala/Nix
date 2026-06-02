{ self, lib, ... }:
let dubois = import ../../modules/home/_helpers.nix { inherit lib; };
in {
  imports = [
    ./hardware-configuration.nix
    self.modules.system
  ];

  modules = {
    system = dubois.enableAll [
      "shell-extension"
      "games"
      "hermes-agent"
    ];
  };

  virtualisation.podman.enable = true;
  virtualisation.containers.registries.search = [ "docker.io" ];
}
