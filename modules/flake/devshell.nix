{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      formatter = pkgs.nixfmt;

      devShells.python = pkgs.mkShell {
        packages = with pkgs; [
          python312
          pyright
        ];
      };
    };
}
