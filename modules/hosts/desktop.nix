{ config, inputs, ... }:
let
  inventory = config.revachol.inventory;
  host = inventory.hosts.desktop;
  user = inventory.users.${host.user};
in
{
  flake.nixosConfigurations.${host.flakeName} = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./_desktop/hardware.nix
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager
      config.flake.modules.nixos.workstation
      {
        nixpkgs.hostPlatform = host.system;

        revachol = {
          inherit host user;
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          users.${user.username} = {
            imports = [ config.flake.modules.homeManager.workstation ];
            revachol.user = user;
          };
        };
      }
    ];
  };
}
