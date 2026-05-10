{ input, config, lib, pkgs, ... }:
let cfg = config.modules.home.generalApps;
in
{
  options.modules.home.generalApps.enable = lib.mkEnableOption "general-apps";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hello
      spotify
      keepassxc
      codex
      codex-acp
      vesktop
    ];
  };
}
