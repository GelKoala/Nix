{ ... }:{

  perSystem = { pkgs, ... }: {
    devShells = {
      python = import ../modules/home/dev/_python.nix { inherit pkgs; }; 
    };
  };
}

