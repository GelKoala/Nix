{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hello
    vesktop
  ];
}
