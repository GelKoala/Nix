{ pkgs, ... }:
{
  boot = {
    loader = {
      timeout = 2;
      systemd-boot= {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.verbose = false;
    plymouth.enable = true;
    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "udev.log_priority=3"
    ];
  };
}
