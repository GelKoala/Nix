{ self, inputs, SystemConfig, UserConfig, ... }:
let
  hostDir = ../hosts/${SystemConfig.host};
in
{
  flake.nixosConfigurations.${SystemConfig.host} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self SystemConfig UserConfig inputs; };
    modules = [
      { nixpkgs.hostPlatform = SystemConfig.system; }
      (hostDir + "/configuration.nix")
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit self SystemConfig UserConfig inputs; };
          users.${UserConfig.username} = import (hostDir + "/home.nix");
        };
      }
    ];
  };
}
