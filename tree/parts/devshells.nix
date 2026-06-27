{ ... }: {
  perSystem = { pkgs, ... }: {
    devShells.python = pkgs.mkShell {
      packages = with pkgs; [
        python312
        pyright
      ];
    };
  };
}
