{ pkgs, lib, config, ... }:
let cfg = config.modules.shell.direnv;
in {
  options.modules.shell.direnv.enable =
    lib.mkEnableOption "DirEnv";

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
