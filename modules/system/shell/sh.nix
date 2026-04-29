{ config, pkgs, SystemConfig, UserConfig, lib, ... }:

let
  Aliases = {
    ll = "ls -l";
    ".." = "cd ..";
    nix-rebuild = "sudo nixos-rebuild switch --flake .#${SystemConfig.host}";
    revachol = "cd .revachol";
    "configuration.nix" = "sudo nvim hosts/${SystemConfig.host}/configuration.nix";
    "home.nix" = "sudo nvim hosts/${SystemConfig.host}/home.nix";
  };
in
{
  options.modules.shell-extension.enable = lib.mkEnableOption "shell-extension";

  config = lib.mkMerge [
    {
      programs.bash = {
        enable = true;
        shellAliases = Aliases;
      };

      programs.zsh = {
        enable = true;
        shellAliases = Aliases;
      };
    }

    (lib.mkIf config.modules.shell-extension.enable {
      environment.systemPackages = with pkgs; [
        ncdu
        btop
      ];
    })
  ];
}
