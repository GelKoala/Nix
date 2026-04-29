{ inputs, pkgs, SystemConfig, UserConfig, ... }:

{
  imports = [
    ./hardware-configuration.nix
    (inputs."import-tree" ../../modules/system)
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.shells = with pkgs; [ zsh fish bash ];
  users.defaultUserShell = pkgs.zsh;
  programs = {
    zsh.enable = true;
    bash.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = SystemConfig.hostname;
  modules = {
    shell-extension.enable = true;
    system.docker.enable = true;
  };

  networking.networkmanager.enable = true;

  time.timeZone = SystemConfig.timezone;

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = SystemConfig.locale;
    LC_IDENTIFICATION = SystemConfig.locale;
    LC_MEASUREMENT = SystemConfig.locale;
    LC_MONETARY = SystemConfig.locale;
    LC_NAME = SystemConfig.locale;
    LC_NUMERIC = SystemConfig.locale;
    LC_PAPER = SystemConfig.locale;
    LC_TELEPHONE = SystemConfig.locale;
    LC_TIME = SystemConfig.locale;
  };

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  console.keyMap = "br-abnt2";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.udisks2.enable = true;
  programs.dconf.enable = true;

  users.users.${UserConfig.username} = {
    isNormalUser = true;
    description = UserConfig.name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    kitty
    gnome-disk-utility
  ];

  system.stateVersion = "25.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
