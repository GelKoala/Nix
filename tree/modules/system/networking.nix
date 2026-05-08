{ SystemConfig, ... }:
{
  networking.hostName = SystemConfig.hostname;
  networking.networkmanager.enable = true;
}
