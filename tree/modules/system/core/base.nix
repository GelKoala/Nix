{ pkgs, self, SystemConfig, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    exfatprogs
    gnome-disk-utility
    kdePackages.partitionmanager
    geeqie
    cachix
    wev
    discord
  ];

  nixpkgs.overlays = [
    self.overlays.default
  ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";

  # Networking
  networking.hostName = SystemConfig.hostname;
  networking.networkmanager.enable = true;
}
