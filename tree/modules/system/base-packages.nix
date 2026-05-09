{ pkgs, self, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    kitty
    gnome-disk-utility
  ];

  nixpkgs.overlays = [
    self.overlays.default
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
