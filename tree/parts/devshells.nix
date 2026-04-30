{ SystemConfig, pkgs, ... }:

{
  perSystem = { pkgs, ... }: {
    devShells.projetopy =
      import ../branches/develop/python.nix { inherit pkgs; };
  };
}
