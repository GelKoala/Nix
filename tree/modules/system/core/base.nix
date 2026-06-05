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
  ];

  nix.settings = {
    substituters = [
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };
  nixpkgs.overlays = [
    self.overlays.default
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

  # Networking
  networking.hostName = SystemConfig.hostname;
  networking.networkmanager.enable = true;
}
