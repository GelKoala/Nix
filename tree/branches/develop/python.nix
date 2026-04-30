{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    python312
    pyright
  ];
}
