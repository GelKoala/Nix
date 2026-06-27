{ inputs, ... }:
{
  flake.overlays.default = final: prev: {
    zen-browser = inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
    dolphin = prev.kdePackages.dolphin;
    unstable = import inputs.nixpkgs-unstable {
      system = prev.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
