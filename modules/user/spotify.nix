{ config, lib, pkgs, ... }:
{
  options.modules.user.spotify.enable = lib.mkEnableOption "spotify";

  config = lib.mkIf config.modules.user.spotify.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
