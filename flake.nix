{
  description = "revachol";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    "import-tree".url = "github:vic/import-tree";
    nix-gaming.url = "github:fufexan/nix-gaming";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hermes-agent.url = "github:NousResearch/hermes-agent";
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
