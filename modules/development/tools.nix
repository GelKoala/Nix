{ ... }:
{
  flake.modules.homeManager.tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        pnpm
        yarn
        nodejs_24
        unstable.codex
      ];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
}
