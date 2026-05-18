{ pkgs, self, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    exfatprogs
    kitty
    gnome-disk-utility
    kdePackages.partitionmanager
    geeqie
  ];

  nixpkgs.overlays = [
    self.overlays.default
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
