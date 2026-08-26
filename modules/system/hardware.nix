{ ... }:
{
  flake.modules.nixos.hardware =
    { pkgs, ... }:
    {
      boot = {
        initrd.kernelModules = [ "amdgpu" ];
        kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
      };

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [ rocmPackages.clr.icd ];
      };

      environment = {
        variables.AMD_VULKAN_ICD = "RADV";
        systemPackages = with pkgs; [
          amdgpu_top
          radeontop
          lact
          clinfo
        ];
      };

      systemd = {
        packages = [ pkgs.lact ];
        services.lactd.wantedBy = [ "multi-user.target" ];
      };
    };
}
