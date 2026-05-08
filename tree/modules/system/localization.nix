{ SystemConfig, ... }:
{
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

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  console.keyMap = "br-abnt2";
}
