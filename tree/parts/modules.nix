{ inputs, self, ... }: {
  flake = {
    modules.system = inputs.import-tree ../modules/system;
    modules.home = inputs.import-tree ../modules/home;
    modules.shell = inputs.import-tree ../modules/shell;
  };

  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ self.overlays.default ];
    };
  };
}
