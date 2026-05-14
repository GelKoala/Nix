{ ... }:{

  perSystem = { pkgs, ... }: {
    devShells = {
      python = import ../modules/shell/_python.nix { inherit pkgs; }; 
    };
  };
}

