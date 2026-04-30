{ config, pkgs, SystemConfig, lib, ... }:
let
  aliases = {
    ll = "ls -l";
    ".." = "cd ..";
    nix-rebuild = "sudo nixos-rebuild switch --flake .#${SystemConfig.host}";
    revachol = "cd .revachol";
    "configuration.nix" = "sudo nvim tree/hosts/${SystemConfig.host}/configuration.nix";
    "home.nix" = "sudo nvim tree/hosts/${SystemConfig.host}/home.nix";
  };
in
{
  options.modules.shell-extension.enable = lib.mkEnableOption "shell-extension";

  config = lib.mkMerge [
    {
      environment.shells = with pkgs; [ zsh fish bash ];
      users.defaultUserShell = pkgs.zsh;

      programs = {
        zsh.enable = true;
        bash.enable = true;
      };

      programs.bash.shellAliases = aliases;
      programs.zsh.shellAliases = aliases;
    }

    (lib.mkIf config.modules.shell-extension.enable {
      environment.systemPackages = with pkgs; [
        ncdu
        btop
      ];
    })
  ];
}
