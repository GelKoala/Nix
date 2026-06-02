{ inputs, pkgs, config, lib, ... }:
let cfg = config.modules.home.zen-browser;
in {
  options.modules.home.zen-browser.enable = lib.mkEnableOption "zen-browser";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zen-browser
    ];
  };
}
