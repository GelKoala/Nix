{ ... }:
{
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Inputs
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0";
    };
    touchpad = {
      accelProfile = "flat";
      accelSpeed = "0";
    };
  };
  # Plasma
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
