{ self, inputs, ... }:
{
  perSystem = { pkgs, system, ... }:
  let
    unstablePkgs = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      pkgs = unstablePkgs;
      settings =
        (builtins.fromJSON
          (builtins.readFile ./noctalia.json)).settings;
    };
  };
}
