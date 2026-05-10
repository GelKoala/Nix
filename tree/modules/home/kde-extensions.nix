{ pkgs, config, lib, ... }:
let cfg = config.modules.home.kdeExtensions;
in {
  options.modules.home.kdeExtensions.enable = lib.mkEnableOption "kde-extensions";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs.kdePackages; [
      kdf
    ];
  };
}
