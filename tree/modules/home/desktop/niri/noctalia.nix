{ config, inputs, lib, pkgs, ... }:

let
  cfg = config.modules.home.noctalia;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  options.modules.home.noctalia.enable = lib.mkEnableOption "noctalia v5";

  config = lib.mkIf cfg.enable {
    programs.noctalia = {
      enable = true;
      systemd.enable = false;
      package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = builtins.fromTOML (builtins.readFile ./settings.toml);
    };
  };
}
