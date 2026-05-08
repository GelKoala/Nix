{ inputs, SystemConfig, ... }:

let
  pkgs = inputs.nixpkgs.legacyPackages.${SystemConfig.system};
in {
  flake.devShells.${SystemConfig.system}.projetopy =
    import ./features/python.nix { inherit pkgs; };
}
