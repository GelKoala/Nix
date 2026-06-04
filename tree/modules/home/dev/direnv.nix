{ pkgs, lib, config, ... }:
let cfg = config.modules.home.direnv;
in {
  options.modules.home.direnv.enable =
    lib.mkEnableOption "DirEnv";

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
