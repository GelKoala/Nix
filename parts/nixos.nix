{ inputs, SystemConfig, UserConfig, ... }:
{
  flake.nixosConfigurations.${SystemConfig.host} =
    inputs.nixpkgs.lib.nixosSystem {
      system  = SystemConfig.system;
      modules = [
        ../hosts/${SystemConfig.host}/configuration.nix

        inputs.home-manager.nixosModules.home-manager
        {
 	  home-manager = {
            useGlobalPkgs    = true;
            useUserPackages  = true;
            extraSpecialArgs = { inherit SystemConfig UserConfig inputs; };
    	    users.${UserConfig.username} =
              import ../hosts/${SystemConfig.host}/${UserConfig.username}.nix;
   	  };
	}
      ];
      specialArgs = { inherit SystemConfig UserConfig inputs; };
    };
}
