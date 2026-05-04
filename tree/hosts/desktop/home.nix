{ inputs, ... }:

{
  imports = [
    (inputs."import-tree" ../../branches/home)
  ];

  modules.user = {
    zen-browser.enable = true;
    kde-extensions.enable = true;
    general-apps.enable = true;
  };
}
