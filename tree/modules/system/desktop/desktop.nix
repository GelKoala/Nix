{ pkgs, ... }:
{
  services.printing.enable = true;
  programs.dconf.enable = true;

  # Plasma
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Thunar integration (gvfs, xfconf, etc.)
  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  # Font
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
