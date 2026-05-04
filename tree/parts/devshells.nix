{ inputs, SystemConfig, ... }:

let
  pkgs = inputs.nixpkgs.legacyPackages.${SystemConfig.system};
in {
  flake.devShells.${SystemConfig.system}.projetopy =
    import ../branches/develop/python.nix { inherit pkgs; };
}
