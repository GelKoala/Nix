{ inputs, pkgs, config, lib, ... }:
{
  options.modules.user.zen-browser.enable = lib.mkEnableOption "zen-browser";

  config = lib.mkIf config.modules.user.zen-browser.enable {
    home.packages = [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
