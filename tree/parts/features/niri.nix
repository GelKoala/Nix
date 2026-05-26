{ self, inputs, ... }:
{

  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', system, ... }:
  let
    unstablePkgs = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      pkgs = unstablePkgs;
      settings = import ./_niri/niri-settings.nix {
        pkgs = unstablePkgs;
        inherit lib self' inputs;
      };
    };
  };
}
