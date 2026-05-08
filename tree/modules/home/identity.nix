{ UserConfig, ... }:
{
  home.username = UserConfig.username;
  home.homeDirectory = "/home/${UserConfig.username}";
  home.stateVersion = "25.11";
}
