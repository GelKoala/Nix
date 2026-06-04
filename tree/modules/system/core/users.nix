{ pkgs, UserConfig, ... }:
{
  users.users.${UserConfig.username} = {
    isNormalUser = true;
    description = UserConfig.name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
