{ inputs, ... }: {
  flake = {
    modules.system = inputs.import-tree ../modules/system;
    modules.home = inputs.import-tree ../modules/home;
    modules.shell = inputs.import-tree ../modules/shell;
  };
}
