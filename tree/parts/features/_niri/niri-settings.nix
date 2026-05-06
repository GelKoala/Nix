{ pkgs, lib, self', inputs, ... }:
let
  args = { inherit pkgs lib self' inputs; };
  imports = [
    ./inputs.nix
    ./layout.nix
    ./binds.nix
    ./window.nix
    ./general.nix
  ];
in
lib.foldl' lib.recursiveUpdate
  {}
  (map (file: import file args) imports)
