{
  description = "revachol";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    "import-tree".url = "github:vic/import-tree";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    let
      inherit (import ./tree/lib/variables.nix) SystemConfig;
      parts = inputs."import-tree" ./tree/parts;
    in
    flake-parts.lib.mkFlake { inherit inputs; } (
      parts
      // {
        systems = [ SystemConfig.system ];
      }
    );

}
