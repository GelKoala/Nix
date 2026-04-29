{ inputs, SystemConfig, UserConfig, ... }:
let
  hostDir = ../hosts/${SystemConfig.host};
in
{
  flake.nixosConfigurations.${SystemConfig.host} = inputs.nixpkgs.lib.nixosSystem {
    system = SystemConfig.system;
    specialArgs = { inherit SystemConfig UserConfig inputs; };
    modules = [
      (hostDir + "/configuration.nix")
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit SystemConfig UserConfig inputs; };
          users.${UserConfig.username} = import (hostDir + "/home.nix");
        };
      }
    ];
  };
}
