{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myNoctalia = inputs.wrapper-modules.wrapper.noctalia-shell.wrapp {
      inherit pkgs;
      settings = {};
    };
  };
}
