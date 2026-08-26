{ ... }:
{
  flake.modules = {
    nixos.environment =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          geeqie
          wev
          discord
        ];

        security.rtkit.enable = true;
        services = {
          pulseaudio.enable = false;
          pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
          };
          printing.enable = true;
          xserver.enable = true;
          displayManager.sddm.enable = true;
          desktopManager.plasma6.enable = true;
          libinput = {
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
        };

        programs = {
          dconf.enable = true;
          thunar.enable = true;
          xfconf.enable = true;
        };

        fonts.packages = with pkgs; [
          jetbrains-mono
          nerd-fonts.jetbrains-mono
        ];
      };

    homeManager.environment =
      { pkgs, ... }:
      {
        home.packages = with pkgs.kdePackages; [ kdf ];

        systemd.user.services."drkonqi-coredump-pickup" = {
          Unit.ConditionPathExists = "!/home";
          Service.ExecStart = "/run/current-system/sw/bin/true";
        };
      };
  };
}
