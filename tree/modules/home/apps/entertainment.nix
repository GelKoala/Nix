{ input, config, lib, pkgs, ... }:
let cfg = config.modules.home.entertainment;
in
{
  options.modules.home.entertainment.enable = lib.mkEnableOption "entertainment";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      stremio-linux-shell
    ];
  };
}
