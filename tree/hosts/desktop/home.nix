{ inputs, self, ... }:

{
  imports = [
    (inputs."import-tree" ../../modules/home)
    self.modules.shell
    self.modules.home
  ];

  modules.home = {
    obsidian.enable = true;
  };
  modules.shell.kitty = {
    enable = true;
  };
  modules.user = {
    zen-browser.enable = true;
    kde-extensions.enable = true;
    general-apps.enable = true;
  };
}
