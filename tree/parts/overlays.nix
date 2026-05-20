{ inputs, SystemConfig, pkgs,  ... }:
{
  flake.overlays.default = final: prev: {
    zen-browser = inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
    stable = import inputs.nixpkgs-stable {
      system = prev.system;
      config.allowUnfree = true;
    };
  };
}
