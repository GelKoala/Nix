{ ... }:
{
  programs.niri.enable = true;
  services.displayManager.defaultSession = "niri";
  systemd.user.services.niri = {
    restartIfChanged = false;
    stopIfChanged = false;
  };
}
