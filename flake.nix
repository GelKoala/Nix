{
  description = "flake config";
 
  inputs = {
     nixpkgs.url = "nixpkgs/nixos-unstable"; 
     flake-parts.url = "github:hercules-ci/flake-parts";
     home-manager = {
     	url = "github:nix-community/home-manager";
    	inputs.nixpkgs.follows = "nixpkgs";
     	};
     zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
        };
  };

  outputs =  inputs@{ self, nixpkgs, home-manager, flake-parts, ... }:
   let
     inherit (import ./parts/variables.nix) SystemConfig UserConfig; 
     lib = nixpkgs.lib;
     pkgs = nixpkgs.legacyPackages.${SystemConfig.system};


   in  
    flake-parts.lib.mkFlake { inherit inputs; } {
     systems = [ SystemConfig.system ];
     imports = [ ./parts/nixos.nix ];
     _module.args = { inherit SystemConfig UserConfig; };
      
  };
}
