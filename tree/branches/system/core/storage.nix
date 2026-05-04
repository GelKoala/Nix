{ ... }:
{
  
  fileSystems."/storage" = {
  device = "/dev/disk/by-uuid/363af083-f816-44d5-95a6-f098aef4d67c";
  fsType = "btrfs";
  options = [ "defaults" "nofail" ];
  };
 	
  services.udisks2.enable = true;
  programs.dconf.enable = true;
}
