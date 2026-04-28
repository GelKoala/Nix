{ inputs, pkgs, config, lib, ...}
:
  {
   options.modules.user.kde-extensions.enable = lib.mkEnableOption "kde-extensions";
   
   config = lib.mkIf config.modules.user.kde-extensions.enable {
      home.packages = with
        pkgs.kdePackages; [
	  #filelight
	  kdf
      ];

    };
}
