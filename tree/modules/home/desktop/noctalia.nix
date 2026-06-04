{ config, inputs, lib, pkgs, ... }:

let
  cfg = config.modules.home.noctalia;
  system = pkgs.stdenv.hostPlatform.system;
  unstablePkgs = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  options.modules.home.noctalia = {
    enable = lib.mkEnableOption "noctalia-shell";
    package = lib.mkOption {
      type = lib.types.package;
      default = unstablePkgs.noctalia-shell;
      readOnly = true;
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
  };
}
