{ inputs, ... }:

{
  imports = [
    (inputs."import-tree" ../../branches/home)
  ];

  modules.user = {
    zen-browser.enable = true;
    kde-extensions.enable = true;
    spotify.enable = true;
  };
}
