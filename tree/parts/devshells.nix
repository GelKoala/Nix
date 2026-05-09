{ inputs, SystemConfig, ... }:

let
  pkgs = inputs.nixpkgs.legacyPackages.${SystemConfig.system};
in {
  flake.devShells.${SystemConfig.system}.projetopy =
    import ./features/_python.nix { inherit pkgs; };
}
