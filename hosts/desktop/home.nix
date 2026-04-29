{ inputs, pkgs, SystemConfig, UserConfig, ... }:

{
  systemd.user.services."drkonqi-coredump-pickup" = {
    Unit.ConditionPathExists = "!/home";
    Service.ExecStart = "/run/current-system/sw/bin/true";
  };

  imports = [
    (inputs."import-tree" ../../modules/user)
  ];

  modules.user = {
    zen-browser.enable = true;
    kde-extensions.enable = true;
    spotify.enable = true;
  };

  home.username = UserConfig.username;
  home.homeDirectory = "/home/${UserConfig.username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    hello
    vesktop
  ];

  programs.zed-editor.enable = true;
  programs.home-manager.enable = true;
}
