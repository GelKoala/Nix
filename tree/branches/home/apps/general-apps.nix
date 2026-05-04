{ input, config, lib, pkgs, ... }:
{
  options.modules.user.general-apps.enable = lib.mkEnableOption "general-apps";

  config = lib.mkIf config.modules.user.general-apps.enable {
    home.packages = with pkgs; [
      spotify
      keepassxc
      codex
      codex-acp
    ];
  };
}
