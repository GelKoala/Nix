{ ... }:
{
  flake.modules.homeManager.media =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        stremio-linux-shell
        unstable.pear-desktop
        unstable.spotify
      ];
    };
}
