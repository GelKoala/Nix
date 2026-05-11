{
  description = "revachol";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.11";
    "import-tree".url = "github:vic/import-tree";
    nix-gaming.url = "github:fufexan/nix-gaming";
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
      inherit (import ./tree/parts/_settings.nix) SystemConfig UserConfig;
      parts = inputs."import-tree" ./tree/parts;
    in
    flake-parts.lib.mkFlake { inherit inputs; } (parts // {
      systems = [ SystemConfig.system ];
      _module.args = { inherit SystemConfig UserConfig; };
    });

}
