{ ... }:
{
  flake.modules.nixos.containers = {
    virtualisation.podman.enable = true;
    virtualisation.containers.registries.search = [ "docker.io" ];
  };

  flake.modules.homeManager.containers =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        docker
        lazydocker
        podman-desktop
        podman
        podman-compose
        kubectl
        dbeaver-bin
      ];
    };
}
